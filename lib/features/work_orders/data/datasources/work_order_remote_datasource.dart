import 'package:injectable/injectable.dart';
import 'package:fsm/features/work_orders/data/api/work_order_api_client.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/data/models/start_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/pause_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/resume_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/complete_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/reject_work_order_request.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

abstract class WorkOrderRemoteDataSource {
  Future<List<WorkOrderDto>> getWorkOrders({
    required int page,
    required int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
  });

  Future<WorkOrderDto> getWorkOrderById(int id);

  Future<WorkOrderDto> startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  });

  Future<WorkOrderDto> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  });

  Future<WorkOrderDto> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  });

  Future<WorkOrderDto> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<String> images,
    required double latitude,
    required double longitude,
    String? completionNotes,
  });

  Future<WorkOrderDto> rejectWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  });
}

@Injectable(as: WorkOrderRemoteDataSource)
class WorkOrderRemoteDataSourceImpl implements WorkOrderRemoteDataSource {
  final WorkOrderApiClient _apiClient;

  WorkOrderRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<WorkOrderDto>> getWorkOrders({
    required int page,
    required int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
  }) async {
    final response = await _apiClient.getWorkOrders(
      page: page,
      limit: limit,
      status: status?.name,
      priority: priority?.name,
      searchQuery: searchQuery,
    );
    return response.workOrders;
  }

  @override
  Future<WorkOrderDto> getWorkOrderById(int id) async {
    final response = await _apiClient.getWorkOrderById(id);
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  }) async {
    final request = StartWorkOrderRequest(
      gpsCoordinates: '$latitude,$longitude',
      notes: notes,
    );
    final response = await _apiClient.startWorkOrder(workOrderId, request);
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  }) async {
    final request = PauseWorkOrderRequest(
      reason: reason,
      gpsCoordinates: '$latitude,$longitude',
    );
    final response = await _apiClient.pauseWorkOrder(workOrderId, request);
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  }) async {
    final request = ResumeWorkOrderRequest(
      gpsCoordinates: '$latitude,$longitude',
      notes: notes,
    );
    final response = await _apiClient.resumeWorkOrder(workOrderId, request);
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<String> images,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) async {
    final request = CompleteWorkOrderRequest(
      workLog: workLog,
      partsUsed: partsUsed
          .map((part) => PartUsedRequestDto(
                partNumber: part.partNumber,
                quantityUsed: part.quantityUsed,
              ))
          .toList(),
      images: images,
      gpsCoordinates: '$latitude,$longitude',
      completionNotes: completionNotes,
    );
    final response = await _apiClient.completeWorkOrder(workOrderId, request);
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> rejectWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  }) async {
    final request = RejectWorkOrderRequest(
      reason: reason,
      gpsCoordinates: '$latitude,$longitude',
    );
    final response = await _apiClient.rejectWorkOrder(workOrderId, request);
    return response.workOrder;
  }
}