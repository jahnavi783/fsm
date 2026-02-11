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
  @JsonKey(name: 'pause_counts')
  List<PauseCountDto>? get pauseCounts;

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
                .equals(other.groupedImages, groupedImages) &&
            const DeepCollectionEquality()
                .equals(other.pauseCounts, pauseCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workOrderId,
      const DeepCollectionEquality().hash(groupedImages),
      const DeepCollectionEquality().hash(pauseCounts));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesResponseDto(workOrderId: $workOrderId, groupedImages: $groupedImages, pauseCounts: $pauseCounts)';
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
      Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
      @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts});
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
    Object? pauseCounts = freezed,
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
      pauseCounts: freezed == pauseCounts
          ? _self.pauseCounts
          : pauseCounts // ignore: cast_nullable_to_non_nullable
              as List<PauseCountDto>?,
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
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
            @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
        return $default(
            _that.workOrderId, _that.groupedImages, _that.pauseCounts);
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
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
            @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto():
        return $default(
            _that.workOrderId, _that.groupedImages, _that.pauseCounts);
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
            Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
            @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderGroupedImagesResponseDto() when $default != null:
        return $default(
            _that.workOrderId, _that.groupedImages, _that.pauseCounts);
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
      required final Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
      @JsonKey(name: 'pause_counts') final List<PauseCountDto>? pauseCounts})
      : _groupedImages = groupedImages,
        _pauseCounts = pauseCounts;
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

  final List<PauseCountDto>? _pauseCounts;
  @override
  @JsonKey(name: 'pause_counts')
  List<PauseCountDto>? get pauseCounts {
    final value = _pauseCounts;
    if (value == null) return null;
    if (_pauseCounts is EqualUnmodifiableListView) return _pauseCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
                .equals(other._groupedImages, _groupedImages) &&
            const DeepCollectionEquality()
                .equals(other._pauseCounts, _pauseCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workOrderId,
      const DeepCollectionEquality().hash(_groupedImages),
      const DeepCollectionEquality().hash(_pauseCounts));

  @override
  String toString() {
    return 'WorkOrderGroupedImagesResponseDto(workOrderId: $workOrderId, groupedImages: $groupedImages, pauseCounts: $pauseCounts)';
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
      Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
      @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts});
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
    Object? pauseCounts = freezed,
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
      pauseCounts: freezed == pauseCounts
          ? _self._pauseCounts
          : pauseCounts // ignore: cast_nullable_to_non_nullable
              as List<PauseCountDto>?,
    ));
  }
}

/// @nodoc
mixin _$PauseCountDto {
  @JsonKey(name: 'user_id')
  int get userId;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  @JsonKey(name: 'pause_count')
  int get pauseCount;

  /// Create a copy of PauseCountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PauseCountDtoCopyWith<PauseCountDto> get copyWith =>
      _$PauseCountDtoCopyWithImpl<PauseCountDto>(
          this as PauseCountDto, _$identity);

  /// Serializes this PauseCountDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PauseCountDto &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pauseCount, pauseCount) ||
                other.pauseCount == pauseCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, firstName, lastName, email, pauseCount);

  @override
  String toString() {
    return 'PauseCountDto(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, pauseCount: $pauseCount)';
  }
}

/// @nodoc
abstract mixin class $PauseCountDtoCopyWith<$Res> {
  factory $PauseCountDtoCopyWith(
          PauseCountDto value, $Res Function(PauseCountDto) _then) =
      _$PauseCountDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'pause_count') int pauseCount});
}

/// @nodoc
class _$PauseCountDtoCopyWithImpl<$Res>
    implements $PauseCountDtoCopyWith<$Res> {
  _$PauseCountDtoCopyWithImpl(this._self, this._then);

  final PauseCountDto _self;
  final $Res Function(PauseCountDto) _then;

  /// Create a copy of PauseCountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? pauseCount = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
      pauseCount: null == pauseCount
          ? _self.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PauseCountDto].
extension PauseCountDtoPatterns on PauseCountDto {
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
    TResult Function(_PauseCountDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto() when $default != null:
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
    TResult Function(_PauseCountDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto():
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
    TResult? Function(_PauseCountDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto() when $default != null:
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
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'pause_count') int pauseCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto() when $default != null:
        return $default(_that.userId, _that.firstName, _that.lastName,
            _that.email, _that.pauseCount);
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
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'pause_count') int pauseCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto():
        return $default(_that.userId, _that.firstName, _that.lastName,
            _that.email, _that.pauseCount);
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
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'pause_count') int pauseCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauseCountDto() when $default != null:
        return $default(_that.userId, _that.firstName, _that.lastName,
            _that.email, _that.pauseCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PauseCountDto implements PauseCountDto {
  const _PauseCountDto(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      @JsonKey(name: 'pause_count') required this.pauseCount});
  factory _PauseCountDto.fromJson(Map<String, dynamic> json) =>
      _$PauseCountDtoFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  @JsonKey(name: 'pause_count')
  final int pauseCount;

  /// Create a copy of PauseCountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauseCountDtoCopyWith<_PauseCountDto> get copyWith =>
      __$PauseCountDtoCopyWithImpl<_PauseCountDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PauseCountDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauseCountDto &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pauseCount, pauseCount) ||
                other.pauseCount == pauseCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, firstName, lastName, email, pauseCount);

  @override
  String toString() {
    return 'PauseCountDto(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, pauseCount: $pauseCount)';
  }
}

/// @nodoc
abstract mixin class _$PauseCountDtoCopyWith<$Res>
    implements $PauseCountDtoCopyWith<$Res> {
  factory _$PauseCountDtoCopyWith(
          _PauseCountDto value, $Res Function(_PauseCountDto) _then) =
      __$PauseCountDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'pause_count') int pauseCount});
}

/// @nodoc
class __$PauseCountDtoCopyWithImpl<$Res>
    implements _$PauseCountDtoCopyWith<$Res> {
  __$PauseCountDtoCopyWithImpl(this._self, this._then);

  final _PauseCountDto _self;
  final $Res Function(_PauseCountDto) _then;

  /// Create a copy of PauseCountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? pauseCount = null,
  }) {
    return _then(_PauseCountDto(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
      pauseCount: null == pauseCount
          ? _self.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
