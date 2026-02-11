import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/core/storage/hive_service.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_local_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_hive_model.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'work_order_local_ds_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HiveService>(),
  MockSpec<Box<WorkOrderHiveModel>>(as: #MockWorkOrderBox),
])
void main() {
  late WorkOrderLocalDataSourceImpl dataSource;
  late MockHiveService mockHiveService;
  late MockWorkOrderBox mockBox;

  setUp(() {
    mockHiveService = MockHiveService();
    mockBox = MockWorkOrderBox();
    dataSource = WorkOrderLocalDataSourceImpl(mockHiveService);

    // Setup default behavior for getTypedBox
    when(mockHiveService.getTypedBox<WorkOrderHiveModel>(HiveBoxes.workOrders))
        .thenAnswer((_) async => mockBox);
  });

  final tWorkOrderHiveModel = WorkOrderHiveModel(
    id: 1,
    woNumber: 'WO-001',
    srId: 100,
    summary: 'Test',
    problemDescription: 'Desc',
    priority: 1,
    visitDate: DateTime(2025, 1, 1),
    location: 'Loc',
    status: 0,
    durationDays: 1,
    durationHours: 8.0,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
    userId: '1',
    cachedAt: DateTime(2025, 1, 1),
    isPendingSync: false,
    images: [],
  );

  group('cacheWorkOrders', () {
    test('should cache work orders to Hive box', () async {
      // Arrange
      final workOrders = [tWorkOrderHiveModel];

      // Act
      await dataSource.cacheWorkOrders(workOrders);

      // Assert
      verify(mockBox.put(1, tWorkOrderHiveModel)).called(1);
    });
  });

  group('getCachedWorkOrders', () {
    test('should return all cached work orders when no status filter',
        () async {
      // Arrange
      when(mockBox.values).thenReturn([tWorkOrderHiveModel]);

      // Act
      final result = await dataSource.getCachedWorkOrders();

      // Assert
      expect(result, [tWorkOrderHiveModel]);
    });

    test('should filter work orders by status', () async {
      // Arrange
      final workOrder2 = WorkOrderHiveModel(
        id: 2,
        woNumber: 'WO-002',
        srId: 101,
        summary: 'Test 2',
        problemDescription: 'Desc 2',
        priority: 1,
        visitDate: DateTime(2025, 1, 2),
        location: 'Loc 2',
        status: 1,
        durationDays: 1,
        durationHours: 8.0,
        createdAt: DateTime(2025, 1, 2),
        updatedAt: DateTime(2025, 1, 2),
        userId: '1',
        cachedAt: DateTime(2025, 1, 2),
        isPendingSync: false,
        images: [],
      );
      when(mockBox.values).thenReturn([tWorkOrderHiveModel, workOrder2]);

      // Act
      final result = await dataSource.getCachedWorkOrders(
        status: WorkOrderStatus.assigned,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.id, 2);
    });
  });

  group('getCachedWorkOrderById', () {
    test('should return work order by id', () async {
      // Arrange
      when(mockBox.get(1)).thenReturn(tWorkOrderHiveModel);

      // Act
      final result = await dataSource.getCachedWorkOrderById(1);

      // Assert
      expect(result, tWorkOrderHiveModel);
    });
  });

  group('updateWorkOrder', () {
    test('should update work order in Hive box', () async {
      // Act
      await dataSource.updateWorkOrder(tWorkOrderHiveModel);

      // Assert
      verify(mockBox.put(1, tWorkOrderHiveModel)).called(1);
    });
  });

  group('deleteWorkOrder', () {
    test('should delete work order from Hive box', () async {
      // Act
      await dataSource.deleteWorkOrder(1);

      // Assert
      verify(mockBox.delete(1)).called(1);
    });
  });

  group('clearCache', () {
    test('should clear all work orders from Hive box', () async {
      // Act
      await dataSource.clearCache();

      // Assert
      verify(mockBox.clear()).called(1);
    });
  });

  group('getPendingSyncWorkOrders', () {
    test('should return only work orders pending sync', () async {
      // Arrange
      final pendingWO = tWorkOrderHiveModel.copyWith(isPendingSync: true);
      when(mockBox.values).thenReturn([tWorkOrderHiveModel, pendingWO]);

      // Act
      final result = await dataSource.getPendingSyncWorkOrders();

      // Assert
      expect(result.length, 1);
      expect(result.first.id, 1);
    });
  });

  group('markWorkOrderForSync', () {
    test('should mark work order for sync', () async {
      // Arrange
      when(mockBox.get(1)).thenReturn(tWorkOrderHiveModel);

      // Act
      await dataSource.markWorkOrderForSync(1, 'update');

      // Assert
      verify(mockBox.put(1, any)).called(1);
    });
  });
}
