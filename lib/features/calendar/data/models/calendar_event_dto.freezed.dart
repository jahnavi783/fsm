// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarEventDto {
  int get id;
  String get title;
  @JsonKey(name: 'start_time')
  String get startTime;
  @JsonKey(name: 'end_time')
  String get endTime;
  String get type;
  String get description;
  @JsonKey(name: 'work_order_id')
  int? get workOrderId;
  String? get location;
  @JsonKey(name: 'is_all_day')
  bool get isAllDay;
  String? get color;
  Map<String, dynamic>? get metadata;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of CalendarEventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarEventDtoCopyWith<CalendarEventDto> get copyWith =>
      _$CalendarEventDtoCopyWithImpl<CalendarEventDto>(
          this as CalendarEventDto, _$identity);

  /// Serializes this CalendarEventDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarEventDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      startTime,
      endTime,
      type,
      description,
      workOrderId,
      location,
      isAllDay,
      color,
      const DeepCollectionEquality().hash(metadata),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CalendarEventDto(id: $id, title: $title, startTime: $startTime, endTime: $endTime, type: $type, description: $description, workOrderId: $workOrderId, location: $location, isAllDay: $isAllDay, color: $color, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CalendarEventDtoCopyWith<$Res> {
  factory $CalendarEventDtoCopyWith(
          CalendarEventDto value, $Res Function(CalendarEventDto) _then) =
      _$CalendarEventDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String type,
      String description,
      @JsonKey(name: 'work_order_id') int? workOrderId,
      String? location,
      @JsonKey(name: 'is_all_day') bool isAllDay,
      String? color,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$CalendarEventDtoCopyWithImpl<$Res>
    implements $CalendarEventDtoCopyWith<$Res> {
  _$CalendarEventDtoCopyWithImpl(this._self, this._then);

  final CalendarEventDto _self;
  final $Res Function(CalendarEventDto) _then;

  /// Create a copy of CalendarEventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? description = null,
    Object? workOrderId = freezed,
    Object? location = freezed,
    Object? isAllDay = null,
    Object? color = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _self.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CalendarEventDto].
extension CalendarEventDtoPatterns on CalendarEventDto {
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
    TResult Function(_CalendarEventDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto() when $default != null:
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
    TResult Function(_CalendarEventDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto():
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
    TResult? Function(_CalendarEventDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto() when $default != null:
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
            String title,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime,
            String type,
            String description,
            @JsonKey(name: 'work_order_id') int? workOrderId,
            String? location,
            @JsonKey(name: 'is_all_day') bool isAllDay,
            String? color,
            Map<String, dynamic>? metadata,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.description,
            _that.workOrderId,
            _that.location,
            _that.isAllDay,
            _that.color,
            _that.metadata,
            _that.createdAt,
            _that.updatedAt);
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
            String title,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime,
            String type,
            String description,
            @JsonKey(name: 'work_order_id') int? workOrderId,
            String? location,
            @JsonKey(name: 'is_all_day') bool isAllDay,
            String? color,
            Map<String, dynamic>? metadata,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto():
        return $default(
            _that.id,
            _that.title,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.description,
            _that.workOrderId,
            _that.location,
            _that.isAllDay,
            _that.color,
            _that.metadata,
            _that.createdAt,
            _that.updatedAt);
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
            String title,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime,
            String type,
            String description,
            @JsonKey(name: 'work_order_id') int? workOrderId,
            String? location,
            @JsonKey(name: 'is_all_day') bool isAllDay,
            String? color,
            Map<String, dynamic>? metadata,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.description,
            _that.workOrderId,
            _that.location,
            _that.isAllDay,
            _that.color,
            _that.metadata,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CalendarEventDto implements CalendarEventDto {
  const _CalendarEventDto(
      {required this.id,
      required this.title,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      required this.type,
      required this.description,
      @JsonKey(name: 'work_order_id') this.workOrderId,
      this.location,
      @JsonKey(name: 'is_all_day') this.isAllDay = false,
      this.color,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _metadata = metadata;
  factory _CalendarEventDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventDtoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final String type;
  @override
  final String description;
  @override
  @JsonKey(name: 'work_order_id')
  final int? workOrderId;
  @override
  final String? location;
  @override
  @JsonKey(name: 'is_all_day')
  final bool isAllDay;
  @override
  final String? color;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  /// Create a copy of CalendarEventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarEventDtoCopyWith<_CalendarEventDto> get copyWith =>
      __$CalendarEventDtoCopyWithImpl<_CalendarEventDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalendarEventDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarEventDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      startTime,
      endTime,
      type,
      description,
      workOrderId,
      location,
      isAllDay,
      color,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CalendarEventDto(id: $id, title: $title, startTime: $startTime, endTime: $endTime, type: $type, description: $description, workOrderId: $workOrderId, location: $location, isAllDay: $isAllDay, color: $color, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CalendarEventDtoCopyWith<$Res>
    implements $CalendarEventDtoCopyWith<$Res> {
  factory _$CalendarEventDtoCopyWith(
          _CalendarEventDto value, $Res Function(_CalendarEventDto) _then) =
      __$CalendarEventDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String type,
      String description,
      @JsonKey(name: 'work_order_id') int? workOrderId,
      String? location,
      @JsonKey(name: 'is_all_day') bool isAllDay,
      String? color,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$CalendarEventDtoCopyWithImpl<$Res>
    implements _$CalendarEventDtoCopyWith<$Res> {
  __$CalendarEventDtoCopyWithImpl(this._self, this._then);

  final _CalendarEventDto _self;
  final $Res Function(_CalendarEventDto) _then;

  /// Create a copy of CalendarEventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? description = null,
    Object? workOrderId = freezed,
    Object? location = freezed,
    Object? isAllDay = null,
    Object? color = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_CalendarEventDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _self.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
