// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:fsm/features/parts/data/models/part_hive_model.dart';
// import 'package:fsm/features/parts/domain/entities/part_entity.dart'
//     as parts_domain;
// import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/part_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/service_request_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
// import 'package:hive_ce/hive.dart';
//
// import '../../domain/entities/location_entity.dart' show LocationEntity;
//
// part 'work_order_hive_model.freezed.dart';
// part 'work_order_hive_model.g.dart';
//
// @freezed
// @HiveType(typeId: 1)
// abstract class WorkOrderHiveModel with _$WorkOrderHiveModel {
//   const factory WorkOrderHiveModel({
//     @HiveField(0) required int id,
//     @HiveField(1) required String woNumber,
//     @HiveField(2) required int srId,
//     @HiveField(3) required String summary,
//     @HiveField(4) required String problemDescription,
//     @HiveField(5) required int priority, // Store as int for enum
//     @HiveField(6) required DateTime visitDate,
//     @HiveField(7) required String location,
//     @HiveField(8) required int status, // Store as int for enum
//     @HiveField(9) required int durationDays,
//     @HiveField(10) required DateTime createdAt,
//     @HiveField(11) required DateTime updatedAt,
//     @HiveField(12) DateTime? startedAt,
//     @HiveField(13) DateTime? resumedAt,
//     @HiveField(14) DateTime? completedAt,
//     @HiveField(15) String? pauseLogs,
//     @HiveField(16) String? workLog,
//     @HiveField(17) @Default([]) List<PartUsedHiveModel> partsUsed,
//     @HiveField(18) @Default([]) List<String> images,
//     @HiveField(19) CustomerHiveModel? customer,
//     @HiveField(20) LocationHiveModel? locationDetails,
//     @HiveField(21) ServiceRequestHiveModel? serviceRequest,
//     @HiveField(22) @Default([]) List<WorkLogHiveModel> workLogs,
//     @HiveField(23) @Default([]) List<String> requiredSkills,
//     @HiveField(24) @Default([]) List<PartHiveModel> requiredParts,
//     @HiveField(25) @Default([]) List<String> attachments,
//     @HiveField(26) String? completionNotes,
//     @HiveField(27) required DateTime cachedAt,
//     @HiveField(28) @Default(false) bool isPendingSync,
//     @HiveField(29) String? pendingAction,
//     @HiveField(30) String? userId,
//   }) = _WorkOrderHiveModel;
//
//   factory WorkOrderHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$WorkOrderHiveModelFromJson(json);
// }
//
// @freezed
// @HiveType(typeId: 2)
// abstract class PartUsedHiveModel with _$PartUsedHiveModel {
//   const factory PartUsedHiveModel({
//     @HiveField(0) required String partNumber,
//     @HiveField(1) required int quantityUsed,
//     @HiveField(2) String? partName,
//     @HiveField(3) String? description,
//   }) = _PartUsedHiveModel;
//
//   factory PartUsedHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$PartUsedHiveModelFromJson(json);
// }
//
// @freezed
// @HiveType(typeId: 3)
// abstract class CustomerHiveModel with _$CustomerHiveModel {
//   const factory CustomerHiveModel({
//     @HiveField(0) required int id,
//     @HiveField(1) required String name,
//     @HiveField(2) required String email,
//     @HiveField(3) String? phone,
//     @HiveField(4) String? address,
//     @HiveField(5) String? city,
//     @HiveField(6) String? state,
//     @HiveField(7) String? postalCode,
//     @HiveField(8) String? country,
//   }) = _CustomerHiveModel;
//
//   factory CustomerHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$CustomerHiveModelFromJson(json);
// }
//
// @freezed
// @HiveType(typeId: 4)
// abstract class LocationHiveModel with _$LocationHiveModel {
//   const factory LocationHiveModel({
//     @HiveField(0) required double latitude,
//     @HiveField(1) required double longitude,
//     @HiveField(2) String? address,
//     @HiveField(3) String? city,
//     @HiveField(4) String? state,
//     @HiveField(5) String? postalCode,
//     @HiveField(6) String? country,
//     @HiveField(7) String? landmark,
//     @HiveField(8) double? accuracy,
//     @HiveField(9) DateTime? capturedAt,
//   }) = _LocationHiveModel;
//
//   factory LocationHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$LocationHiveModelFromJson(json);
// }
//
// @freezed
// @HiveType(typeId: 5)
// abstract class ServiceRequestHiveModel with _$ServiceRequestHiveModel {
//   const factory ServiceRequestHiveModel({
//     @HiveField(0) required String srNumber,
//     @HiveField(1) required String srType,
//     @HiveField(2) String? priority,
//     @HiveField(3) String? issueDescription,
//     @HiveField(4) String? machineSerial,
//     @HiveField(5) String? model,
//     @HiveField(6) String? customerName,
//     @HiveField(7) String? location,
//     @HiveField(8) String? postalCode,
//     @HiveField(9) String? underWarranty,
//     @HiveField(10) DateTime? visitDate,
//   }) = _ServiceRequestHiveModel;
//
//   factory ServiceRequestHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$ServiceRequestHiveModelFromJson(json);
// }
//
// @freezed
// @HiveType(typeId: 6)
// abstract class WorkLogHiveModel with _$WorkLogHiveModel {
//   const factory WorkLogHiveModel({
//     @HiveField(0) required int id,
//     @HiveField(1) required int workOrderId,
//     @HiveField(2) required int type, // Store as int for enum
//     @HiveField(3) required String description,
//     @HiveField(4) required DateTime timestamp,
//     @HiveField(5) String? notes,
//     @HiveField(6) double? latitude,
//     @HiveField(7) double? longitude,
//     @HiveField(8) String? userId,
//     @HiveField(9) String? userName,
//   }) = _WorkLogHiveModel;
//
//   factory WorkLogHiveModel.fromJson(Map<String, dynamic> json) =>
//       _$WorkLogHiveModelFromJson(json);
// }
//
// // Extension for mapping to domain entity
// extension WorkOrderHiveModelX on WorkOrderHiveModel {
//   WorkOrderEntity toEntity() {
//     return WorkOrderEntity(
//       id: id,
//       woNumber: woNumber,
//       srId: srId,
//       summary: summary,
//       problemDescription: problemDescription,
//       priority: WorkOrderPriority.values[priority],
//       visitDate: visitDate,
//       location: location,
//       status: WorkOrderStatus.values[status],
//       durationDays: durationDays,
//       createdAt: createdAt,
//       updatedAt: updatedAt,
//       startedAt: startedAt,
//       resumedAt: resumedAt,
//       completedAt: completedAt,
//       pauseLogs: pauseLogs,
//       workLog: workLog,
//       partsUsed: partsUsed.map((p) => p.toEntity()).toList(),
//       images: images,
//       customer: customer?.toEntity(),
//       locationDetails: locationDetails?.toEntity(),
//       serviceRequest: serviceRequest?.toEntity(),
//       workLogs: workLogs.map((w) => w.toEntity()).toList(),
//       requiredSkills: requiredSkills,
//       requiredParts:
//           requiredParts.map((p) => _convertPartEntity(p.toEntity())).toList(),
//       attachments: attachments,
//       completionNotes: completionNotes,
//     );
//   }
//
//   PartEntity _convertPartEntity(parts_domain.PartEntity partsEntity) {
//     return PartEntity(
//       quantity: partsEntity.quantityAvailable,
//       partNumber: partsEntity.partNumber,
//       partName: partsEntity.partName,
//       unitPrice: partsEntity.unitPrice,
//     );
//   }
// }
//
// extension PartUsedHiveModelX on PartUsedHiveModel {
//   PartUsedEntity toEntity() {
//     return PartUsedEntity(
//       partNumber: partNumber,
//       quantityUsed: quantityUsed,
//       partName: partName,
//       description: description,
//     );
//   }
// }
//
// extension CustomerHiveModelX on CustomerHiveModel {
//   CustomerEntity toEntity() {
//     return CustomerEntity(
//       id: id,
//       name: name,
//       email: email,
//       phone: phone,
//       address: address,
//       city: city,
//       state: state,
//       postalCode: postalCode,
//       country: country,
//     );
//   }
// }
//
// extension LocationHiveModelX on LocationHiveModel {
//   LocationEntity toEntity() {
//     return LocationEntity(
//       latitude: latitude,
//       longitude: longitude,
//       address: address,
//       city: city,
//       state: state,
//       postalCode: postalCode,
//       country: country,
//       landmark: landmark,
//       accuracy: accuracy,
//       capturedAt: capturedAt,
//     );
//   }
// }
//
// extension ServiceRequestHiveModelX on ServiceRequestHiveModel {
//   ServiceRequestEntity toEntity() {
//     return ServiceRequestEntity(
//       srNumber: srNumber,
//       srType: srType,
//       priority: priority,
//       issueDescription: issueDescription,
//       machineSerial: machineSerial,
//       model: model,
//       customerName: customerName,
//       location: location,
//       postalCode: postalCode,
//       underWarranty: underWarranty,
//       visitDate: visitDate,
//     );
//   }
// }
//
// extension WorkLogHiveModelX on WorkLogHiveModel {
//   WorkLogEntity toEntity() {
//     return WorkLogEntity(
//       id: id,
//       workOrderId: workOrderId,
//       type: WorkLogType.values[type],
//       description: description,
//       timestamp: timestamp,
//       notes: notes,
//       latitude: latitude,
//       longitude: longitude,
//       userId: userId,
//       userName: userName,
//     );
//   }
// }

import 'package:hive_ce/hive.dart';

import '../../domain/entities/work_order_entity.dart';

part 'work_order_hive_model.g.dart';

@HiveType(typeId: 5)
class WorkOrderHiveModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String woNumber;

  // ✅ srId is int to match DTO + Entity
  @HiveField(2)
  final int srId;

  @HiveField(3)
  final String? userId; // current logged-in technician

  @HiveField(4)
  final String summary;

  @HiveField(5)
  final String problemDescription;

  /// Index of WorkOrderPriority enum
  @HiveField(6)
  final int priority;

  @HiveField(7)
  final DateTime visitDate;

  @HiveField(8)
  final String location;

  /// Index of WorkOrderStatus enum
  @HiveField(9)
  final int status;

  @HiveField(10)
  final int durationDays;

  @HiveField(11)
  final DateTime createdAt;

  @HiveField(12)
  final DateTime updatedAt;

  @HiveField(13)
  final DateTime? startedAt;

  @HiveField(14)
  final DateTime? resumedAt;

  @HiveField(15)
  final DateTime? completedAt;

  @HiveField(16)
  final String? pauseLogs;

  @HiveField(17)
  final String? workLog;

  @HiveField(18)
  final List<PartUsedHiveModel>? partsUsed;

  @HiveField(19)
  final List<String> images;

  @HiveField(20)
  final DateTime cachedAt;

  @HiveField(21)
  final bool isPendingSync;

  @HiveField(22)
  final String? pendingAction;

  WorkOrderHiveModel({
    required this.id,
    required this.woNumber,
    required this.srId,
    required this.userId,
    required this.summary,
    required this.problemDescription,
    required this.priority,
    required this.visitDate,
    required this.location,
    required this.status,
    required this.durationDays,
    required this.createdAt,
    required this.updatedAt,
    this.startedAt,
    this.resumedAt,
    this.completedAt,
    this.pauseLogs,
    this.workLog,
    this.partsUsed,
    required this.images,
    required this.cachedAt,
    required this.isPendingSync,
    this.pendingAction,
  });

  WorkOrderHiveModel copyWith({
    int? status,
    String? pendingAction,
    bool? isPendingSync,
    DateTime? startedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    String? pauseLogs,
    String? workLog,
    List<String>? images,
    List<PartUsedHiveModel>? partsUsed,
  }) {
    return WorkOrderHiveModel(
      id: id,
      woNumber: woNumber,
      srId: srId,
      userId: userId,
      summary: summary,
      problemDescription: problemDescription,
      priority: priority,
      visitDate: visitDate,
      location: location,
      status: status ?? this.status,
      durationDays: durationDays,
      createdAt: createdAt,
      updatedAt: updatedAt,
      startedAt: startedAt ?? this.startedAt,
      resumedAt: resumedAt ?? this.resumedAt,
      completedAt: completedAt ?? this.completedAt,
      pauseLogs: pauseLogs ?? this.pauseLogs,
      workLog: workLog ?? this.workLog,
      partsUsed: partsUsed ?? this.partsUsed,
      images: images ?? this.images,
      cachedAt: cachedAt,
      isPendingSync: isPendingSync ?? this.isPendingSync,
      pendingAction: pendingAction ?? this.pendingAction,
    );
  }

  WorkOrderEntity toEntity() {
    return WorkOrderEntity(
      id: id,
      woNumber: woNumber,
      srId: srId,
      userId: userId,
      summary: summary,
      problemDescription: problemDescription,
      // ✅ Use the same enum types as WorkOrderEntity
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
      partsUsed: (partsUsed ?? [])
          .map(
            (p) => PartUsedEntity(
              partNumber: p.partNumber,
              quantityUsed: p.quantityUsed,
              partName: p.partName,
              description: p.description,
            ),
          )
          .toList(),
      images: images,
    );
  }
}

@HiveType(typeId: 6)
class PartUsedHiveModel {
  @HiveField(0)
  final String partNumber;

  @HiveField(1)
  final int quantityUsed;

  // ✅ Make nullable to match PartUsedEntity (String?)
  @HiveField(2)
  final String? partName;

  @HiveField(3)
  final String? description;

  PartUsedHiveModel({
    required this.partNumber,
    required this.quantityUsed,
    this.partName,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'part_number': partNumber,
        'quantity_used': quantityUsed,
        'part_name': partName,
        'description': description,
      };
}
