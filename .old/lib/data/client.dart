import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fsm_flutter/core/constants.dart';
import 'package:fsm_flutter/core/services/enums.dart';
import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/data/response/document_response.dart';
import 'package:fsm_flutter/data/response/inventory_response.dart';
import 'package:fsm_flutter/data/response/login_request.dart';
import 'package:fsm_flutter/data/response/login_response.dart';
import 'package:fsm_flutter/data/response/refresh_token_response.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';
import 'package:fsm_flutter/data/response/wo_reject_request.dart';
import 'package:fsm_flutter/data/response/work_order_response.dart';
import 'package:fsm_flutter/data/response/work_orders_response.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/auth/refresh-token')
  Future<RefreshTokenResponse> refreshToken(@Body() Map<String, dynamic> body);

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
    @Part(name: 'parts_used')
    required List<WoCompletePartsUsedRequest> partsUsed,
    @Part(name: 'files') List<File> files = const [],
  });

  @GET("/users/me")
  Future<UserEntity> getUserById();

  @GET("/inventory")
  Future<InventoryResponse> getInventory();

  @PATCH('/work-orders/{id}/reject')
  Future<WorkOrderResponse> rejectWorkOrder({
    @Path('id') required int id,
    @Body() required WoRejectRequest body,
  });

  @GET("/documents")
  Future<DocumentResponse> getDocuments({
    @Query('model') String? model,
    @Query('category') DocumentCategory? category,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}
