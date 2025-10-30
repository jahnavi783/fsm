import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/service_request_entity.dart';

part 'service_request_dto.freezed.dart';
part 'service_request_dto.g.dart';

@freezed
abstract class ServiceRequestDto with _$ServiceRequestDto {
  const factory ServiceRequestDto({
    @JsonKey(name: 'sr_number') required String srNumber,
    @JsonKey(name: 'sr_type') required String srType,
    String? priority,
    @JsonKey(name: 'issue_description') String? issueDescription,
    @JsonKey(name: 'machine_serial') String? machineSerial,
    String? model,
    @JsonKey(name: 'customer_name') String? customerName,
    String? location,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'under_warranty') String? underWarranty,
    @JsonKey(name: 'visit_date') String? visitDate,
  }) = _ServiceRequestDto;

  factory ServiceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestDtoFromJson(json);
}

extension ServiceRequestDtoX on ServiceRequestDto {
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
      visitDate: visitDate != null ? DateTime.parse(visitDate!) : null,
    );
  }
}