// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_by_sr_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrdersBySRResponse {
  @JsonKey(name: 'service_request')
  ServiceRequestDto get serviceRequest;
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders;

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrdersBySRResponseCopyWith<WorkOrdersBySRResponse> get copyWith =>
      _$WorkOrdersBySRResponseCopyWithImpl<WorkOrdersBySRResponse>(
          this as WorkOrdersBySRResponse, _$identity);

  /// Serializes this WorkOrdersBySRResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrdersBySRResponse &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            const DeepCollectionEquality()
                .equals(other.workOrders, workOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceRequest,
      const DeepCollectionEquality().hash(workOrders));

  @override
  String toString() {
    return 'WorkOrdersBySRResponse(serviceRequest: $serviceRequest, workOrders: $workOrders)';
  }
}

/// @nodoc
abstract mixin class $WorkOrdersBySRResponseCopyWith<$Res> {
  factory $WorkOrdersBySRResponseCopyWith(WorkOrdersBySRResponse value,
          $Res Function(WorkOrdersBySRResponse) _then) =
      _$WorkOrdersBySRResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_request') ServiceRequestDto serviceRequest,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});

  $ServiceRequestDtoCopyWith<$Res> get serviceRequest;
}

/// @nodoc
class _$WorkOrdersBySRResponseCopyWithImpl<$Res>
    implements $WorkOrdersBySRResponseCopyWith<$Res> {
  _$WorkOrdersBySRResponseCopyWithImpl(this._self, this._then);

  final WorkOrdersBySRResponse _self;
  final $Res Function(WorkOrdersBySRResponse) _then;

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRequest = null,
    Object? workOrders = null,
  }) {
    return _then(_self.copyWith(
      serviceRequest: null == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto,
      workOrders: null == workOrders
          ? _self.workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ));
  }

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<$Res> get serviceRequest {
    return $ServiceRequestDtoCopyWith<$Res>(_self.serviceRequest, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrdersBySRResponse].
extension WorkOrdersBySRResponsePatterns on WorkOrdersBySRResponse {
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
    TResult Function(_WorkOrdersBySRResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse() when $default != null:
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
    TResult Function(_WorkOrdersBySRResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse():
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
    TResult? Function(_WorkOrdersBySRResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse() when $default != null:
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
            @JsonKey(name: 'service_request') ServiceRequestDto serviceRequest,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse() when $default != null:
        return $default(_that.serviceRequest, _that.workOrders);
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
            @JsonKey(name: 'service_request') ServiceRequestDto serviceRequest,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse():
        return $default(_that.serviceRequest, _that.workOrders);
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
            @JsonKey(name: 'service_request') ServiceRequestDto serviceRequest,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersBySRResponse() when $default != null:
        return $default(_that.serviceRequest, _that.workOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrdersBySRResponse implements WorkOrdersBySRResponse {
  const _WorkOrdersBySRResponse(
      {@JsonKey(name: 'service_request') required this.serviceRequest,
      @JsonKey(name: 'work_orders')
      required final List<WorkOrderDto> workOrders})
      : _workOrders = workOrders;
  factory _WorkOrdersBySRResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersBySRResponseFromJson(json);

  @override
  @JsonKey(name: 'service_request')
  final ServiceRequestDto serviceRequest;
  final List<WorkOrderDto> _workOrders;
  @override
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrdersBySRResponseCopyWith<_WorkOrdersBySRResponse> get copyWith =>
      __$WorkOrdersBySRResponseCopyWithImpl<_WorkOrdersBySRResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrdersBySRResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrdersBySRResponse &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceRequest,
      const DeepCollectionEquality().hash(_workOrders));

  @override
  String toString() {
    return 'WorkOrdersBySRResponse(serviceRequest: $serviceRequest, workOrders: $workOrders)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrdersBySRResponseCopyWith<$Res>
    implements $WorkOrdersBySRResponseCopyWith<$Res> {
  factory _$WorkOrdersBySRResponseCopyWith(_WorkOrdersBySRResponse value,
          $Res Function(_WorkOrdersBySRResponse) _then) =
      __$WorkOrdersBySRResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_request') ServiceRequestDto serviceRequest,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});

  @override
  $ServiceRequestDtoCopyWith<$Res> get serviceRequest;
}

/// @nodoc
class __$WorkOrdersBySRResponseCopyWithImpl<$Res>
    implements _$WorkOrdersBySRResponseCopyWith<$Res> {
  __$WorkOrdersBySRResponseCopyWithImpl(this._self, this._then);

  final _WorkOrdersBySRResponse _self;
  final $Res Function(_WorkOrdersBySRResponse) _then;

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceRequest = null,
    Object? workOrders = null,
  }) {
    return _then(_WorkOrdersBySRResponse(
      serviceRequest: null == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto,
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ));
  }

  /// Create a copy of WorkOrdersBySRResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<$Res> get serviceRequest {
    return $ServiceRequestDtoCopyWith<$Res>(_self.serviceRequest, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

// dart format on
