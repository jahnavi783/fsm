// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_grouped_images_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderGroupedImagesResponseDto {
  @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
  int get workOrderId;
  @JsonKey(name: 'grouped_images')
  Map<String, List<WorkOrderImageCaptureDto>> get groupedImages;

  /// Create a copy of WorkOrderGroupedImagesResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderGroupedImagesResponseDtoCopyWith<WorkOrderGroupedImagesResponseDto>
      get copyWith => _$WorkOrderGroupedImagesResponseDtoCopyWithImpl<
              WorkOrderGroupedImagesResponseDto>(
          this as WorkOrderGroupedImagesResponseDto, _$identity);

  /// Serializes this WorkOrderGroupedImagesResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderGroupedImagesResponseDto &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            const DeepCollectionEquality()
                .equals(other.groupedImages, groupedImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrderId,
      const DeepCollectionEquality().hash(groupedImages));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesResponseDto(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderGroupedImagesResponseDtoCopyWith<$Res> {
  factory $WorkOrderGroupedImagesResponseDtoCopyWith(
          WorkOrderGroupedImagesResponseDto value,
          $Res Function(WorkOrderGroupedImagesResponseDto) _then) =
      _$WorkOrderGroupedImagesResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
      int workOrderId,
      @JsonKey(name: 'grouped_images')
      Map<String, List<WorkOrderImageCaptureDto>> groupedImages});
}

/// @nodoc
class _$WorkOrderGroupedImagesResponseDtoCopyWithImpl<$Res>
    implements $WorkOrderGroupedImagesResponseDtoCopyWith<$Res> {
  _$WorkOrderGroupedImagesResponseDtoCopyWithImpl(this._self, this._then);

  final WorkOrderGroupedImagesResponseDto _self;
  final $Res Function(WorkOrderGroupedImagesResponseDto) _then;

  /// Create a copy of WorkOrderGroupedImagesResponseDto
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
              as Map<String, List<WorkOrderImageCaptureDto>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkOrderGroupedImagesResponseDto].
extension WorkOrderGroupedImagesResponseDtoPatterns
    on WorkOrderGroupedImagesResponseDto {
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
    TResult Function(_WorkOrderGroupedImagesResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
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
    TResult Function(_WorkOrderGroupedImagesResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto():
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
    TResult? Function(_WorkOrderGroupedImagesResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
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
            @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
            int workOrderId,
            @JsonKey(name: 'grouped_images')
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
            int workOrderId,
            @JsonKey(name: 'grouped_images')
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto():
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
    TResult? Function(
            @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
            int workOrderId,
            @JsonKey(name: 'grouped_images')
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
        return $default(_that.workOrderId, _that.groupedImages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderGroupedImagesResponseDto
    implements WorkOrderGroupedImagesResponseDto {
  const _WorkOrderGroupedImagesResponseDto(
      {@JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
      required this.workOrderId,
      @JsonKey(name: 'grouped_images')
      required final Map<String, List<WorkOrderImageCaptureDto>> groupedImages})
      : _groupedImages = groupedImages;
  factory _WorkOrderGroupedImagesResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$WorkOrderGroupedImagesResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
  final int workOrderId;
  final Map<String, List<WorkOrderImageCaptureDto>> _groupedImages;
  @override
  @JsonKey(name: 'grouped_images')
  Map<String, List<WorkOrderImageCaptureDto>> get groupedImages {
    if (_groupedImages is EqualUnmodifiableMapView) return _groupedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groupedImages);
  }

  /// Create a copy of WorkOrderGroupedImagesResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderGroupedImagesResponseDtoCopyWith<
          _WorkOrderGroupedImagesResponseDto>
      get copyWith => __$WorkOrderGroupedImagesResponseDtoCopyWithImpl<
          _WorkOrderGroupedImagesResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderGroupedImagesResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderGroupedImagesResponseDto &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            const DeepCollectionEquality()
                .equals(other._groupedImages, _groupedImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrderId,
      const DeepCollectionEquality().hash(_groupedImages));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesResponseDto(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderGroupedImagesResponseDtoCopyWith<$Res>
    implements $WorkOrderGroupedImagesResponseDtoCopyWith<$Res> {
  factory _$WorkOrderGroupedImagesResponseDtoCopyWith(
          _WorkOrderGroupedImagesResponseDto value,
          $Res Function(_WorkOrderGroupedImagesResponseDto) _then) =
      __$WorkOrderGroupedImagesResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
      int workOrderId,
      @JsonKey(name: 'grouped_images')
      Map<String, List<WorkOrderImageCaptureDto>> groupedImages});
}

/// @nodoc
class __$WorkOrderGroupedImagesResponseDtoCopyWithImpl<$Res>
    implements _$WorkOrderGroupedImagesResponseDtoCopyWith<$Res> {
  __$WorkOrderGroupedImagesResponseDtoCopyWithImpl(this._self, this._then);

  final _WorkOrderGroupedImagesResponseDto _self;
  final $Res Function(_WorkOrderGroupedImagesResponseDto) _then;

  /// Create a copy of WorkOrderGroupedImagesResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? groupedImages = null,
  }) {
    return _then(_WorkOrderGroupedImagesResponseDto(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      groupedImages: null == groupedImages
          ? _self._groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WorkOrderImageCaptureDto>>,
    ));
  }
}

// dart format on
