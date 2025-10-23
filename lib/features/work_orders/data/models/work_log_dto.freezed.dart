// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkLogDto {
  int get id;
  @JsonKey(name: 'work_order_id')
  int get workOrderId;
  String get type;
  String get description;
  String get timestamp;
  String? get notes;
  double? get latitude;
  double? get longitude;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'user_name')
  String? get userName;

  /// Create a copy of WorkLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkLogDtoCopyWith<WorkLogDto> get copyWith =>
      _$WorkLogDtoCopyWithImpl<WorkLogDto>(this as WorkLogDto, _$identity);

  /// Serializes this WorkLogDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkLogDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @override
  String toString() {
    return 'WorkLogDto(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class $WorkLogDtoCopyWith<$Res> {
  factory $WorkLogDtoCopyWith(
          WorkLogDto value, $Res Function(WorkLogDto) _then) =
      _$WorkLogDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'work_order_id') int workOrderId,
      String type,
      String description,
      String timestamp,
      String? notes,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_name') String? userName});
}

/// @nodoc
class _$WorkLogDtoCopyWithImpl<$Res> implements $WorkLogDtoCopyWith<$Res> {
  _$WorkLogDtoCopyWithImpl(this._self, this._then);

  final WorkLogDto _self;
  final $Res Function(WorkLogDto) _then;

  /// Create a copy of WorkLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workOrderId = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? notes = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkLogDto].
extension WorkLogDtoPatterns on WorkLogDto {
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
    TResult Function(_WorkLogDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto() when $default != null:
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
    TResult Function(_WorkLogDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto():
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
    TResult? Function(_WorkLogDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto() when $default != null:
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
            @JsonKey(name: 'work_order_id') int workOrderId,
            String type,
            String description,
            String timestamp,
            String? notes,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'user_name') String? userName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto() when $default != null:
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
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
            @JsonKey(name: 'work_order_id') int workOrderId,
            String type,
            String description,
            String timestamp,
            String? notes,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'user_name') String? userName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto():
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
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
            @JsonKey(name: 'work_order_id') int workOrderId,
            String type,
            String description,
            String timestamp,
            String? notes,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'user_name') String? userName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogDto() when $default != null:
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkLogDto implements WorkLogDto {
  const _WorkLogDto(
      {required this.id,
      @JsonKey(name: 'work_order_id') required this.workOrderId,
      required this.type,
      required this.description,
      required this.timestamp,
      this.notes,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_name') this.userName});
  factory _WorkLogDto.fromJson(Map<String, dynamic> json) =>
      _$WorkLogDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'work_order_id')
  final int workOrderId;
  @override
  final String type;
  @override
  final String description;
  @override
  final String timestamp;
  @override
  final String? notes;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;

  /// Create a copy of WorkLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkLogDtoCopyWith<_WorkLogDto> get copyWith =>
      __$WorkLogDtoCopyWithImpl<_WorkLogDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkLogDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkLogDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @override
  String toString() {
    return 'WorkLogDto(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class _$WorkLogDtoCopyWith<$Res>
    implements $WorkLogDtoCopyWith<$Res> {
  factory _$WorkLogDtoCopyWith(
          _WorkLogDto value, $Res Function(_WorkLogDto) _then) =
      __$WorkLogDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'work_order_id') int workOrderId,
      String type,
      String description,
      String timestamp,
      String? notes,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_name') String? userName});
}

/// @nodoc
class __$WorkLogDtoCopyWithImpl<$Res> implements _$WorkLogDtoCopyWith<$Res> {
  __$WorkLogDtoCopyWithImpl(this._self, this._then);

  final _WorkLogDto _self;
  final $Res Function(_WorkLogDto) _then;

  /// Create a copy of WorkLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workOrderId = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? notes = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_WorkLogDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
