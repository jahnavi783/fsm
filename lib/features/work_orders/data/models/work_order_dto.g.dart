// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderDtoImpl _$$WorkOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$WorkOrderDtoImpl(
      id: (json['id'] as num).toInt(),
      woNumber: json['wo_number'] as String,
      srId: (json['sr_id'] as num).toInt(),
      summary: json['summary'] as String? ?? '',
      problemDescription: json['problem_description'] as String? ?? '',
      priority: json['priority'] as String,
      visitDate: json['visit_date'] as String,
      location: json['location'] as String? ?? '',
      status: json['status'] as String,
      duration: (json['duration'] as num?)?.toInt() ?? 30,
      startedAt: json['started_at'] as String?,
      resumedAt: json['resumed_at'] as String?,
      completedAt: json['completed_at'] as String?,
      pauseLogs: json['pause_logs'] as String?,
      workLog: json['work_log'] as String?,
      partsUsed: (json['parts_used'] as List<dynamic>?)
              ?.map((e) => PartUsedDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      createdBy: json['created_by'] == null
          ? null
          : UserDto.fromJson(json['created_by'] as Map<String, dynamic>),
      assignedTo: json['assigned_to'] == null
          ? null
          : UserDto.fromJson(json['assigned_to'] as Map<String, dynamic>),
      serviceRequest: json['service_request'] == null
          ? null
          : ServiceRequestDto.fromJson(
              json['service_request'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : CustomerDto.fromJson(json['customer'] as Map<String, dynamic>),
      locationDetails: json['location_details'] == null
          ? null
          : LocationDto.fromJson(
              json['location_details'] as Map<String, dynamic>),
      workLogs: (json['work_logs'] as List<dynamic>?)
              ?.map((e) => WorkLogDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      requiredSkills: (json['required_skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      requiredParts: (json['required_parts'] as List<dynamic>?)
              ?.map((e) => PartDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      completionNotes: json['completion_notes'] as String?,
    );

Map<String, dynamic> _$$WorkOrderDtoImplToJson(_$WorkOrderDtoImpl instance) =>
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
      'duration': instance.duration,
      'started_at': instance.startedAt,
      'resumed_at': instance.resumedAt,
      'completed_at': instance.completedAt,
      'pause_logs': instance.pauseLogs,
      'work_log': instance.workLog,
      'parts_used': instance.partsUsed,
      'images': instance.images,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'assigned_to': instance.assignedTo,
      'service_request': instance.serviceRequest,
      'customer': instance.customer,
      'location_details': instance.locationDetails,
      'work_logs': instance.workLogs,
      'required_skills': instance.requiredSkills,
      'required_parts': instance.requiredParts,
      'attachments': instance.attachments,
      'completion_notes': instance.completionNotes,
    };

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': instance.role,
    };

_$PartUsedDtoImpl _$$PartUsedDtoImplFromJson(Map<String, dynamic> json) =>
    _$PartUsedDtoImpl(
      partNumber: json['part_number'] as String,
      quantityUsed: (json['quantity_used'] as num).toInt(),
      partName: json['part_name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PartUsedDtoImplToJson(_$PartUsedDtoImpl instance) =>
    <String, dynamic>{
      'part_number': instance.partNumber,
      'quantity_used': instance.quantityUsed,
      'part_name': instance.partName,
      'description': instance.description,
    };
