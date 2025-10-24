import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

/// A generic JsonConverter that converts between a stringified JSON array and a List of objects
/// 
/// Usage example:
/// ```dart
/// @JsonSerializable()
/// class MyModel {
///   @JsonArrayConverter<User>()
///   final List<User> users;
///   
///   // ... rest of the class
/// }
/// ```
class JsonArrayConverter<T> implements JsonConverter<List<T>, String> {
  const JsonArrayConverter();

  @override
  List<T> fromJson(String json) {
    if (json.isEmpty) {
      return <T>[];
    }

    try {
      final List<dynamic> decoded = jsonDecode(json) as List<dynamic>;
      return decoded.map((item) {
        if (item is Map<String, dynamic>) {
          return _fromJsonMap<T>(item);
        } else {
          throw ArgumentError('Expected Map<String, dynamic>, got ${item.runtimeType}');
        }
      }).toList();
    } catch (e) {
      throw FormatException('Failed to parse JSON array: $e');
    }
  }

  @override
  String toJson(List<T> object) {
    try {
      final List<Map<String, dynamic>> jsonList = object.map((item) {
        return _toJsonMap(item);
      }).toList();
      
      return jsonEncode(jsonList);
    } catch (e) {
      throw FormatException('Failed to encode object list to JSON: $e');
    }
  }

  /// Helper method to convert a Map to the generic type T
  /// This assumes that T has a fromJson constructor
  /// 
  /// Note: This method uses reflection-like patterns and may need to be
  /// extended for each specific type in your application.
  /// For better type safety, use JsonArrayConverterWithFactory instead.
  T _fromJsonMap<T>(Map<String, dynamic> json) {
    // This is a fallback approach - ideally use JsonArrayConverterWithFactory
    // for type-safe conversions with explicit factory functions
    try {
      // Try to call the fromJson method dynamically
      // This assumes T has a static fromJson method
      return (T as dynamic).fromJson(json) as T;
    } catch (e) {
      throw UnsupportedError(
        'Type $T does not have a fromJson(Map<String, dynamic>) constructor. '
        'Please use JsonArrayConverterWithFactory with explicit factory functions instead.',
      );
    }
  }

  /// Helper method to convert the generic type T to a Map
  /// This assumes that T has a toJson method
  Map<String, dynamic> _toJsonMap(T object) {
    if (object case final HasToJson hasToJson) {
      return hasToJson.toJson();
    }
    
    // Fallback for common patterns
    try {
      return (object as dynamic).toJson() as Map<String, dynamic>;
    } catch (e) {
      throw UnsupportedError('Type ${object.runtimeType} does not have a toJson() method. '
          'Ensure your model implements toJson() or use JsonArrayConverterWithFactory instead.');
    }
  }
}

/// Interface to ensure type safety for toJson method
abstract class HasToJson {
  Map<String, dynamic> toJson();
}

/// Alternative converter that accepts factory functions for better type safety
class JsonArrayConverterWithFactory<T> implements JsonConverter<List<T>, String> {
  const JsonArrayConverterWithFactory({
    required this.fromJsonFactory,
    required this.toJsonFactory,
  });

  final T Function(Map<String, dynamic>) fromJsonFactory;
  final Map<String, dynamic> Function(T) toJsonFactory;

  @override
  List<T> fromJson(String json) {
    if (json.isEmpty) {
      return <T>[];
    }

    try {
      final List<dynamic> decoded = jsonDecode(json) as List<dynamic>;
      return decoded.map((item) {
        if (item is Map<String, dynamic>) {
          return fromJsonFactory(item);
        } else {
          throw ArgumentError('Expected Map<String, dynamic>, got ${item.runtimeType}');
        }
      }).toList();
    } catch (e) {
      throw FormatException('Failed to parse JSON array: $e');
    }
  }

  @override
  String toJson(List<T> object) {
    try {
      final List<Map<String, dynamic>> jsonList = object.map(toJsonFactory).toList();
      return jsonEncode(jsonList);
    } catch (e) {
      throw FormatException('Failed to encode object list to JSON: $e');
    }
  }
}

/// Nullable version of JsonArrayConverter that handles null or String values
/// Returns null if input is null or empty string, otherwise parses the JSON string
class NullableJsonArrayConverter<T> implements JsonConverter<List<T>?, dynamic> {
  const NullableJsonArrayConverter();

  @override
  List<T>? fromJson(dynamic json) {
    // Handle null case
    if (json == null) {
      return null;
    }

    // Handle List case (if API sends array directly)
    if (json is List) {
      return json.map((item) {
        if (item is Map<String, dynamic>) {
          return _fromJsonMap(item);
        } else {
          throw ArgumentError('Expected Map<String, dynamic>, got ${item.runtimeType}');
        }
      }).toList();
    }

    // Handle String case (JSON string)
    if (json is String) {
      if (json.isEmpty) {
        return null;
      }

      try {
        final List<dynamic> decoded = jsonDecode(json) as List<dynamic>;
        return decoded.map((item) {
          if (item is Map<String, dynamic>) {
            return _fromJsonMap(item);
          } else {
            throw ArgumentError('Expected Map<String, dynamic>, got ${item.runtimeType}');
          }
        }).toList();
      } catch (e) {
        throw FormatException('Failed to parse JSON array: $e');
      }
    }

    throw ArgumentError('Expected null, List, or String, got ${json.runtimeType}');
  }

  @override
  dynamic toJson(List<T>? object) {
    if (object == null) {
      return null;
    }

    try {
      final List<Map<String, dynamic>> jsonList = object.map((item) {
        return _toJsonMap(item);
      }).toList();

      return jsonEncode(jsonList);
    } catch (e) {
      throw FormatException('Failed to encode object list to JSON: $e');
    }
  }

  T _fromJsonMap(Map<String, dynamic> json) {
    try {
      return (T as dynamic).fromJson(json) as T;
    } catch (e) {
      throw UnsupportedError(
        'Type $T does not have a fromJson(Map<String, dynamic>) constructor.',
      );
    }
  }

  Map<String, dynamic> _toJsonMap(T object) {
    if (object case final HasToJson hasToJson) {
      return hasToJson.toJson();
    }

    try {
      return (object as dynamic).toJson() as Map<String, dynamic>;
    } catch (e) {
      throw UnsupportedError('Type ${object.runtimeType} does not have a toJson() method.');
    }
  }
}