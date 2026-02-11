import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/documents/data/api/document_api_client.dart';
import 'package:fsm/features/documents/data/models/document_dto.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late DocumentApiClient apiClient;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    dioAdapter = DioAdapter(dio: dio);
    apiClient = DocumentApiClient(dio);
  });

  group('getDocuments', () {
    final tDocumentResponse = {
      'uploads': [
        {
          'id': '1',
          'title': 'Test Doc',
          'description': 'Desc',
          'category': 'manual',
          'related_model': 'work_order',
          'files': [
            {
              'id': 1,
              'file_name': 'test.pdf',
              'file_url': 'url',
              'file_type': 'pdf',
              'file_size': 1024,
            }
          ],
          'uploaded_by': 1,
          'uploader': {
            'id': 1,
            'first_name': 'Test',
            'last_name': 'User',
            'email': 'test@test.com',
            'role_id': 1,
          },
          'createdAt': '2025-01-01T00:00:00Z',
          'updatedAt': '2025-01-01T00:00:00Z',
          'keywords': 'test',
          'tags': ['tag1'],
        }
      ],
      'total': 1,
      'page': 1,
      'pages': 1,
    };

    test('should return DocumentResponseDto when status is 200', () async {
      // Arrange
      dioAdapter.onGet(
        '/documents',
        (server) => server.reply(200, tDocumentResponse),
        queryParameters: {'page': 1, 'limit': 10},
      );

      // Act
      final result = await apiClient.getDocuments(page: 1, limit: 10);

      // Assert
      expect(result.documents.length, 1);
      expect(result.documents.first.id, '1');
      expect(result.total, 1);
    });

    test('should throw DioException when status is not 200', () async {
      // Arrange
      dioAdapter.onGet(
        '/documents',
        (server) => server.reply(404, {'message': 'Not Found'}),
      );

      // Act
      final call = apiClient.getDocuments();

      // Assert
      expect(call, throwsA(isA<DioException>()));
    });
    group('check query parameters', () {
      test('should pass query parameters correctly', () async {
        // Arrange
        dioAdapter.onGet(
          '/documents',
          (server) => server.reply(200, tDocumentResponse),
          queryParameters: {
            'model': 'work_order',
            'category': 'safety',
            'keyword': 'test',
            'page': 2,
            'limit': 20,
          },
        );

        // Act
        final result = await apiClient.getDocuments(
          model: 'work_order',
          category: 'safety',
          keyword: 'test',
          page: 2,
          limit: 20,
        );

        // Assert
        expect(result.documents.isNotEmpty, true);
      });
    });
  });
}
