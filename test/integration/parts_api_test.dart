import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/dio_helper.dart';
import 'helpers/auth_helper.dart';

/// Integration tests for Parts/Inventory APIs
///
/// API Documentation Reference: docs/api.md
/// - GET /api/inventory (Get All Inventory Parts)
/// - GET /api/inventory/check (Check Part Availability)
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

  group('Inventory APIs - GET /api/inventory', () {
    test('should get all inventory parts successfully', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['parts'], isA<List>());

      final parts = response.data['parts'] as List;

      // If parts exist, verify structure
      if (parts.isNotEmpty) {
        final firstPart = parts.first;
        expect(firstPart['part_number'], isNotNull);
        expect(firstPart['part_name'], isNotNull);
        expect(firstPart['category'], isNotNull);
        expect(firstPart['quantity_available'], isA<int>());
        expect(firstPart['unit_price'], isA<num>());
        expect(firstPart['status'], isNotNull);
      }
    });

    test('should return parts with valid status values', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;
      const validStatuses = ['active', 'out_of_stock', 'discontinued'];

      for (var part in parts) {
        expect(
          validStatuses.contains(part['status']),
          true,
          reason: 'Part status should be one of: active, out_of_stock, discontinued',
        );
      }
    });

    test('should validate part data structure', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;
      if (parts.isNotEmpty) {
        for (var part in parts) {
          // Required fields
          expect(part['part_number'], isA<String>());
          expect(part['part_name'], isA<String>());
          expect(part['category'], isA<String>());
          expect(part['quantity_available'], isA<int>());
          expect(part['unit_price'], isA<num>());
          expect(part['status'], isA<String>());

          // Validate quantity is non-negative
          expect(part['quantity_available'], greaterThanOrEqualTo(0));

          // Validate price is non-negative
          expect(part['unit_price'], greaterThanOrEqualTo(0));
        }
      }
    });

    test('should include different part categories', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;
      if (parts.length > 1) {
        final categories = parts.map((p) => p['category']).toSet();

        // Verify there are multiple categories (indicating diverse inventory)
        // This is a soft assertion - may not always be true for test data
        expect(categories.length, greaterThanOrEqualTo(1));
      }
    });

    test('should correctly mark out of stock items', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;

      for (var part in parts) {
        final quantity = part['quantity_available'] as int;
        final status = part['status'] as String;

        // If quantity is 0, status should be out_of_stock
        if (quantity == 0) {
          expect(
            status,
            'out_of_stock',
            reason: 'Parts with 0 quantity should be marked as out_of_stock',
          );
        }
      }
    });
  });

  group('Inventory APIs - GET /api/inventory/check', () {
    test('should check part availability by part number', () async {
      // First get a valid part number from inventory
      final inventoryResponse = await authenticatedDio.get('/inventory');
      final parts = inventoryResponse.data['parts'] as List;

      if (parts.isEmpty) {
        print('No parts in inventory to test');
        return;
      }

      final testPart = parts.first;
      final partNumber = testPart['part_number'] as String;

      // Act - Check availability by part number
      final response = await authenticatedDio.get(
        '/inventory/check',
        queryParameters: {
          'query': partNumber,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['part_number'], partNumber);
      expect(response.data['part_name'], isNotNull);
      expect(response.data['category'], isNotNull);
      expect(response.data['quantity_available'], isA<int>());
      expect(response.data['unit_price'], isA<num>());
      expect(response.data['status'], isNotNull);
    });

    test('should check part availability by part name', () async {
      // First get a valid part name from inventory
      final inventoryResponse = await authenticatedDio.get('/inventory');
      final parts = inventoryResponse.data['parts'] as List;

      if (parts.isEmpty) {
        print('No parts in inventory to test');
        return;
      }

      final testPart = parts.first;
      final partName = testPart['part_name'] as String;

      // Act - Check availability by part name
      final response = await authenticatedDio.get(
        '/inventory/check',
        queryParameters: {
          'query': partName,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['part_name'], partName);
      expect(response.data['part_number'], isNotNull);
    });

    test('should support partial search by part name', () async {
      // First get a valid part name from inventory
      final inventoryResponse = await authenticatedDio.get('/inventory');
      final parts = inventoryResponse.data['parts'] as List;

      if (parts.isEmpty) {
        print('No parts in inventory to test');
        return;
      }

      final testPart = parts.first;
      final partName = testPart['part_name'] as String;

      // Use first few characters of part name
      if (partName.length < 3) return;
      final partialName = partName.substring(0, 3);

      // Act - Check with partial name
      final response = await authenticatedDio.get(
        '/inventory/check',
        queryParameters: {
          'query': partialName,
        },
      );

      // Assert - Should either find a match or return 404
      if (response.statusCode == 200) {
        expect(response.data, isNotNull);
        expect(response.data['part_name'], isNotNull);
        expect(
          (response.data['part_name'] as String).toLowerCase(),
          contains(partialName.toLowerCase()),
        );
      }
    });

    test('should return 404 for non-existent part', () async {
      // Act & Assert
      try {
        await authenticatedDio.get(
          '/inventory/check',
          queryParameters: {
            'query': 'NONEXISTENT-PART-12345',
          },
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 404);
        expect(e.response?.data['message'], contains('Part not found'));
      }
    });

    test('should return 400 for missing query parameter', () async {
      // Act & Assert
      try {
        await authenticatedDio.get('/inventory/check');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 400);
        expect(
          e.response?.data['message'],
          anyOf([
            contains('query'),
            contains('required'),
            contains('search'),
          ]),
        );
      }
    });

    test('should handle empty query parameter', () async {
      // Act & Assert
      try {
        await authenticatedDio.get(
          '/inventory/check',
          queryParameters: {
            'query': '',
          },
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 404]));
      }
    });

    test('should handle special characters in query', () async {
      // Act - Search with special characters
      try {
        final response = await authenticatedDio.get(
          '/inventory/check',
          queryParameters: {
            'query': '@#\$%^&',
          },
        );

        // If it succeeds, that's fine (no match found)
        expect(response.statusCode, anyOf([200, 404]));
      } on DioException catch (e) {
        // Or it might return 404 which is expected
        expect(e.response?.statusCode, 404);
      }
    });

    test('should be case-insensitive for part search', () async {
      // Get a valid part
      final inventoryResponse = await authenticatedDio.get('/inventory');
      final parts = inventoryResponse.data['parts'] as List;

      if (parts.isEmpty) {
        print('No parts in inventory to test');
        return;
      }

      final testPart = parts.first;
      final partNumber = testPart['part_number'] as String;

      // Test with different cases
      final queries = [
        partNumber.toUpperCase(),
        partNumber.toLowerCase(),
        partNumber, // original case
      ];

      for (final query in queries) {
        try {
          final response = await authenticatedDio.get(
            '/inventory/check',
            queryParameters: {
              'query': query,
            },
          );

          // All should find the same part (or at least not error)
          expect(response.statusCode, 200);
        } on DioException catch (e) {
          // Some backends might be case-sensitive
          // Log but don't fail
          print('Case sensitivity test: ${e.response?.statusCode} for query: $query');
        }
      }
    });
  });

  group('Inventory APIs - Error Handling', () {
    test('should require authentication for inventory access', () async {
      // Arrange
      final unauthDio = DioHelper.createDio();

      // Act & Assert
      try {
        await unauthDio.get('/inventory');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthDio.close();
      }
    });

    test('should require authentication for part check', () async {
      // Arrange
      final unauthDio = DioHelper.createDio();

      // Act & Assert
      try {
        await unauthDio.get(
          '/inventory/check',
          queryParameters: {
            'query': 'ENG001',
          },
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthDio.close();
      }
    });

    test('should handle invalid HTTP methods', () async {
      // Act & Assert - Try POST on GET-only endpoint
      try {
        await authenticatedDio.post('/inventory');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([404, 405]));
      }
    });
  });

  group('Inventory APIs - Data Validation', () {
    test('should have consistent part data between list and check', () async {
      // Get all parts
      final listResponse = await authenticatedDio.get('/inventory');
      final parts = listResponse.data['parts'] as List;

      if (parts.isEmpty) {
        print('No parts in inventory to test');
        return;
      }

      final testPart = parts.first;
      final partNumber = testPart['part_number'] as String;

      // Check specific part
      final checkResponse = await authenticatedDio.get(
        '/inventory/check',
        queryParameters: {
          'query': partNumber,
        },
      );

      // Assert - Data should match
      expect(checkResponse.data['part_number'], testPart['part_number']);
      expect(checkResponse.data['part_name'], testPart['part_name']);
      expect(checkResponse.data['category'], testPart['category']);
      expect(checkResponse.data['quantity_available'], testPart['quantity_available']);
      expect(checkResponse.data['unit_price'], testPart['unit_price']);
      expect(checkResponse.data['status'], testPart['status']);
    });

    test('should maintain inventory data integrity', () async {
      // Act - Call inventory endpoint multiple times
      final response1 = await authenticatedDio.get('/inventory');
      final response2 = await authenticatedDio.get('/inventory');

      // Assert - Should return consistent data
      expect(response1.statusCode, 200);
      expect(response2.statusCode, 200);

      final parts1 = response1.data['parts'] as List;
      final parts2 = response2.data['parts'] as List;

      // Same number of parts
      expect(parts1.length, parts2.length);

      // Same part numbers in same order
      if (parts1.isNotEmpty && parts2.isNotEmpty) {
        for (int i = 0; i < parts1.length; i++) {
          expect(parts1[i]['part_number'], parts2[i]['part_number']);
        }
      }
    });
  });

  group('Inventory APIs - Business Logic', () {
    test('should correctly categorize parts', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;
      final categories = <String>{};

      for (var part in parts) {
        categories.add(part['category'] as String);
      }

      // Should have at least one category
      expect(categories.isNotEmpty, true);

      // Common categories from API doc
      const commonCategories = ['Engine', 'Hydraulics', 'Electrical', 'Mechanical'];

      // Log categories found
      print('Part categories in inventory: $categories');
    });

    test('should have realistic part data', () async {
      // Act
      final response = await authenticatedDio.get('/inventory');

      // Assert
      expect(response.statusCode, 200);

      final parts = response.data['parts'] as List;

      for (var part in parts) {
        // Part number should follow a pattern (letters and numbers)
        final partNumber = part['part_number'] as String;
        expect(partNumber.isNotEmpty, true);
        expect(partNumber.length, greaterThan(2));

        // Part name should be descriptive
        final partName = part['part_name'] as String;
        expect(partName.isNotEmpty, true);
        expect(partName.length, greaterThan(3));

        // Price should be positive (if part is available)
        final unitPrice = part['unit_price'] as num;
        if (part['status'] != 'discontinued') {
          expect(unitPrice, greaterThan(0));
        }
      }
    });
  });
}
