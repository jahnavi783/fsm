import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/dio_helper.dart';
import 'helpers/auth_helper.dart';

/// Integration tests for Documents APIs
///
/// API Documentation Reference: docs/api.md
/// - GET /api/documents (Get Documents with filters)
///
/// Note: Upload, Update, Delete operations require Manager role
/// and are not tested here as we're using Technician credentials
void main() {
  late Dio authenticatedDio;

  setUpAll(() async {
    final token = await AuthHelper.loginAsTechnician();
    authenticatedDio = DioHelper.createDio(authToken: token);
  });

  tearDownAll(() {
    AuthHelper.clearTokens();
    authenticatedDio.close();
  });

  group('Documents APIs - GET /api/documents', () {
    test('should get all documents successfully', () async {
      // Act
      final response = await authenticatedDio.get('/documents');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['uploads'], isA<List>()); // API returns 'uploads', not 'documents'
      expect(response.data['total'], isA<int>());

      // If documents exist, verify structure
      final documents = response.data['uploads'] as List;
      if (documents.isNotEmpty) {
        final firstDoc = documents.first;
        expect(firstDoc['upload_id'], isNotNull);
        expect(firstDoc['title'], isNotNull);
        expect(firstDoc['category'], isNotNull);
        expect(firstDoc['files'], isA<List>());
        expect(firstDoc['uploaded_by'], isNotNull);
      }
    });

    test('should get documents with pagination', () async {
      // Act
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'page': 1,
          'limit': 5,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['page'], 1);
      expect(response.data['pages'], isA<int>());

      final documents = response.data['uploads'] as List;
      expect(documents.length, lessThanOrEqualTo(5));
    });

    test('should filter documents by category', () async {
      // Test with different categories: manual, sop, repair_guide, other
      const categories = ['sop', 'manual', 'repair_guide', 'other'];

      for (final category in categories) {
        // Act
        final response = await authenticatedDio.get(
          '/documents',
          queryParameters: {
            'category': category,
          },
        );

        // Assert
        expect(response.statusCode, 200);
        expect(response.data['uploads'], isA<List>());

        // Verify all returned documents match the category
        final documents = response.data['uploads'] as List;
        for (var doc in documents) {
          expect(doc['category'], category,
              reason: 'All documents should match the requested category');
        }
      }
    });

    test('should filter documents by model', () async {
      // Act - Try filtering by a model (e.g., from seeded data)
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'model': 'WIG-LF5000', // Example model from API doc
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());

      // If documents exist, verify they're related to the model
      final documents = response.data['uploads'] as List;
      for (var doc in documents) {
        if (doc['related_model'] != null) {
          expect(
            doc['related_model'],
            contains('WIG-LF5000'),
            reason: 'Documents should be related to the requested model',
          );
        }
      }
    });

    test('should search documents by keyword', () async {
      // Act - Search with common keywords
      final keywords = ['battery', 'repair', 'maintenance'];

      for (final keyword in keywords) {
        final response = await authenticatedDio.get(
          '/documents',
          queryParameters: {
            'keyword': keyword,
          },
        );

        // Assert
        expect(response.statusCode, 200);
        expect(response.data['uploads'], isA<List>());

        // If documents exist, verify keyword appears in title, description, or keywords
        final documents = response.data['uploads'] as List;
        for (var doc in documents) {
          final titleContains = (doc['title'] as String?)?.toLowerCase().contains(keyword.toLowerCase()) ?? false;
          final descContains = (doc['description'] as String?)?.toLowerCase().contains(keyword.toLowerCase()) ?? false;
          final keywordsContain = (doc['keywords'] as List?)?.any(
                    (k) => k.toString().toLowerCase().contains(keyword.toLowerCase()),
                  ) ?? false;

          final hasKeyword = titleContains || descContains || keywordsContain;

          expect(hasKeyword, true,
              reason: 'Document should contain the search keyword');
        }
      }
    });

    test('should combine multiple filters', () async {
      // Act - Filter by category AND keyword
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'category': 'sop',
          'keyword': 'battery',
          'page': 1,
          'limit': 10,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());

      // Verify pagination
      expect(response.data['page'], 1);

      // Verify filters are applied
      final documents = response.data['uploads'] as List;
      if (documents.isNotEmpty) {
        for (var doc in documents) {
          expect(doc['category'], 'sop');
        }
      }
    });

    test('should return empty list for non-existent category', () async {
      // Act
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'category': 'non_existent_category',
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());
      expect(response.data['total'], 0);
    });

    test('should return empty list for non-matching keyword', () async {
      // Act
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'keyword': 'xyznonexistentkeyword123',
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());
      expect(response.data['total'], 0);
    });

    test('should handle pagination beyond available pages', () async {
      // Act - Request page 9999 which likely doesn't exist
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'page': 9999,
          'limit': 10,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());
      expect(response.data['uploads'], isEmpty);
    });

    test('should validate document structure', () async {
      // Act
      final response = await authenticatedDio.get('/documents');

      // Assert
      expect(response.statusCode, 200);

      final documents = response.data['uploads'] as List;
      if (documents.isNotEmpty) {
        final doc = documents.first;

        // Required fields
        expect(doc['upload_id'], isA<String>());
        expect(doc['title'], isA<String>());
        expect(doc['category'], isA<String>());
        expect(doc['files'], isA<List>());
        expect(doc['uploaded_by'], isA<Map>());
        expect(doc['createdAt'], isA<String>());

        // Optional fields (may be null)
        // description, related_model, keywords

        // Uploaded by structure
        expect(doc['uploaded_by']['id'], isA<int>());
        expect(doc['uploaded_by']['first_name'], isA<String>());
        expect(doc['uploaded_by']['email'], isA<String>());

        // Files structure
        final files = doc['files'] as List;
        if (files.isNotEmpty) {
          final file = files.first;
          expect(file['id'], isA<int>());
          expect(file['filename'], isA<String>());
          expect(file['file_url'], isA<String>());
          expect(file['file_type'], isA<String>());
          expect(file['file_size'], isA<int>());
        }
      }
    });
  });

  group('Documents APIs - Error Handling', () {
    test('should require authentication', () async {
      // Arrange
      final unauthDio = DioHelper.createDio();

      // Act & Assert
      try {
        await unauthDio.get('/documents');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthDio.close();
      }
    });

    test('should handle invalid category gracefully', () async {
      // Act
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'category': 'invalid@category!',
        },
      );

      // Assert - Should either return empty or handle gracefully
      expect(response.statusCode, anyOf([200, 400]));

      if (response.statusCode == 200) {
        expect(response.data['documents'], isA<List>());
      }
    });

    test('should handle invalid pagination parameters', () async {
      // Act - Negative page number
      try {
        final response = await authenticatedDio.get(
          '/documents',
          queryParameters: {
            'page': -1,
            'limit': 10,
          },
        );

        // If it doesn't throw, it should still return valid data
        expect(response.statusCode, 200);
        expect(response.data['documents'], isA<List>());
      } on DioException catch (e) {
        // Or it might return 400 for invalid parameters
        expect(e.response?.statusCode, 400);
      }
    });

    test('should handle invalid limit parameter', () async {
      // Act - Zero or negative limit
      try {
        final response = await authenticatedDio.get(
          '/documents',
          queryParameters: {
            'page': 1,
            'limit': 0,
          },
        );

        // Should handle gracefully
        expect(response.statusCode, anyOf([200, 400]));
        if (response.statusCode == 200) {
          expect(response.data['uploads'], isA<List>());
        }
      } on DioException catch (e) {
        expect(e.response?.statusCode, 400);
      }
    });
  });

  group('Documents APIs - Performance and Edge Cases', () {
    test('should handle large limit parameter', () async {
      // Act - Request very large limit
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'limit': 1000,
        },
      );

      // Assert - Should handle gracefully (might cap at max limit)
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());

      final documents = response.data['uploads'] as List;
      expect(documents.length, lessThanOrEqualTo(1000));
    });

    test('should handle empty keyword search', () async {
      // Act - Empty string keyword
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'keyword': '',
        },
      );

      // Assert - Should return all documents or handle gracefully
      expect(response.statusCode, 200);
      expect(response.data['uploads'], isA<List>());
    });

    test('should handle special characters in keyword', () async {
      // Act - Special characters in search
      final response = await authenticatedDio.get(
        '/documents',
        queryParameters: {
          'keyword': '@#\$%^&*()',
        },
      );

      // Assert - Should not crash
      expect(response.statusCode, anyOf([200, 400]));

      if (response.statusCode == 200) {
        expect(response.data['uploads'], isA<List>());
      }
    });
  });
}
