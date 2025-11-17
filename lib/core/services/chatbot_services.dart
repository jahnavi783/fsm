/// Chatbot API Service using Dio
/// File: lib/services/chatbot_api_service.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/chat_models.dart';

class ChatbotApiService {
  final Dio _dio;
  final String baseUrl = 'https://vast-heron-poetic.ngrok-free.app/api/chatbot';

  ChatbotApiService({String? token}) : _dio = Dio() {
    // Configure Dio
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers['Content-Type'] = 'application/json';

    // Set token if provided
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    // Add logging (only in debug mode)
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          logPrint: (obj) => debugPrint('🌐 $obj'),
        ),
      );
    }
  }

  /// Update the token (when user logs in)
  void updateToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// API CALL 1: Start a new chat session
  Future<ChatSessionResponse> startSession() async {
    try {
      final response = await _dio.post('/session/start');

      return ChatSessionResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// API CALL 2: Send a message to chatbot
  Future<ChatMessageResponse> sendMessage({
    required String sessionId,
    required String message,
  }) async {
    try {
      final request = ChatMessageRequest(
        sessionId: sessionId,
        message: message,
      );

      final response = await _dio.post(
        '/message',
        data: request.toJson(),
      );

      return ChatMessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// API CALL 3: Get conversation history
  Future<ChatHistoryResponse> getHistory(String sessionId) async {
    try {
      final response = await _dio.get('/session/$sessionId/history');

      return ChatHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// API CALL 4: End the chat session
  Future<void> endSession(String sessionId) async {
    try {
      await _dio.delete('/session/$sessionId/end');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle errors and show user-friendly messages
  String _handleError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      // Extract error message
      String errorMessage = 'Server error';
      if (data is Map && data.containsKey('message')) {
        errorMessage = data['message'];
      }

      // Return user-friendly message based on error code
      switch (statusCode) {
        case 401:
          return 'Please login again. Your session expired.';
        case 403:
          return 'Only technicians can use the chatbot.';
        case 404:
          return 'Session not found. Please start a new chat.';
        case 500:
          return 'Server error: $errorMessage';
        default:
          return 'Error: $errorMessage';
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Check your internet.';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection.';
    } else {
      return 'Network error. Please try again.';
    }
  }

  /// Clean up when done
  void dispose() {
    _dio.close();
  }
}
