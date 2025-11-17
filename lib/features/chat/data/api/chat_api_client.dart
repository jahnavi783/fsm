import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/chat_message_dto.dart';
import '../models/chat_session_dto.dart';

part 'chat_api_client.g.dart';

/// Retrofit API client for chatbot endpoints
///
/// Provides type-safe HTTP endpoints for chat functionality.
/// Base URL should be configured to point to: /api/chatbot
@RestApi()
abstract class ChatApiClient {
  factory ChatApiClient(Dio dio, {String? baseUrl}) = _ChatApiClient;

  /// Start a new chat session
  ///
  /// POST /api/chatbot/session/start
  ///
  /// Returns session information with user context
  @POST('/chatbot/session/start')
  Future<ChatSessionResponseDto> startSession();

  /// Send a message to the chatbot
  ///
  /// POST /api/chatbot/message
  ///
  /// Sends user message and receives assistant response
  @POST('/chatbot/message')
  Future<ChatMessageResponseDto> sendMessage(
    @Body() ChatMessageRequestDto request,
  );

  /// Get conversation history for a session
  ///
  /// GET /api/chatbot/session/{sessionId}/history
  ///
  /// Returns list of all messages in the session
  @GET('/chatbot/session/{sessionId}/history')
  Future<ChatHistoryResponseDto> getChatHistory(
    @Path('sessionId') String sessionId,
  );

  /// End a chat session
  ///
  /// DELETE /api/chatbot/session/{sessionId}/end
  ///
  /// Terminates the active session
  @DELETE('/chatbot/session/{sessionId}/end')
  Future<void> endSession(
    @Path('sessionId') String sessionId,
  );
}
