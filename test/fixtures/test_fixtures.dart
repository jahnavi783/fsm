import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_orders_data.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';

/// Test fixtures for Work Order entities
class WorkOrderFixtures {
  static WorkOrderEntity createWorkOrder({
    int id = 1,
    String woNumber = 'WO-001',
    int srId = 1,
    String summary = 'Test Work Order',
    String problemDescription = 'Test problem description',
    WorkOrderPriority priority = WorkOrderPriority.medium,
    DateTime? visitDate,
    String location = 'Test Location',
    WorkOrderStatus status = WorkOrderStatus.assigned,
    int durationDays = 1,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    String? pauseLogs,
    String? workLog,
    List<PartUsedEntity> partsUsed = const [],
    List<String> images = const [],
    CustomerEntity? customer,
    LocationEntity? locationDetails,
    List<String> requiredSkills = const [],
    List<PartEntity> requiredParts = const [],
    List<String> attachments = const [],
    String? completionNotes,
  }) {
    return WorkOrderEntity(
      id: id,
      woNumber: woNumber,
      srId: srId,
      summary: summary,
      problemDescription: problemDescription,
      priority: priority,
      visitDate: visitDate ?? DateTime.now().add(const Duration(days: 1)),
      location: location,
      status: status,
      durationDays: durationDays,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
      startedAt: startedAt,
      resumedAt: resumedAt,
      completedAt: completedAt,
      pauseLogs: pauseLogs,
      workLog: workLog,
      partsUsed: partsUsed,
      images: images,
      customer: customer,
      locationDetails: locationDetails,
      requiredSkills: requiredSkills,
      requiredParts: requiredParts,
      attachments: attachments,
      completionNotes: completionNotes,
    );
  }

  static List<WorkOrderEntity> createWorkOrders(int count) {
    return List.generate(
      count,
      (index) => createWorkOrder(
        id: index + 1,
        woNumber: 'WO-${(index + 1).toString().padLeft(3, '0')}',
        summary: 'Work Order ${index + 1}',
      ),
    );
  }

  static List<WorkOrderEntity> createWorkOrdersWithStatuses(
    Map<WorkOrderStatus, int> statusCounts,
  ) {
    final workOrders = <WorkOrderEntity>[];
    var id = 1;

    statusCounts.forEach((status, count) {
      for (var i = 0; i < count; i++) {
        workOrders.add(createWorkOrder(
          id: id++,
          status: status,
          woNumber: 'WO-${id.toString().padLeft(3, '0')}',
        ));
      }
    });

    return workOrders;
  }

  static List<WorkOrderEntity> createWorkOrdersWithPriorities(
    Map<WorkOrderPriority, int> priorityCounts,
  ) {
    final workOrders = <WorkOrderEntity>[];
    var id = 1;

    priorityCounts.forEach((priority, count) {
      for (var i = 0; i < count; i++) {
        workOrders.add(createWorkOrder(
          id: id++,
          priority: priority,
          woNumber: 'WO-${id.toString().padLeft(3, '0')}',
        ));
      }
    });

    return workOrders;
  }

  static WorkOrdersData createWorkOrdersData({
    List<WorkOrderEntity>? workOrders,
    List<WorkOrderEntity>? unassignedWorkOrders,
    int total = 50,
    int page = 1,
    int pages = 3,
    int? unassignedCount,
  }) {
    final woList = workOrders ?? createWorkOrders(20);
    final unassignedList = unassignedWorkOrders ?? [];
    
    return WorkOrdersData(
      workOrders: woList,
      unassignedWorkOrders: unassignedList,
      total: total,
      page: page,
      pages: pages,
      unassignedCount: unassignedCount ?? unassignedList.length,
    );
  }

  static CustomerEntity createCustomer({
    int id = 1,
    String name = 'Test Customer',
    String? email,
    String? phone,
    String? address,
  }) {
    return CustomerEntity(
      id: id,
      name: name,
      email: email ?? 'customer$id@test.com',
      phone: phone ?? '+1234567890',
      address: address ?? 'Test Address $id',
    );
  }

  static LocationEntity createLocation({
    int id = 1,
    String name = 'Test Location',
    String address = 'Test Address',
    double latitude = 37.7749,
    double longitude = -122.4194,
    String? city,
    String? state,
    String? zipCode,
  }) {
    return LocationEntity(
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
      city: city ?? 'San Francisco',
      state: state ?? 'CA',
      zipCode: zipCode ?? '94102',
    );
  }
}

/// Test fixtures for User entities
class UserFixtures {
  static UserEntity createUser({
    int id = 1,
    String firstName = 'John',
    String lastName = 'Doe',
    String? email,
    String? phone,
    String? city,
  }) {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email ?? 'user$id@test.com',
      phone: phone,
      city: city,
    );
  }
}

/// Test fixtures for Failures
class FailureFixtures {
  static Failure serverFailure({
    String message = 'Server error',
    int? statusCode = 500,
    String? errorCode,
  }) {
    return Failure.server(
      message: message,
      statusCode: statusCode,
      errorCode: errorCode,
    );
  }

  static Failure networkFailure({
    String message = 'Network error',
  }) {
    return Failure.network(message: message);
  }

  static Failure cacheFailure({
    String message = 'Cache error',
  }) {
    return Failure.cache(message: message);
  }

  static Failure authenticationFailure({
    String message = 'Authentication failed',
  }) {
    return Failure.authentication(message: message);
  }
}
