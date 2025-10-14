import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/part_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/service_request_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';
import 'package:hive/hive.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

import '../../domain/entities/location_entity.dart' show LocationEntity;

part 'work_order_hive_model.freezed.dart';
part 'work_order_hive_model.g.dart';

@freezed
@HiveType(typeId: 1)
class WorkOrderHiveModel with _$WorkOrderHiveModel {
  const factory WorkOrderHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String woNumber,
    @HiveField(2) required int srId,
    @HiveField(3) required String summary,
    @HiveField(4) required String problemDescription,
    @HiveField(5) required int priority, // Store as int for enum
    @HiveField(6) required DateTime visitDate,
    @HiveField(7) required String location,
    @HiveField(8) required int status, // Store as int for enum
    @HiveField(9) required int durationDays,
    @HiveField(10) required DateTime createdAt,
    @HiveField(11) required DateTime updatedAt,
    @HiveField(12) DateTime? startedAt,
    @HiveField(13) DateTime? resumedAt,
    @HiveField(14) DateTime? completedAt,
    @HiveField(15) String? pauseLogs,
    @HiveField(16) String? workLog,
    @HiveField(17) @Default([]) List<PartUsedHiveModel> partsUsed,
    @HiveField(18) @Default([]) List<String> images,
    @HiveField(19) CustomerHiveModel? customer,
    @HiveField(20) LocationHiveModel? locationDetails,
    @HiveField(21) ServiceRequestHiveModel? serviceRequest,
    @HiveField(22) @Default([]) List<WorkLogHiveModel> workLogs,
    @HiveField(23) @Default([]) List<String> requiredSkills,
    @HiveField(24) @Default([]) List<PartHiveModel> requiredParts,
    @HiveField(25) @Default([]) List<String> attachments,
    @HiveField(26) String? completionNotes,
    @HiveField(27) required DateTime cachedAt,
    @HiveField(28) @Default(false) bool isPendingSync,
    @HiveField(29)
    String? pendingAction, // 'start', 'pause', 'resume', 'complete', 'reject'
  }) = _WorkOrderHiveModel;

  factory WorkOrderHiveModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 2)
class PartUsedHiveModel with _$PartUsedHiveModel {
  const factory PartUsedHiveModel({
    @HiveField(0) required String partNumber,
    @HiveField(1) required int quantityUsed,
    @HiveField(2) String? partName,
    @HiveField(3) String? description,
  }) = _PartUsedHiveModel;

  factory PartUsedHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartUsedHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 3)
class CustomerHiveModel with _$CustomerHiveModel {
  const factory CustomerHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) String? phone,
    @HiveField(4) String? address,
    @HiveField(5) String? city,
    @HiveField(6) String? state,
    @HiveField(7) String? postalCode,
    @HiveField(8) String? country,
  }) = _CustomerHiveModel;

  factory CustomerHiveModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class LocationHiveModel with _$LocationHiveModel {
  const factory LocationHiveModel({
    @HiveField(0) required double latitude,
    @HiveField(1) required double longitude,
    @HiveField(2) String? address,
    @HiveField(3) String? city,
    @HiveField(4) String? state,
    @HiveField(5) String? postalCode,
    @HiveField(6) String? country,
    @HiveField(7) String? landmark,
    @HiveField(8) double? accuracy,
    @HiveField(9) DateTime? capturedAt,
  }) = _LocationHiveModel;

  factory LocationHiveModel.fromJson(Map<String, dynamic> json) =>
      _$LocationHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 5)
class ServiceRequestHiveModel with _$ServiceRequestHiveModel {
  const factory ServiceRequestHiveModel({
    @HiveField(0) required String srNumber,
    @HiveField(1) required String srType,
    @HiveField(2) String? priority,
    @HiveField(3) String? issueDescription,
    @HiveField(4) String? machineSerial,
    @HiveField(5) String? model,
    @HiveField(6) String? customerName,
    @HiveField(7) String? location,
    @HiveField(8) String? postalCode,
    @HiveField(9) String? underWarranty,
    @HiveField(10) DateTime? visitDate,
  }) = _ServiceRequestHiveModel;

  factory ServiceRequestHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 6)
class WorkLogHiveModel with _$WorkLogHiveModel {
  const factory WorkLogHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required int workOrderId,
    @HiveField(2) required int type, // Store as int for enum
    @HiveField(3) required String description,
    @HiveField(4) required DateTime timestamp,
    @HiveField(5) String? notes,
    @HiveField(6) double? latitude,
    @HiveField(7) double? longitude,
    @HiveField(8) String? userId,
    @HiveField(9) String? userName,
  }) = _WorkLogHiveModel;

  factory WorkLogHiveModel.fromJson(Map<String, dynamic> json) =>
      _$WorkLogHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 7)
class PartHiveModel with _$PartHiveModel {
  const factory PartHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String partNumber,
    @HiveField(2) required String name,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required double price,
    @HiveField(6) required int stockQuantity,
    @HiveField(7) required String unit,
    @HiveField(8) @Default([]) List<String> compatibleModels,
    @HiveField(9) String? imageUrl,
    @HiveField(10) String? specifications,
  }) = _PartHiveModel;

  factory PartHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartHiveModelFromJson(json);
}

// Extension for mapping to domain entity
extension WorkOrderHiveModelX on WorkOrderHiveModel {
  WorkOrderEntity toEntity() {
    return WorkOrderEntity(
      id: id,
      woNumber: woNumber,
      srId: srId,
      summary: summary,
      problemDescription: problemDescription,
      priority: WorkOrderPriority.values[priority],
      visitDate: visitDate,
      location: location,
      status: WorkOrderStatus.values[status],
      durationDays: durationDays,
      createdAt: createdAt,
      updatedAt: updatedAt,
      startedAt: startedAt,
      resumedAt: resumedAt,
      completedAt: completedAt,
      pauseLogs: pauseLogs,
      workLog: workLog,
      partsUsed: partsUsed.map((p) => p.toEntity()).toList(),
      images: images,
      customer: customer?.toEntity(),
      locationDetails: locationDetails?.toEntity(),
      serviceRequest: serviceRequest?.toEntity(),
      workLogs: workLogs.map((w) => w.toEntity()).toList(),
      requiredSkills: requiredSkills,
      requiredParts: requiredParts.map((p) => p.toEntity()).toList(),
      attachments: attachments,
      completionNotes: completionNotes,
    );
  }
}

extension PartUsedHiveModelX on PartUsedHiveModel {
  PartUsedEntity toEntity() {
    return PartUsedEntity(
      partNumber: partNumber,
      quantityUsed: quantityUsed,
      partName: partName,
      description: description,
    );
  }
}

extension CustomerHiveModelX on CustomerHiveModel {
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
    );
  }
}

extension LocationHiveModelX on LocationHiveModel {
  LocationEntity toEntity() {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: address,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      landmark: landmark,
      accuracy: accuracy,
      capturedAt: capturedAt,
    );
  }
}

extension ServiceRequestHiveModelX on ServiceRequestHiveModel {
  ServiceRequestEntity toEntity() {
    return ServiceRequestEntity(
      srNumber: srNumber,
      srType: srType,
      priority: priority,
      issueDescription: issueDescription,
      machineSerial: machineSerial,
      model: model,
      customerName: customerName,
      location: location,
      postalCode: postalCode,
      underWarranty: underWarranty,
      visitDate: visitDate,
    );
  }
}

extension WorkLogHiveModelX on WorkLogHiveModel {
  WorkLogEntity toEntity() {
    return WorkLogEntity(
      id: id,
      workOrderId: workOrderId,
      type: WorkLogType.values[type],
      description: description,
      timestamp: timestamp,
      notes: notes,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
      userName: userName,
    );
  }
}

extension PartHiveModelX on PartHiveModel {
  PartEntity toEntity() {
    return PartEntity(
      id: id,
      partNumber: partNumber,
      name: name,
      description: description,
      category: category,
      price: price,
      stockQuantity: stockQuantity,
      unit: unit,
      compatibleModels: compatibleModels,
      imageUrl: imageUrl,
      specifications: specifications,
    );
  }
}
