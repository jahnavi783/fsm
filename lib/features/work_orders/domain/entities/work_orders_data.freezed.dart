// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrdersData {
  List<WorkOrderEntity> get workOrders;
  List<WorkOrderEntity> get unassignedWorkOrders;
  int get total;
  int get page;
  int get pages;
  int get unassignedCount;

  /// Create a copy of WorkOrdersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrdersDataCopyWith<WorkOrdersData> get copyWith =>
      _$WorkOrdersDataCopyWithImpl<WorkOrdersData>(
          this as WorkOrdersData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrdersData &&
            const DeepCollectionEquality()
                .equals(other.workOrders, workOrders) &&
            const DeepCollectionEquality()
                .equals(other.unassignedWorkOrders, unassignedWorkOrders) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.unassignedCount, unassignedCount) ||
                other.unassignedCount == unassignedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(workOrders),
      const DeepCollectionEquality().hash(unassignedWorkOrders),
      total,
      page,
      pages,
      unassignedCount);

  @override
  String toString() {
    return 'WorkOrdersData(workOrders: $workOrders, unassignedWorkOrders: $unassignedWorkOrders, total: $total, page: $page, pages: $pages, unassignedCount: $unassignedCount)';
  }
}

/// @nodoc
abstract mixin class $WorkOrdersDataCopyWith<$Res> {
  factory $WorkOrdersDataCopyWith(
          WorkOrdersData value, $Res Function(WorkOrdersData) _then) =
      _$WorkOrdersDataCopyWithImpl;
  @useResult
  $Res call(
      {List<WorkOrderEntity> workOrders,
      List<WorkOrderEntity> unassignedWorkOrders,
      int total,
      int page,
      int pages,
      int unassignedCount});
}

/// @nodoc
class _$WorkOrdersDataCopyWithImpl<$Res>
    implements $WorkOrdersDataCopyWith<$Res> {
  _$WorkOrdersDataCopyWithImpl(this._self, this._then);

  final WorkOrdersData _self;
  final $Res Function(WorkOrdersData) _then;

  /// Create a copy of WorkOrdersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrders = null,
    Object? unassignedWorkOrders = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? unassignedCount = null,
  }) {
    return _then(_self.copyWith(
      workOrders: null == workOrders
          ? _self.workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      unassignedWorkOrders: null == unassignedWorkOrders
          ? _self.unassignedWorkOrders
          : unassignedWorkOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
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
      unassignedCount: null == unassignedCount
          ? _self.unassignedCount
          : unassignedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkOrdersData].
extension WorkOrdersDataPatterns on WorkOrdersData {
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
    TResult Function(_WorkOrdersData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData() when $default != null:
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
    TResult Function(_WorkOrdersData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData():
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
    TResult? Function(_WorkOrdersData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData() when $default != null:
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
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int total,
            int page,
            int pages,
            int unassignedCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData() when $default != null:
        return $default(_that.workOrders, _that.unassignedWorkOrders,
            _that.total, _that.page, _that.pages, _that.unassignedCount);
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
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int total,
            int page,
            int pages,
            int unassignedCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData():
        return $default(_that.workOrders, _that.unassignedWorkOrders,
            _that.total, _that.page, _that.pages, _that.unassignedCount);
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
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int total,
            int page,
            int pages,
            int unassignedCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrdersData() when $default != null:
        return $default(_that.workOrders, _that.unassignedWorkOrders,
            _that.total, _that.page, _that.pages, _that.unassignedCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkOrdersData implements WorkOrdersData {
  const _WorkOrdersData(
      {required final List<WorkOrderEntity> workOrders,
      required final List<WorkOrderEntity> unassignedWorkOrders,
      required this.total,
      required this.page,
      required this.pages,
      required this.unassignedCount})
      : _workOrders = workOrders,
        _unassignedWorkOrders = unassignedWorkOrders;

  final List<WorkOrderEntity> _workOrders;
  @override
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  final List<WorkOrderEntity> _unassignedWorkOrders;
  @override
  List<WorkOrderEntity> get unassignedWorkOrders {
    if (_unassignedWorkOrders is EqualUnmodifiableListView)
      return _unassignedWorkOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unassignedWorkOrders);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int pages;
  @override
  final int unassignedCount;

  /// Create a copy of WorkOrdersData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrdersDataCopyWith<_WorkOrdersData> get copyWith =>
      __$WorkOrdersDataCopyWithImpl<_WorkOrdersData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrdersData &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders) &&
            const DeepCollectionEquality()
                .equals(other._unassignedWorkOrders, _unassignedWorkOrders) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.unassignedCount, unassignedCount) ||
                other.unassignedCount == unassignedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workOrders),
      const DeepCollectionEquality().hash(_unassignedWorkOrders),
      total,
      page,
      pages,
      unassignedCount);

  @override
  String toString() {
    return 'WorkOrdersData(workOrders: $workOrders, unassignedWorkOrders: $unassignedWorkOrders, total: $total, page: $page, pages: $pages, unassignedCount: $unassignedCount)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrdersDataCopyWith<$Res>
    implements $WorkOrdersDataCopyWith<$Res> {
  factory _$WorkOrdersDataCopyWith(
          _WorkOrdersData value, $Res Function(_WorkOrdersData) _then) =
      __$WorkOrdersDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<WorkOrderEntity> workOrders,
      List<WorkOrderEntity> unassignedWorkOrders,
      int total,
      int page,
      int pages,
      int unassignedCount});
}

/// @nodoc
class __$WorkOrdersDataCopyWithImpl<$Res>
    implements _$WorkOrdersDataCopyWith<$Res> {
  __$WorkOrdersDataCopyWithImpl(this._self, this._then);

  final _WorkOrdersData _self;
  final $Res Function(_WorkOrdersData) _then;

  /// Create a copy of WorkOrdersData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrders = null,
    Object? unassignedWorkOrders = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? unassignedCount = null,
  }) {
    return _then(_WorkOrdersData(
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      unassignedWorkOrders: null == unassignedWorkOrders
          ? _self._unassignedWorkOrders
          : unassignedWorkOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
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
      unassignedCount: null == unassignedCount
          ? _self.unassignedCount
          : unassignedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
