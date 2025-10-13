// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestEntity _$ServiceRequestEntityFromJson(
        Map<String, dynamic> json) =>
    _ServiceRequestEntity(
      srNumber: json['sr_number'] as String,
      priority: json['priority'] as String?,
      srType: json['sr_type'] as String,
      issueDescription: json['issue_description'] as String?,
      machineSerial: json['machine_serial'] as String?,
      model: json['model'] as String?,
      customerName: json['customer_name'] as String?,
      location: json['location'] as String?,
      postalCode: json['postal_code'] as String?,
      underWarranty: json['under_warranty'] as String?,
      visitDate: _$JsonConverterFromJson<String, DateTime>(
          json['visit_date'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$ServiceRequestEntityToJson(
        _ServiceRequestEntity instance) =>
    <String, dynamic>{
      'sr_number': instance.srNumber,
      'priority': instance.priority,
      'sr_type': instance.srType,
      'issue_description': instance.issueDescription,
      'machine_serial': instance.machineSerial,
      'model': instance.model,
      'customer_name': instance.customerName,
      'location': instance.location,
      'postal_code': instance.postalCode,
      'under_warranty': instance.underWarranty,
      'visit_date': _$JsonConverterToJson<String, DateTime>(
          instance.visitDate, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
