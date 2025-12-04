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
  int? get id;
  String? get timestamp;
  List<String> get imageUrls;
  double? get latitude;
  double? get longitude;
  CapturedByEntity? get capturedBy;
  DateTime? get capturedAt;
  String? get reason;
  String? get comments;
  String? get remarks;

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      const DeepCollectionEquality().hash(imageUrls),
      latitude,
      longitude,
      capturedBy,
      capturedAt,
      reason,
      comments,
      remarks);

  @override
  String toString() {
    return 'WorkOrderImageCaptureEntity(id: $id, timestamp: $timestamp, imageUrls: $imageUrls, latitude: $latitude, longitude: $longitude, capturedBy: $capturedBy, capturedAt: $capturedAt, reason: $reason, comments: $comments, remarks: $remarks)';
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
      {int? id,
      String? timestamp,
      List<String> imageUrls,
      double? latitude,
      double? longitude,
      CapturedByEntity? capturedBy,
      DateTime? capturedAt,
      String? reason,
      String? comments,
      String? remarks});

  $CapturedByEntityCopyWith<$Res>? get capturedBy;
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
    Object? id = freezed,
    Object? timestamp = freezed,
    Object? imageUrls = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capturedBy = freezed,
    Object? capturedAt = freezed,
    Object? reason = freezed,
    Object? comments = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
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
      capturedBy: freezed == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByEntity?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByEntityCopyWith<$Res>? get capturedBy {
    if (_self.capturedBy == null) {
      return null;
    }

    return $CapturedByEntityCopyWith<$Res>(_self.capturedBy!, (value) {
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
            int? id,
            String? timestamp,
            List<String> imageUrls,
            double? latitude,
            double? longitude,
            CapturedByEntity? capturedBy,
            DateTime? capturedAt,
            String? reason,
            String? comments,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
        return $default(
            _that.id,
            _that.timestamp,
            _that.imageUrls,
            _that.latitude,
            _that.longitude,
            _that.capturedBy,
            _that.capturedAt,
            _that.reason,
            _that.comments,
            _that.remarks);
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
            int? id,
            String? timestamp,
            List<String> imageUrls,
            double? latitude,
            double? longitude,
            CapturedByEntity? capturedBy,
            DateTime? capturedAt,
            String? reason,
            String? comments,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity():
        return $default(
            _that.id,
            _that.timestamp,
            _that.imageUrls,
            _that.latitude,
            _that.longitude,
            _that.capturedBy,
            _that.capturedAt,
            _that.reason,
            _that.comments,
            _that.remarks);
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
            int? id,
            String? timestamp,
            List<String> imageUrls,
            double? latitude,
            double? longitude,
            CapturedByEntity? capturedBy,
            DateTime? capturedAt,
            String? reason,
            String? comments,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureEntity() when $default != null:
        return $default(
            _that.id,
            _that.timestamp,
            _that.imageUrls,
            _that.latitude,
            _that.longitude,
            _that.capturedBy,
            _that.capturedAt,
            _that.reason,
            _that.comments,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkOrderImageCaptureEntity implements WorkOrderImageCaptureEntity {
  const _WorkOrderImageCaptureEntity(
      {this.id,
      this.timestamp,
      final List<String> imageUrls = const [],
      this.latitude,
      this.longitude,
      this.capturedBy,
      this.capturedAt,
      this.reason,
      this.comments,
      this.remarks})
      : _imageUrls = imageUrls;

  @override
  final int? id;
  @override
  final String? timestamp;
  final List<String> _imageUrls;
  @override
  @JsonKey()
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
  final CapturedByEntity? capturedBy;
  @override
  final DateTime? capturedAt;
  @override
  final String? reason;
  @override
  final String? comments;
  @override
  final String? remarks;

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      const DeepCollectionEquality().hash(_imageUrls),
      latitude,
      longitude,
      capturedBy,
      capturedAt,
      reason,
      comments,
      remarks);

  @override
  String toString() {
    return 'WorkOrderImageCaptureEntity(id: $id, timestamp: $timestamp, imageUrls: $imageUrls, latitude: $latitude, longitude: $longitude, capturedBy: $capturedBy, capturedAt: $capturedAt, reason: $reason, comments: $comments, remarks: $remarks)';
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
      {int? id,
      String? timestamp,
      List<String> imageUrls,
      double? latitude,
      double? longitude,
      CapturedByEntity? capturedBy,
      DateTime? capturedAt,
      String? reason,
      String? comments,
      String? remarks});

  @override
  $CapturedByEntityCopyWith<$Res>? get capturedBy;
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
    Object? id = freezed,
    Object? timestamp = freezed,
    Object? imageUrls = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capturedBy = freezed,
    Object? capturedAt = freezed,
    Object? reason = freezed,
    Object? comments = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_WorkOrderImageCaptureEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
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
      capturedBy: freezed == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByEntity?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByEntityCopyWith<$Res>? get capturedBy {
    if (_self.capturedBy == null) {
      return null;
    }

    return $CapturedByEntityCopyWith<$Res>(_self.capturedBy!, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

// dart format on
