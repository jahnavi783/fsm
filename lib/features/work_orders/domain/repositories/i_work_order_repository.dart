import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_orders_data.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';

abstract class IWorkOrderRepository {
  Future<Either<Failure, WorkOrdersData>> getWorkOrders({
    required int page,
    required int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
  });

  Future<Either<Failure, WorkOrderEntity>> getWorkOrderById(int id);

  Future<Either<Failure, WorkOrderEntity>> startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  });

  Future<Either<Failure, WorkOrderEntity>> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
    List<File> files = const [],
  });

  Future<Either<Failure, WorkOrderEntity>> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  });

  Future<Either<Failure, WorkOrderEntity>> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required String customerName,
    required File signature,
    required List<PartUsedEntity> partsUsed,
    required List<File> files,
    required double latitude,
    required double longitude,
    String? completionNotes,
  });

  Future<Either<Failure, WorkOrderEntity>> rejectWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  });

  Future<Either<Failure, List<WorkOrderEntity>>> syncPendingWorkOrders();

  Future<Either<Failure, void>> cacheWorkOrders(
      List<WorkOrderEntity> workOrders);

  Future<Either<Failure, List<WorkOrderEntity>>> getCachedWorkOrders({
    WorkOrderStatus? status,
  });

  Future<Either<Failure, WorkOrderGroupedImagesEntity>> getGroupedImages(
      int workOrderId);

  Future<Either<Failure, WorkOrderEntity>> assignWorkOrder({
    required int workOrderId,
    required int technicianId,
  });
}
