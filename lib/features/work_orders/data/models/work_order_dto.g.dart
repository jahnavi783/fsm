// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderDto _$WorkOrderDtoFromJson(Map<String, dynamic> json) =>
    _WorkOrderDto(
      id: (json['id'] as num).toInt(),
      woNumber: json['wo_number'] as String,
      srId: (json['sr_id'] as num).toInt(),
      summary: json['summary'] as String? ?? '',
      problemDescription: json['problem_description'] as String? ?? '',
      priority: json['priority'] as String,
      visitDate: json['visit_date'] as String,
      location: json['location'] as String? ?? '',
      status: json['status'] as String,
      durationDays: (json['duration_days'] as num?)?.toInt() ?? 0,
      createdBy: (json['created_by'] as num?)?.toInt(),
      assignedTo: (json['assigned_to'] as num?)?.toInt(),
      startedAt: json['started_at'] as String?,
      resumedAt: json['resumed_at'] as String?,
      completedAt: json['completed_at'] as String?,
      pauseLogs: json['pause_logs'] as String?,
      rejectionLogs: json['rejection_logs'] as String?,
      workLog: json['work_log'] as String?,
      partsUsed: (json['parts_used'] as List<dynamic>?)
          ?.map((e) => PartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      createdByUser: json['createdBy'] == null
          ? null
          : UserDto.fromJson(json['createdBy'] as Map<String, dynamic>),
      assignedToUser: json['assignedTo'] == null
          ? null
          : UserDto.fromJson(json['assignedTo'] as Map<String, dynamic>),
      serviceRequest: json['serviceRequest'] == null
          ? null
          : ServiceRequestDto.fromJson(
              json['serviceRequest'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : CustomerDto.fromJson(json['customer'] as Map<String, dynamic>),
      locationDetails: json['location_details'] == null
          ? null
          : LocationDto.fromJson(
              json['location_details'] as Map<String, dynamic>),
      workLogs: (json['workLogs'] as List<dynamic>?)
              ?.map((e) => WorkLogDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      requiredSkills: (json['requiredSkills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      requiredParts: (json['requiredParts'] as List<dynamic>?)
              ?.map((e) => PartDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      completionNotes: json['completionNotes'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkOrderDtoToJson(_WorkOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wo_number': instance.woNumber,
      'sr_id': instance.srId,
      'summary': instance.summary,
      'problem_description': instance.problemDescription,
      'priority': instance.priority,
      'visit_date': instance.visitDate,
      'location': instance.location,
      'status': instance.status,
      'duration_days': instance.durationDays,
      'created_by': instance.createdBy,
      'assigned_to': instance.assignedTo,
      'started_at': instance.startedAt,
      'resumed_at': instance.resumedAt,
      'completed_at': instance.completedAt,
      'pause_logs': instance.pauseLogs,
      'rejection_logs': instance.rejectionLogs,
      'work_log': instance.workLog,
      'parts_used': instance.partsUsed,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdByUser,
      'assignedTo': instance.assignedToUser,
      'serviceRequest': instance.serviceRequest,
      'customer': instance.customer,
      'location_details': instance.locationDetails,
      'workLogs': instance.workLogs,
      'requiredSkills': instance.requiredSkills,
      'requiredParts': instance.requiredParts,
      'attachments': instance.attachments,
      'completionNotes': instance.completionNotes,
      'images': instance.images,
    };

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
    };
