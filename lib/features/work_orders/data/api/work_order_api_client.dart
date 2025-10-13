import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fsm/features/work_orders/data/models/work_orders_response.dart';
import 'package:fsm/features/work_orders/data/models/work_order_response.dart';
import 'package:fsm/features/work_orders/data/models/start_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/pause_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/resume_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/complete_work_order_request.dart';
import 'package:fsm/features/work_orders/data/models/reject_work_order_request.dart';

part 'work_order_api_client.g.dart';

@RestApi()
abstract class WorkOrderApiClient {
  factory WorkOrderApiClient(Dio dio, {String baseUrl}) = _WorkOrderApiClient;

  @GET('/work-orders')
  Future<WorkOrdersResponse> getWorkOrders({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('status') String? status,
    @Query('priority') String? priority,
    @Query('search') String? searchQuery,
  });

  @GET('/work-orders/{id}')
  Future<WorkOrderResponse> getWorkOrderById(@Path('id') int id);

  @POST('/work-orders/{id}/start')
  Future<WorkOrderResponse> startWorkOrder(
    @Path('id') int id,
    @Body() StartWorkOrderRequest request,
  );

  @POST('/work-orders/{id}/pause')
  Future<WorkOrderResponse> pauseWorkOrder(
    @Path('id') int id,
    @Body() PauseWorkOrderRequest request,
  );

  @POST('/work-orders/{id}/resume')
  Future<WorkOrderResponse> resumeWorkOrder(
    @Path('id') int id,
    @Body() ResumeWorkOrderRequest request,
  );

  @POST('/work-orders/{id}/complete')
  Future<WorkOrderResponse> completeWorkOrder(
    @Path('id') int id,
    @Body() CompleteWorkOrderRequest request,
  );

  @POST('/work-orders/{id}/reject')
  Future<WorkOrderResponse> rejectWorkOrder(
    @Path('id') int id,
    @Body() RejectWorkOrderRequest request,
  );
}