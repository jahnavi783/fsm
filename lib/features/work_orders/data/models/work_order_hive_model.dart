// import 'package:hive_ce/hive.dart';
//
// import '../../domain/entities/work_order_entity.dart';
//
// part 'work_order_hive_model.g.dart';
//
// @HiveType(typeId: 5)
// class WorkOrderHiveModel extends HiveObject {
//   @HiveField(0)
//   final int id;
//
//   @HiveField(1)
//   final String woNumber;
//
//   @HiveField(2)
//   final int srId;
//
//   @HiveField(3)
//   final String? userId;
//
//   @HiveField(4)
//   final String summary;
//
//   @HiveField(5)
//   final String problemDescription;
//
//   @HiveField(6)
//   final int priority;
//
//   @HiveField(7)
//   final DateTime visitDate;
//
//   @HiveField(8)
//   final String location;
//
//   @HiveField(9)
//   final int status;
//
//   @HiveField(10)
//   final int durationDays;
//
//   @HiveField(11)
//   final DateTime createdAt;
//
//   @HiveField(12)
//   final DateTime updatedAt;
//
//   @HiveField(13)
//   final DateTime? startedAt;
//
//   @HiveField(14)
//   final DateTime? resumedAt;
//
//   @HiveField(15)
//   final DateTime? completedAt;
//
//   @HiveField(16)
//   final String? pauseLogs;
//
//   @HiveField(17)
//   final String? workLog;
//
//   @HiveField(18)
//   final List<PartUsedHiveModel>? partsUsed;
//
//   @HiveField(19)
//   final List<String> images;
//
//   @HiveField(20)
//   final DateTime cachedAt;
//
//   @HiveField(21)
//   final bool isPendingSync;
//
//   @HiveField(22)
//   final String? pendingAction;
//
//   // ✅ IMPORTANT: This field is missing from constructor!
//   @HiveField(23)
//   final String? serviceRequestNumber;
//
//   WorkOrderHiveModel({
//     required this.id,
//     required this.woNumber,
//     required this.srId,
//     required this.userId,
//     required this.summary,
//     required this.problemDescription,
//     required this.priority,
//     required this.visitDate,
//     required this.location,
//     required this.status,
//     required this.durationDays,
//     required this.createdAt,
//     required this.updatedAt,
//     this.startedAt,
//     this.resumedAt,
//     this.completedAt,
//     this.pauseLogs,
//     this.workLog,
//     this.partsUsed,
//     required this.images,
//     required this.cachedAt,
//     required this.isPendingSync,
//     this.pendingAction,
//     // ✅ FIXED: Added missing serviceRequestNumber parameter
//     this.serviceRequestNumber,
//   });
//
//   WorkOrderHiveModel copyWith({
//     int? status,
//     String? pendingAction,
//     bool? isPendingSync,
//     DateTime? startedAt,
//     DateTime? resumedAt,
//     DateTime? completedAt,
//     String? pauseLogs,
//     String? workLog,
//     List<String>? images,
//     List<PartUsedHiveModel>? partsUsed,
//     String? serviceRequestNumber,
//   }) {
//     return WorkOrderHiveModel(
//       id: id,
//       woNumber: woNumber,
//       srId: srId,
//       // ✅ FIXED: Use parameter if provided, otherwise keep existing
//       serviceRequestNumber: serviceRequestNumber ?? this.serviceRequestNumber,
//       userId: userId,
//       summary: summary,
//       problemDescription: problemDescription,
//       priority: priority,
//       visitDate: visitDate,
//       location: location,
//       status: status ?? this.status,
//       durationDays: durationDays,
//       createdAt: createdAt,
//       updatedAt: updatedAt,
//       startedAt: startedAt ?? this.startedAt,
//       resumedAt: resumedAt ?? this.resumedAt,
//       completedAt: completedAt ?? this.completedAt,
//       pauseLogs: pauseLogs ?? this.pauseLogs,
//       workLog: workLog ?? this.workLog,
//       partsUsed: partsUsed ?? this.partsUsed,
//       images: images ?? this.images,
//       cachedAt: cachedAt,
//       isPendingSync: isPendingSync ?? this.isPendingSync,
//       pendingAction: pendingAction ?? this.pendingAction,
//     );
//   }
//
//   WorkOrderEntity toEntity() {
//     return WorkOrderEntity(
//       id: id,
//       woNumber: woNumber,
//       srId: srId,
//       userId: userId,
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
//       // ✅ FIXED: Added serviceRequestNumber
//       serviceRequestNumber: serviceRequestNumber,
//       partsUsed: (partsUsed ?? [])
//           .map(
//             (p) => PartUsedEntity(
//               partNumber: p.partNumber,
//               quantityUsed: p.quantityUsed,
//               partName: p.partName,
//               description: p.description,
//             ),
//           )
//           .toList(),
//       images: images,
//     );
//   }
// }
//
// @HiveType(typeId: 6)
// class PartUsedHiveModel {
//   @HiveField(0)
//   final String partNumber;
//
//   @HiveField(1)
//   final int quantityUsed;
//
//   @HiveField(2)
//   final String? partName;
//
//   @HiveField(3)
//   final String? description;
//
//   PartUsedHiveModel({
//     required this.partNumber,
//     required this.quantityUsed,
//     this.partName,
//     this.description,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'part_number': partNumber,
//         'quantity_used': quantityUsed,
//         'part_name': partName,
//         'description': description,
//       };
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

  @HiveField(2)
  final int srId;

  @HiveField(3)
  final String? userId;

  @HiveField(4)
  final String summary;

  @HiveField(5)
  final String problemDescription;

  @HiveField(6)
  final int priority;

  @HiveField(7)
  final DateTime visitDate;

  @HiveField(8)
  final String location;

  @HiveField(9)
  final int status;

  @HiveField(10)
  final int durationDays;

  // ✅ FIXED: Added missing durationHours field
  @HiveField(11)
  final double? durationHours;

  @HiveField(12)
  final DateTime createdAt;

  @HiveField(13)
  final DateTime updatedAt;

  @HiveField(14)
  final DateTime? startedAt;

  @HiveField(15)
  final DateTime? resumedAt;

  @HiveField(16)
  final DateTime? completedAt;

  @HiveField(17)
  final String? pauseLogs;

  @HiveField(18)
  final String? workLog;

  @HiveField(19)
  final List<PartUsedHiveModel>? partsUsed;

  @HiveField(20)
  final List<String> images;

  @HiveField(21)
  final DateTime cachedAt;

  @HiveField(22)
  final bool isPendingSync;

  @HiveField(23)
  final String? pendingAction;

  @HiveField(24)
  final String? serviceRequestNumber;

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
    // ✅ FIXED: Added missing durationHours parameter
    this.durationHours,
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
    this.serviceRequestNumber,
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
    String? serviceRequestNumber,
    // ✅ FIXED: Added durationHours parameter to copyWith
    double? durationHours,
  }) {
    return WorkOrderHiveModel(
      id: id,
      woNumber: woNumber,
      srId: srId,
      serviceRequestNumber: serviceRequestNumber ?? this.serviceRequestNumber,
      userId: userId,
      summary: summary,
      problemDescription: problemDescription,
      priority: priority,
      visitDate: visitDate,
      location: location,
      status: status ?? this.status,
      durationDays: durationDays,
      // ✅ FIXED: Use parameter if provided, otherwise keep existing
      durationHours: durationHours ?? this.durationHours,
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
      priority: WorkOrderPriority.values[priority],
      visitDate: visitDate,
      location: location,
      status: WorkOrderStatus.values[status],
      durationDays: durationDays,
      // ✅ FIXED: Pass durationHours to entity
      durationHours: durationHours,
      createdAt: createdAt,
      updatedAt: updatedAt,
      startedAt: startedAt,
      resumedAt: resumedAt,
      completedAt: completedAt,
      pauseLogs: pauseLogs,
      workLog: workLog,
      serviceRequestNumber: serviceRequestNumber,
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
