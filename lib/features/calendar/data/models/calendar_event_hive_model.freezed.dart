// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarEventHiveModel _$CalendarEventHiveModelFromJson(
    Map<String, dynamic> json) {
  return _CalendarEventHiveModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarEventHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get startTime => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get endTime => throw _privateConstructorUsedError;
  @HiveField(4)
  int get type => throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(5)
  String get description => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get workOrderId => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get location => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isAllDay => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get color => throw _privateConstructorUsedError;
  @HiveField(10)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime get cachedAt => throw _privateConstructorUsedError;
  @HiveField(12)
  bool get isPendingSync => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get pendingAction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarEventHiveModelCopyWith<CalendarEventHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventHiveModelCopyWith<$Res> {
  factory $CalendarEventHiveModelCopyWith(CalendarEventHiveModel value,
          $Res Function(CalendarEventHiveModel) then) =
      _$CalendarEventHiveModelCopyWithImpl<$Res, CalendarEventHiveModel>;
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
      @HiveField(10) Map<String, dynamic>? metadata,
      @HiveField(11) DateTime cachedAt,
      @HiveField(12) bool isPendingSync,
      @HiveField(13) String? pendingAction});
}

/// @nodoc
class _$CalendarEventHiveModelCopyWithImpl<$Res,
        $Val extends CalendarEventHiveModel>
    implements $CalendarEventHiveModelCopyWith<$Res> {
  _$CalendarEventHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _value.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _value.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEventHiveModelImplCopyWith<$Res>
    implements $CalendarEventHiveModelCopyWith<$Res> {
  factory _$$CalendarEventHiveModelImplCopyWith(
          _$CalendarEventHiveModelImpl value,
          $Res Function(_$CalendarEventHiveModelImpl) then) =
      __$$CalendarEventHiveModelImplCopyWithImpl<$Res>;
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
      @HiveField(10) Map<String, dynamic>? metadata,
      @HiveField(11) DateTime cachedAt,
      @HiveField(12) bool isPendingSync,
      @HiveField(13) String? pendingAction});
}

/// @nodoc
class __$$CalendarEventHiveModelImplCopyWithImpl<$Res>
    extends _$CalendarEventHiveModelCopyWithImpl<$Res,
        _$CalendarEventHiveModelImpl>
    implements _$$CalendarEventHiveModelImplCopyWith<$Res> {
  __$$CalendarEventHiveModelImplCopyWithImpl(
      _$CalendarEventHiveModelImpl _value,
      $Res Function(_$CalendarEventHiveModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$CalendarEventHiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _value.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _value.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarEventHiveModelImpl implements _CalendarEventHiveModel {
  const _$CalendarEventHiveModelImpl(
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
      @HiveField(10) final Map<String, dynamic>? metadata,
      @HiveField(11) required this.cachedAt,
      @HiveField(12) this.isPendingSync = false,
      @HiveField(13) this.pendingAction})
      : _metadata = metadata;

  factory _$CalendarEventHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEventHiveModelImplFromJson(json);

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
// Store as int for enum
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
  final Map<String, dynamic>? _metadata;
  @override
  @HiveField(10)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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

  @override
  String toString() {
    return 'CalendarEventHiveModel(id: $id, title: $title, startTime: $startTime, endTime: $endTime, type: $type, description: $description, workOrderId: $workOrderId, location: $location, isAllDay: $isAllDay, color: $color, metadata: $metadata, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventHiveModelImpl &&
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
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.isPendingSync, isPendingSync) ||
                other.isPendingSync == isPendingSync) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
  }

  @JsonKey(ignore: true)
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
      cachedAt,
      isPendingSync,
      pendingAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventHiveModelImplCopyWith<_$CalendarEventHiveModelImpl>
      get copyWith => __$$CalendarEventHiveModelImplCopyWithImpl<
          _$CalendarEventHiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEventHiveModelImplToJson(
      this,
    );
  }
}

abstract class _CalendarEventHiveModel implements CalendarEventHiveModel {
  const factory _CalendarEventHiveModel(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String title,
          @HiveField(2) required final DateTime startTime,
          @HiveField(3) required final DateTime endTime,
          @HiveField(4) required final int type,
          @HiveField(5) required final String description,
          @HiveField(6) final int? workOrderId,
          @HiveField(7) final String? location,
          @HiveField(8) final bool isAllDay,
          @HiveField(9) final String? color,
          @HiveField(10) final Map<String, dynamic>? metadata,
          @HiveField(11) required final DateTime cachedAt,
          @HiveField(12) final bool isPendingSync,
          @HiveField(13) final String? pendingAction}) =
      _$CalendarEventHiveModelImpl;

  factory _CalendarEventHiveModel.fromJson(Map<String, dynamic> json) =
      _$CalendarEventHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  DateTime get startTime;
  @override
  @HiveField(3)
  DateTime get endTime;
  @override
  @HiveField(4)
  int get type;
  @override // Store as int for enum
  @HiveField(5)
  String get description;
  @override
  @HiveField(6)
  int? get workOrderId;
  @override
  @HiveField(7)
  String? get location;
  @override
  @HiveField(8)
  bool get isAllDay;
  @override
  @HiveField(9)
  String? get color;
  @override
  @HiveField(10)
  Map<String, dynamic>? get metadata;
  @override
  @HiveField(11)
  DateTime get cachedAt;
  @override
  @HiveField(12)
  bool get isPendingSync;
  @override
  @HiveField(13)
  String? get pendingAction;
  @override
  @JsonKey(ignore: true)
  _$$CalendarEventHiveModelImplCopyWith<_$CalendarEventHiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
