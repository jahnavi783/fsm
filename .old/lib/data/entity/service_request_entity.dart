import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm_flutter/core/utils.dart';

part 'service_request_entity.freezed.dart';
part 'service_request_entity.g.dart';

@freezed
abstract class ServiceRequestEntity with _$ServiceRequestEntity {
  const ServiceRequestEntity._();
  const factory ServiceRequestEntity({
    @JsonKey(name: 'sr_number') required String srNumber,
    String? priority,
    @JsonKey(name: 'sr_type') required String srType,
    @JsonKey(name: 'issue_description') String? issueDescription,
    @JsonKey(name: 'machine_serial') String? machineSerial,
    String? model,
    @JsonKey(name: 'customer_name') String? customerName,
    String? location,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'under_warranty') String? underWarranty,
    @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
  }) = _ServiceRequestEntity;

  factory ServiceRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestEntityFromJson(json);
}
