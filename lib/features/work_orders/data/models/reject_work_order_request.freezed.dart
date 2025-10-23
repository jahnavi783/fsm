// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectWorkOrderRequest {
  String get reason;
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;

  /// Create a copy of RejectWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RejectWorkOrderRequestCopyWith<RejectWorkOrderRequest> get copyWith =>
      _$RejectWorkOrderRequestCopyWithImpl<RejectWorkOrderRequest>(
          this as RejectWorkOrderRequest, _$identity);

  /// Serializes this RejectWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RejectWorkOrderRequest &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, gpsCoordinates);

  @override
  String toString() {
    return 'RejectWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }
}

/// @nodoc
abstract mixin class $RejectWorkOrderRequestCopyWith<$Res> {
  factory $RejectWorkOrderRequestCopyWith(RejectWorkOrderRequest value,
          $Res Function(RejectWorkOrderRequest) _then) =
      _$RejectWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class _$RejectWorkOrderRequestCopyWithImpl<$Res>
    implements $RejectWorkOrderRequestCopyWith<$Res> {
  _$RejectWorkOrderRequestCopyWithImpl(this._self, this._then);

  final RejectWorkOrderRequest _self;
  final $Res Function(RejectWorkOrderRequest) _then;

  /// Create a copy of RejectWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_self.copyWith(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RejectWorkOrderRequest].
extension RejectWorkOrderRequestPatterns on RejectWorkOrderRequest {
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
    TResult Function(_RejectWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest() when $default != null:
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
    TResult Function(_RejectWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest():
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
    TResult? Function(_RejectWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest() when $default != null:
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
    TResult Function(String reason,
            @JsonKey(name: 'gps_coordinates') String gpsCoordinates)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest() when $default != null:
        return $default(_that.reason, _that.gpsCoordinates);
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
    TResult Function(String reason,
            @JsonKey(name: 'gps_coordinates') String gpsCoordinates)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest():
        return $default(_that.reason, _that.gpsCoordinates);
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
    TResult? Function(String reason,
            @JsonKey(name: 'gps_coordinates') String gpsCoordinates)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RejectWorkOrderRequest() when $default != null:
        return $default(_that.reason, _that.gpsCoordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RejectWorkOrderRequest implements RejectWorkOrderRequest {
  const _RejectWorkOrderRequest(
      {required this.reason,
      @JsonKey(name: 'gps_coordinates') required this.gpsCoordinates});
  factory _RejectWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectWorkOrderRequestFromJson(json);

  @override
  final String reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;

  /// Create a copy of RejectWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RejectWorkOrderRequestCopyWith<_RejectWorkOrderRequest> get copyWith =>
      __$RejectWorkOrderRequestCopyWithImpl<_RejectWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RejectWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RejectWorkOrderRequest &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, gpsCoordinates);

  @override
  String toString() {
    return 'RejectWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }
}

/// @nodoc
abstract mixin class _$RejectWorkOrderRequestCopyWith<$Res>
    implements $RejectWorkOrderRequestCopyWith<$Res> {
  factory _$RejectWorkOrderRequestCopyWith(_RejectWorkOrderRequest value,
          $Res Function(_RejectWorkOrderRequest) _then) =
      __$RejectWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class __$RejectWorkOrderRequestCopyWithImpl<$Res>
    implements _$RejectWorkOrderRequestCopyWith<$Res> {
  __$RejectWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _RejectWorkOrderRequest _self;
  final $Res Function(_RejectWorkOrderRequest) _then;

  /// Create a copy of RejectWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_RejectWorkOrderRequest(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
