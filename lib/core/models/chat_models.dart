/// Response when starting a chat session
class ChatSessionResponse {
  final bool success;
  final String sessionId;
  final UserInfo? user;
  final String? message;

  ChatSessionResponse({
    required this.success,
    required this.sessionId,
    this.user,
    this.message,
  });

  /// Convert JSON to ChatSessionResponse object
  factory ChatSessionResponse.fromJson(Map<String, dynamic> json) {
    return ChatSessionResponse(
      success: json['success'] ?? false,
      sessionId: json['sessionId'] ?? '',
      user: json['user'] != null ? UserInfo.fromJson(json['user']) : null,
      message: json['message'],
    );
  }
}

/// User information
class UserInfo {
  final int? id;
  final String email;
  final String role;
  final String? firstName;
  final String? lastName;

  UserInfo({
    this.id,
    required this.email,
    required this.role,
    this.firstName,
    this.lastName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      firstName: json['firstName'] ?? json['first_name'],
      lastName: json['lastName'] ?? json['last_name'],
    );
  }

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return email;
  }
}

/// Response when sending a message
class ChatMessageResponse {
  final bool success;
  final String message;
  final List<String>? toolsUsed;

  ChatMessageResponse({
    required this.success,
    required this.message,
    this.toolsUsed,
  });

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessageResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      toolsUsed: json['toolsUsed'] != null
          ? List<String>.from(json['toolsUsed'])
          : null,
    );
  }
}

/// Response when getting conversation history
class ChatHistoryResponse {
  final bool success;
  final List<ChatHistoryMessage> history;

  ChatHistoryResponse({
    required this.success,
    required this.history,
  });

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) {
    return ChatHistoryResponse(
      success: json['success'] ?? false,
      history: (json['history'] as List?)
              ?.map((e) => ChatHistoryMessage.fromJson(e))
              .toList() ??
          [],
    );
  }
}

/// Individual message in history
class ChatHistoryMessage {
  final String role; // "user" or "assistant"
  final String content;
  final DateTime timestamp;

  ChatHistoryMessage({
    required this.role,
    required this.content,
    required this.timestamp,
  });

  factory ChatHistoryMessage.fromJson(Map<String, dynamic> json) {
    return ChatHistoryMessage(
      role: json['role'] ?? '',
      content: json['content'] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';
}

/// Request model for sending message
class ChatMessageRequest {
  final String sessionId;
  final String message;

  ChatMessageRequest({
    required this.sessionId,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'message': message,
    };
  }
}
