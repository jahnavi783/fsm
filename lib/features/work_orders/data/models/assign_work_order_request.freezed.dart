// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assign_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignWorkOrderRequest {
  @JsonKey(name: 'assigned_to')
  int get assignedTo;

  /// Create a copy of AssignWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssignWorkOrderRequestCopyWith<AssignWorkOrderRequest> get copyWith =>
      _$AssignWorkOrderRequestCopyWithImpl<AssignWorkOrderRequest>(
          this as AssignWorkOrderRequest, _$identity);

  /// Serializes this AssignWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssignWorkOrderRequest &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assignedTo);

  @override
  String toString() {
    return 'AssignWorkOrderRequest(assignedTo: $assignedTo)';
  }
}

/// @nodoc
abstract mixin class $AssignWorkOrderRequestCopyWith<$Res> {
  factory $AssignWorkOrderRequestCopyWith(AssignWorkOrderRequest value,
          $Res Function(AssignWorkOrderRequest) _then) =
      _$AssignWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'assigned_to') int assignedTo});
}

/// @nodoc
class _$AssignWorkOrderRequestCopyWithImpl<$Res>
    implements $AssignWorkOrderRequestCopyWith<$Res> {
  _$AssignWorkOrderRequestCopyWithImpl(this._self, this._then);

  final AssignWorkOrderRequest _self;
  final $Res Function(AssignWorkOrderRequest) _then;

  /// Create a copy of AssignWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedTo = null,
  }) {
    return _then(_self.copyWith(
      assignedTo: null == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssignWorkOrderRequest].
extension AssignWorkOrderRequestPatterns on AssignWorkOrderRequest {
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
    TResult Function(_AssignWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest() when $default != null:
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
    TResult Function(_AssignWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest():
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
    TResult? Function(_AssignWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest() when $default != null:
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
    TResult Function(@JsonKey(name: 'assigned_to') int assignedTo)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest() when $default != null:
        return $default(_that.assignedTo);
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
    TResult Function(@JsonKey(name: 'assigned_to') int assignedTo) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest():
        return $default(_that.assignedTo);
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
    TResult? Function(@JsonKey(name: 'assigned_to') int assignedTo)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignWorkOrderRequest() when $default != null:
        return $default(_that.assignedTo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssignWorkOrderRequest implements AssignWorkOrderRequest {
  const _AssignWorkOrderRequest(
      {@JsonKey(name: 'assigned_to') required this.assignedTo});
  factory _AssignWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$AssignWorkOrderRequestFromJson(json);

  @override
  @JsonKey(name: 'assigned_to')
  final int assignedTo;

  /// Create a copy of AssignWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssignWorkOrderRequestCopyWith<_AssignWorkOrderRequest> get copyWith =>
      __$AssignWorkOrderRequestCopyWithImpl<_AssignWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssignWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignWorkOrderRequest &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assignedTo);

  @override
  String toString() {
    return 'AssignWorkOrderRequest(assignedTo: $assignedTo)';
  }
}

/// @nodoc
abstract mixin class _$AssignWorkOrderRequestCopyWith<$Res>
    implements $AssignWorkOrderRequestCopyWith<$Res> {
  factory _$AssignWorkOrderRequestCopyWith(_AssignWorkOrderRequest value,
          $Res Function(_AssignWorkOrderRequest) _then) =
      __$AssignWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'assigned_to') int assignedTo});
}

/// @nodoc
class __$AssignWorkOrderRequestCopyWithImpl<$Res>
    implements _$AssignWorkOrderRequestCopyWith<$Res> {
  __$AssignWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _AssignWorkOrderRequest _self;
  final $Res Function(_AssignWorkOrderRequest) _then;

  /// Create a copy of AssignWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? assignedTo = null,
  }) {
    return _then(_AssignWorkOrderRequest(
      assignedTo: null == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
