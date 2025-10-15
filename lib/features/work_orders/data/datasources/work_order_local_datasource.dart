import 'package:injectable/injectable.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/core/storage/hive_service.dart';
import 'package:fsm/features/work_orders/data/models/work_order_hive_model.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

abstract class WorkOrderLocalDataSource {
  Future<void> cacheWorkOrders(List<WorkOrderHiveModel> workOrders);
  Future<List<WorkOrderHiveModel>> getCachedWorkOrders({
    WorkOrderStatus? status,
  });
  Future<WorkOrderHiveModel?> getCachedWorkOrderById(int id);
  Future<void> updateWorkOrder(WorkOrderHiveModel workOrder);
  Future<void> deleteWorkOrder(int id);
  Future<void> clearCache();
  Future<List<WorkOrderHiveModel>> getPendingSyncWorkOrders();
  Future<void> markWorkOrderForSync(int id, String action);
  Future<void> clearSyncFlag(int id);
}

@Injectable(as: WorkOrderLocalDataSource)
class WorkOrderLocalDataSourceImpl implements WorkOrderLocalDataSource {
  final HiveService _hiveService;

  WorkOrderLocalDataSourceImpl(this._hiveService);

  Future<Box<WorkOrderHiveModel>> get _workOrderBox async =>
      await _hiveService.getTypedBox<WorkOrderHiveModel>(HiveBoxes.workOrders);

  @override
  Future<void> cacheWorkOrders(List<WorkOrderHiveModel> workOrders) async {
    final box = await _workOrderBox;
    for (final workOrder in workOrders) {
      await box.put(workOrder.id, workOrder);
    }
  }

  @override
  Future<List<WorkOrderHiveModel>> getCachedWorkOrders({
    WorkOrderStatus? status,
  }) async {
    final box = await _workOrderBox;
    final allWorkOrders = box.values.toList();

    if (status != null) {
      return allWorkOrders.where((wo) => wo.status == status.index).toList();
    }

    return allWorkOrders;
  }

  @override
  Future<WorkOrderHiveModel?> getCachedWorkOrderById(int id) async {
    final box = await _workOrderBox;
    return box.get(id);
  }

  @override
  Future<void> updateWorkOrder(WorkOrderHiveModel workOrder) async {
    final box = await _workOrderBox;
    await box.put(workOrder.id, workOrder);
  }

  @override
  Future<void> deleteWorkOrder(int id) async {
    final box = await _workOrderBox;
    await box.delete(id);
  }

  @override
  Future<void> clearCache() async {
    final box = await _workOrderBox;
    await box.clear();
  }

  @override
  Future<List<WorkOrderHiveModel>> getPendingSyncWorkOrders() async {
    final box = await _workOrderBox;
    return box.values.where((workOrder) => workOrder.isPendingSync).toList();
  }

  @override
  Future<void> markWorkOrderForSync(int id, String action) async {
    final box = await _workOrderBox;
    final workOrder = box.get(id);
    if (workOrder != null) {
      final updatedWorkOrder = workOrder.copyWith(
        isPendingSync: true,
        pendingAction: action,
      );
      await box.put(id, updatedWorkOrder);
    }
  }

  @override
  Future<void> clearSyncFlag(int id) async {
    final box = await _workOrderBox;
    final workOrder = box.get(id);
    if (workOrder != null) {
      final updatedWorkOrder = workOrder.copyWith(
        isPendingSync: false,
        pendingAction: null,
      );
      await box.put(id, updatedWorkOrder);
    }
  }
}
