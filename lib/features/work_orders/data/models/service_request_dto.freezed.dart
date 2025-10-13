// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceRequestDto _$ServiceRequestDtoFromJson(Map<String, dynamic> json) {
  return _ServiceRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestDto {
  @JsonKey(name: 'sr_number')
  String get srNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'sr_type')
  String get srType => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_description')
  String? get issueDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_serial')
  String? get machineSerial => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'under_warranty')
  String? get underWarranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  String? get visitDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestDtoCopyWith<ServiceRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestDtoCopyWith<$Res> {
  factory $ServiceRequestDtoCopyWith(
          ServiceRequestDto value, $Res Function(ServiceRequestDto) then) =
      _$ServiceRequestDtoCopyWithImpl<$Res, ServiceRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sr_number') String srNumber,
      @JsonKey(name: 'sr_type') String srType,
      String? priority,
      @JsonKey(name: 'issue_description') String? issueDescription,
      @JsonKey(name: 'machine_serial') String? machineSerial,
      String? model,
      @JsonKey(name: 'customer_name') String? customerName,
      String? location,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'under_warranty') String? underWarranty,
      @JsonKey(name: 'visit_date') String? visitDate});
}

/// @nodoc
class _$ServiceRequestDtoCopyWithImpl<$Res, $Val extends ServiceRequestDto>
    implements $ServiceRequestDtoCopyWith<$Res> {
  _$ServiceRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNumber = null,
    Object? srType = null,
    Object? priority = freezed,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_value.copyWith(
      srNumber: null == srNumber
          ? _value.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _value.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _value.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _value.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRequestDtoImplCopyWith<$Res>
    implements $ServiceRequestDtoCopyWith<$Res> {
  factory _$$ServiceRequestDtoImplCopyWith(_$ServiceRequestDtoImpl value,
          $Res Function(_$ServiceRequestDtoImpl) then) =
      __$$ServiceRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sr_number') String srNumber,
      @JsonKey(name: 'sr_type') String srType,
      String? priority,
      @JsonKey(name: 'issue_description') String? issueDescription,
      @JsonKey(name: 'machine_serial') String? machineSerial,
      String? model,
      @JsonKey(name: 'customer_name') String? customerName,
      String? location,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'under_warranty') String? underWarranty,
      @JsonKey(name: 'visit_date') String? visitDate});
}

/// @nodoc
class __$$ServiceRequestDtoImplCopyWithImpl<$Res>
    extends _$ServiceRequestDtoCopyWithImpl<$Res, _$ServiceRequestDtoImpl>
    implements _$$ServiceRequestDtoImplCopyWith<$Res> {
  __$$ServiceRequestDtoImplCopyWithImpl(_$ServiceRequestDtoImpl _value,
      $Res Function(_$ServiceRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNumber = null,
    Object? srType = null,
    Object? priority = freezed,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_$ServiceRequestDtoImpl(
      srNumber: null == srNumber
          ? _value.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _value.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _value.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _value.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequestDtoImpl implements _ServiceRequestDto {
  const _$ServiceRequestDtoImpl(
      {@JsonKey(name: 'sr_number') required this.srNumber,
      @JsonKey(name: 'sr_type') required this.srType,
      this.priority,
      @JsonKey(name: 'issue_description') this.issueDescription,
      @JsonKey(name: 'machine_serial') this.machineSerial,
      this.model,
      @JsonKey(name: 'customer_name') this.customerName,
      this.location,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'under_warranty') this.underWarranty,
      @JsonKey(name: 'visit_date') this.visitDate});

  factory _$ServiceRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'sr_number')
  final String srNumber;
  @override
  @JsonKey(name: 'sr_type')
  final String srType;
  @override
  final String? priority;
  @override
  @JsonKey(name: 'issue_description')
  final String? issueDescription;
  @override
  @JsonKey(name: 'machine_serial')
  final String? machineSerial;
  @override
  final String? model;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  final String? location;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'under_warranty')
  final String? underWarranty;
  @override
  @JsonKey(name: 'visit_date')
  final String? visitDate;

  @override
  String toString() {
    return 'ServiceRequestDto(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequestDtoImpl &&
            (identical(other.srNumber, srNumber) ||
                other.srNumber == srNumber) &&
            (identical(other.srType, srType) || other.srType == srType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.issueDescription, issueDescription) ||
                other.issueDescription == issueDescription) &&
            (identical(other.machineSerial, machineSerial) ||
                other.machineSerial == machineSerial) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.underWarranty, underWarranty) ||
                other.underWarranty == underWarranty) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      srNumber,
      srType,
      priority,
      issueDescription,
      machineSerial,
      model,
      customerName,
      location,
      postalCode,
      underWarranty,
      visitDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequestDtoImplCopyWith<_$ServiceRequestDtoImpl> get copyWith =>
      __$$ServiceRequestDtoImplCopyWithImpl<_$ServiceRequestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceRequestDto implements ServiceRequestDto {
  const factory _ServiceRequestDto(
          {@JsonKey(name: 'sr_number') required final String srNumber,
          @JsonKey(name: 'sr_type') required final String srType,
          final String? priority,
          @JsonKey(name: 'issue_description') final String? issueDescription,
          @JsonKey(name: 'machine_serial') final String? machineSerial,
          final String? model,
          @JsonKey(name: 'customer_name') final String? customerName,
          final String? location,
          @JsonKey(name: 'postal_code') final String? postalCode,
          @JsonKey(name: 'under_warranty') final String? underWarranty,
          @JsonKey(name: 'visit_date') final String? visitDate}) =
      _$ServiceRequestDtoImpl;

  factory _ServiceRequestDto.fromJson(Map<String, dynamic> json) =
      _$ServiceRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'sr_number')
  String get srNumber;
  @override
  @JsonKey(name: 'sr_type')
  String get srType;
  @override
  String? get priority;
  @override
  @JsonKey(name: 'issue_description')
  String? get issueDescription;
  @override
  @JsonKey(name: 'machine_serial')
  String? get machineSerial;
  @override
  String? get model;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  String? get location;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'under_warranty')
  String? get underWarranty;
  @override
  @JsonKey(name: 'visit_date')
  String? get visitDate;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRequestDtoImplCopyWith<_$ServiceRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
