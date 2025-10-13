// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRequestDtoImpl _$$ServiceRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRequestDtoImpl(
      srNumber: json['sr_number'] as String,
      srType: json['sr_type'] as String,
      priority: json['priority'] as String?,
      issueDescription: json['issue_description'] as String?,
      machineSerial: json['machine_serial'] as String?,
      model: json['model'] as String?,
      customerName: json['customer_name'] as String?,
      location: json['location'] as String?,
      postalCode: json['postal_code'] as String?,
      underWarranty: json['under_warranty'] as String?,
      visitDate: json['visit_date'] as String?,
    );

Map<String, dynamic> _$$ServiceRequestDtoImplToJson(
        _$ServiceRequestDtoImpl instance) =>
    <String, dynamic>{
      'sr_number': instance.srNumber,
      'sr_type': instance.srType,
      'priority': instance.priority,
      'issue_description': instance.issueDescription,
      'machine_serial': instance.machineSerial,
      'model': instance.model,
      'customer_name': instance.customerName,
      'location': instance.location,
      'postal_code': instance.postalCode,
      'under_warranty': instance.underWarranty,
      'visit_date': instance.visitDate,
    };
