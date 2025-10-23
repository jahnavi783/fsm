// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrdersResponse {
  int get total;
  int get page;
  int get pages;
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders;

  /// Create a copy of WorkOrdersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrdersResponseCopyWith<WorkOrdersResponse> get copyWith =>
      _$WorkOrdersResponseCopyWithImpl<WorkOrdersResponse>(
          this as WorkOrdersResponse, _$identity);

  /// Serializes this WorkOrdersResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrdersResponse &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality()
                .equals(other.workOrders, workOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(workOrders));

  @override
  String toString() {
    return 'WorkOrdersResponse(total: $total, page: $page, pages: $pages, workOrders: $workOrders)';
  }
}

/// @nodoc
abstract mixin class $WorkOrdersResponseCopyWith<$Res> {
  factory $WorkOrdersResponseCopyWith(
          WorkOrdersResponse value, $Res Function(WorkOrdersResponse) _then) =
      _$WorkOrdersResponseCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int page,
      int pages,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});
}

/// @nodoc
class _$WorkOrdersResponseCopyWithImpl<$Res>
    implements $WorkOrdersResponseCopyWith<$Res> {
  _$WorkOrdersResponseCopyWithImpl(this._self, this._then);

  final WorkOrdersResponse _self;
  final $Res Function(WorkOrdersResponse) _then;

  /// Create a copy of WorkOrdersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? workOrders = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      workOrders: null == workOrders
          ? _self.workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkOrdersResponse].
extension WorkOrdersResponsePatterns on WorkOrdersResponse {
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
    TResult Function(_WorkOrdersResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse() when $default != null:
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
    TResult Function(_WorkOrdersResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse():
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
    TResult? Function(_WorkOrdersResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse() when $default != null:
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
    TResult Function(int total, int page, int pages,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse() when $default != null:
        return $default(_that.total, _that.page, _that.pages, _that.workOrders);
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
    TResult Function(int total, int page, int pages,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse():
        return $default(_that.total, _that.page, _that.pages, _that.workOrders);
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
    TResult? Function(int total, int page, int pages,
            @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersResponse() when $default != null:
        return $default(_that.total, _that.page, _that.pages, _that.workOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrdersResponse implements WorkOrdersResponse {
  const _WorkOrdersResponse(
      {required this.total,
      required this.page,
      required this.pages,
      @JsonKey(name: 'work_orders')
      required final List<WorkOrderDto> workOrders})
      : _workOrders = workOrders;
  factory _WorkOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersResponseFromJson(json);

  @override
  final int total;
  @override
  final int page;
  @override
  final int pages;
  final List<WorkOrderDto> _workOrders;
  @override
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  /// Create a copy of WorkOrdersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrdersResponseCopyWith<_WorkOrdersResponse> get copyWith =>
      __$WorkOrdersResponseCopyWithImpl<_WorkOrdersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrdersResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrdersResponse &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_workOrders));

  @override
  String toString() {
    return 'WorkOrdersResponse(total: $total, page: $page, pages: $pages, workOrders: $workOrders)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrdersResponseCopyWith<$Res>
    implements $WorkOrdersResponseCopyWith<$Res> {
  factory _$WorkOrdersResponseCopyWith(
          _WorkOrdersResponse value, $Res Function(_WorkOrdersResponse) _then) =
      __$WorkOrdersResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int page,
      int pages,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});
}

/// @nodoc
class __$WorkOrdersResponseCopyWithImpl<$Res>
    implements _$WorkOrdersResponseCopyWith<$Res> {
  __$WorkOrdersResponseCopyWithImpl(this._self, this._then);

  final _WorkOrdersResponse _self;
  final $Res Function(_WorkOrdersResponse) _then;

  /// Create a copy of WorkOrdersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? workOrders = null,
  }) {
    return _then(_WorkOrdersResponse(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ));
  }
}

// dart format on
