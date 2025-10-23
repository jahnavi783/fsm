// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_image_capture_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GpsCoordinatesDto {
  String get type;
  @JsonKey(fromJson: _coordinatesFromJson)
  List<double> get coordinates;

  /// Create a copy of GpsCoordinatesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GpsCoordinatesDtoCopyWith<GpsCoordinatesDto> get copyWith =>
      _$GpsCoordinatesDtoCopyWithImpl<GpsCoordinatesDto>(
          this as GpsCoordinatesDto, _$identity);

  /// Serializes this GpsCoordinatesDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GpsCoordinatesDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(coordinates));

  @override
  String toString() {
    return 'GpsCoordinatesDto(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class $GpsCoordinatesDtoCopyWith<$Res> {
  factory $GpsCoordinatesDtoCopyWith(
          GpsCoordinatesDto value, $Res Function(GpsCoordinatesDto) _then) =
      _$GpsCoordinatesDtoCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      @JsonKey(fromJson: _coordinatesFromJson) List<double> coordinates});
}

/// @nodoc
class _$GpsCoordinatesDtoCopyWithImpl<$Res>
    implements $GpsCoordinatesDtoCopyWith<$Res> {
  _$GpsCoordinatesDtoCopyWithImpl(this._self, this._then);

  final GpsCoordinatesDto _self;
  final $Res Function(GpsCoordinatesDto) _then;

  /// Create a copy of GpsCoordinatesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GpsCoordinatesDto].
extension GpsCoordinatesDtoPatterns on GpsCoordinatesDto {
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
    TResult Function(_GpsCoordinatesDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto() when $default != null:
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
    TResult Function(_GpsCoordinatesDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto():
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
    TResult? Function(_GpsCoordinatesDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto() when $default != null:
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
    TResult Function(String type,
            @JsonKey(fromJson: _coordinatesFromJson) List<double> coordinates)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto() when $default != null:
        return $default(_that.type, _that.coordinates);
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
    TResult Function(String type,
            @JsonKey(fromJson: _coordinatesFromJson) List<double> coordinates)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto():
        return $default(_that.type, _that.coordinates);
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
    TResult? Function(String type,
            @JsonKey(fromJson: _coordinatesFromJson) List<double> coordinates)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinatesDto() when $default != null:
        return $default(_that.type, _that.coordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GpsCoordinatesDto implements GpsCoordinatesDto {
  const _GpsCoordinatesDto(
      {required this.type,
      @JsonKey(fromJson: _coordinatesFromJson)
      required final List<double> coordinates})
      : _coordinates = coordinates;
  factory _GpsCoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$GpsCoordinatesDtoFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  @JsonKey(fromJson: _coordinatesFromJson)
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of GpsCoordinatesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GpsCoordinatesDtoCopyWith<_GpsCoordinatesDto> get copyWith =>
      __$GpsCoordinatesDtoCopyWithImpl<_GpsCoordinatesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GpsCoordinatesDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GpsCoordinatesDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @override
  String toString() {
    return 'GpsCoordinatesDto(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$GpsCoordinatesDtoCopyWith<$Res>
    implements $GpsCoordinatesDtoCopyWith<$Res> {
  factory _$GpsCoordinatesDtoCopyWith(
          _GpsCoordinatesDto value, $Res Function(_GpsCoordinatesDto) _then) =
      __$GpsCoordinatesDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(fromJson: _coordinatesFromJson) List<double> coordinates});
}

/// @nodoc
class __$GpsCoordinatesDtoCopyWithImpl<$Res>
    implements _$GpsCoordinatesDtoCopyWith<$Res> {
  __$GpsCoordinatesDtoCopyWithImpl(this._self, this._then);

  final _GpsCoordinatesDto _self;
  final $Res Function(_GpsCoordinatesDto) _then;

  /// Create a copy of GpsCoordinatesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_GpsCoordinatesDto(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
mixin _$WorkOrderImageCaptureDto {
  @JsonKey(name: 'image_urls')
  List<String>? get imageUrls;
  @JsonKey(name: 'gps_coordinates')
  GpsCoordinatesDto? get gpsCoordinates;
  @JsonKey(name: 'captured_by')
  CapturedByDto get capturedBy;
  @JsonKey(name: 'captured_at')
  String get capturedAt;

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderImageCaptureDtoCopyWith<WorkOrderImageCaptureDto> get copyWith =>
      _$WorkOrderImageCaptureDtoCopyWithImpl<WorkOrderImageCaptureDto>(
          this as WorkOrderImageCaptureDto, _$identity);

  /// Serializes this WorkOrderImageCaptureDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderImageCaptureDto &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrls),
      gpsCoordinates,
      capturedBy,
      capturedAt);

  @override
  String toString() {
    return 'WorkOrderImageCaptureDto(imageUrls: $imageUrls, gpsCoordinates: $gpsCoordinates, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderImageCaptureDtoCopyWith<$Res> {
  factory $WorkOrderImageCaptureDtoCopyWith(WorkOrderImageCaptureDto value,
          $Res Function(WorkOrderImageCaptureDto) _then) =
      _$WorkOrderImageCaptureDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'image_urls') List<String>? imageUrls,
      @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
      @JsonKey(name: 'captured_by') CapturedByDto capturedBy,
      @JsonKey(name: 'captured_at') String capturedAt});

  $GpsCoordinatesDtoCopyWith<$Res>? get gpsCoordinates;
  $CapturedByDtoCopyWith<$Res> get capturedBy;
}

/// @nodoc
class _$WorkOrderImageCaptureDtoCopyWithImpl<$Res>
    implements $WorkOrderImageCaptureDtoCopyWith<$Res> {
  _$WorkOrderImageCaptureDtoCopyWithImpl(this._self, this._then);

  final WorkOrderImageCaptureDto _self;
  final $Res Function(WorkOrderImageCaptureDto) _then;

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = freezed,
    Object? gpsCoordinates = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_self.copyWith(
      imageUrls: freezed == imageUrls
          ? _self.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gpsCoordinates: freezed == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as GpsCoordinatesDto?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByDto,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GpsCoordinatesDtoCopyWith<$Res>? get gpsCoordinates {
    if (_self.gpsCoordinates == null) {
      return null;
    }

    return $GpsCoordinatesDtoCopyWith<$Res>(_self.gpsCoordinates!, (value) {
      return _then(_self.copyWith(gpsCoordinates: value));
    });
  }

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByDtoCopyWith<$Res> get capturedBy {
    return $CapturedByDtoCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderImageCaptureDto].
extension WorkOrderImageCaptureDtoPatterns on WorkOrderImageCaptureDto {
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
    TResult Function(_WorkOrderImageCaptureDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto() when $default != null:
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
    TResult Function(_WorkOrderImageCaptureDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto():
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
    TResult? Function(_WorkOrderImageCaptureDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto() when $default != null:
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
            @JsonKey(name: 'image_urls') List<String>? imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedByDto capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto() when $default != null:
        return $default(_that.imageUrls, _that.gpsCoordinates, _that.capturedBy,
            _that.capturedAt);
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
            @JsonKey(name: 'image_urls') List<String>? imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedByDto capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto():
        return $default(_that.imageUrls, _that.gpsCoordinates, _that.capturedBy,
            _that.capturedAt);
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
            @JsonKey(name: 'image_urls') List<String>? imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedByDto capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderImageCaptureDto() when $default != null:
        return $default(_that.imageUrls, _that.gpsCoordinates, _that.capturedBy,
            _that.capturedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderImageCaptureDto implements WorkOrderImageCaptureDto {
  const _WorkOrderImageCaptureDto(
      {@JsonKey(name: 'image_urls') final List<String>? imageUrls,
      @JsonKey(name: 'gps_coordinates') this.gpsCoordinates,
      @JsonKey(name: 'captured_by') required this.capturedBy,
      @JsonKey(name: 'captured_at') required this.capturedAt})
      : _imageUrls = imageUrls;
  factory _WorkOrderImageCaptureDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderImageCaptureDtoFromJson(json);

  final List<String>? _imageUrls;
  @override
  @JsonKey(name: 'image_urls')
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'gps_coordinates')
  final GpsCoordinatesDto? gpsCoordinates;
  @override
  @JsonKey(name: 'captured_by')
  final CapturedByDto capturedBy;
  @override
  @JsonKey(name: 'captured_at')
  final String capturedAt;

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderImageCaptureDtoCopyWith<_WorkOrderImageCaptureDto> get copyWith =>
      __$WorkOrderImageCaptureDtoCopyWithImpl<_WorkOrderImageCaptureDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderImageCaptureDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderImageCaptureDto &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageUrls),
      gpsCoordinates,
      capturedBy,
      capturedAt);

  @override
  String toString() {
    return 'WorkOrderImageCaptureDto(imageUrls: $imageUrls, gpsCoordinates: $gpsCoordinates, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderImageCaptureDtoCopyWith<$Res>
    implements $WorkOrderImageCaptureDtoCopyWith<$Res> {
  factory _$WorkOrderImageCaptureDtoCopyWith(_WorkOrderImageCaptureDto value,
          $Res Function(_WorkOrderImageCaptureDto) _then) =
      __$WorkOrderImageCaptureDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image_urls') List<String>? imageUrls,
      @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
      @JsonKey(name: 'captured_by') CapturedByDto capturedBy,
      @JsonKey(name: 'captured_at') String capturedAt});

  @override
  $GpsCoordinatesDtoCopyWith<$Res>? get gpsCoordinates;
  @override
  $CapturedByDtoCopyWith<$Res> get capturedBy;
}

/// @nodoc
class __$WorkOrderImageCaptureDtoCopyWithImpl<$Res>
    implements _$WorkOrderImageCaptureDtoCopyWith<$Res> {
  __$WorkOrderImageCaptureDtoCopyWithImpl(this._self, this._then);

  final _WorkOrderImageCaptureDto _self;
  final $Res Function(_WorkOrderImageCaptureDto) _then;

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrls = freezed,
    Object? gpsCoordinates = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_WorkOrderImageCaptureDto(
      imageUrls: freezed == imageUrls
          ? _self._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gpsCoordinates: freezed == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as GpsCoordinatesDto?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedByDto,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GpsCoordinatesDtoCopyWith<$Res>? get gpsCoordinates {
    if (_self.gpsCoordinates == null) {
      return null;
    }

    return $GpsCoordinatesDtoCopyWith<$Res>(_self.gpsCoordinates!, (value) {
      return _then(_self.copyWith(gpsCoordinates: value));
    });
  }

  /// Create a copy of WorkOrderImageCaptureDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByDtoCopyWith<$Res> get capturedBy {
    return $CapturedByDtoCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

// dart format on
