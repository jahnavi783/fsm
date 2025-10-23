// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_image_capture_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderImageCaptureEntity {
  List<String> get imageUrls;
  double? get latitude;
  double? get longitude;
  CapturedByEntity get capturedBy;
  DateTime get capturedAt;

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderImageCaptureEntityCopyWith<WorkOrderImageCaptureEntity>
      get copyWith => _$WorkOrderImageCaptureEntityCopyWithImpl<
              WorkOrderImageCaptureEntity>(
          this as WorkOrderImageCaptureEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderImageCaptureEntity &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrls),
      latitude,
      longitude,
      capturedBy,
      capturedAt);

  @override
  String toString() {
    return 'WorkOrderImageCaptureEntity(imageUrls: $imageUrls, latitude: $latitude, longitude: $longitude, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderImageCaptureEntityCopyWith<$Res> {
  factory $WorkOrderImageCaptureEntityCopyWith(
          WorkOrderImageCaptureEntity value,
          $Res Function(WorkOrderImageCaptureEntity) _then) =
      _$WorkOrderImageCaptureEntityCopyWithImpl;
  @useResult
  $Res call(
      {List<String> imageUrls,
      double? latitude,
      double? longitude,
      CapturedByEntity capturedBy,
      DateTime capturedAt});

  $CapturedByEntityCopyWith<$Res> get capturedBy;
}

/// @nodoc
class _$WorkOrderImageCaptureEntityCopyWithImpl<$Res>
    implements $WorkOrderImageCaptureEntityCopyWith<$Res> {
  _$WorkOrderImageCaptureEntityCopyWithImpl(this._self, this._then);

  final WorkOrderImageCaptureEntity _self;
  final $Res Function(WorkOrderImageCaptureEntity) _then;

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_self.copyWith(
      imageUrls: null == imageUrls
          ? _self.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByEntity,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByEntityCopyWith<$Res> get capturedBy {
    return $CapturedByEntityCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderImageCaptureEntity].
extension WorkOrderImageCaptureEntityPatterns on WorkOrderImageCaptureEntity {
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
    TResult Function(_WorkOrderImageCaptureEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
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
    TResult Function(_WorkOrderImageCaptureEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity():
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
    TResult? Function(_WorkOrderImageCaptureEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
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
            List<String> imageUrls,
            double? latitude,
            double? longitude,
            CapturedByEntity capturedBy,
            DateTime capturedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
        return $default(_that.imageUrls, _that.latitude, _that.longitude,
            _that.capturedBy, _that.capturedAt);
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
    TResult Function(List<String> imageUrls, double? latitude,
            double? longitude, CapturedByEntity capturedBy, DateTime capturedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity():
        return $default(_that.imageUrls, _that.latitude, _that.longitude,
            _that.capturedBy, _that.capturedAt);
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
            List<String> imageUrls,
            double? latitude,
            double? longitude,
            CapturedByEntity capturedBy,
            DateTime capturedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
        return $default(_that.imageUrls, _that.latitude, _that.longitude,
            _that.capturedBy, _that.capturedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkOrderImageCaptureEntity implements WorkOrderImageCaptureEntity {
  const _WorkOrderImageCaptureEntity(
      {required final List<String> imageUrls,
      this.latitude,
      this.longitude,
      required this.capturedBy,
      required this.capturedAt})
      : _imageUrls = imageUrls;

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final CapturedByEntity capturedBy;
  @override
  final DateTime capturedAt;

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderImageCaptureEntityCopyWith<_WorkOrderImageCaptureEntity>
      get copyWith => __$WorkOrderImageCaptureEntityCopyWithImpl<
          _WorkOrderImageCaptureEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderImageCaptureEntity &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageUrls),
      latitude,
      longitude,
      capturedBy,
      capturedAt);

  @override
  String toString() {
    return 'WorkOrderImageCaptureEntity(imageUrls: $imageUrls, latitude: $latitude, longitude: $longitude, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderImageCaptureEntityCopyWith<$Res>
    implements $WorkOrderImageCaptureEntityCopyWith<$Res> {
  factory _$WorkOrderImageCaptureEntityCopyWith(
          _WorkOrderImageCaptureEntity value,
          $Res Function(_WorkOrderImageCaptureEntity) _then) =
      __$WorkOrderImageCaptureEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> imageUrls,
      double? latitude,
      double? longitude,
      CapturedByEntity capturedBy,
      DateTime capturedAt});

  @override
  $CapturedByEntityCopyWith<$Res> get capturedBy;
}

/// @nodoc
class __$WorkOrderImageCaptureEntityCopyWithImpl<$Res>
    implements _$WorkOrderImageCaptureEntityCopyWith<$Res> {
  __$WorkOrderImageCaptureEntityCopyWithImpl(this._self, this._then);

  final _WorkOrderImageCaptureEntity _self;
  final $Res Function(_WorkOrderImageCaptureEntity) _then;

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrls = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_WorkOrderImageCaptureEntity(
      imageUrls: null == imageUrls
          ? _self._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByEntity,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByEntityCopyWith<$Res> get capturedBy {
    return $CapturedByEntityCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

// dart format on
