// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarEventHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get title;
  @HiveField(2)
  DateTime get startTime;
  @HiveField(3)
  DateTime get endTime;
  @HiveField(4)
  int get type; // CalendarEventType as int
  @HiveField(5)
  String get description;
  @HiveField(6)
  int? get workOrderId;
  @HiveField(7)
  String? get location;
  @HiveField(8)
  bool get isAllDay;
  @HiveField(9)
  String? get color;
  @HiveField(10)
  String? get metadata; // Store as JSON string
  @HiveField(11)
  DateTime get cachedAt;
  @HiveField(12)
  bool get isPendingSync;
  @HiveField(13)
  String? get pendingAction;

  /// Create a copy of CalendarEventHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarEventHiveModelCopyWith<CalendarEventHiveModel> get copyWith =>
      _$CalendarEventHiveModelCopyWithImpl<CalendarEventHiveModel>(
          this as CalendarEventHiveModel, _$identity);

  /// Serializes this CalendarEventHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarEventHiveModel &&
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
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.isPendingSync, isPendingSync) ||
                other.isPendingSync == isPendingSync) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
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
      metadata,
      cachedAt,
      isPendingSync,
      pendingAction);

  @override
  String toString() {
    return 'CalendarEventHiveModel(id: $id, title: $title, startTime: $startTime, endTime: $endTime, type: $type, description: $description, workOrderId: $workOrderId, location: $location, isAllDay: $isAllDay, color: $color, metadata: $metadata, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }
}

/// @nodoc
abstract mixin class $CalendarEventHiveModelCopyWith<$Res> {
  factory $CalendarEventHiveModelCopyWith(CalendarEventHiveModel value,
          $Res Function(CalendarEventHiveModel) _then) =
      _$CalendarEventHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) DateTime startTime,
      @HiveField(3) DateTime endTime,
      @HiveField(4) int type,
      @HiveField(5) String description,
      @HiveField(6) int? workOrderId,
      @HiveField(7) String? location,
      @HiveField(8) bool isAllDay,
      @HiveField(9) String? color,
      @HiveField(10) String? metadata,
      @HiveField(11) DateTime cachedAt,
      @HiveField(12) bool isPendingSync,
      @HiveField(13) String? pendingAction});
}

/// @nodoc
class _$CalendarEventHiveModelCopyWithImpl<$Res>
    implements $CalendarEventHiveModelCopyWith<$Res> {
  _$CalendarEventHiveModelCopyWithImpl(this._self, this._then);

  final CalendarEventHiveModel _self;
  final $Res Function(CalendarEventHiveModel) _then;

  /// Create a copy of CalendarEventHiveModel
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
    Object? cachedAt = null,
    Object? isPendingSync = null,
    Object? pendingAction = freezed,
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
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _self.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _self.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CalendarEventHiveModel].
extension CalendarEventHiveModelPatterns on CalendarEventHiveModel {
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
    TResult Function(_CalendarEventHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel() when $default != null:
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
    TResult Function(_CalendarEventHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel():
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
    TResult? Function(_CalendarEventHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel() when $default != null:
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
            @HiveField(0) int id,
            @HiveField(1) String title,
            @HiveField(2) DateTime startTime,
            @HiveField(3) DateTime endTime,
            @HiveField(4) int type,
            @HiveField(5) String description,
            @HiveField(6) int? workOrderId,
            @HiveField(7) String? location,
            @HiveField(8) bool isAllDay,
            @HiveField(9) String? color,
            @HiveField(10) String? metadata,
            @HiveField(11) DateTime cachedAt,
            @HiveField(12) bool isPendingSync,
            @HiveField(13) String? pendingAction)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel() when $default != null:
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
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
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
            @HiveField(0) int id,
            @HiveField(1) String title,
            @HiveField(2) DateTime startTime,
            @HiveField(3) DateTime endTime,
            @HiveField(4) int type,
            @HiveField(5) String description,
            @HiveField(6) int? workOrderId,
            @HiveField(7) String? location,
            @HiveField(8) bool isAllDay,
            @HiveField(9) String? color,
            @HiveField(10) String? metadata,
            @HiveField(11) DateTime cachedAt,
            @HiveField(12) bool isPendingSync,
            @HiveField(13) String? pendingAction)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel():
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
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
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
            @HiveField(0) int id,
            @HiveField(1) String title,
            @HiveField(2) DateTime startTime,
            @HiveField(3) DateTime endTime,
            @HiveField(4) int type,
            @HiveField(5) String description,
            @HiveField(6) int? workOrderId,
            @HiveField(7) String? location,
            @HiveField(8) bool isAllDay,
            @HiveField(9) String? color,
            @HiveField(10) String? metadata,
            @HiveField(11) DateTime cachedAt,
            @HiveField(12) bool isPendingSync,
            @HiveField(13) String? pendingAction)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarEventHiveModel() when $default != null:
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
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CalendarEventHiveModel implements CalendarEventHiveModel {
  const _CalendarEventHiveModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.startTime,
      @HiveField(3) required this.endTime,
      @HiveField(4) required this.type,
      @HiveField(5) required this.description,
      @HiveField(6) this.workOrderId,
      @HiveField(7) this.location,
      @HiveField(8) this.isAllDay = false,
      @HiveField(9) this.color,
      @HiveField(10) this.metadata,
      @HiveField(11) required this.cachedAt,
      @HiveField(12) this.isPendingSync = false,
      @HiveField(13) this.pendingAction});
  factory _CalendarEventHiveModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventHiveModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final DateTime startTime;
  @override
  @HiveField(3)
  final DateTime endTime;
  @override
  @HiveField(4)
  final int type;
// CalendarEventType as int
  @override
  @HiveField(5)
  final String description;
  @override
  @HiveField(6)
  final int? workOrderId;
  @override
  @HiveField(7)
  final String? location;
  @override
  @JsonKey()
  @HiveField(8)
  final bool isAllDay;
  @override
  @HiveField(9)
  final String? color;
  @override
  @HiveField(10)
  final String? metadata;
// Store as JSON string
  @override
  @HiveField(11)
  final DateTime cachedAt;
  @override
  @JsonKey()
  @HiveField(12)
  final bool isPendingSync;
  @override
  @HiveField(13)
  final String? pendingAction;

  /// Create a copy of CalendarEventHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarEventHiveModelCopyWith<_CalendarEventHiveModel> get copyWith =>
      __$CalendarEventHiveModelCopyWithImpl<_CalendarEventHiveModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalendarEventHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarEventHiveModel &&
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
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.isPendingSync, isPendingSync) ||
                other.isPendingSync == isPendingSync) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
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
      metadata,
      cachedAt,
      isPendingSync,
      pendingAction);

  @override
  String toString() {
    return 'CalendarEventHiveModel(id: $id, title: $title, startTime: $startTime, endTime: $endTime, type: $type, description: $description, workOrderId: $workOrderId, location: $location, isAllDay: $isAllDay, color: $color, metadata: $metadata, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }
}

/// @nodoc
abstract mixin class _$CalendarEventHiveModelCopyWith<$Res>
    implements $CalendarEventHiveModelCopyWith<$Res> {
  factory _$CalendarEventHiveModelCopyWith(_CalendarEventHiveModel value,
          $Res Function(_CalendarEventHiveModel) _then) =
      __$CalendarEventHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) DateTime startTime,
      @HiveField(3) DateTime endTime,
      @HiveField(4) int type,
      @HiveField(5) String description,
      @HiveField(6) int? workOrderId,
      @HiveField(7) String? location,
      @HiveField(8) bool isAllDay,
      @HiveField(9) String? color,
      @HiveField(10) String? metadata,
      @HiveField(11) DateTime cachedAt,
      @HiveField(12) bool isPendingSync,
      @HiveField(13) String? pendingAction});
}

/// @nodoc
class __$CalendarEventHiveModelCopyWithImpl<$Res>
    implements _$CalendarEventHiveModelCopyWith<$Res> {
  __$CalendarEventHiveModelCopyWithImpl(this._self, this._then);

  final _CalendarEventHiveModel _self;
  final $Res Function(_CalendarEventHiveModel) _then;

  /// Create a copy of CalendarEventHiveModel
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
    Object? cachedAt = null,
    Object? isPendingSync = null,
    Object? pendingAction = freezed,
  }) {
    return _then(_CalendarEventHiveModel(
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
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _self.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _self.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
