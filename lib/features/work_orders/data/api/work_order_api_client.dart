import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fsm/features/work_orders/data/models/work_orders_response.dart';
import 'package:fsm/features/work_orders/data/models/work_order_response.dart';
import 'package:fsm/features/work_orders/data/models/reject_work_order_request.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_order_api_client.g.dart';

@RestApi()
abstract class WorkOrderApiClient {
  factory WorkOrderApiClient(Dio dio, {String baseUrl}) = _WorkOrderApiClient;

  @GET('/work-orders')
  Future<WorkOrdersResponse> getWorkOrders({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('status') WorkOrderStatus? status,
    @Query('priority') WorkOrderPriority? priority,
  });

  @GET('/work-orders/{id}')
  Future<WorkOrderResponse> getWorkOrderById(@Path('id') int id);

  @PATCH('/work-orders/{id}/start')
  @MultiPart()
  Future<WorkOrderResponse> startWorkOrder({
    @Path('id') required int id,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/pause')
  @MultiPart()
  Future<WorkOrderResponse> pauseWorkOrder({
    @Path('id') required int id,
    @Part(name: 'reason') required String reason,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/resume')
  @MultiPart()
  Future<WorkOrderResponse> resumeWorkOrder({
    @Path('id') required int id,
    @Part(name: 'gps_coordinates') String? gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/complete')
  @MultiPart()
  Future<WorkOrderResponse> completeWorkOrder({
    @Path('id') required int id,
    @Part(name: 'work_log') required String workLog,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'parts_used') required String partsUsed,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/reject')
  Future<WorkOrderResponse> rejectWorkOrder({
    @Path('id') required int id,
    @Body() required RejectWorkOrderRequest body,
  });
}