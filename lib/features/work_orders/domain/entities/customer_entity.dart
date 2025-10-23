import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_entity.freezed.dart';

@freezed
abstract class CustomerEntity with _$CustomerEntity {
  const factory CustomerEntity({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) = _CustomerEntity;
}