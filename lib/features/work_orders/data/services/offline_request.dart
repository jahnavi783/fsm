// // import 'dart:convert';
// //
// // class OfflineRequest {
// //   final String id;
// //   final String url;
// //   final String method;
// //   final Map<String, dynamic> body;
// //   final Map<String, String> headers;
// //   final String description;
// //
// //   OfflineRequest({
// //     required this.id,
// //     required this.url,
// //     required this.method,
// //     required this.body,
// //     required this.headers,
// //     required this.description,
// //   });
// //
// //   Map<String, dynamic> toJson() => {
// //         'id': id,
// //         'url': url,
// //         'method': method,
// //         'body': body,
// //         'headers': headers,
// //         'description': description,
// //       };
// //
// //   factory OfflineRequest.fromJson(Map<String, dynamic> json) => OfflineRequest(
// //         id: json['id'],
// //         url: json['url'],
// //         method: json['method'],
// //         body: Map<String, dynamic>.from(json['body']),
// //         headers: Map<String, String>.from(json['headers']),
// //         description: json['description'],
// //       );
// //
// //   static String encodeList(List<OfflineRequest> list) =>
// //       jsonEncode(list.map((e) => e.toJson()).toList());
// //
// //   static List<OfflineRequest> decodeList(String raw) {
// //     final data = jsonDecode(raw) as List;
// //     return data.map((e) => OfflineRequest.fromJson(e)).toList();
// //   }
// // }
// import 'dart:convert';
//
// /// Represents a queued API request that will be executed when connectivity is restored
// class OfflineRequest {
//   final String id;
//   final String url;
//   final String method;
//   final Map<String, dynamic> body;
//   final Map<String, String> headers;
//   final String description;
//   final DateTime timestamp;
//   final int retryCount;
//   final String? workOrderId;
//
//   OfflineRequest({
//     required this.id,
//     required this.url,
//     required this.method,
//     required this.body,
//     required this.headers,
//     required this.description,
//     DateTime? timestamp,
//     this.retryCount = 0,
//     this.workOrderId,
//   }) : timestamp = timestamp ?? DateTime.now();
//
//   /// Create a copy with updated fields
//   OfflineRequest copyWith({
//     String? id,
//     String? url,
//     String? method,
//     Map<String, dynamic>? body,
//     Map<String, String>? headers,
//     String? description,
//     DateTime? timestamp,
//     int? retryCount,
//     String? workOrderId,
//   }) {
//     return OfflineRequest(
//       id: id ?? this.id,
//       url: url ?? this.url,
//       method: method ?? this.method,
//       body: body ?? this.body,
//       headers: headers ?? this.headers,
//       description: description ?? this.description,
//       timestamp: timestamp ?? this.timestamp,
//       retryCount: retryCount ?? this.retryCount,
//       workOrderId: workOrderId ?? this.workOrderId,
//     );
//   }
//
//   /// Convert to JSON for persistence
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'url': url,
//         'method': method,
//         'body': body,
//         'headers': headers,
//         'description': description,
//         'timestamp': timestamp.toIso8601String(),
//         'retryCount': retryCount,
//         'workOrderId': workOrderId,
//       };
//
//   /// Create from JSON
//   factory OfflineRequest.fromJson(Map<String, dynamic> json) {
//     return OfflineRequest(
//       id: json['id'] as String,
//       url: json['url'] as String,
//       method: json['method'] as String,
//       body: Map<String, dynamic>.from(json['body'] as Map),
//       headers: Map<String, String>.from(json['headers'] as Map),
//       description: json['description'] as String,
//       timestamp: DateTime.parse(json['timestamp'] as String),
//       retryCount: json['retryCount'] as int? ?? 0,
//       workOrderId: json['workOrderId'] as String?,
//     );
//   }
//
//   /// Encode list of requests to JSON string
//   static String encodeList(List<OfflineRequest> list) {
//     return jsonEncode(list.map((e) => e.toJson()).toList());
//   }
//
//   /// Decode JSON string to list of requests
//   static List<OfflineRequest> decodeList(String raw) {
//     if (raw.isEmpty) return [];
//     final data = jsonDecode(raw) as List;
//     return data
//         .map((e) => OfflineRequest.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
//
//   @override
//   String toString() {
//     return 'OfflineRequest{id: $id, method: $method, url: $url, description: $description, timestamp: $timestamp, retryCount: $retryCount}';
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is OfflineRequest && other.id == id;
//   }
//
//   @override
//   int get hashCode => id.hashCode;
// }
import 'dart:convert';

/// Represents a queued API request that will be executed when connectivity is restored
class OfflineRequest {
  final String id;
  final String url;
  final String method;
  final Map<String, dynamic> body;
  final Map<String, String> headers;
  final String description;
  final int sequenceNumber;
  final String? workOrderId;

  OfflineRequest({
    required this.id,
    required this.url,
    required this.method,
    required this.body,
    required this.headers,
    required this.description,
    required this.sequenceNumber,
    this.workOrderId,
  });

  /// Convert to JSON for persistence
  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'method': method,
        'body': body,
        'headers': headers,
        'description': description,
        'sequenceNumber': sequenceNumber,
        'workOrderId': workOrderId,
      };

  /// Create from JSON
  factory OfflineRequest.fromJson(Map<String, dynamic> json) {
    return OfflineRequest(
      id: json['id'] as String,
      url: json['url'] as String,
      method: json['method'] as String,
      body: Map<String, dynamic>.from(json['body'] as Map),
      headers: Map<String, String>.from(json['headers'] as Map),
      description: json['description'] as String,
      sequenceNumber: json['sequenceNumber'] as int? ?? 0,
      workOrderId: json['workOrderId'] as String?,
    );
  }

  /// Encode list of requests to JSON string
  static String encodeList(List<OfflineRequest> list) {
    return jsonEncode(list.map((e) => e.toJson()).toList());
  }

  /// Decode JSON string to list of requests
  static List<OfflineRequest> decodeList(String raw) {
    if (raw.isEmpty) return [];
    try {
      final data = jsonDecode(raw) as List;
      return data
          .map((e) => OfflineRequest.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error decoding offline requests: $e');
      return [];
    }
  }

  @override
  String toString() {
    return 'OfflineRequest{id: $id, seq: $sequenceNumber, method: $method, url: $url, workOrderId: $workOrderId, description: $description}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfflineRequest && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
