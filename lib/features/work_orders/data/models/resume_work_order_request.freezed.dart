// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResumeWorkOrderRequest {
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  String? get notes;

  /// Create a copy of ResumeWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResumeWorkOrderRequestCopyWith<ResumeWorkOrderRequest> get copyWith =>
      _$ResumeWorkOrderRequestCopyWithImpl<ResumeWorkOrderRequest>(
          this as ResumeWorkOrderRequest, _$identity);

  /// Serializes this ResumeWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResumeWorkOrderRequest &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gpsCoordinates, notes);

  @override
  String toString() {
    return 'ResumeWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $ResumeWorkOrderRequestCopyWith<$Res> {
  factory $ResumeWorkOrderRequestCopyWith(ResumeWorkOrderRequest value,
          $Res Function(ResumeWorkOrderRequest) _then) =
      _$ResumeWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class _$ResumeWorkOrderRequestCopyWithImpl<$Res>
    implements $ResumeWorkOrderRequestCopyWith<$Res> {
  _$ResumeWorkOrderRequestCopyWithImpl(this._self, this._then);

  final ResumeWorkOrderRequest _self;
  final $Res Function(ResumeWorkOrderRequest) _then;

  /// Create a copy of ResumeWorkOrderRequest
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

/// Adds pattern-matching-related methods to [ResumeWorkOrderRequest].
extension ResumeWorkOrderRequestPatterns on ResumeWorkOrderRequest {
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
    TResult Function(_ResumeWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResumeWorkOrderRequest() when $default != null:
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
    TResult Function(_ResumeWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResumeWorkOrderRequest():
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
    TResult? Function(_ResumeWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResumeWorkOrderRequest() when $default != null:
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
      case _ResumeWorkOrderRequest() when $default != null:
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
      case _ResumeWorkOrderRequest():
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
      case _ResumeWorkOrderRequest() when $default != null:
        return $default(_that.gpsCoordinates, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ResumeWorkOrderRequest implements ResumeWorkOrderRequest {
  const _ResumeWorkOrderRequest(
      {@JsonKey(name: 'gps_coordinates') required this.gpsCoordinates,
      this.notes});
  factory _ResumeWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$ResumeWorkOrderRequestFromJson(json);

  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;
  @override
  final String? notes;

  /// Create a copy of ResumeWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResumeWorkOrderRequestCopyWith<_ResumeWorkOrderRequest> get copyWith =>
      __$ResumeWorkOrderRequestCopyWithImpl<_ResumeWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResumeWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResumeWorkOrderRequest &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gpsCoordinates, notes);

  @override
  String toString() {
    return 'ResumeWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$ResumeWorkOrderRequestCopyWith<$Res>
    implements $ResumeWorkOrderRequestCopyWith<$Res> {
  factory _$ResumeWorkOrderRequestCopyWith(_ResumeWorkOrderRequest value,
          $Res Function(_ResumeWorkOrderRequest) _then) =
      __$ResumeWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class __$ResumeWorkOrderRequestCopyWithImpl<$Res>
    implements _$ResumeWorkOrderRequestCopyWith<$Res> {
  __$ResumeWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _ResumeWorkOrderRequest _self;
  final $Res Function(_ResumeWorkOrderRequest) _then;

  /// Create a copy of ResumeWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_ResumeWorkOrderRequest(
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
