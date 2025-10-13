class AIAssistanceCollection {
  final String query;
  final String answer;
  final List<String> context;
  final DateTime? timestamp;

  AIAssistanceCollection({
    required this.query,
    required this.answer,
    required this.context,
    this.timestamp,
  });

  AIAssistanceCollection copyWith({
    String? query,
    String? answer,
    List<String>? context,
    DateTime? timestamp,
  }) {
    return AIAssistanceCollection(
      query: query ?? this.query,
      answer: answer ?? this.answer,
      context: context ?? this.context,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'query': query,
      'answer': answer,
      'context': context,
      'timestamp': timestamp?.toIso8601String(),
    };
  }

  factory AIAssistanceCollection.fromJson(Map<String, dynamic> map) {
    return AIAssistanceCollection(
      query: map['query'] ?? "",
      answer: map['answer'] ?? "",
      context: List<String>.from((map['context'] as List<String>)),
      timestamp:
          map['timestamp'] != null ? DateTime.parse(map['timestamp']) : null,
    );
  }
}
