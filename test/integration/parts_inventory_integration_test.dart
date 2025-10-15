import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';

import '../../lib/app.dart';
import '../../lib/core/error/failures.dart';
import '../../lib/features/parts/domain/entities/part_entity.dart';
import '../../lib/features/parts/domain/entities/inventory_entity.dart';
import '../../lib/features/parts/domain/repositories/i_parts_repository.dart';
import '../../lib/features/auth/domain/repositories/i_auth_repository.dart';
import 'integration_test_helpers.dart';

void main() {
  group('Parts Inventory Management Integration Tests', () {
    late MockPartsRepository mockPartsRepository;
    late MockAuthRepository mockAuthRepository;
    late List<PartEntity> testParts;
    late List<InventoryEntity> testInventory;

    setUpAll(() async {
      await IntegrationTestHelpers.setupIntegrationTest();
    });

    tearDownAll(() async {
      await IntegrationTestHelpers.tearDownIntegrationTest();
    });

    setUp(() {
      mockPartsRepository = MockPartsRepository();
      mockAuthRepository = MockAuthRepository();

      // Create test parts with different stock levels
      testParts = [
        IntegrationTestHelpers.createTestPart(
          id: 1,
          partNumber: 'PART-001',
          stockQuantity: 25,
        ),
        IntegrationTestHelpers.createTestPart(
          id: 2,
          partNumber: 'PART-002',
          stockQuantity: 3, // Low stock
        ),
        IntegrationTestHelpers.createTestPart(
          id: 3,
          partNumber: 'PART-003',
          stockQuantity: 0, // Out of stock
        ),
        IntegrationTestHelpers.createTestPart(
          id: 4,
          partNumber: 'PART-004',
          stockQuantity: 50,
        ),
      ];

      // Create corresponding inventory entities
      testInventory = [
        const InventoryEntity(
          partId: 1,
          quantity: 25,
          minQuantity: 10,
          maxQuantity: 100,
          lastUpdated: null,
        ),
        const InventoryEntity(
          partId: 2,
          quantity: 3,
          minQuantity: 5,
          maxQuantity: 50,
          lastUpdated: null,
        ),
        const InventoryEntity(
          partId: 3,
          quantity: 0,
          minQuantity: 2,
          maxQuantity: 20,
          lastUpdated: null,
        ),
        const InventoryEntity(
          partId: 4,
          quantity: 50,
          minQuantity: 20,
          maxQuantity: 200,
          lastUpdated: null,
        ),
      ];

      // Setup auth mock
      final testUser = IntegrationTestHelpers.createTestUser();
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );

      // Setup parts repository mocks
      when(mockPartsRepository.getParts(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: anyNamed('category'),
      )).thenAnswer((_) async => Right(testParts));

      when(mockPartsRepository.getLowStockParts()).thenAnswer(
        (_) async =>
            Right([testParts[1], testParts[2]]), // Parts with low/no stock
      );
    });

    testWidgets('Complete parts inventory flow - browse, search, and update',
        (tester) async {
      // Arrange
      when(mockPartsRepository.getPartById(1)).thenAnswer(
        (_) async => Right(testParts[0]),
      );

      when(mockPartsRepository.getInventoryByPartId(1)).thenAnswer(
        (_) async => Right(testInventory[0]),
      );

      // Act - Launch app and navigate to parts
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Navigate to parts
      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show parts page with inventory indicators
      expect(find.byKey(const Key('parts_page')), findsOneWidget);
      expect(find.text('PART-001'), findsOneWidget);
      expect(find.text('PART-002'), findsOneWidget);
      expect(find.text('PART-003'), findsOneWidget);
      expect(find.text('PART-004'), findsOneWidget);

      // Should show stock level indicators
      expect(find.byKey(const Key('stock_indicator_1')),
          findsOneWidget); // Normal stock
      expect(find.byKey(const Key('low_stock_indicator_2')),
          findsOneWidget); // Low stock
      expect(find.byKey(const Key('out_of_stock_indicator_3')),
          findsOneWidget); // Out of stock
      expect(find.byKey(const Key('stock_indicator_4')),
          findsOneWidget); // Normal stock

      // Should show low stock alert
      expect(find.byKey(const Key('low_stock_alert')), findsOneWidget);
      expect(find.text('2 items low in stock'), findsOneWidget);

      // Act - Search for specific part
      await tester.tap(find.byKey(const Key('search_button')));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('search_field')),
        'PART-001',
      );
      await tester.pumpAndSettle();

      // Mock search results
      when(mockPartsRepository.searchParts(
        query: 'PART-001',
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => Right([testParts[0]]));

      await tester.tap(find.byKey(const Key('search_submit_button')));
      await tester.pumpAndSettle();

      // Assert - Should show filtered results
      expect(find.text('PART-001'), findsOneWidget);
      expect(find.text('PART-002'), findsNothing);

      // Clear search
      await tester.tap(find.byKey(const Key('clear_search_button')));
      await tester.pumpAndSettle();

      // Act - Open part details
      await tester.tap(find.text('PART-001'));
      await tester.pumpAndSettle();

      // Assert - Should show part details page
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('part_details_page')),
      );
      expect(find.text('PART-001'), findsOneWidget);
      expect(find.text('Current Stock: 25'), findsOneWidget);
      expect(find.text('Min Stock: 10'), findsOneWidget);
      expect(find.text('Max Stock: 100'), findsOneWidget);
      expect(find.byKey(const Key('update_inventory_button')), findsOneWidget);

      // Verify part details were loaded
      verify(mockPartsRepository.getPartById(1)).called(1);
      verify(mockPartsRepository.getInventoryByPartId(1)).called(1);
    });

    testWidgets('Inventory update flow - adjust stock levels', (tester) async {
      // Arrange
      when(mockPartsRepository.getPartById(1)).thenAnswer(
        (_) async => Right(testParts[0]),
      );

      when(mockPartsRepository.getInventoryByPartId(1)).thenAnswer(
        (_) async => Right(testInventory[0]),
      );

      // Mock inventory update
      when(mockPartsRepository.updateInventory(
        partId: 1,
        newQuantity: anyNamed('newQuantity'),
        reason: anyNamed('reason'),
      )).thenAnswer((_) async {
        final updatedInventory = testInventory[0].copyWith(
          quantity: 30,
          lastUpdated: DateTime.now(),
        );
        return Right(updatedInventory);
      });

      // Act - Launch app and navigate to part details
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PART-001'));
      await tester.pumpAndSettle();

      // Act - Update inventory
      await tester.tap(find.byKey(const Key('update_inventory_button')));
      await tester.pumpAndSettle();

      // Assert - Should show inventory update dialog
      expect(find.text('Update Inventory'), findsOneWidget);
      expect(find.byKey(const Key('current_quantity_field')), findsOneWidget);
      expect(find.byKey(const Key('new_quantity_field')), findsOneWidget);
      expect(find.byKey(const Key('reason_field')), findsOneWidget);

      // Should show current quantity
      expect(find.text('Current: 25'), findsOneWidget);

      // Act - Enter new quantity and reason
      await tester.enterText(
        find.byKey(const Key('new_quantity_field')),
        '30',
      );
      await tester.enterText(
        find.byKey(const Key('reason_field')),
        'Stock replenishment',
      );
      await tester.pumpAndSettle();

      // Confirm update
      await tester.tap(find.byKey(const Key('confirm_update_button')));
      await tester.pump();

      // Should show loading
      IntegrationTestHelpers.verifyLoadingIndicator();
      await tester.pumpAndSettle();

      // Assert - Should show updated quantity
      expect(find.text('Current Stock: 30'), findsOneWidget);
      IntegrationTestHelpers.verifySuccessMessage(
          'Inventory updated successfully');

      // Verify update was called
      verify(mockPartsRepository.updateInventory(
        partId: 1,
        newQuantity: 30,
        reason: 'Stock replenishment',
      )).called(1);
    });

    testWidgets('Low stock management flow - alerts and reorder suggestions',
        (tester) async {
      // Arrange
      when(mockPartsRepository.getPartById(2)).thenAnswer(
        (_) async => Right(testParts[1]), // Low stock part
      );

      when(mockPartsRepository.getInventoryByPartId(2)).thenAnswer(
        (_) async => Right(testInventory[1]),
      );

      // Act - Launch app and check low stock alerts
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Should show low stock notification on dashboard
      expect(find.byKey(const Key('low_stock_notification')), findsOneWidget);
      expect(find.text('Low Stock Alert'), findsOneWidget);

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show low stock alert banner
      expect(find.byKey(const Key('low_stock_alert')), findsOneWidget);
      expect(find.text('2 items low in stock'), findsOneWidget);

      // Act - Tap on low stock alert
      await tester.tap(find.byKey(const Key('low_stock_alert')));
      await tester.pumpAndSettle();

      // Assert - Should show low stock parts list
      expect(find.byKey(const Key('low_stock_parts_page')), findsOneWidget);
      expect(find.text('PART-002'), findsOneWidget);
      expect(find.text('PART-003'), findsOneWidget);
      expect(find.text('Stock: 3 (Min: 5)'), findsOneWidget);
      expect(find.text('Stock: 0 (Min: 2)'), findsOneWidget);

      // Should show reorder suggestions
      expect(find.byKey(const Key('reorder_suggestion_2')), findsOneWidget);
      expect(find.byKey(const Key('reorder_suggestion_3')), findsOneWidget);
      expect(find.text('Suggested order: 47 units'),
          findsOneWidget); // To reach max stock

      // Act - Open low stock part details
      await tester.tap(find.text('PART-002'));
      await tester.pumpAndSettle();

      // Assert - Should show part details with low stock warning
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('part_details_page')),
      );
      expect(find.byKey(const Key('low_stock_warning')), findsOneWidget);
      expect(find.text('Below minimum stock level'), findsOneWidget);
      expect(find.byKey(const Key('reorder_button')), findsOneWidget);
    });

    testWidgets('Parts filtering and categorization', (tester) async {
      // Arrange
      final electricalParts = [testParts[0], testParts[1]];
      final plumbingParts = [testParts[2], testParts[3]];

      when(mockPartsRepository.getParts(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'electrical',
      )).thenAnswer((_) async => Right(electricalParts));

      when(mockPartsRepository.getParts(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'plumbing',
      )).thenAnswer((_) async => Right(plumbingParts));

      // Act - Launch app and test filtering
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      // Act - Open filter menu
      await tester.tap(find.byKey(const Key('filter_button')));
      await tester.pumpAndSettle();

      // Assert - Should show category filters
      expect(find.text('Filter by Category'), findsOneWidget);
      expect(find.text('electrical'), findsOneWidget);
      expect(find.text('plumbing'), findsOneWidget);
      expect(find.text('mechanical'), findsOneWidget);

      // Act - Filter by electrical category
      await tester.tap(find.text('electrical'));
      await tester.pumpAndSettle();

      // Assert - Should show only electrical parts
      expect(find.text('PART-001'), findsOneWidget);
      expect(find.text('PART-002'), findsOneWidget);
      expect(find.text('PART-003'), findsNothing);
      expect(find.text('PART-004'), findsNothing);

      // Act - Filter by stock level
      await tester.tap(find.byKey(const Key('filter_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Low Stock Only'));
      await tester.pumpAndSettle();

      // Should show only low stock parts
      expect(find.text('PART-002'), findsOneWidget);
      expect(find.text('PART-001'), findsNothing);

      // Act - Clear filters
      await tester.tap(find.byKey(const Key('clear_filters_button')));
      await tester.pumpAndSettle();

      // Should show all parts again
      expect(find.text('PART-001'), findsOneWidget);
      expect(find.text('PART-002'), findsOneWidget);
      expect(find.text('PART-003'), findsOneWidget);
      expect(find.text('PART-004'), findsOneWidget);
    });

    testWidgets('Inventory validation and error handling', (tester) async {
      // Arrange
      when(mockPartsRepository.getPartById(1)).thenAnswer(
        (_) async => Right(testParts[0]),
      );

      when(mockPartsRepository.getInventoryByPartId(1)).thenAnswer(
        (_) async => Right(testInventory[0]),
      );

      // Mock validation error
      when(mockPartsRepository.updateInventory(
        partId: anyNamed('partId'),
        newQuantity: anyNamed('newQuantity'),
        reason: anyNamed('reason'),
      )).thenAnswer((_) async => const Left(ValidationFailure(
            message: 'Invalid quantity',
            fieldErrors: {
              'newQuantity': 'Quantity cannot exceed maximum stock level',
            },
          )));

      // Act - Launch app and try invalid update
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PART-001'));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('update_inventory_button')));
      await tester.pumpAndSettle();

      // Try to set quantity above maximum
      await tester.enterText(
        find.byKey(const Key('new_quantity_field')),
        '150', // Above max of 100
      );
      await tester.enterText(
        find.byKey(const Key('reason_field')),
        'Test update',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_update_button')));
      await tester.pumpAndSettle();

      // Assert - Should show validation error
      IntegrationTestHelpers.verifyErrorMessage('Invalid quantity');
      expect(find.text('Quantity cannot exceed maximum stock level'),
          findsOneWidget);

      // Dialog should remain open for correction
      expect(find.text('Update Inventory'), findsOneWidget);
    });

    testWidgets('Offline inventory management and sync', (tester) async {
      // Arrange - Start online, make changes, then go offline
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      when(mockPartsRepository.getPartById(1)).thenAnswer(
        (_) async => Right(testParts[0]),
      );

      when(mockPartsRepository.getInventoryByPartId(1)).thenAnswer(
        (_) async => Right(testInventory[0]),
      );

      // Act - Launch app and make inventory update
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PART-001'));
      await tester.pumpAndSettle();

      // Simulate going offline during update
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockPartsRepository.updateInventory(
        partId: anyNamed('partId'),
        newQuantity: anyNamed('newQuantity'),
        reason: anyNamed('reason'),
      )).thenAnswer((_) async => const Left(NetworkFailure(
            message: 'No internet connection - update queued for sync',
          )));

      await tester.tap(find.byKey(const Key('update_inventory_button')));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('new_quantity_field')),
        '20',
      );
      await tester.enterText(
        find.byKey(const Key('reason_field')),
        'Offline update',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_update_button')));
      await tester.pumpAndSettle();

      // Assert - Should show offline message and queue update
      IntegrationTestHelpers.verifyErrorMessage(
          'No internet connection - update queued for sync');
      expect(find.byKey(const Key('pending_sync_indicator')), findsOneWidget);

      // Restore connectivity and sync
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      when(mockPartsRepository.syncPendingInventoryUpdates()).thenAnswer(
        (_) async => const Right(null),
      );

      await tester.tap(find.byKey(const Key('sync_button')));
      await tester.pumpAndSettle();

      // Should show sync completion
      IntegrationTestHelpers.verifySuccessMessage('Inventory updates synced');

      // Verify sync was called
      verify(mockPartsRepository.syncPendingInventoryUpdates()).called(1);
    });

    testWidgets('Parts usage tracking in work orders', (tester) async {
      // Arrange - Simulate parts usage during work order completion
      when(mockPartsRepository.getPartById(1)).thenAnswer(
        (_) async => Right(testParts[0]),
      );

      when(mockPartsRepository.recordPartUsage(
        partId: 1,
        quantityUsed: 2,
        workOrderId: 123,
        reason: anyNamed('reason'),
      )).thenAnswer((_) async {
        final updatedInventory = testInventory[0].copyWith(
          quantity: 23, // 25 - 2 used
          lastUpdated: DateTime.now(),
        );
        return Right(updatedInventory);
      });

      // Act - Launch app and simulate parts usage
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('parts_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PART-001'));
      await tester.pumpAndSettle();

      // Act - Record parts usage
      await tester.tap(find.byKey(const Key('record_usage_button')));
      await tester.pumpAndSettle();

      // Assert - Should show usage recording dialog
      expect(find.text('Record Parts Usage'), findsOneWidget);
      expect(find.byKey(const Key('quantity_used_field')), findsOneWidget);
      expect(find.byKey(const Key('work_order_field')), findsOneWidget);

      // Enter usage details
      await tester.enterText(
        find.byKey(const Key('quantity_used_field')),
        '2',
      );
      await tester.enterText(
        find.byKey(const Key('work_order_field')),
        'WO-123',
      );
      await tester.enterText(
        find.byKey(const Key('usage_reason_field')),
        'Replaced faulty component',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('confirm_usage_button')));
      await tester.pumpAndSettle();

      // Assert - Should update inventory and show confirmation
      expect(find.text('Current Stock: 23'), findsOneWidget);
      IntegrationTestHelpers.verifySuccessMessage('Parts usage recorded');

      // Verify usage was recorded
      verify(mockPartsRepository.recordPartUsage(
        partId: 1,
        quantityUsed: 2,
        workOrderId: 123,
        reason: 'Replaced faulty component',
      )).called(1);
    });
  });
}

/// Mock repository for testing
class MockPartsRepository extends Mock implements IPartsRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}
