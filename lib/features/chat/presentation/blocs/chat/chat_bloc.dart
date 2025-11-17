import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/network/network_info.dart';
import '../../../domain/entities/chat_message_entity.dart';
import '../../../domain/usecases/end_session_usecase.dart';
import '../../../domain/usecases/get_chat_history_usecase.dart';
import '../../../domain/usecases/restore_session_usecase.dart';
import '../../../domain/usecases/send_message_usecase.dart';
import '../../../domain/usecases/start_session_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

/// BLoC for managing chat functionality
///
/// Handles session lifecycle, message sending/receiving,
/// history loading, and offline synchronization.
@singleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final StartSessionUseCase _startSessionUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetChatHistoryUseCase _getChatHistoryUseCase;
  final EndSessionUseCase _endSessionUseCase;
  final RestoreSessionUseCase _restoreSessionUseCase;
  final NetworkInfo _networkInfo;
  final Uuid _uuid;

  ChatBloc(
    this._startSessionUseCase,
    this._sendMessageUseCase,
    this._getChatHistoryUseCase,
    this._endSessionUseCase,
    this._restoreSessionUseCase,
    this._networkInfo,
    this._uuid,
  ) : super(ChatState.initial()) {
    on<ChatEvent>(_onChatEvent);
  }

  Future<void> _onChatEvent(
    ChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    await event.when(
      initialize: () => _initialize(emit),
      startSession: () => _startSession(emit),
      sendMessage: (message) => _sendMessage(message, emit),
      loadHistory: (forceRefresh) => _loadHistory(forceRefresh, emit),
      endSession: () => _endSession(emit),
      restoreSession: () => _restoreSession(emit),
      syncPendingMessages: () => _syncPendingMessages(emit),
      clearData: () => _clearData(emit),
      markMessageSeen: (messageId) => _markMessageSeen(messageId, emit),
    );
  }

  /// Initialize chat feature
  Future<void> _initialize(Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    // Check network status
    final isConnected = await _networkInfo.isConnected;

    // Try to restore active session
    final result = await _restoreSessionUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isInitialized: true,
          isOffline: !isConnected,
        ));
      },
      (session) {
        if (session != null) {
          // Active session found, load its history
          emit(state.copyWith(
            session: session,
            canSendMessages: true,
            isLoading: false,
            isInitialized: true,
            isOffline: !isConnected,
          ));

          // Load history in background
          add(const ChatEvent.loadHistory());
        } else {
          emit(state.copyWith(
            isLoading: false,
            isInitialized: true,
            isOffline: !isConnected,
          ));
        }
      },
    );
  }

  /// Start a new chat session
  Future<void> _startSession(Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      emit(state.copyWith(
        isLoading: false,
        error: 'No internet connection. Cannot start chat session.',
        isOffline: true,
      ));
      return;
    }

    final result = await _startSessionUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
          isOffline: !isConnected,
        ));
      },
      (session) {
        emit(state.copyWith(
          session: session,
          messages: [], // Clear any old messages
          canSendMessages: true,
          isLoading: false,
          error: null,
          isOffline: false,
        ));
      },
    );
  }

  /// Send a message to the chatbot
  Future<void> _sendMessage(
    String message,
    Emitter<ChatState> emit,
  ) async {
    // Validate session exists
    if (state.session == null) {
      emit(state.copyWith(
        error: 'No active session. Please start a new chat.',
      ));
      return;
    }

    // Validate message not empty
    if (message.trim().isEmpty) {
      return;
    }

    // Create user message entity for optimistic update
    final userMessage = ChatMessageEntity(
      id: _uuid.v4(),
      sessionId: state.session!.sessionId,
      role: 'user',
      content: message.trim(),
      timestamp: DateTime.now(),
      isSynced: false,
      isPending: true,
    );

    // Optimistically add user message to UI
    emit(state.copyWith(
      messages: [...state.messages, userMessage],
      isBotTyping: true,
      error: null,
    ));

    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      // Queue message for later sync
      emit(state.copyWith(
        isBotTyping: false,
        error: 'No internet. Message will be sent when online.',
        isOffline: true,
        pendingMessageCount: state.pendingMessageCount + 1,
      ));
      return;
    }

    // Send message via use case
    final params = SendMessageParams(
      sessionId: state.session!.sessionId,
      message: message.trim(),
    );

    final result = await _sendMessageUseCase(params);

    result.fold(
      (failure) {
        // Remove optimistic message on failure
        final messagesWithoutLast = state.messages
            .where((msg) => msg.id != userMessage.id)
            .toList();

        emit(state.copyWith(
          messages: messagesWithoutLast,
          isBotTyping: false,
          error: failure.message,
          isOffline: !isConnected,
        ));
      },
      (assistantMessage) {
        // Update user message as synced
        final syncedUserMessage = userMessage.copyWith(
          isSynced: true,
          isPending: false,
        );

        // Add both synced user message and assistant response
        final updatedMessages = [
          ...state.messages.where((msg) => msg.id != userMessage.id),
          syncedUserMessage,
          assistantMessage,
        ];

        emit(state.copyWith(
          messages: updatedMessages,
          isBotTyping: false,
          error: null,
          isOffline: false,
        ));
      },
    );
  }

  /// Load chat history
  Future<void> _loadHistory(
    bool forceRefresh,
    Emitter<ChatState> emit,
  ) async {
    if (state.session == null) {
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    final params = GetChatHistoryParams(
      sessionId: state.session!.sessionId,
      forceRefresh: forceRefresh,
    );

    final result = await _getChatHistoryUseCase(params);

    final isConnected = await _networkInfo.isConnected;

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
          isOffline: !isConnected,
        ));
      },
      (messages) {
        emit(state.copyWith(
          messages: messages,
          isLoading: false,
          error: null,
          isOffline: !isConnected,
          lastSyncTime: DateTime.now(),
        ));
      },
    );
  }

  /// End the current session
  Future<void> _endSession(Emitter<ChatState> emit) async {
    if (state.session == null) {
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    final params = EndSessionParams(sessionId: state.session!.sessionId);
    final result = await _endSessionUseCase(params);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
      (_) {
        // Reset to initial state
        emit(ChatState.initial().copyWith(
          isInitialized: true,
        ));
      },
    );
  }

  /// Restore a previously active session
  Future<void> _restoreSession(Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _restoreSessionUseCase();
    final isConnected = await _networkInfo.isConnected;

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
          isOffline: !isConnected,
        ));
      },
      (session) {
        if (session != null) {
          emit(state.copyWith(
            session: session,
            canSendMessages: true,
            isLoading: false,
            error: null,
            isOffline: !isConnected,
          ));

          // Load history for restored session
          add(const ChatEvent.loadHistory());
        } else {
          emit(state.copyWith(
            isLoading: false,
            isOffline: !isConnected,
          ));
        }
      },
    );
  }

  /// Sync pending messages (stub for future implementation)
  Future<void> _syncPendingMessages(Emitter<ChatState> emit) async {
    // TODO: Implement pending message sync
    // This would call repository.syncPendingMessages()
    emit(state.copyWith(
      pendingMessageCount: 0,
      lastSyncTime: DateTime.now(),
    ));
  }

  /// Clear all chat data
  Future<void> _clearData(Emitter<ChatState> emit) async {
    // TODO: Implement data clearing via repository
    emit(ChatState.initial().copyWith(isInitialized: true));
  }

  /// Mark a message as seen (UI state only)
  Future<void> _markMessageSeen(
    String messageId,
    Emitter<ChatState> emit,
  ) async {
    // This is for UI state management, no repository call needed
    // Could be used for read receipts in future
  }
}
