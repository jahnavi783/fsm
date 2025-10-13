// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestEntity {
  @JsonKey(name: 'sr_number')
  String get srNumber;
  String? get priority;
  @JsonKey(name: 'sr_type')
  String get srType;
  @JsonKey(name: 'issue_description')
  String? get issueDescription;
  @JsonKey(name: 'machine_serial')
  String? get machineSerial;
  String? get model;
  @JsonKey(name: 'customer_name')
  String? get customerName;
  String? get location;
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @JsonKey(name: 'under_warranty')
  String? get underWarranty;
  @DateTimeConverter()
  @JsonKey(name: 'visit_date')
  DateTime? get visitDate;

  /// Create a copy of ServiceRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceRequestEntityCopyWith<ServiceRequestEntity> get copyWith =>
      _$ServiceRequestEntityCopyWithImpl<ServiceRequestEntity>(
          this as ServiceRequestEntity, _$identity);

  /// Serializes this ServiceRequestEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceRequestEntity &&
            (identical(other.srNumber, srNumber) ||
                other.srNumber == srNumber) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.srType, srType) || other.srType == srType) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      srNumber,
      priority,
      srType,
      issueDescription,
      machineSerial,
      model,
      customerName,
      location,
      postalCode,
      underWarranty,
      visitDate);

  @override
  String toString() {
    return 'ServiceRequestEntity(srNumber: $srNumber, priority: $priority, srType: $srType, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class $ServiceRequestEntityCopyWith<$Res> {
  factory $ServiceRequestEntityCopyWith(ServiceRequestEntity value,
          $Res Function(ServiceRequestEntity) _then) =
      _$ServiceRequestEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'sr_number') String srNumber,
      String? priority,
      @JsonKey(name: 'sr_type') String srType,
      @JsonKey(name: 'issue_description') String? issueDescription,
      @JsonKey(name: 'machine_serial') String? machineSerial,
      String? model,
      @JsonKey(name: 'customer_name') String? customerName,
      String? location,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'under_warranty') String? underWarranty,
      @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate});
}

/// @nodoc
class _$ServiceRequestEntityCopyWithImpl<$Res>
    implements $ServiceRequestEntityCopyWith<$Res> {
  _$ServiceRequestEntityCopyWithImpl(this._self, this._then);

  final ServiceRequestEntity _self;
  final $Res Function(ServiceRequestEntity) _then;

  /// Create a copy of ServiceRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNumber = null,
    Object? priority = freezed,
    Object? srType = null,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_self.copyWith(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      issueDescription: freezed == issueDescription
          ? _self.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _self.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _self.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceRequestEntity extends ServiceRequestEntity {
  const _ServiceRequestEntity(
      {@JsonKey(name: 'sr_number') required this.srNumber,
      this.priority,
      @JsonKey(name: 'sr_type') required this.srType,
      @JsonKey(name: 'issue_description') this.issueDescription,
      @JsonKey(name: 'machine_serial') this.machineSerial,
      this.model,
      @JsonKey(name: 'customer_name') this.customerName,
      this.location,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'under_warranty') this.underWarranty,
      @DateTimeConverter() @JsonKey(name: 'visit_date') this.visitDate})
      : super._();
  factory _ServiceRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestEntityFromJson(json);

  @override
  @JsonKey(name: 'sr_number')
  final String srNumber;
  @override
  final String? priority;
  @override
  @JsonKey(name: 'sr_type')
  final String srType;
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
  @DateTimeConverter()
  @JsonKey(name: 'visit_date')
  final DateTime? visitDate;

  /// Create a copy of ServiceRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceRequestEntityCopyWith<_ServiceRequestEntity> get copyWith =>
      __$ServiceRequestEntityCopyWithImpl<_ServiceRequestEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceRequestEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestEntity &&
            (identical(other.srNumber, srNumber) ||
                other.srNumber == srNumber) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.srType, srType) || other.srType == srType) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      srNumber,
      priority,
      srType,
      issueDescription,
      machineSerial,
      model,
      customerName,
      location,
      postalCode,
      underWarranty,
      visitDate);

  @override
  String toString() {
    return 'ServiceRequestEntity(srNumber: $srNumber, priority: $priority, srType: $srType, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class _$ServiceRequestEntityCopyWith<$Res>
    implements $ServiceRequestEntityCopyWith<$Res> {
  factory _$ServiceRequestEntityCopyWith(_ServiceRequestEntity value,
          $Res Function(_ServiceRequestEntity) _then) =
      __$ServiceRequestEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sr_number') String srNumber,
      String? priority,
      @JsonKey(name: 'sr_type') String srType,
      @JsonKey(name: 'issue_description') String? issueDescription,
      @JsonKey(name: 'machine_serial') String? machineSerial,
      String? model,
      @JsonKey(name: 'customer_name') String? customerName,
      String? location,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'under_warranty') String? underWarranty,
      @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate});
}

/// @nodoc
class __$ServiceRequestEntityCopyWithImpl<$Res>
    implements _$ServiceRequestEntityCopyWith<$Res> {
  __$ServiceRequestEntityCopyWithImpl(this._self, this._then);

  final _ServiceRequestEntity _self;
  final $Res Function(_ServiceRequestEntity) _then;

  /// Create a copy of ServiceRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? srNumber = null,
    Object? priority = freezed,
    Object? srType = null,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_ServiceRequestEntity(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      issueDescription: freezed == issueDescription
          ? _self.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _self.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _self.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
