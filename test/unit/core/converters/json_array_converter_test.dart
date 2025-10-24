import 'package:test/test.dart';
import 'package:fsm/core/converters/json_array_converter.dart';

// Simple test model
class TestModel {
  const TestModel({
    required this.id,
    required this.name,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  final int id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'TestModel(id: $id, name: $name)';
}

void main() {
  group('JsonArrayConverter', () {
    late JsonArrayConverterWithFactory<TestModel> converter;

    setUp(() {
      converter = JsonArrayConverterWithFactory<TestModel>(
        fromJsonFactory: TestModel.fromJson,
        toJsonFactory: (model) => model.toJson(),
      );
    });

    test('should parse valid JSON array string', () {
      const jsonString = '[{"id":1,"name":"Test1"},{"id":2,"name":"Test2"}]';
      
      final result = converter.fromJson(jsonString);
      
      expect(result, hasLength(2));
      expect(result[0].id, equals(1));
      expect(result[0].name, equals('Test1'));
      expect(result[1].id, equals(2));
      expect(result[1].name, equals('Test2'));
    });

    test('should handle empty string', () {
      final result = converter.fromJson('');
      
      expect(result, isEmpty);
    });

    test('should handle empty array', () {
      final result = converter.fromJson('[]');
      
      expect(result, isEmpty);
    });

    test('should convert objects back to JSON string', () {
      final models = [
        const TestModel(id: 1, name: 'Test1'),
        const TestModel(id: 2, name: 'Test2'),
      ];
      
      final result = converter.toJson(models);
      
      expect(result, equals('[{"id":1,"name":"Test1"},{"id":2,"name":"Test2"}]'));
    });

    test('should handle empty list serialization', () {
      final result = converter.toJson(<TestModel>[]);
      
      expect(result, equals('[]'));
    });

    test('should throw FormatException for invalid JSON', () {
      expect(
        () => converter.fromJson('invalid json'),
        throwsA(isA<FormatException>()),
      );
    });

    test('should throw FormatException for non-Map objects in array', () {
      expect(
        () => converter.fromJson('[1, 2, 3]'),
        throwsA(isA<FormatException>()),
      );
    });

    test('should round-trip conversion', () {
      final originalModels = [
        const TestModel(id: 1, name: 'Test1'),
        const TestModel(id: 2, name: 'Test2'),
        const TestModel(id: 3, name: 'Test3'),
      ];
      
      final jsonString = converter.toJson(originalModels);
      final parsedModels = converter.fromJson(jsonString);
      
      expect(parsedModels, equals(originalModels));
    });
  });
}