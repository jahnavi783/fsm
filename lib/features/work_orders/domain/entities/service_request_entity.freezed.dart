// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  String get srNumber;
  String get srType;
  String? get priority;
  String? get issueDescription;
  String? get machineSerial;
  String? get model;
  String? get customerName;
  String? get location;
  String? get postalCode;
  String? get underWarranty;
  DateTime? get visitDate;

  /// Create a copy of ServiceRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceRequestEntityCopyWith<ServiceRequestEntity> get copyWith =>
      _$ServiceRequestEntityCopyWithImpl<ServiceRequestEntity>(
          this as ServiceRequestEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceRequestEntity &&
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
    return 'ServiceRequestEntity(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class $ServiceRequestEntityCopyWith<$Res> {
  factory $ServiceRequestEntityCopyWith(ServiceRequestEntity value,
          $Res Function(ServiceRequestEntity) _then) =
      _$ServiceRequestEntityCopyWithImpl;
  @useResult
  $Res call(
      {String srNumber,
      String srType,
      String? priority,
      String? issueDescription,
      String? machineSerial,
      String? model,
      String? customerName,
      String? location,
      String? postalCode,
      String? underWarranty,
      DateTime? visitDate});
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
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceRequestEntity].
extension ServiceRequestEntityPatterns on ServiceRequestEntity {
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
    TResult Function(_ServiceRequestEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity() when $default != null:
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
    TResult Function(_ServiceRequestEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity():
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
    TResult? Function(_ServiceRequestEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity() when $default != null:
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
            String srNumber,
            String srType,
            String? priority,
            String? issueDescription,
            String? machineSerial,
            String? model,
            String? customerName,
            String? location,
            String? postalCode,
            String? underWarranty,
            DateTime? visitDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity() when $default != null:
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
            String srNumber,
            String srType,
            String? priority,
            String? issueDescription,
            String? machineSerial,
            String? model,
            String? customerName,
            String? location,
            String? postalCode,
            String? underWarranty,
            DateTime? visitDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity():
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
            String srNumber,
            String srType,
            String? priority,
            String? issueDescription,
            String? machineSerial,
            String? model,
            String? customerName,
            String? location,
            String? postalCode,
            String? underWarranty,
            DateTime? visitDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestEntity() when $default != null:
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

class _ServiceRequestEntity extends ServiceRequestEntity {
  const _ServiceRequestEntity(
      {required this.srNumber,
      required this.srType,
      this.priority,
      this.issueDescription,
      this.machineSerial,
      this.model,
      this.customerName,
      this.location,
      this.postalCode,
      this.underWarranty,
      this.visitDate})
      : super._();

  @override
  final String srNumber;
  @override
  final String srType;
  @override
  final String? priority;
  @override
  final String? issueDescription;
  @override
  final String? machineSerial;
  @override
  final String? model;
  @override
  final String? customerName;
  @override
  final String? location;
  @override
  final String? postalCode;
  @override
  final String? underWarranty;
  @override
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestEntity &&
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
    return 'ServiceRequestEntity(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
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
      {String srNumber,
      String srType,
      String? priority,
      String? issueDescription,
      String? machineSerial,
      String? model,
      String? customerName,
      String? location,
      String? postalCode,
      String? underWarranty,
      DateTime? visitDate});
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
    return _then(_ServiceRequestEntity(
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
              as DateTime?,
    ));
  }
}

// dart format on
