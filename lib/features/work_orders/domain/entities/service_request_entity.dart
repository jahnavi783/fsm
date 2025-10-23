import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_request_entity.freezed.dart';

@freezed
abstract class ServiceRequestEntity with _$ServiceRequestEntity {
  const ServiceRequestEntity._();
  
  const factory ServiceRequestEntity({
    required String srNumber,
    required String srType,
    String? priority,
    String? issueDescription,
    String? machineSerial,
    String? model,
    String? customerName,
    String? location,
    String? postalCode,
    String? underWarranty,
    DateTime? visitDate,
  }) = _ServiceRequestEntity;
}