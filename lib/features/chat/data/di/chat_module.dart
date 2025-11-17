import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../api/chat_api_client.dart';

/// Dependency Injection module for chat feature
///
/// Provides factory methods for creating chat-related dependencies
/// that require external dependencies (Dio, Uuid, etc.)
@module
abstract class ChatModule {
  /// Provides ChatApiClient instance
  @lazySingleton
  ChatApiClient chatApiClient(Dio dio) => ChatApiClient(dio);

  /// Provides Uuid instance for generating message IDs
  @lazySingleton
  Uuid uuid() => const Uuid();
}
