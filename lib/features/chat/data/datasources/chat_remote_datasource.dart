import 'package:injectable/injectable.dart';

import '../api/chat_api_client.dart';
import '../models/chat_message_dto.dart';
import '../models/chat_session_dto.dart';

/// Abstract interface for chat remote operations
abstract class ChatRemoteDataSource {
  /// Start a new chat session
  Future<ChatSessionDto> startSession();

  /// Send a message to the chatbot
  Future<ChatMessageResponseDto> sendMessage({
    required String sessionId,
    required String message,
  });

  /// Get conversation history for a session
  Future<List<ChatMessageDto>> getChatHistory({
    required String sessionId,
  });

  /// End a chat session
  Future<void> endSession({required String sessionId});
}

/// Implementation of chat remote data source
///
/// Handles all API communication for chat functionality.
@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ChatApiClient _apiClient;

  ChatRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ChatSessionDto> startSession() async {
    final response = await _apiClient.startSession();
    return response.toSessionDto();
  }

  @override
  Future<ChatMessageResponseDto> sendMessage({
    required String sessionId,
    required String message,
  }) async {
    final request = ChatMessageRequestDto(
      sessionId: sessionId,
      message: message,
    );

    final response = await _apiClient.sendMessage(request);
    return response;
  }

  @override
  Future<List<ChatMessageDto>> getChatHistory({
    required String sessionId,
  }) async {
    final response = await _apiClient.getChatHistory(sessionId);

    // Convert history messages to ChatMessageDto format
    return response.history.map((historyMsg) {
      return ChatMessageDto(
        sessionId: sessionId,
        role: historyMsg.role,
        content: historyMsg.content,
        timestamp: historyMsg.timestamp,
      );
    }).toList();
  }

  @override
  Future<void> endSession({required String sessionId}) async {
    await _apiClient.endSession(sessionId);
  }
}
