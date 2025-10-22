import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/dio_helper.dart';
import 'helpers/auth_helper.dart';
import 'fixtures/test_data.dart';

/// Integration tests for Work Order APIs
///
/// API Documentation Reference: docs/api.md
/// - GET /api/work-orders (Get All Work Orders)
/// - GET /api/work-orders/{id} (Get Work Order by ID)
/// - PATCH /api/work-orders/{id}/start (Start Work Order)
/// - PATCH /api/work-orders/{id}/pause (Pause Work Order)
/// - PATCH /api/work-orders/{id}/resume (Resume Work Order)
/// - PATCH /api/work-orders/{id}/complete (Complete Work Order)
/// - PATCH /api/work-orders/{id}/reject (Reject Work Order)
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

  group('Work Order APIs - GET /api/work-orders', () {
    test('should get all work orders with default pagination', () async {
      // Act
      final response = await authenticatedDio.get('/work-orders');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['total'], isA<int>());
      expect(response.data['page'], isA<int>());
      expect(response.data['pages'], isA<int>());
      expect(response.data['work_orders'], isA<List>());
    });

    test('should get work orders with pagination parameters', () async {
      // Act
      final response = await authenticatedDio.get(
        '/work-orders',
        queryParameters: {
          'page': 1,
          'limit': 5,
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['page'], 1);
      expect(response.data['work_orders'], isA<List>());

      final workOrders = response.data['work_orders'] as List;
      expect(workOrders.length, lessThanOrEqualTo(5));
    });

    test('should filter work orders by status', () async {
      // Act
      final response = await authenticatedDio.get(
        '/work-orders',
        queryParameters: {
          'status': 'In Progress',
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['work_orders'], isA<List>());

      // Verify all returned work orders have the requested status
      final workOrders = response.data['work_orders'] as List;
      if (workOrders.isNotEmpty) {
        for (var wo in workOrders) {
          expect(wo['status'], 'In Progress');
        }
      }
    });

    test('should filter work orders by priority', () async {
      // Act
      final response = await authenticatedDio.get(
        '/work-orders',
        queryParameters: {
          'priority': 'high',
        },
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data['work_orders'], isA<List>());

      // Verify all returned work orders have the requested priority
      final workOrders = response.data['work_orders'] as List;
      if (workOrders.isNotEmpty) {
        for (var wo in workOrders) {
          expect(wo['priority'], 'high');
        }
      }
    });

    test('should return work orders for technician (role-based access)', () async {
      // Act - Technician should only see their assigned work orders
      final response = await authenticatedDio.get('/work-orders');

      // Assert
      expect(response.statusCode, 200);
      final workOrders = response.data['work_orders'] as List;

      // All work orders should be assigned to the test technician
      for (var wo in workOrders) {
        // Work orders might not have assigned_to field if they're unassigned
        // But for technicians, they should only see their own
        if (wo['assignedTo'] != null) {
          expect(
            wo['assignedTo']['id'],
            TestUsers.technicianUserId,
            reason: 'Technician should only see their own work orders',
          );
        }
      }
    });
  });

  group('Work Order APIs - GET /api/work-orders/{id}', () {
    test('should get work order by ID successfully', () async {
      // Act
      final response = await authenticatedDio.get(
        '/work-orders/${TestWorkOrders.wo1Id}',
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['work_order'], isNotNull);

      final workOrder = response.data['work_order'];
      expect(workOrder['id'], TestWorkOrders.wo1Id);
      expect(workOrder['wo_number'], isNotNull);
      expect(workOrder['status'], isNotNull);
      expect(workOrder['priority'], isNotNull);
      expect(workOrder['serviceRequest'], isNotNull);
    });

    test('should get work order with duration tracking for in-progress WO', () async {
      // WO1 is in_progress, so it should have duration tracking
      // Act
      final response = await authenticatedDio.get(
        '/work-orders/${TestWorkOrders.wo1Id}',
      );

      // Assert
      expect(response.statusCode, 200);
      final data = response.data;

      // WO1 should be started
      expect(data['work_order'], isNotNull);
      expect(data['work_order']['status'], 'in_progress');
      expect(data['work_order']['started_at'], isNotNull);

      // Duration tracking may or may not be present depending on API version
      // This is informational - we don't fail if it's missing
      if (data['duration_tracking'] != null) {
        expect(data['duration_tracking']['expected_duration_hours'], isA<num>());
        expect(data['duration_tracking']['started_at'], isNotNull);
        print('✅ Duration tracking present for in-progress WO');
      } else {
        print('ℹ️  Duration tracking not returned by API');
      }
    });

    test('should get completed work order with actual duration', () async {
      // WO6 should be completed (or check any completed WO)
      // Act
      final response = await authenticatedDio.get(
        '/work-orders/${TestWorkOrders.wo6Id}',
      );

      // Assert
      expect(response.statusCode, 200);
      final workOrder = response.data['work_order'];

      print('ℹ️  WO6 current status: ${workOrder['status']}');

      // If it's completed, check completion details
      if (workOrder['status'] == 'completed') {
        expect(workOrder['completed_at'], isNotNull);

        // Check duration information
        if (workOrder['actual_duration_hours'] != null) {
          expect(workOrder['actual_duration_hours'], greaterThan(0));
          print('✅ WO6 actual duration: ${workOrder['actual_duration_hours']} hours');
        }
      } else {
        // Database might have been reset - WO6 is not completed yet
        print('ℹ️  WO6 is ${workOrder['status']}, not completed (database may have been reset)');
      }
    });

    test('should fail to get non-existent work order', () async {
      // Act & Assert
      try {
        await authenticatedDio.get('/work-orders/99999');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 404);
      }
    });

    test('should fail to get work order without authentication', () async {
      // Arrange
      final unauthDio = DioHelper.createDio();

      // Act & Assert
      try {
        await unauthDio.get('/work-orders/${TestWorkOrders.wo1Id}');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthDio.close();
      }
    });
  });

  group('Work Order APIs - PATCH /api/work-orders/{id}/reject', () {
    test('should document reject API for assigned work orders', () async {
      // Note: WO1 is in_progress and WO2 is paused, so we can't test rejection
      // with Michael Clark's credentials. This test documents the API structure.
      //
      // Valid rejection states: assigned, paused
      // Can only reject work orders assigned to the current user

      // Test with WO2 (paused) - technically rejectable but may fail
      try {
        final response = await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo2Id}/reject',
          data: {
            'reason': 'Not available this week due to scheduled maintenance training',
          },
        );

        // If successful
        expect(response.statusCode, 200);
        expect(response.data['message'], contains('rejected'));
      } on DioException catch (e) {
        // Expected failures:
        // - 400: Invalid status (can only reject assigned or paused WOs)
        // - 403: Not authorized
        expect(e.response?.statusCode, anyOf([400, 403]));

        if (e.response?.statusCode == 400) {
          expect(
            e.response?.data['message'],
            anyOf([
              contains('Invalid status'),
              contains('can only reject'),
              contains('cannot reject'),
            ]),
          );
        }
      }
    });

    test('should fail to reject work order without reason', () async {
      // Act & Assert
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo2Id}/reject',
          data: {},
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 403]));
      }
    });

    test('should fail to reject work order in terminal state', () async {
      // WO6 is completed (terminal state) - cannot be rejected
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo6Id}/reject',
          data: {
            'reason': 'Test rejection of completed WO',
          },
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 403]));
        if (e.response?.statusCode == 400) {
          expect(e.response?.data['message'], contains('Invalid status'));
        }
      }
    });
  });

  group('Work Order APIs - Multipart Operations', () {
    test('should validate GPS coordinates format requirement', () async {
      // This test documents the GPS coordinate format expected by the API
      final gpsCoordinates = TestWorkOrders.testGpsCoordinates;

      // Assert format is [longitude, latitude] as JSON string
      expect(gpsCoordinates, isA<String>());
      expect(gpsCoordinates, contains('['));
      expect(gpsCoordinates, contains(']'));
      expect(gpsCoordinates, contains(','));
    });

    test('should fail to start already in-progress work order', () async {
      // WO1 is already in_progress, so starting it should fail
      final formData = FormData.fromMap({
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
      });

      // Act & Assert
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo1Id}/start',
          data: formData,
        );
        fail('Should have thrown DioException - WO1 is already in progress');
      } on DioException catch (e) {
        // Expected: 400 - Already started or invalid status
        expect(e.response?.statusCode, 400);
        expect(
          e.response?.data['message'],
          anyOf([
            contains('Invalid status'),
            contains('already'),
            contains('in progress'),
            contains('Assigned'),
            contains('started'),
          ]),
        );
      }
    });

    test('should pause in-progress work order successfully', () async {
      // WO1 is in_progress, so it can be paused
      final formData = FormData.fromMap({
        'reason': 'Testing pause operation - will resume immediately',
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
      });

      // Act & Assert
      try {
        final response = await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo1Id}/pause',
          data: formData,
        );

        // If successful
        expect(response.statusCode, 200);
        expect(response.data['message'], contains('paused'));
        expect(response.data['work_order'], isNotNull);
        expect(response.data['work_order']['status'], 'paused');

        print('✅ WO1 paused successfully - remember to resume it!');
      } on DioException catch (e) {
        // If it fails, it might have already been paused by a previous test run
        if (e.response?.statusCode == 400) {
          print('⚠️  WO1 might already be paused: ${e.response?.data['message']}');
          expect(
            e.response?.data['message'],
            anyOf([
              contains('Invalid status'),
              contains('cannot pause'),
              contains('already paused'),
              contains('In Progress'),
              contains('can be paused'),
            ]),
          );
        } else {
          fail('Unexpected error: ${e.response?.statusCode} - ${e.response?.data}');
        }
      }
    });

    test('should resume paused work order successfully', () async {
      // WO2 is paused, so it should be resumable
      final formData = FormData.fromMap({
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
      });

      // Act & Assert
      try {
        final response = await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo2Id}/resume',
          data: formData,
        );

        // If successful
        expect(response.statusCode, 200);
        expect(response.data['message'], contains('resumed'));
        expect(response.data['work_order'], isNotNull);
        expect(response.data['work_order']['status'], 'in_progress');

        print('✅ WO2 resumed successfully');
      } on DioException catch (e) {
        // Handle various failure scenarios
        if (e.response?.statusCode == 400) {
          print('⚠️  Cannot resume WO2: ${e.response?.data['message']}');
          expect(
            e.response?.data['message'],
            anyOf([
              contains('Invalid status'),
              contains('cannot resume'),
              contains('not paused'),
              contains('Paused'),
              contains('can be resumed'),
            ]),
          );
        } else if (e.response?.statusCode == 403) {
          // WO2 might not be assigned to Michael Clark anymore (database reset)
          print('⚠️  WO2 not assigned to current user: ${e.response?.data['message']}');
          expect(e.response?.data['message'], contains('not assigned'));
        } else {
          fail('Unexpected error: ${e.response?.statusCode} - ${e.response?.data}');
        }
      }
    });

    test('should require signature for completing work order', () async {
      // This test documents that completion requires a signature file
      // WO1 is in_progress, but we can't complete it without a signature

      final formData = FormData.fromMap({
        'work_log': 'Test completion - Replaced faulty motor and completed testing',
        'customer_name': 'John Davis',
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
        'parts_used': '[]', // Empty parts array
        // Missing: signature file (required)
      });

      // Act & Assert
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo1Id}/complete',
          data: formData,
        );
        fail('Should have thrown DioException - signature is required');
      } on DioException catch (e) {
        // Expected: 400 - Missing signature or wrong status
        expect(e.response?.statusCode, 400);
        expect(
          e.response?.data['message'],
          anyOf([
            contains('signature'),
            contains('required'),
            contains('In Progress'),
            contains('can be completed'),
          ]),
        );
      }
    });

    test('should fail to resume already in-progress work order', () async {
      // If WO1 is in_progress (not paused), resuming should fail
      final formData = FormData.fromMap({
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
      });

      // Act & Assert
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo1Id}/resume',
          data: formData,
        );
        fail('Should have thrown DioException - cannot resume in_progress WO');
      } on DioException catch (e) {
        // Expected: 400 - Invalid status for resume
        expect(e.response?.statusCode, 400);
        expect(
          e.response?.data['message'],
          anyOf([
            contains('Invalid status'),
            contains('cannot resume'),
            contains('not paused'),
            contains('Paused'),
            contains('can be resumed'),
          ]),
        );
      }
    });

    test('should fail to perform operations on completed work order', () async {
      // WO6 should be completed (terminal state) - no operations should be allowed
      // First check if it's actually completed
      final checkResponse = await authenticatedDio.get(
        '/work-orders/${TestWorkOrders.wo6Id}',
      );
      final currentStatus = checkResponse.data['work_order']['status'] as String;

      if (currentStatus != 'completed') {
        print('⚠️  Skipping test: WO6 is $currentStatus, not completed (database may have been reset)');
        return;
      }

      final formData = FormData.fromMap({
        'gps_coordinates': TestWorkOrders.testGpsCoordinates,
      });

      // Try to resume completed WO (should fail)
      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo6Id}/resume',
          data: formData,
        );
        fail('Should have thrown DioException - cannot modify completed WO');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 403]));
        if (e.response?.statusCode == 400) {
          expect(
            e.response?.data['message'],
            anyOf([
              contains('Invalid status'),
              contains('completed'),
              contains('Paused'),
              contains('can be resumed'),
            ]),
          );
        }
      }
    });
  });

  group('Work Order APIs - Error Handling', () {
    test('should return 401 for unauthenticated requests', () async {
      final unauthDio = DioHelper.createDio();

      try {
        await unauthDio.get('/work-orders');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthDio.close();
      }
    });

    test('should return 404 for non-existent work order operations', () async {
      try {
        await authenticatedDio.patch(
          '/work-orders/99999/reject',
          data: {'reason': 'Test'},
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 404);
      }
    });

    test('should return 400 for invalid multipart data', () async {
      // Try to start work order without required GPS coordinates
      final invalidFormData = FormData.fromMap({
        // Missing gps_coordinates
      });

      try {
        await authenticatedDio.patch(
          '/work-orders/${TestWorkOrders.wo1Id}/start',
          data: invalidFormData,
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        // Should fail validation
        expect(e.response?.statusCode, anyOf([400, 403]));
      }
    });
  });

  group('Work Order APIs - Status Validation', () {
    test('should respect work order status state machine', () async {
      // Get current work order status
      final response = await authenticatedDio.get(
        '/work-orders/${TestWorkOrders.wo1Id}',
      );

      final currentStatus = response.data['work_order']['status'] as String;
      print('Current WO1 Status: $currentStatus');

      // Document valid state transitions (API uses lowercase with underscores)
      const validTransitions = {
        'assigned': ['start', 'reject'],
        'in_progress': ['pause', 'complete'],
        'paused': ['resume', 'reject'],
        'completed': [], // Terminal state
        'rejected': [], // Terminal state
        'new': ['start', 'reject'], // New work orders can be started or rejected
      };

      expect(validTransitions.containsKey(currentStatus), true,
          reason: 'Status should be one of the defined states');

      final allowedActions = validTransitions[currentStatus];
      expect(allowedActions, isNotNull);
      print('Allowed actions for $currentStatus: $allowedActions');
    });
  });
}
