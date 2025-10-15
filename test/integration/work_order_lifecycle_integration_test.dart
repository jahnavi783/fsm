import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:location/location.dart';

import '../../lib/app.dart';
import '../../lib/core/error/failures.dart';
import '../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../lib/features/work_orders/domain/repositories/i_work_order_repository.dart';
import '../../lib/features/auth/domain/repositories/i_auth_repository.dart';
import 'integration_test_helpers.dart';

void main() {
  group('Work Order Lifecycle Integration Tests', () {
    late MockWorkOrderRepository mockWorkOrderRepository;
    late MockAuthRepository mockAuthRepository;
    late List<WorkOrderEntity> testWorkOrders;

    setUpAll(() async {
      await IntegrationTestHelpers.setupIntegrationTest();
    });

    tearDownAll(() async {
      await IntegrationTestHelpers.tearDownIntegrationTest();
    });

    setUp(() {
      mockWorkOrderRepository = MockWorkOrderRepository();
      mockAuthRepository = MockAuthRepository();

      // Create test work orders with different statuses
      testWorkOrders = [
        IntegrationTestHelpers.createTestWorkOrder(
          id: 1,
          woNumber: 'WO-001',
          status: WorkOrderStatus.assigned,
        ),
        IntegrationTestHelpers.createTestWorkOrder(
          id: 2,
          woNumber: 'WO-002',
          status: WorkOrderStatus.inProgress,
        ),
        IntegrationTestHelpers.createTestWorkOrder(
          id: 3,
          woNumber: 'WO-003',
          status: WorkOrderStatus.paused,
        ),
      ];

      // Setup auth mock
      final testUser = IntegrationTestHelpers.createTestUser();
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );

      // Setup work order repository mocks
      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(testWorkOrders));
    });

    testWidgets('Complete work order lifecycle - start to completion',
        (tester) async {
      // Arrange
      IntegrationTestHelpers.simulateLocationService(
        latitude: 37.7749,
        longitude: -122.4194,
        accuracy: 5.0,
      );

      var currentWorkOrder = testWorkOrders[0]; // Assigned work order

      when(mockWorkOrderRepository.getWorkOrderById(1)).thenAnswer(
        (_) async => Right(currentWorkOrder),
      );

      // Mock start work order
      when(mockWorkOrderRepository.startWorkOrder(
        workOrderId: 1,
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async {
        currentWorkOrder = currentWorkOrder.copyWith(
          status: WorkOrderStatus.inProgress,
          startedAt: DateTime.now(),
        );
        return Right(currentWorkOrder);
      });

      // Mock complete work order
      when(mockWorkOrderRepository.completeWorkOrder(
        workOrderId: 1,
        completionNotes: anyNamed('completionNotes'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async {
        currentWorkOrder = currentWorkOrder.copyWith(
          status: WorkOrderStatus.completed,
          completedAt: DateTime.now(),
          completionNotes: 'Work completed successfully',
        );
        return Right(currentWorkOrder);
      });

      // Act - Launch app and navigate to work orders
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Navigate to work orders list
      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show work orders list
      expect(find.byKey(const Key('work_orders_page')), findsOneWidget);
      expect(find.text('WO-001'), findsOneWidget);
      expect(find.text('WO-002'), findsOneWidget);
      expect(find.text('WO-003'), findsOneWidget);

      // Act - Tap on assigned work order
      await tester.tap(find.text('WO-001'));
      await tester.pumpAndSettle();

      // Assert - Should show work order details
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('work_order_details_page')),
      );
      expect(find.text('WO-001'), findsOneWidget);
      expect(find.text('Assigned'), findsOneWidget);
      expect(find.byKey(const Key('start_work_order_button')), findsOneWidget);

      // Act - Start work order
      await tester.tap(find.byKey(const Key('start_work_order_button')));
      await tester.pumpAndSettle();

      // Assert - Should show confirmation dialog
      expect(find.text('Start Work Order'), findsOneWidget);
      expect(find.text('Are you sure you want to start this work order?'),
          findsOneWidget);

      // Confirm start
      await tester.tap(find.byKey(const Key('confirm_start_button')));
      await tester.pump();

      // Should show loading
      IntegrationTestHelpers.verifyLoadingIndicator();
      await tester.pumpAndSettle();

      // Assert - Work order should now be in progress
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.byKey(const Key('pause_work_order_button')), findsOneWidget);
      expect(
          find.byKey(const Key('complete_work_order_button')), findsOneWidget);

      // Verify start was called with GPS coordinates
      verify(mockWorkOrderRepository.startWorkOrder(
        workOrderId: 1,
        latitude: 37.7749,
        longitude: -122.4194,
      )).called(1);

      // Act - Complete work order
      await tester.tap(find.byKey(const Key('complete_work_order_button')));
      await tester.pumpAndSettle();

      // Assert - Should show completion form
      expect(find.text('Complete Work Order'), findsOneWidget);
      expect(find.byKey(const Key('completion_notes_field')), findsOneWidget);

      // Enter completion notes
      await tester.enterText(
        find.byKey(const Key('completion_notes_field')),
        'Work completed successfully',
      );
      await tester.pumpAndSettle();

      // Confirm completion
      await tester.tap(find.byKey(const Key('confirm_complete_button')));
      await tester.pump();

      // Should show loading
      IntegrationTestHelpers.verifyLoadingIndicator();
      await tester.pumpAndSettle();

      // Assert - Work order should now be completed
      expect(find.text('Completed'), findsOneWidget);
      IntegrationTestHelpers.verifySuccessMessage(
          'Work order completed successfully');

      // Verify completion was called with notes and GPS
      verify(mockWorkOrderRepository.completeWorkOrder(
        workOrderId: 1,
        completionNotes: 'Work completed successfully',
        latitude: 37.7749,
        longitude: -122.4194,
      )).called(1);
    });

    testWidgets('Work order lifecycle - pause and resume flow', (tester) async {
      // Arrange
      IntegrationTestHelpers.simulateLocationService();

      var currentWorkOrder = testWorkOrders[1]; // In progress work order

      when(mockWorkOrderRepository.getWorkOrderById(2)).thenAnswer(
        (_) async => Right(currentWorkOrder),
      );

      // Mock pause work order
      when(mockWorkOrderRepository.pauseWorkOrder(
        workOrderId: 2,
        reason: anyNamed('reason'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async {
        currentWorkOrder = currentWorkOrder.copyWith(
          status: WorkOrderStatus.paused,
        );
        return Right(currentWorkOrder);
      });

      // Mock resume work order
      when(mockWorkOrderRepository.resumeWorkOrder(
        workOrderId: 2,
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async {
        currentWorkOrder = currentWorkOrder.copyWith(
          status: WorkOrderStatus.inProgress,
        );
        return Right(currentWorkOrder);
      });

      // Act - Launch app and navigate to work order
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      // Tap on in-progress work order
      await tester.tap(find.text('WO-002'));
      await tester.pumpAndSettle();

      // Assert - Should show in-progress work order
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('work_order_details_page')),
      );
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.byKey(const Key('pause_work_order_button')), findsOneWidget);

      // Act - Pause work order
      await tester.tap(find.byKey(const Key('pause_work_order_button')));
      await tester.pumpAndSettle();

      // Assert - Should show pause reason dialog
      expect(find.text('Pause Work Order'), findsOneWidget);
      expect(find.byKey(const Key('pause_reason_field')), findsOneWidget);

      // Enter pause reason
      await tester.enterText(
        find.byKey(const Key('pause_reason_field')),
        'Taking lunch break',
      );
      await tester.pumpAndSettle();

      // Confirm pause
      await tester.tap(find.byKey(const Key('confirm_pause_button')));
      await tester.pump();

      IntegrationTestHelpers.verifyLoadingIndicator();
      await tester.pumpAndSettle();

      // Assert - Work order should now be paused
      expect(find.text('Paused'), findsOneWidget);
      expect(find.byKey(const Key('resume_work_order_button')), findsOneWidget);

      // Verify pause was called
      verify(mockWorkOrderRepository.pauseWorkOrder(
        workOrderId: 2,
        reason: 'Taking lunch break',
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).called(1);

      // Act - Resume work order
      await tester.tap(find.byKey(const Key('resume_work_order_button')));
      await tester.pumpAndSettle();

      // Assert - Should show resume confirmation
      expect(find.text('Resume Work Order'), findsOneWidget);

      // Confirm resume
      await tester.tap(find.byKey(const Key('confirm_resume_button')));
      await tester.pump();

      IntegrationTestHelpers.verifyLoadingIndicator();
      await tester.pumpAndSettle();

      // Assert - Work order should be in progress again
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.byKey(const Key('pause_work_order_button')), findsOneWidget);

      // Verify resume was called
      verify(mockWorkOrderRepository.resumeWorkOrder(
        workOrderId: 2,
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).called(1);
    });

    testWidgets('Work order lifecycle - GPS failure handling', (tester) async {
      // Arrange - Simulate GPS failure
      IntegrationTestHelpers.simulateLocationService(shouldThrow: true);

      when(mockWorkOrderRepository.getWorkOrderById(1)).thenAnswer(
        (_) async => Right(testWorkOrders[0]),
      );

      // Act - Launch app and try to start work order
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('WO-001'));
      await tester.pumpAndSettle();

      // Try to start work order without GPS
      await tester.tap(find.byKey(const Key('start_work_order_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_start_button')));
      await tester.pumpAndSettle();

      // Assert - Should show GPS error
      IntegrationTestHelpers.verifyErrorMessage('Location service unavailable');
      expect(find.text('Assigned'), findsOneWidget); // Status unchanged

      // Verify start was not called due to GPS failure
      verifyNever(mockWorkOrderRepository.startWorkOrder(
        workOrderId: anyNamed('workOrderId'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      ));
    });

    testWidgets('Work order lifecycle - offline mode handling', (tester) async {
      // Arrange - Simulate offline mode
      IntegrationTestHelpers.simulateNetworkConnectivity(false);
      IntegrationTestHelpers.simulateLocationService();

      when(mockWorkOrderRepository.getWorkOrderById(1)).thenAnswer(
        (_) async => Right(testWorkOrders[0]),
      );

      when(mockWorkOrderRepository.startWorkOrder(
        workOrderId: anyNamed('workOrderId'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async => const Left(NetworkFailure(
            message: 'No internet connection',
          )));

      // Act - Launch app and try to start work order offline
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Should show offline indicator
      expect(find.byKey(const Key('offline_indicator')), findsOneWidget);

      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('WO-001'));
      await tester.pumpAndSettle();

      // Try to start work order offline
      await tester.tap(find.byKey(const Key('start_work_order_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_start_button')));
      await tester.pumpAndSettle();

      // Assert - Should show offline message and queue action
      IntegrationTestHelpers.verifyErrorMessage('No internet connection');
      expect(find.text('Action queued for sync'), findsOneWidget);

      // Restore connectivity and verify sync
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      // Simulate sync trigger
      await tester.tap(find.byKey(const Key('sync_button')));
      await tester.pumpAndSettle();

      // Should show sync in progress
      expect(find.text('Syncing...'), findsOneWidget);
    });

    testWidgets('Work order lifecycle - validation errors', (tester) async {
      // Arrange
      IntegrationTestHelpers.simulateLocationService();

      when(mockWorkOrderRepository.getWorkOrderById(1)).thenAnswer(
        (_) async => Right(testWorkOrders[0]),
      );

      when(mockWorkOrderRepository.completeWorkOrder(
        workOrderId: anyNamed('workOrderId'),
        completionNotes: anyNamed('completionNotes'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async => const Left(ValidationFailure(
            message: 'Completion notes are required',
            fieldErrors: {'completionNotes': 'This field is required'},
          )));

      // Act - Launch app and try to complete without notes
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('WO-001'));
      await tester.pumpAndSettle();

      // Start work order first
      await tester.tap(find.byKey(const Key('start_work_order_button')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('confirm_start_button')));
      await tester.pumpAndSettle();

      // Try to complete without notes
      await tester.tap(find.byKey(const Key('complete_work_order_button')));
      await tester.pumpAndSettle();

      // Leave notes field empty and try to submit
      await tester.tap(find.byKey(const Key('confirm_complete_button')));
      await tester.pumpAndSettle();

      // Assert - Should show validation error
      IntegrationTestHelpers.verifyErrorMessage(
          'Completion notes are required');
      expect(find.text('This field is required'), findsOneWidget);
    });
  });
}

/// Mock repositories for testing
class MockWorkOrderRepository extends Mock implements IWorkOrderRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}
