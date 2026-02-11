import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/work_orders/data/api/work_order_api_client.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_remote_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/data/models/work_order_response.dart';
import 'package:fsm/features/work_orders/data/models/work_orders_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'work_order_remote_ds_test.mocks.dart';

@GenerateMocks([WorkOrderApiClient])
void main() {
  late WorkOrderRemoteDataSourceImpl dataSource;
  late MockWorkOrderApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWorkOrderApiClient();
    dataSource = WorkOrderRemoteDataSourceImpl(mockApiClient);
  });

  const tWorkOrderId = 1;
  const tWorkOrderDto = WorkOrderDto(
    id: tWorkOrderId,
    woNumber: 'WO-123',
    srId: 101,
    summary: 'Test',
    problemDescription: 'Desc',
    priority: 'Medium',
    visitDate: '2025-01-01T00:00:00.000',
    location: 'Loc',
    status: 'Assigned',
    durationDays: 1,
    durationHours: 8.0,
    createdAt: '2025-01-01T00:00:00.000',
    updatedAt: '2025-01-01T00:00:00.000',
    serviceRequest: null,
  );

  final tWorkOrderResponse = WorkOrderResponse(
    workOrder: tWorkOrderDto,
  );

  group('getWorkOrders', () {
    const tPage = 1;
    const tLimit = 10;
    final tResponse = WorkOrdersResponse(
      workOrders: [tWorkOrderDto],
      unassignedWorkOrders: [],
      total: 1,
      page: 1,
      pages: 1,
      unassignedCount: 0,
    );

    test('should return WorkOrdersResponse when api call is successful',
        () async {
      // Arrange
      when(mockApiClient.getWorkOrders(
        page: tPage,
        limit: tLimit,
        status: null,
        priority: null,
      )).thenAnswer((_) async => tResponse);

      // Act
      final result = await dataSource.getWorkOrders(page: tPage, limit: tLimit);

      // Assert
      expect(result, tResponse);
      verify(mockApiClient.getWorkOrders(
        page: tPage,
        limit: tLimit,
        status: null,
        priority: null,
      ));
    });

    test('should throw exception when api call fails', () async {
      // Arrange
      when(mockApiClient.getWorkOrders(
        page: tPage,
        limit: tLimit,
        status: null,
        priority: null,
      )).thenThrow(Exception());

      // Act
      final call = dataSource.getWorkOrders;

      // Assert
      expect(() => call(page: tPage, limit: tLimit), throwsException);
    });
  });

  group('getWorkOrderById', () {
    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.getWorkOrderById(tWorkOrderId))
          .thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.getWorkOrderById(tWorkOrderId);

      // Assert
      expect(result, tWorkOrderDto);
    });
  });

  group('startWorkOrder', () {
    const tLat = 10.0;
    const tLng = 20.0;

    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.startWorkOrder(
        id: tWorkOrderId,
        gpsCoordinates: '[$tLng, $tLat]',
        files: [],
        comments: null,
      )).thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.startWorkOrder(
        workOrderId: tWorkOrderId,
        latitude: tLat,
        longitude: tLng,
      );

      // Assert
      expect(result, tWorkOrderDto);
    });
  });

  group('pauseWorkOrder', () {
    const tReason = 'Lunch';
    const tLat = 10.0;
    const tLng = 20.0;

    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.pauseWorkOrder(
        id: tWorkOrderId,
        reason: tReason,
        gpsCoordinates: '[$tLng, $tLat]',
        files: [],
      )).thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.pauseWorkOrder(
        workOrderId: tWorkOrderId,
        reason: tReason,
        latitude: tLat,
        longitude: tLng,
      );

      // Assert
      expect(result, tWorkOrderDto);
    });
  });

  group('resumeWorkOrder', () {
    const tLat = 10.0;
    const tLng = 20.0;

    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.resumeWorkOrder(
        id: tWorkOrderId,
        gpsCoordinates: '[$tLng, $tLat]',
        files: [],
        comments: null,
      )).thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.resumeWorkOrder(
        workOrderId: tWorkOrderId,
        latitude: tLat,
        longitude: tLng,
      );

      // Assert
      expect(result, tWorkOrderDto);
    });
  });

  group('rejectWorkOrder', () {
    const tReason = 'Reason';
    const tLat = 10.0;
    const tLng = 20.0;

    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.rejectWorkOrder(
        id: tWorkOrderId,
        body: anyNamed('body'),
      )).thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.rejectWorkOrder(
        workOrderId: tWorkOrderId,
        reason: tReason,
        latitude: tLat,
        longitude: tLng,
      );

      // Assert
      expect(result, tWorkOrderDto);
      verify(mockApiClient.rejectWorkOrder(
        id: tWorkOrderId,
        body: anyNamed('body'),
      ));
    });
  });

  group('assignWorkOrder', () {
    const tTechId = 99;

    test('should return WorkOrderDto when api call is successful', () async {
      // Arrange
      when(mockApiClient.assignWorkOrder(
        id: tWorkOrderId,
        body: anyNamed('body'),
      )).thenAnswer((_) async => tWorkOrderResponse);

      // Act
      final result = await dataSource.assignWorkOrder(
        workOrderId: tWorkOrderId,
        technicianId: tTechId,
      );

      // Assert
      expect(result, tWorkOrderDto);
      verify(mockApiClient.assignWorkOrder(
        id: tWorkOrderId,
        body: anyNamed('body'),
      ));
    });
  });
}
