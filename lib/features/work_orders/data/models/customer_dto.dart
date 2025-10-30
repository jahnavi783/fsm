import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';

part 'customer_dto.freezed.dart';
part 'customer_dto.g.dart';

@freezed
abstract class CustomerDto with _$CustomerDto {
  const factory CustomerDto({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? address,
    String? city,
    String? state,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? country,
  }) = _CustomerDto;

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);
}

extension CustomerDtoX on CustomerDto {
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
    );
  }
}