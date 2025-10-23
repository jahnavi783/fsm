// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pause_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PauseWorkOrderRequest {
  String get reason;
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;

  /// Create a copy of PauseWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PauseWorkOrderRequestCopyWith<PauseWorkOrderRequest> get copyWith =>
      _$PauseWorkOrderRequestCopyWithImpl<PauseWorkOrderRequest>(
          this as PauseWorkOrderRequest, _$identity);

  /// Serializes this PauseWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PauseWorkOrderRequest &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, gpsCoordinates);

  @override
  String toString() {
    return 'PauseWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }
}

/// @nodoc
abstract mixin class $PauseWorkOrderRequestCopyWith<$Res> {
  factory $PauseWorkOrderRequestCopyWith(PauseWorkOrderRequest value,
          $Res Function(PauseWorkOrderRequest) _then) =
      _$PauseWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class _$PauseWorkOrderRequestCopyWithImpl<$Res>
    implements $PauseWorkOrderRequestCopyWith<$Res> {
  _$PauseWorkOrderRequestCopyWithImpl(this._self, this._then);

  final PauseWorkOrderRequest _self;
  final $Res Function(PauseWorkOrderRequest) _then;

  /// Create a copy of PauseWorkOrderRequest
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

/// Adds pattern-matching-related methods to [PauseWorkOrderRequest].
extension PauseWorkOrderRequestPatterns on PauseWorkOrderRequest {
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
    TResult Function(_PauseWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauseWorkOrderRequest() when $default != null:
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
    TResult Function(_PauseWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseWorkOrderRequest():
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
    TResult? Function(_PauseWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseWorkOrderRequest() when $default != null:
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
      case _PauseWorkOrderRequest() when $default != null:
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
      case _PauseWorkOrderRequest():
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
      case _PauseWorkOrderRequest() when $default != null:
        return $default(_that.reason, _that.gpsCoordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PauseWorkOrderRequest implements PauseWorkOrderRequest {
  const _PauseWorkOrderRequest(
      {required this.reason,
      @JsonKey(name: 'gps_coordinates') required this.gpsCoordinates});
  factory _PauseWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PauseWorkOrderRequestFromJson(json);

  @override
  final String reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;

  /// Create a copy of PauseWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauseWorkOrderRequestCopyWith<_PauseWorkOrderRequest> get copyWith =>
      __$PauseWorkOrderRequestCopyWithImpl<_PauseWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PauseWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauseWorkOrderRequest &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, gpsCoordinates);

  @override
  String toString() {
    return 'PauseWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }
}

/// @nodoc
abstract mixin class _$PauseWorkOrderRequestCopyWith<$Res>
    implements $PauseWorkOrderRequestCopyWith<$Res> {
  factory _$PauseWorkOrderRequestCopyWith(_PauseWorkOrderRequest value,
          $Res Function(_PauseWorkOrderRequest) _then) =
      __$PauseWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class __$PauseWorkOrderRequestCopyWithImpl<$Res>
    implements _$PauseWorkOrderRequestCopyWith<$Res> {
  __$PauseWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _PauseWorkOrderRequest _self;
  final $Res Function(_PauseWorkOrderRequest) _then;

  /// Create a copy of PauseWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_PauseWorkOrderRequest(
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
