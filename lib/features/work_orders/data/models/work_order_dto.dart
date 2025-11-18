import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/core/converters/json_array_converter.dart';
import 'package:fsm/features/work_orders/data/models/customer_dto.dart';
import 'package:fsm/features/work_orders/data/models/location_dto.dart';
import 'package:fsm/features/work_orders/data/models/part_dto.dart';
import 'package:fsm/features/work_orders/data/models/part_used_dto.dart';
import 'package:fsm/features/work_orders/data/models/service_request_dto.dart';
import 'package:fsm/features/work_orders/data/models/work_log_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_order_dto.freezed.dart';
part 'work_order_dto.g.dart';

double? _toDoubleNullable(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value.trim());
  return null;
}

// Helper functions for parts_used field conversion
List<PartUsedDto>? _partsUsedFromJson(dynamic json) {
  if (json == null) {
    return null;
  }

  // Handle List case (if API sends array directly)
  if (json is List) {
    return json
        .map((e) => PartUsedDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Handle String case (JSON string)
  if (json is String) {
    if (json.isEmpty) {
      return null;
    }

    try {
      final List<dynamic> decoded = jsonDecode(json) as List<dynamic>;
      return decoded
          .map((e) => PartUsedDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  return null;
}

dynamic _partsUsedToJson(List<PartUsedDto>? partsUsed) {
  if (partsUsed == null) {
    return null;
  }

  final List<Map<String, dynamic>> jsonList =
      partsUsed.map((e) => e.toJson()).toList();
  return jsonEncode(jsonList);
}

@freezed
abstract class WorkOrderDto with _$WorkOrderDto {
  const factory WorkOrderDto({
    required int id,
    @JsonKey(name: 'wo_number') required String woNumber,
    @JsonKey(name: 'sr_id') required int srId,
    @Default('') String summary,
    @JsonKey(name: 'problem_description')
    @Default('')
    String problemDescription,
    required String priority,
    @JsonKey(name: 'visit_date') required String visitDate,
    @Default('') String location,
    required String status,
    @JsonKey(name: 'duration_days') @Default(0) int durationDays,
    @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
    double? durationHours,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'assigned_to') int? assignedTo,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'resumed_at') String? resumedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'pause_logs') String? pauseLogs,
    @JsonKey(name: 'rejection_logs') String? rejectionLogs,
    @JsonKey(name: 'work_log') String? workLog,
    @JsonKey(
      name: 'parts_used',
      fromJson: _partsUsedFromJson,
      toJson: _partsUsedToJson,
    )
    List<PartUsedDto>? partsUsed,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'updatedAt') required String updatedAt,
    @JsonKey(name: 'createdBy') UserDto? createdByUser,
    @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
    @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
    // Optional fields that may not be in the API response
    CustomerDto? customer,
    @JsonKey(name: 'location_details') LocationDto? locationDetails,
    @Default([]) List<WorkLogDto> workLogs,
    @Default([]) List<String> requiredSkills,
    @JsonArrayConverter<PartDto>() @Default([]) List<PartDto>? requiredParts,
    @Default([]) List<String> attachments,
    String? completionNotes,
    @Default([]) List<String> images,
  }) = _WorkOrderDto;

  factory WorkOrderDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDtoFromJson(json);
}

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
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
      durationDays: durationDays,
      durationHours: durationHours,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      resumedAt: resumedAt != null ? DateTime.parse(resumedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      pauseLogs: pauseLogs,
      workLog: workLog,
      partsUsed: partsUsed?.map((p) => p.toEntity()).toList() ?? [],
      images: images,
      customer: customer?.toEntity(),
      locationDetails: locationDetails?.toEntity(),
      serviceRequest: serviceRequest?.toEntity(),
      workLogs: workLogs.map((w) => w.toEntity()).toList(),
      requiredSkills: requiredSkills,
      requiredParts: requiredParts?.map((p) => p.toEntity()).toList() ?? [],
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
      case 'in_progress': // Handle both API formats
        return WorkOrderStatus.inProgress;
      case 'paused':
        return WorkOrderStatus.paused;
      case 'completed':
        return WorkOrderStatus.completed;
      case 'rejected':
        return WorkOrderStatus.rejected;
      case 'reassigned':
      case 're_assigned': // Handle both API formats
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
