// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_images_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupedImagesResponse {
  @JsonKey(name: 'work_order_id')
  int get workOrderId;
  @JsonKey(name: 'grouped_images')
  GroupedImages get groupedImages;

  /// Create a copy of GroupedImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupedImagesResponseCopyWith<GroupedImagesResponse> get copyWith =>
      _$GroupedImagesResponseCopyWithImpl<GroupedImagesResponse>(
          this as GroupedImagesResponse, _$identity);

  /// Serializes this GroupedImagesResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupedImagesResponse &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.groupedImages, groupedImages) ||
                other.groupedImages == groupedImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrderId, groupedImages);

  @override
  String toString() {
    return 'GroupedImagesResponse(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class $GroupedImagesResponseCopyWith<$Res> {
  factory $GroupedImagesResponseCopyWith(GroupedImagesResponse value,
          $Res Function(GroupedImagesResponse) _then) =
      _$GroupedImagesResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'work_order_id') int workOrderId,
      @JsonKey(name: 'grouped_images') GroupedImages groupedImages});

  $GroupedImagesCopyWith<$Res> get groupedImages;
}

/// @nodoc
class _$GroupedImagesResponseCopyWithImpl<$Res>
    implements $GroupedImagesResponseCopyWith<$Res> {
  _$GroupedImagesResponseCopyWithImpl(this._self, this._then);

  final GroupedImagesResponse _self;
  final $Res Function(GroupedImagesResponse) _then;

  /// Create a copy of GroupedImagesResponse
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
              as GroupedImages,
    ));
  }

  /// Create a copy of GroupedImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupedImagesCopyWith<$Res> get groupedImages {
    return $GroupedImagesCopyWith<$Res>(_self.groupedImages, (value) {
      return _then(_self.copyWith(groupedImages: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroupedImagesResponse].
extension GroupedImagesResponsePatterns on GroupedImagesResponse {
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
    TResult Function(_GroupedImagesResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse() when $default != null:
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
    TResult Function(_GroupedImagesResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse():
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
    TResult? Function(_GroupedImagesResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'work_order_id') int workOrderId,
            @JsonKey(name: 'grouped_images') GroupedImages groupedImages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'work_order_id') int workOrderId,
            @JsonKey(name: 'grouped_images') GroupedImages groupedImages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse():
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
    TResult? Function(@JsonKey(name: 'work_order_id') int workOrderId,
            @JsonKey(name: 'grouped_images') GroupedImages groupedImages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImagesResponse() when $default != null:
        return $default(_that.workOrderId, _that.groupedImages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupedImagesResponse implements GroupedImagesResponse {
  const _GroupedImagesResponse(
      {@JsonKey(name: 'work_order_id') required this.workOrderId,
      @JsonKey(name: 'grouped_images') required this.groupedImages});
  factory _GroupedImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupedImagesResponseFromJson(json);

  @override
  @JsonKey(name: 'work_order_id')
  final int workOrderId;
  @override
  @JsonKey(name: 'grouped_images')
  final GroupedImages groupedImages;

  /// Create a copy of GroupedImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupedImagesResponseCopyWith<_GroupedImagesResponse> get copyWith =>
      __$GroupedImagesResponseCopyWithImpl<_GroupedImagesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupedImagesResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupedImagesResponse &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.groupedImages, groupedImages) ||
                other.groupedImages == groupedImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workOrderId, groupedImages);

  @override
  String toString() {
    return 'GroupedImagesResponse(workOrderId: $workOrderId, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class _$GroupedImagesResponseCopyWith<$Res>
    implements $GroupedImagesResponseCopyWith<$Res> {
  factory _$GroupedImagesResponseCopyWith(_GroupedImagesResponse value,
          $Res Function(_GroupedImagesResponse) _then) =
      __$GroupedImagesResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'work_order_id') int workOrderId,
      @JsonKey(name: 'grouped_images') GroupedImages groupedImages});

  @override
  $GroupedImagesCopyWith<$Res> get groupedImages;
}

/// @nodoc
class __$GroupedImagesResponseCopyWithImpl<$Res>
    implements _$GroupedImagesResponseCopyWith<$Res> {
  __$GroupedImagesResponseCopyWithImpl(this._self, this._then);

  final _GroupedImagesResponse _self;
  final $Res Function(_GroupedImagesResponse) _then;

  /// Create a copy of GroupedImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? groupedImages = null,
  }) {
    return _then(_GroupedImagesResponse(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      groupedImages: null == groupedImages
          ? _self.groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as GroupedImages,
    ));
  }

  /// Create a copy of GroupedImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupedImagesCopyWith<$Res> get groupedImages {
    return $GroupedImagesCopyWith<$Res>(_self.groupedImages, (value) {
      return _then(_self.copyWith(groupedImages: value));
    });
  }
}

/// @nodoc
mixin _$GroupedImages {
  List<ImageLog> get start;
  List<ImageLog> get pause;
  List<ImageLog> get resume;
  List<ImageLog> get complete;
  List<ImageLog> get signature;

  /// Create a copy of GroupedImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupedImagesCopyWith<GroupedImages> get copyWith =>
      _$GroupedImagesCopyWithImpl<GroupedImages>(
          this as GroupedImages, _$identity);

  /// Serializes this GroupedImages to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupedImages &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.pause, pause) &&
            const DeepCollectionEquality().equals(other.resume, resume) &&
            const DeepCollectionEquality().equals(other.complete, complete) &&
            const DeepCollectionEquality().equals(other.signature, signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(pause),
      const DeepCollectionEquality().hash(resume),
      const DeepCollectionEquality().hash(complete),
      const DeepCollectionEquality().hash(signature));

  @override
  String toString() {
    return 'GroupedImages(start: $start, pause: $pause, resume: $resume, complete: $complete, signature: $signature)';
  }
}

/// @nodoc
abstract mixin class $GroupedImagesCopyWith<$Res> {
  factory $GroupedImagesCopyWith(
          GroupedImages value, $Res Function(GroupedImages) _then) =
      _$GroupedImagesCopyWithImpl;
  @useResult
  $Res call(
      {List<ImageLog> start,
      List<ImageLog> pause,
      List<ImageLog> resume,
      List<ImageLog> complete,
      List<ImageLog> signature});
}

/// @nodoc
class _$GroupedImagesCopyWithImpl<$Res>
    implements $GroupedImagesCopyWith<$Res> {
  _$GroupedImagesCopyWithImpl(this._self, this._then);

  final GroupedImages _self;
  final $Res Function(GroupedImages) _then;

  /// Create a copy of GroupedImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? pause = null,
    Object? resume = null,
    Object? complete = null,
    Object? signature = null,
  }) {
    return _then(_self.copyWith(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      pause: null == pause
          ? _self.pause
          : pause // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      resume: null == resume
          ? _self.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      complete: null == complete
          ? _self.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      signature: null == signature
          ? _self.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupedImages].
extension GroupedImagesPatterns on GroupedImages {
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
    TResult Function(_GroupedImages value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupedImages() when $default != null:
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
    TResult Function(_GroupedImages value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImages():
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
    TResult? Function(_GroupedImages value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImages() when $default != null:
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
            List<ImageLog> start,
            List<ImageLog> pause,
            List<ImageLog> resume,
            List<ImageLog> complete,
            List<ImageLog> signature)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupedImages() when $default != null:
        return $default(_that.start, _that.pause, _that.resume, _that.complete,
            _that.signature);
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
            List<ImageLog> start,
            List<ImageLog> pause,
            List<ImageLog> resume,
            List<ImageLog> complete,
            List<ImageLog> signature)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImages():
        return $default(_that.start, _that.pause, _that.resume, _that.complete,
            _that.signature);
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
            List<ImageLog> start,
            List<ImageLog> pause,
            List<ImageLog> resume,
            List<ImageLog> complete,
            List<ImageLog> signature)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupedImages() when $default != null:
        return $default(_that.start, _that.pause, _that.resume, _that.complete,
            _that.signature);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupedImages implements GroupedImages {
  const _GroupedImages(
      {final List<ImageLog> start = const [],
      final List<ImageLog> pause = const [],
      final List<ImageLog> resume = const [],
      final List<ImageLog> complete = const [],
      final List<ImageLog> signature = const []})
      : _start = start,
        _pause = pause,
        _resume = resume,
        _complete = complete,
        _signature = signature;
  factory _GroupedImages.fromJson(Map<String, dynamic> json) =>
      _$GroupedImagesFromJson(json);

  final List<ImageLog> _start;
  @override
  @JsonKey()
  List<ImageLog> get start {
    if (_start is EqualUnmodifiableListView) return _start;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_start);
  }

  final List<ImageLog> _pause;
  @override
  @JsonKey()
  List<ImageLog> get pause {
    if (_pause is EqualUnmodifiableListView) return _pause;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pause);
  }

  final List<ImageLog> _resume;
  @override
  @JsonKey()
  List<ImageLog> get resume {
    if (_resume is EqualUnmodifiableListView) return _resume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resume);
  }

  final List<ImageLog> _complete;
  @override
  @JsonKey()
  List<ImageLog> get complete {
    if (_complete is EqualUnmodifiableListView) return _complete;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_complete);
  }

  final List<ImageLog> _signature;
  @override
  @JsonKey()
  List<ImageLog> get signature {
    if (_signature is EqualUnmodifiableListView) return _signature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signature);
  }

  /// Create a copy of GroupedImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupedImagesCopyWith<_GroupedImages> get copyWith =>
      __$GroupedImagesCopyWithImpl<_GroupedImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupedImagesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupedImages &&
            const DeepCollectionEquality().equals(other._start, _start) &&
            const DeepCollectionEquality().equals(other._pause, _pause) &&
            const DeepCollectionEquality().equals(other._resume, _resume) &&
            const DeepCollectionEquality().equals(other._complete, _complete) &&
            const DeepCollectionEquality()
                .equals(other._signature, _signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_start),
      const DeepCollectionEquality().hash(_pause),
      const DeepCollectionEquality().hash(_resume),
      const DeepCollectionEquality().hash(_complete),
      const DeepCollectionEquality().hash(_signature));

  @override
  String toString() {
    return 'GroupedImages(start: $start, pause: $pause, resume: $resume, complete: $complete, signature: $signature)';
  }
}

/// @nodoc
abstract mixin class _$GroupedImagesCopyWith<$Res>
    implements $GroupedImagesCopyWith<$Res> {
  factory _$GroupedImagesCopyWith(
          _GroupedImages value, $Res Function(_GroupedImages) _then) =
      __$GroupedImagesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ImageLog> start,
      List<ImageLog> pause,
      List<ImageLog> resume,
      List<ImageLog> complete,
      List<ImageLog> signature});
}

/// @nodoc
class __$GroupedImagesCopyWithImpl<$Res>
    implements _$GroupedImagesCopyWith<$Res> {
  __$GroupedImagesCopyWithImpl(this._self, this._then);

  final _GroupedImages _self;
  final $Res Function(_GroupedImages) _then;

  /// Create a copy of GroupedImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? pause = null,
    Object? resume = null,
    Object? complete = null,
    Object? signature = null,
  }) {
    return _then(_GroupedImages(
      start: null == start
          ? _self._start
          : start // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      pause: null == pause
          ? _self._pause
          : pause // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      resume: null == resume
          ? _self._resume
          : resume // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      complete: null == complete
          ? _self._complete
          : complete // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
      signature: null == signature
          ? _self._signature
          : signature // ignore: cast_nullable_to_non_nullable
              as List<ImageLog>,
    ));
  }
}

/// @nodoc
mixin _$ImageLog {
  @JsonKey(name: 'image_urls')
  List<String> get imageUrls;
  @JsonKey(name: 'gps_coordinates')
  GpsCoordinates? get gpsCoordinates;
  @JsonKey(name: 'captured_by')
  CapturedBy get capturedBy;
  @JsonKey(name: 'captured_at')
  String get capturedAt;

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageLogCopyWith<ImageLog> get copyWith =>
      _$ImageLogCopyWithImpl<ImageLog>(this as ImageLog, _$identity);

  /// Serializes this ImageLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageLog &&
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
    return 'ImageLog(imageUrls: $imageUrls, gpsCoordinates: $gpsCoordinates, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class $ImageLogCopyWith<$Res> {
  factory $ImageLogCopyWith(ImageLog value, $Res Function(ImageLog) _then) =
      _$ImageLogCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'image_urls') List<String> imageUrls,
      @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
      @JsonKey(name: 'captured_by') CapturedBy capturedBy,
      @JsonKey(name: 'captured_at') String capturedAt});

  $GpsCoordinatesCopyWith<$Res>? get gpsCoordinates;
  $CapturedByCopyWith<$Res> get capturedBy;
}

/// @nodoc
class _$ImageLogCopyWithImpl<$Res> implements $ImageLogCopyWith<$Res> {
  _$ImageLogCopyWithImpl(this._self, this._then);

  final ImageLog _self;
  final $Res Function(ImageLog) _then;

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
    Object? gpsCoordinates = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_self.copyWith(
      imageUrls: null == imageUrls
          ? _self.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: freezed == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as GpsCoordinates?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedBy,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GpsCoordinatesCopyWith<$Res>? get gpsCoordinates {
    if (_self.gpsCoordinates == null) {
      return null;
    }

    return $GpsCoordinatesCopyWith<$Res>(_self.gpsCoordinates!, (value) {
      return _then(_self.copyWith(gpsCoordinates: value));
    });
  }

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByCopyWith<$Res> get capturedBy {
    return $CapturedByCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ImageLog].
extension ImageLogPatterns on ImageLog {
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
    TResult Function(_ImageLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageLog() when $default != null:
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
    TResult Function(_ImageLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageLog():
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
    TResult? Function(_ImageLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageLog() when $default != null:
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
            @JsonKey(name: 'image_urls') List<String> imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedBy capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageLog() when $default != null:
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
            @JsonKey(name: 'image_urls') List<String> imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedBy capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageLog():
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
            @JsonKey(name: 'image_urls') List<String> imageUrls,
            @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
            @JsonKey(name: 'captured_by') CapturedBy capturedBy,
            @JsonKey(name: 'captured_at') String capturedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageLog() when $default != null:
        return $default(_that.imageUrls, _that.gpsCoordinates, _that.capturedBy,
            _that.capturedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ImageLog implements ImageLog {
  const _ImageLog(
      {@JsonKey(name: 'image_urls') required final List<String> imageUrls,
      @JsonKey(name: 'gps_coordinates') this.gpsCoordinates,
      @JsonKey(name: 'captured_by') required this.capturedBy,
      @JsonKey(name: 'captured_at') required this.capturedAt})
      : _imageUrls = imageUrls;
  factory _ImageLog.fromJson(Map<String, dynamic> json) =>
      _$ImageLogFromJson(json);

  final List<String> _imageUrls;
  @override
  @JsonKey(name: 'image_urls')
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @JsonKey(name: 'gps_coordinates')
  final GpsCoordinates? gpsCoordinates;
  @override
  @JsonKey(name: 'captured_by')
  final CapturedBy capturedBy;
  @override
  @JsonKey(name: 'captured_at')
  final String capturedAt;

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageLogCopyWith<_ImageLog> get copyWith =>
      __$ImageLogCopyWithImpl<_ImageLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageLog &&
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
    return 'ImageLog(imageUrls: $imageUrls, gpsCoordinates: $gpsCoordinates, capturedBy: $capturedBy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$ImageLogCopyWith<$Res>
    implements $ImageLogCopyWith<$Res> {
  factory _$ImageLogCopyWith(_ImageLog value, $Res Function(_ImageLog) _then) =
      __$ImageLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image_urls') List<String> imageUrls,
      @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
      @JsonKey(name: 'captured_by') CapturedBy capturedBy,
      @JsonKey(name: 'captured_at') String capturedAt});

  @override
  $GpsCoordinatesCopyWith<$Res>? get gpsCoordinates;
  @override
  $CapturedByCopyWith<$Res> get capturedBy;
}

/// @nodoc
class __$ImageLogCopyWithImpl<$Res> implements _$ImageLogCopyWith<$Res> {
  __$ImageLogCopyWithImpl(this._self, this._then);

  final _ImageLog _self;
  final $Res Function(_ImageLog) _then;

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrls = null,
    Object? gpsCoordinates = freezed,
    Object? capturedBy = null,
    Object? capturedAt = null,
  }) {
    return _then(_ImageLog(
      imageUrls: null == imageUrls
          ? _self._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: freezed == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as GpsCoordinates?,
      capturedBy: null == capturedBy
          ? _self.capturedBy
          : capturedBy // ignore: cast_nullable_to_non_nullable
              as CapturedBy,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GpsCoordinatesCopyWith<$Res>? get gpsCoordinates {
    if (_self.gpsCoordinates == null) {
      return null;
    }

    return $GpsCoordinatesCopyWith<$Res>(_self.gpsCoordinates!, (value) {
      return _then(_self.copyWith(gpsCoordinates: value));
    });
  }

  /// Create a copy of ImageLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapturedByCopyWith<$Res> get capturedBy {
    return $CapturedByCopyWith<$Res>(_self.capturedBy, (value) {
      return _then(_self.copyWith(capturedBy: value));
    });
  }
}

/// @nodoc
mixin _$GpsCoordinates {
  String get type;
  List<double> get coordinates;

  /// Create a copy of GpsCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GpsCoordinatesCopyWith<GpsCoordinates> get copyWith =>
      _$GpsCoordinatesCopyWithImpl<GpsCoordinates>(
          this as GpsCoordinates, _$identity);

  /// Serializes this GpsCoordinates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GpsCoordinates &&
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
    return 'GpsCoordinates(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class $GpsCoordinatesCopyWith<$Res> {
  factory $GpsCoordinatesCopyWith(
          GpsCoordinates value, $Res Function(GpsCoordinates) _then) =
      _$GpsCoordinatesCopyWithImpl;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$GpsCoordinatesCopyWithImpl<$Res>
    implements $GpsCoordinatesCopyWith<$Res> {
  _$GpsCoordinatesCopyWithImpl(this._self, this._then);

  final GpsCoordinates _self;
  final $Res Function(GpsCoordinates) _then;

  /// Create a copy of GpsCoordinates
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

/// Adds pattern-matching-related methods to [GpsCoordinates].
extension GpsCoordinatesPatterns on GpsCoordinates {
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
    TResult Function(_GpsCoordinates value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates() when $default != null:
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
    TResult Function(_GpsCoordinates value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates():
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
    TResult? Function(_GpsCoordinates value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates() when $default != null:
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
    TResult Function(String type, List<double> coordinates)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates() when $default != null:
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
    TResult Function(String type, List<double> coordinates) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates():
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
    TResult? Function(String type, List<double> coordinates)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GpsCoordinates() when $default != null:
        return $default(_that.type, _that.coordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GpsCoordinates implements GpsCoordinates {
  const _GpsCoordinates(
      {required this.type, required final List<double> coordinates})
      : _coordinates = coordinates;
  factory _GpsCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GpsCoordinatesFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of GpsCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GpsCoordinatesCopyWith<_GpsCoordinates> get copyWith =>
      __$GpsCoordinatesCopyWithImpl<_GpsCoordinates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GpsCoordinatesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GpsCoordinates &&
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
    return 'GpsCoordinates(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$GpsCoordinatesCopyWith<$Res>
    implements $GpsCoordinatesCopyWith<$Res> {
  factory _$GpsCoordinatesCopyWith(
          _GpsCoordinates value, $Res Function(_GpsCoordinates) _then) =
      __$GpsCoordinatesCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$GpsCoordinatesCopyWithImpl<$Res>
    implements _$GpsCoordinatesCopyWith<$Res> {
  __$GpsCoordinatesCopyWithImpl(this._self, this._then);

  final _GpsCoordinates _self;
  final $Res Function(_GpsCoordinates) _then;

  /// Create a copy of GpsCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_GpsCoordinates(
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
mixin _$CapturedBy {
  int get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  @JsonKey(name: 'role_id')
  int get roleId;

  /// Create a copy of CapturedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CapturedByCopyWith<CapturedBy> get copyWith =>
      _$CapturedByCopyWithImpl<CapturedBy>(this as CapturedBy, _$identity);

  /// Serializes this CapturedBy to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CapturedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, roleId);

  @override
  String toString() {
    return 'CapturedBy(id: $id, firstName: $firstName, lastName: $lastName, email: $email, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class $CapturedByCopyWith<$Res> {
  factory $CapturedByCopyWith(
          CapturedBy value, $Res Function(CapturedBy) _then) =
      _$CapturedByCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'role_id') int roleId});
}

/// @nodoc
class _$CapturedByCopyWithImpl<$Res> implements $CapturedByCopyWith<$Res> {
  _$CapturedByCopyWithImpl(this._self, this._then);

  final CapturedBy _self;
  final $Res Function(CapturedBy) _then;

  /// Create a copy of CapturedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? roleId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CapturedBy].
extension CapturedByPatterns on CapturedBy {
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
    TResult Function(_CapturedBy value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CapturedBy() when $default != null:
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
    TResult Function(_CapturedBy value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedBy():
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
    TResult? Function(_CapturedBy value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedBy() when $default != null:
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
            int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id') int roleId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CapturedBy() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
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
            int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id') int roleId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedBy():
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
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
            int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id') int roleId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedBy() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CapturedBy implements CapturedBy {
  const _CapturedBy(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      @JsonKey(name: 'role_id') required this.roleId});
  factory _CapturedBy.fromJson(Map<String, dynamic> json) =>
      _$CapturedByFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  @JsonKey(name: 'role_id')
  final int roleId;

  /// Create a copy of CapturedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CapturedByCopyWith<_CapturedBy> get copyWith =>
      __$CapturedByCopyWithImpl<_CapturedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CapturedByToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CapturedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, roleId);

  @override
  String toString() {
    return 'CapturedBy(id: $id, firstName: $firstName, lastName: $lastName, email: $email, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class _$CapturedByCopyWith<$Res>
    implements $CapturedByCopyWith<$Res> {
  factory _$CapturedByCopyWith(
          _CapturedBy value, $Res Function(_CapturedBy) _then) =
      __$CapturedByCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'role_id') int roleId});
}

/// @nodoc
class __$CapturedByCopyWithImpl<$Res> implements _$CapturedByCopyWith<$Res> {
  __$CapturedByCopyWithImpl(this._self, this._then);

  final _CapturedBy _self;
  final $Res Function(_CapturedBy) _then;

  /// Create a copy of CapturedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? roleId = null,
  }) {
    return _then(_CapturedBy(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
