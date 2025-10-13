// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) {
  return _CustomerDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDtoCopyWith<CustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDtoCopyWith<$Res> {
  factory $CustomerDtoCopyWith(
          CustomerDto value, $Res Function(CustomerDto) then) =
      _$CustomerDtoCopyWithImpl<$Res, CustomerDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? phone,
      String? address,
      String? city,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      String? country});
}

/// @nodoc
class _$CustomerDtoCopyWithImpl<$Res, $Val extends CustomerDto>
    implements $CustomerDtoCopyWith<$Res> {
  _$CustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerDtoImplCopyWith<$Res>
    implements $CustomerDtoCopyWith<$Res> {
  factory _$$CustomerDtoImplCopyWith(
          _$CustomerDtoImpl value, $Res Function(_$CustomerDtoImpl) then) =
      __$$CustomerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? phone,
      String? address,
      String? city,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      String? country});
}

/// @nodoc
class __$$CustomerDtoImplCopyWithImpl<$Res>
    extends _$CustomerDtoCopyWithImpl<$Res, _$CustomerDtoImpl>
    implements _$$CustomerDtoImplCopyWith<$Res> {
  __$$CustomerDtoImplCopyWithImpl(
      _$CustomerDtoImpl _value, $Res Function(_$CustomerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$CustomerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDtoImpl implements _CustomerDto {
  const _$CustomerDtoImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.phone,
      this.address,
      this.city,
      this.state,
      @JsonKey(name: 'postal_code') this.postalCode,
      this.country});

  factory _$CustomerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'CustomerDto(id: $id, name: $name, email: $email, phone: $phone, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, address,
      city, state, postalCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDtoImplCopyWith<_$CustomerDtoImpl> get copyWith =>
      __$$CustomerDtoImplCopyWithImpl<_$CustomerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerDto implements CustomerDto {
  const factory _CustomerDto(
      {required final int id,
      required final String name,
      required final String email,
      final String? phone,
      final String? address,
      final String? city,
      final String? state,
      @JsonKey(name: 'postal_code') final String? postalCode,
      final String? country}) = _$CustomerDtoImpl;

  factory _CustomerDto.fromJson(Map<String, dynamic> json) =
      _$CustomerDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$CustomerDtoImplCopyWith<_$CustomerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
