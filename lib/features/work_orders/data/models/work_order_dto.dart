import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/service_request_dto.dart';
import 'package:fsm/features/work_orders/data/models/customer_dto.dart';
import 'package:fsm/features/work_orders/data/models/location_dto.dart';
import 'package:fsm/features/work_orders/data/models/part_dto.dart';
import 'package:fsm/features/work_orders/data/models/work_log_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_order_dto.freezed.dart';
part 'work_order_dto.g.dart';

@freezed
class WorkOrderDto with _$WorkOrderDto {
  const factory WorkOrderDto({
    required int id,
    @JsonKey(name: 'wo_number') required String woNumber,
    @JsonKey(name: 'sr_id') required int srId,
    @Default('') String summary,
    @JsonKey(name: 'problem_description') @Default('') String problemDescription,
    required String priority,
    @JsonKey(name: 'visit_date') required String visitDate,
    @Default('') String location,
    required String status,
    @Default(30) int duration,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'resumed_at') String? resumedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'pause_logs') String? pauseLogs,
    @JsonKey(name: 'work_log') String? workLog,
    @JsonKey(name: 'parts_used') @Default([]) List<PartUsedDto> partsUsed,
    @Default([]) List<String> images,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name: 'createdBy') UserDto? createdBy,
    @JsonKey(name: 'assignedTo') UserDto? assignedTo,
    @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
    CustomerDto? customer,
    @JsonKey(name: 'location_details') LocationDto? locationDetails,
    @JsonKey(name: 'work_logs') @Default([]) List<WorkLogDto> workLogs,
    @JsonKey(name: 'required_skills') @Default([]) List<String> requiredSkills,
    @JsonKey(name: 'required_parts') @Default([]) List<PartDto> requiredParts,
    @Default([]) List<String> attachments,
    @JsonKey(name: 'completion_notes') String? completionNotes,
  }) = _WorkOrderDto;

  factory WorkOrderDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDtoFromJson(json);
}

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String role,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

@freezed
class PartUsedDto with _$PartUsedDto {
  const factory PartUsedDto({
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'quantity_used') required int quantityUsed,
    @JsonKey(name: 'part_name') String? partName,
    String? description,
  }) = _PartUsedDto;

  factory PartUsedDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedDtoFromJson(json);
}

// Extension for mapping to domain entity
extension WorkOrderDtoX on WorkOrderDto {
  WorkOrderEntity toEntity() {
    return WorkOrderEntity(
      id: id,
      woNumber: woNumber,
      srId: srId,
      summary: summary,
      problemDescription: problemDescription,
      priority: _mapPriority(priority),
      visitDate: DateTime.parse(visitDate),
      location: location,
      status: _mapStatus(status),
      duration: duration,
      createdAt: createdAt,
      updatedAt:updatedAt,
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      resumedAt: resumedAt != null ? DateTime.parse(resumedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
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
  
  WorkOrderStatus _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return WorkOrderStatus.created;
      case 'assigned':
        return WorkOrderStatus.assigned;
      case 'in progress':
        return WorkOrderStatus.inProgress;
      case 'paused':
        return WorkOrderStatus.paused;
      case 'completed':
        return WorkOrderStatus.completed;
      case 'rejected':
        return WorkOrderStatus.rejected;
      case 'reassigned':
        return WorkOrderStatus.reAssigned;
      default:
        return WorkOrderStatus.assigned;
    }
  }
  
  WorkOrderPriority _mapPriority(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return WorkOrderPriority.low;
      case 'medium':
        return WorkOrderPriority.medium;
      case 'high':
        return WorkOrderPriority.high;
      case 'urgent':
        return WorkOrderPriority.urgent;
      default:
        return WorkOrderPriority.medium;
    }
  }
}

extension PartUsedDtoX on PartUsedDto {
  PartUsedEntity toEntity() {
    return PartUsedEntity(
      partNumber: partNumber,
      quantityUsed: quantityUsed,
      partName: partName,
      description: description,
    );
  }
}