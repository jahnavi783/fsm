// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_grouped_images_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderGroupedImagesEntity {
  int get workOrderId;
  Map<String, List<WorkOrderImageCaptureEntity>> get groupedImages;

  /// Create a copy of WorkOrderGroupedImagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderGroupedImagesEntityCopyWith<WorkOrderGroupedImagesEntity>
      get copyWith => _$WorkOrderGroupedImagesEntityCopyWithImpl<
              WorkOrderGroupedImagesEntity>(
          this as WorkOrderGroupedImagesEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderGroupedImagesEntity &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            const DeepCollectionEquality()
                .equals(other.groupedImages, groupedImages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId,
      const DeepCollectionEquality().hash(groupedImages));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesEntity(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderGroupedImagesEntityCopyWith<$Res> {
  factory $WorkOrderGroupedImagesEntityCopyWith(
          WorkOrderGroupedImagesEntity value,
          $Res Function(WorkOrderGroupedImagesEntity) _then) =
      _$WorkOrderGroupedImagesEntityCopyWithImpl;
  @useResult
  $Res call(
      {int workOrderId,
      Map<String, List<WorkOrderImageCaptureEntity>> groupedImages});
}

/// @nodoc
class _$WorkOrderGroupedImagesEntityCopyWithImpl<$Res>
    implements $WorkOrderGroupedImagesEntityCopyWith<$Res> {
  _$WorkOrderGroupedImagesEntityCopyWithImpl(this._self, this._then);

  final WorkOrderGroupedImagesEntity _self;
  final $Res Function(WorkOrderGroupedImagesEntity) _then;

  /// Create a copy of WorkOrderGroupedImagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? groupedImages = null,
  }) {
    return _then(_self.copyWith(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      groupedImages: null == groupedImages
          ? _self.groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WorkOrderImageCaptureEntity>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkOrderGroupedImagesEntity].
extension WorkOrderGroupedImagesEntityPatterns on WorkOrderGroupedImagesEntity {
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
    TResult Function(_WorkOrderGroupedImagesEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity() when $default != null:
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
    TResult Function(_WorkOrderGroupedImagesEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity():
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
    TResult? Function(_WorkOrderGroupedImagesEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity() when $default != null:
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
    TResult Function(int workOrderId,
            Map<String, List<WorkOrderImageCaptureEntity>> groupedImages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity() when $default != null:
        return $default(_that.workOrderId, _that.groupedImages);
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
    TResult Function(int workOrderId,
            Map<String, List<WorkOrderImageCaptureEntity>> groupedImages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity():
        return $default(_that.workOrderId, _that.groupedImages);
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
    TResult? Function(int workOrderId,
            Map<String, List<WorkOrderImageCaptureEntity>> groupedImages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesEntity() when $default != null:
        return $default(_that.workOrderId, _that.groupedImages);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkOrderGroupedImagesEntity extends WorkOrderGroupedImagesEntity {
  const _WorkOrderGroupedImagesEntity(
      {required this.workOrderId,
      required final Map<String, List<WorkOrderImageCaptureEntity>>
          groupedImages})
      : _groupedImages = groupedImages,
        super._();

  @override
  final int workOrderId;
  final Map<String, List<WorkOrderImageCaptureEntity>> _groupedImages;
  @override
  Map<String, List<WorkOrderImageCaptureEntity>> get groupedImages {
    if (_groupedImages is EqualUnmodifiableMapView) return _groupedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groupedImages);
  }

  /// Create a copy of WorkOrderGroupedImagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderGroupedImagesEntityCopyWith<_WorkOrderGroupedImagesEntity>
      get copyWith => __$WorkOrderGroupedImagesEntityCopyWithImpl<
          _WorkOrderGroupedImagesEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderGroupedImagesEntity &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            const DeepCollectionEquality()
                .equals(other._groupedImages, _groupedImages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId,
      const DeepCollectionEquality().hash(_groupedImages));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesEntity(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderGroupedImagesEntityCopyWith<$Res>
    implements $WorkOrderGroupedImagesEntityCopyWith<$Res> {
  factory _$WorkOrderGroupedImagesEntityCopyWith(
          _WorkOrderGroupedImagesEntity value,
          $Res Function(_WorkOrderGroupedImagesEntity) _then) =
      __$WorkOrderGroupedImagesEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int workOrderId,
      Map<String, List<WorkOrderImageCaptureEntity>> groupedImages});
}

/// @nodoc
class __$WorkOrderGroupedImagesEntityCopyWithImpl<$Res>
    implements _$WorkOrderGroupedImagesEntityCopyWith<$Res> {
  __$WorkOrderGroupedImagesEntityCopyWithImpl(this._self, this._then);

  final _WorkOrderGroupedImagesEntity _self;
  final $Res Function(_WorkOrderGroupedImagesEntity) _then;

  /// Create a copy of WorkOrderGroupedImagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? groupedImages = null,
  }) {
    return _then(_WorkOrderGroupedImagesEntity(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      groupedImages: null == groupedImages
          ? _self._groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WorkOrderImageCaptureEntity>>,
    ));
  }
}

// dart format on
