// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderResponse {
  @JsonKey(name: 'work_order')
  WorkOrderDto get workOrder;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderResponseCopyWith<WorkOrderResponse> get copyWith =>
      _$WorkOrderResponseCopyWithImpl<WorkOrderResponse>(
          this as WorkOrderResponse, _$identity);

  /// Serializes this WorkOrderResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderResponse &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrder);

  @override
  String toString() {
    return 'WorkOrderResponse(workOrder: $workOrder)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderResponseCopyWith<$Res> {
  factory $WorkOrderResponseCopyWith(
          WorkOrderResponse value, $Res Function(WorkOrderResponse) _then) =
      _$WorkOrderResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'work_order') WorkOrderDto workOrder});

  $WorkOrderDtoCopyWith<$Res> get workOrder;
}

/// @nodoc
class _$WorkOrderResponseCopyWithImpl<$Res>
    implements $WorkOrderResponseCopyWith<$Res> {
  _$WorkOrderResponseCopyWithImpl(this._self, this._then);

  final WorkOrderResponse _self;
  final $Res Function(WorkOrderResponse) _then;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrder = null,
  }) {
    return _then(_self.copyWith(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderDto,
    ));
  }

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderDtoCopyWith<$Res> get workOrder {
    return $WorkOrderDtoCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderResponse].
extension WorkOrderResponsePatterns on WorkOrderResponse {
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
    TResult Function(_WorkOrderResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse() when $default != null:
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
    TResult Function(_WorkOrderResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse():
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
    TResult? Function(_WorkOrderResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'work_order') WorkOrderDto workOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse() when $default != null:
        return $default(_that.workOrder);
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
    TResult Function(@JsonKey(name: 'work_order') WorkOrderDto workOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse():
        return $default(_that.workOrder);
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
    TResult? Function(@JsonKey(name: 'work_order') WorkOrderDto workOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderResponse() when $default != null:
        return $default(_that.workOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderResponse implements WorkOrderResponse {
  const _WorkOrderResponse(
      {@JsonKey(name: 'work_order') required this.workOrder});
  factory _WorkOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderResponseFromJson(json);

  @override
  @JsonKey(name: 'work_order')
  final WorkOrderDto workOrder;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderResponseCopyWith<_WorkOrderResponse> get copyWith =>
      __$WorkOrderResponseCopyWithImpl<_WorkOrderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderResponse &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrder);

  @override
  String toString() {
    return 'WorkOrderResponse(workOrder: $workOrder)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderResponseCopyWith<$Res>
    implements $WorkOrderResponseCopyWith<$Res> {
  factory _$WorkOrderResponseCopyWith(
          _WorkOrderResponse value, $Res Function(_WorkOrderResponse) _then) =
      __$WorkOrderResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'work_order') WorkOrderDto workOrder});

  @override
  $WorkOrderDtoCopyWith<$Res> get workOrder;
}

/// @nodoc
class __$WorkOrderResponseCopyWithImpl<$Res>
    implements _$WorkOrderResponseCopyWith<$Res> {
  __$WorkOrderResponseCopyWithImpl(this._self, this._then);

  final _WorkOrderResponse _self;
  final $Res Function(_WorkOrderResponse) _then;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrder = null,
  }) {
    return _then(_WorkOrderResponse(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderDto,
    ));
  }

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderDtoCopyWith<$Res> get workOrder {
    return $WorkOrderDtoCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }
}

// dart format on
