import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';

import '../../lib/app.dart';
import '../../lib/core/error/failures.dart';
import '../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../lib/features/documents/domain/entities/document_entity.dart';
import '../../lib/features/work_orders/domain/repositories/i_work_order_repository.dart';
import '../../lib/features/documents/domain/repositories/i_document_repository.dart';
import '../../lib/features/auth/domain/repositories/i_auth_repository.dart';
import 'integration_test_helpers.dart';

void main() {
  group('Offline Functionality Integration Tests', () {
    late MockWorkOrderRepository mockWorkOrderRepository;
    late MockDocumentRepository mockDocumentRepository;
    late MockAuthRepository mockAuthRepository;
    late List<WorkOrderEntity> cachedWorkOrders;
    late List<DocumentEntity> cachedDocuments;

    setUpAll(() async {
      await IntegrationTestHelpers.setupIntegrationTest();
    });

    tearDownAll(() async {
      await IntegrationTestHelpers.tearDownIntegrationTest();
    });

    setUp(() {
      mockWorkOrderRepository = MockWorkOrderRepository();
      mockDocumentRepository = MockDocumentRepository();
      mockAuthRepository = MockAuthRepository();

      // Create cached data
      cachedWorkOrders = [
        IntegrationTestHelpers.createTestWorkOrder(id: 1, woNumber: 'WO-001'),
        IntegrationTestHelpers.createTestWorkOrder(id: 2, woNumber: 'WO-002'),
      ];

      cachedDocuments = [
        IntegrationTestHelpers.createTestDocument(
          id: 1,
          title: 'Cached Manual',
          isDownloaded: true,
          localPath: '/cache/manual.pdf',
        ),
        IntegrationTestHelpers.createTestDocument(
          id: 2,
          title: 'Online Only Document',
          isDownloaded: false,
        ),
      ];

      // Setup auth mock
      final testUser = IntegrationTestHelpers.createTestUser();
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );
    });

    testWidgets(
        'Offline mode - load cached work orders when network unavailable',
        (tester) async {
      // Arrange - Start offline
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      // Mock repository to return cached data when offline
      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Assert - Should show offline indicator
      expect(find.byKey(const Key('offline_indicator')), findsOneWidget);
      expect(find.text('Offline'), findsOneWidget);

      // Navigate to work orders
      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show cached work orders
      expect(find.byKey(const Key('work_orders_page')), findsOneWidget);
      expect(find.text('WO-001'), findsOneWidget);
      expect(find.text('WO-002'), findsOneWidget);
      expect(find.byKey(const Key('cached_data_indicator')), findsOneWidget);

      // Verify cached data was loaded
      verify(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).called(1);
    });

    testWidgets('Offline mode - queue actions for later sync', (tester) async {
      // Arrange - Start offline
      IntegrationTestHelpers.simulateNetworkConnectivity(false);
      IntegrationTestHelpers.simulateLocationService();

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      when(mockWorkOrderRepository.getWorkOrderById(1)).thenAnswer(
        (_) async => Right(cachedWorkOrders[0]),
      );

      // Mock offline action queueing
      when(mockWorkOrderRepository.startWorkOrder(
        workOrderId: anyNamed('workOrderId'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).thenAnswer((_) async => const Left(NetworkFailure(
            message: 'No internet connection - action queued for sync',
          )));

      // Act - Launch app and try to perform actions offline
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Navigate to work orders and select one
      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('WO-001'));
      await tester.pumpAndSettle();

      // Try to start work order while offline
      await tester.tap(find.byKey(const Key('start_work_order_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_start_button')));
      await tester.pumpAndSettle();

      // Assert - Should show queued message
      expect(find.text('No internet connection - action queued for sync'),
          findsOneWidget);
      expect(find.byKey(const Key('pending_sync_indicator')), findsOneWidget);

      // Should show sync queue count
      expect(find.text('1 action pending sync'), findsOneWidget);

      // Verify action was attempted
      verify(mockWorkOrderRepository.startWorkOrder(
        workOrderId: 1,
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
      )).called(1);
    });

    testWidgets('Offline to online transition - automatic sync',
        (tester) async {
      // Arrange - Start offline with queued actions
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      // Act - Launch app offline
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Assert - Should show offline indicator
      expect(find.byKey(const Key('offline_indicator')), findsOneWidget);

      // Simulate network coming back online
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      // Mock successful sync
      when(mockWorkOrderRepository.syncPendingActions()).thenAnswer(
        (_) async => const Right(null),
      );

      // Trigger connectivity change (this would normally be automatic)
      await tester.tap(find.byKey(const Key('refresh_button')));
      await tester.pump();

      // Should show syncing indicator
      expect(find.byKey(const Key('syncing_indicator')), findsOneWidget);
      expect(find.text('Syncing...'), findsOneWidget);

      await tester.pumpAndSettle();

      // Assert - Should show online indicator and sync completion
      expect(find.byKey(const Key('online_indicator')), findsOneWidget);
      expect(find.text('Online'), findsOneWidget);
      IntegrationTestHelpers.verifySuccessMessage('Sync completed');

      // Verify sync was called
      verify(mockWorkOrderRepository.syncPendingActions()).called(1);
    });

    testWidgets('Offline mode - access downloaded documents', (tester) async {
      // Arrange - Start offline
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: anyNamed('category'),
      )).thenAnswer((_) async => Right(cachedDocuments));

      when(mockDocumentRepository.getDocumentById(1)).thenAnswer(
        (_) async => Right(cachedDocuments[0]),
      );

      // Act - Launch app and navigate to documents
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show documents with download indicators
      expect(find.byKey(const Key('documents_page')), findsOneWidget);
      expect(find.text('Cached Manual'), findsOneWidget);
      expect(find.text('Online Only Document'), findsOneWidget);

      // Downloaded document should have offline indicator
      expect(find.byKey(const Key('downloaded_indicator_1')), findsOneWidget);
      expect(find.byKey(const Key('downloaded_indicator_2')), findsNothing);

      // Act - Try to open downloaded document
      await tester.tap(find.text('Cached Manual'));
      await tester.pumpAndSettle();

      // Assert - Should open document viewer successfully
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );
      expect(find.text('Cached Manual'), findsOneWidget);

      // Go back and try to open online-only document
      await tester.tap(find.byKey(const Key('back_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Online Only Document'));
      await tester.pumpAndSettle();

      // Assert - Should show offline error
      IntegrationTestHelpers.verifyErrorMessage(
          'Document not available offline');
    });

    testWidgets('Offline mode - data freshness warnings', (tester) async {
      // Arrange - Start offline with old cached data
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      // Create work orders with old cache timestamps
      final oldCachedWorkOrders = cachedWorkOrders
          .map((wo) => wo.copyWith(
                // Simulate old cache data (older than 24 hours)
                visitDate: DateTime.now().subtract(const Duration(days: 2)),
              ))
          .toList();

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(oldCachedWorkOrders));

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show data freshness warning
      expect(find.byKey(const Key('stale_data_warning')), findsOneWidget);
      expect(find.text('Data may be outdated'), findsOneWidget);
      expect(find.text('Last updated: 2 days ago'), findsOneWidget);
    });

    testWidgets('Offline mode - sync conflict resolution', (tester) async {
      // Arrange - Start offline, make changes, then go online with conflicts
      IntegrationTestHelpers.simulateNetworkConnectivity(false);
      IntegrationTestHelpers.simulateLocationService();

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      // Act - Launch app and make offline changes
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Make some offline changes (queue actions)
      await tester.tap(find.byKey(const Key('work_orders_tab')));
      await tester.pumpAndSettle();

      // Simulate going online with sync conflicts
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      // Mock sync with conflicts
      when(mockWorkOrderRepository.syncPendingActions()).thenAnswer(
        (_) async => const Left(ServerFailure(
          message: 'Sync conflict detected',
          statusCode: 409,
        )),
      );

      // Trigger sync
      await tester.tap(find.byKey(const Key('sync_button')));
      await tester.pumpAndSettle();

      // Assert - Should show conflict resolution dialog
      expect(find.text('Sync Conflict'), findsOneWidget);
      expect(
          find.text('Some changes conflict with server data'), findsOneWidget);
      expect(find.byKey(const Key('resolve_conflicts_button')), findsOneWidget);
      expect(find.byKey(const Key('discard_local_button')), findsOneWidget);

      // Act - Choose to resolve conflicts
      await tester.tap(find.byKey(const Key('resolve_conflicts_button')));
      await tester.pumpAndSettle();

      // Assert - Should show conflict resolution screen
      expect(find.byKey(const Key('conflict_resolution_page')), findsOneWidget);
      expect(find.text('Choose which version to keep'), findsOneWidget);
    });

    testWidgets('Offline mode - storage management and cleanup',
        (tester) async {
      // Arrange - Simulate low storage scenario
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      // Mock storage cleanup
      when(mockWorkOrderRepository.cleanupOldCache()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Simulate low storage warning
      await tester.tap(find.byKey(const Key('settings_button')));
      await tester.pumpAndSettle();

      // Assert - Should show storage management options
      expect(find.text('Storage Management'), findsOneWidget);
      expect(find.text('Cache size: 150 MB'), findsOneWidget);
      expect(find.byKey(const Key('clear_cache_button')), findsOneWidget);

      // Act - Clear old cache
      await tester.tap(find.byKey(const Key('clear_cache_button')));
      await tester.pumpAndSettle();

      // Assert - Should show confirmation and cleanup
      expect(find.text('Clear Cache'), findsOneWidget);
      await tester.tap(find.byKey(const Key('confirm_clear_button')));
      await tester.pumpAndSettle();

      IntegrationTestHelpers.verifySuccessMessage('Cache cleared successfully');

      // Verify cleanup was called
      verify(mockWorkOrderRepository.cleanupOldCache()).called(1);
    });

    testWidgets('Offline mode - background sync when app returns to foreground',
        (tester) async {
      // Arrange - Start offline
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockWorkOrderRepository.getWorkOrders(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(cachedWorkOrders));

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Simulate app going to background and coming back online
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      // Mock background sync
      when(mockWorkOrderRepository.syncPendingActions()).thenAnswer(
        (_) async => const Right(null),
      );

      // Simulate app lifecycle change (resumed from background)
      // This would typically be handled by the app lifecycle observer
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.resumed'),
        ),
        (data) {},
      );

      await tester.pump();

      // Should trigger background sync
      expect(
          find.byKey(const Key('background_sync_indicator')), findsOneWidget);

      await tester.pumpAndSettle();

      // Assert - Should complete sync silently
      expect(find.byKey(const Key('online_indicator')), findsOneWidget);

      // Verify background sync was triggered
      verify(mockWorkOrderRepository.syncPendingActions()).called(1);
    });
  });
}

/// Mock repositories for testing
class MockWorkOrderRepository extends Mock implements IWorkOrderRepository {}

class MockDocumentRepository extends Mock implements IDocumentRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}
