import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:fsm/features/work_orders/data/api/work_order_api_client.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/data/models/reject_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/work_order_grouped_images_response_dto.dart';
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
    List<File> files = const [],
    String? notes,
  });

  Future<WorkOrderDto> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
    List<File> files = const [],
  });

  Future<WorkOrderDto> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  });

  Future<WorkOrderDto> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<File> files,
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

  Future<WorkOrderGroupedImagesResponseDto> getGroupedImages(int workOrderId);
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
      status: status,
      priority: priority,
      // searchQuery: searchQuery,
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
    List<File> files = const [],
    String? notes,
  }) async {
    final response = await _apiClient.startWorkOrder(
      id: workOrderId,
      gpsCoordinates: '[$longitude, $latitude]',
      files: files,
    );
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
    List<File> files = const [],
  }) async {
    final response = await _apiClient.pauseWorkOrder(
      id: workOrderId,
      reason: reason,
      gpsCoordinates: '[$longitude, $latitude]',
      files: files,
    );
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  }) async {
    final response = await _apiClient.resumeWorkOrder(
      id: workOrderId,
      gpsCoordinates: '[$longitude, $latitude]',
      files: files,
    );
    return response.workOrder;
  }

  @override
  Future<WorkOrderDto> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<File> files,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) async {
    final partsUsedJson = jsonEncode(partsUsed
        .map((part) => {
              'part_number': part.partNumber,
              'quantity_used': part.quantityUsed,
            })
        .toList());

    final response = await _apiClient.completeWorkOrder(
      id: workOrderId,
      workLog: workLog,
      gpsCoordinates: '[$longitude, $latitude]',
      partsUsed: partsUsedJson,
      files: files,
    );
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
      gpsCoordinates: '[$longitude, $latitude]',
    );
    final response = await _apiClient.rejectWorkOrder(
      id: workOrderId,
      body: request,
    );
    return response.workOrder;
  }

  @override
  Future<WorkOrderGroupedImagesResponseDto> getGroupedImages(
      int workOrderId) async {
    return await _apiClient.getGroupedImages(workOrderId);
  }
}
