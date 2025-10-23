// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartWorkOrderRequest {
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  String? get notes;

  /// Create a copy of StartWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StartWorkOrderRequestCopyWith<StartWorkOrderRequest> get copyWith =>
      _$StartWorkOrderRequestCopyWithImpl<StartWorkOrderRequest>(
          this as StartWorkOrderRequest, _$identity);

  /// Serializes this StartWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StartWorkOrderRequest &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gpsCoordinates, notes);

  @override
  String toString() {
    return 'StartWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $StartWorkOrderRequestCopyWith<$Res> {
  factory $StartWorkOrderRequestCopyWith(StartWorkOrderRequest value,
          $Res Function(StartWorkOrderRequest) _then) =
      _$StartWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class _$StartWorkOrderRequestCopyWithImpl<$Res>
    implements $StartWorkOrderRequestCopyWith<$Res> {
  _$StartWorkOrderRequestCopyWithImpl(this._self, this._then);

  final StartWorkOrderRequest _self;
  final $Res Function(StartWorkOrderRequest) _then;

  /// Create a copy of StartWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StartWorkOrderRequest].
extension StartWorkOrderRequestPatterns on StartWorkOrderRequest {
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
    TResult Function(_StartWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest() when $default != null:
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
    TResult Function(_StartWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest():
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
    TResult? Function(_StartWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest() when $default != null:
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
    TResult Function(@JsonKey(name: 'gps_coordinates') String gpsCoordinates,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest() when $default != null:
        return $default(_that.gpsCoordinates, _that.notes);
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
    TResult Function(@JsonKey(name: 'gps_coordinates') String gpsCoordinates,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest():
        return $default(_that.gpsCoordinates, _that.notes);
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
    TResult? Function(@JsonKey(name: 'gps_coordinates') String gpsCoordinates,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartWorkOrderRequest() when $default != null:
        return $default(_that.gpsCoordinates, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StartWorkOrderRequest implements StartWorkOrderRequest {
  const _StartWorkOrderRequest(
      {@JsonKey(name: 'gps_coordinates') required this.gpsCoordinates,
      this.notes});
  factory _StartWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$StartWorkOrderRequestFromJson(json);

  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;
  @override
  final String? notes;

  /// Create a copy of StartWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartWorkOrderRequestCopyWith<_StartWorkOrderRequest> get copyWith =>
      __$StartWorkOrderRequestCopyWithImpl<_StartWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StartWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartWorkOrderRequest &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gpsCoordinates, notes);

  @override
  String toString() {
    return 'StartWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StartWorkOrderRequestCopyWith<$Res>
    implements $StartWorkOrderRequestCopyWith<$Res> {
  factory _$StartWorkOrderRequestCopyWith(_StartWorkOrderRequest value,
          $Res Function(_StartWorkOrderRequest) _then) =
      __$StartWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class __$StartWorkOrderRequestCopyWithImpl<$Res>
    implements _$StartWorkOrderRequestCopyWith<$Res> {
  __$StartWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _StartWorkOrderRequest _self;
  final $Res Function(_StartWorkOrderRequest) _then;

  /// Create a copy of StartWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_StartWorkOrderRequest(
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
