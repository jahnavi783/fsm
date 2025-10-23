// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestDto {
  @JsonKey(name: 'sr_number')
  String get srNumber;
  @JsonKey(name: 'sr_type')
  String get srType;
  String? get priority;
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
  @JsonKey(name: 'visit_date')
  String? get visitDate;

  /// Create a copy of ServiceRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<ServiceRequestDto> get copyWith =>
      _$ServiceRequestDtoCopyWithImpl<ServiceRequestDto>(
          this as ServiceRequestDto, _$identity);

  /// Serializes this ServiceRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceRequestDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ServiceRequestDto(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class $ServiceRequestDtoCopyWith<$Res> {
  factory $ServiceRequestDtoCopyWith(
          ServiceRequestDto value, $Res Function(ServiceRequestDto) _then) =
      _$ServiceRequestDtoCopyWithImpl;
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
class _$ServiceRequestDtoCopyWithImpl<$Res>
    implements $ServiceRequestDtoCopyWith<$Res> {
  _$ServiceRequestDtoCopyWithImpl(this._self, this._then);

  final ServiceRequestDto _self;
  final $Res Function(ServiceRequestDto) _then;

  /// Create a copy of ServiceRequestDto
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceRequestDto].
extension ServiceRequestDtoPatterns on ServiceRequestDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ServiceRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ServiceRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ServiceRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'sr_number') String srNumber,
            @JsonKey(name: 'sr_type') String srType,
            String? priority,
            @JsonKey(name: 'issue_description') String? issueDescription,
            @JsonKey(name: 'machine_serial') String? machineSerial,
            String? model,
            @JsonKey(name: 'customer_name') String? customerName,
            String? location,
            @JsonKey(name: 'postal_code') String? postalCode,
            @JsonKey(name: 'under_warranty') String? underWarranty,
            @JsonKey(name: 'visit_date') String? visitDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto() when $default != null:
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'sr_number') String srNumber,
            @JsonKey(name: 'sr_type') String srType,
            String? priority,
            @JsonKey(name: 'issue_description') String? issueDescription,
            @JsonKey(name: 'machine_serial') String? machineSerial,
            String? model,
            @JsonKey(name: 'customer_name') String? customerName,
            String? location,
            @JsonKey(name: 'postal_code') String? postalCode,
            @JsonKey(name: 'under_warranty') String? underWarranty,
            @JsonKey(name: 'visit_date') String? visitDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto():
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'sr_number') String srNumber,
            @JsonKey(name: 'sr_type') String srType,
            String? priority,
            @JsonKey(name: 'issue_description') String? issueDescription,
            @JsonKey(name: 'machine_serial') String? machineSerial,
            String? model,
            @JsonKey(name: 'customer_name') String? customerName,
            String? location,
            @JsonKey(name: 'postal_code') String? postalCode,
            @JsonKey(name: 'under_warranty') String? underWarranty,
            @JsonKey(name: 'visit_date') String? visitDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestDto() when $default != null:
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceRequestDto implements ServiceRequestDto {
  const _ServiceRequestDto(
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
  factory _ServiceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestDtoFromJson(json);

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

  /// Create a copy of ServiceRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceRequestDtoCopyWith<_ServiceRequestDto> get copyWith =>
      __$ServiceRequestDtoCopyWithImpl<_ServiceRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ServiceRequestDto(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class _$ServiceRequestDtoCopyWith<$Res>
    implements $ServiceRequestDtoCopyWith<$Res> {
  factory _$ServiceRequestDtoCopyWith(
          _ServiceRequestDto value, $Res Function(_ServiceRequestDto) _then) =
      __$ServiceRequestDtoCopyWithImpl;
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
class __$ServiceRequestDtoCopyWithImpl<$Res>
    implements _$ServiceRequestDtoCopyWith<$Res> {
  __$ServiceRequestDtoCopyWithImpl(this._self, this._then);

  final _ServiceRequestDto _self;
  final $Res Function(_ServiceRequestDto) _then;

  /// Create a copy of ServiceRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ServiceRequestDto(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
    ));
  }
}

// dart format on
