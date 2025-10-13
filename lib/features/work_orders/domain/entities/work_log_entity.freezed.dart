// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkLogEntity {
  int get id => throw _privateConstructorUsedError;
  int get workOrderId => throw _privateConstructorUsedError;
  WorkLogType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkLogEntityCopyWith<WorkLogEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLogEntityCopyWith<$Res> {
  factory $WorkLogEntityCopyWith(
          WorkLogEntity value, $Res Function(WorkLogEntity) then) =
      _$WorkLogEntityCopyWithImpl<$Res, WorkLogEntity>;
  @useResult
  $Res call(
      {int id,
      int workOrderId,
      WorkLogType type,
      String description,
      DateTime timestamp,
      String? notes,
      double? latitude,
      double? longitude,
      String? userId,
      String? userName});
}

/// @nodoc
class _$WorkLogEntityCopyWithImpl<$Res, $Val extends WorkLogEntity>
    implements $WorkLogEntityCopyWith<$Res> {
  _$WorkLogEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkLogType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkLogEntityImplCopyWith<$Res>
    implements $WorkLogEntityCopyWith<$Res> {
  factory _$$WorkLogEntityImplCopyWith(
          _$WorkLogEntityImpl value, $Res Function(_$WorkLogEntityImpl) then) =
      __$$WorkLogEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int workOrderId,
      WorkLogType type,
      String description,
      DateTime timestamp,
      String? notes,
      double? latitude,
      double? longitude,
      String? userId,
      String? userName});
}

/// @nodoc
class __$$WorkLogEntityImplCopyWithImpl<$Res>
    extends _$WorkLogEntityCopyWithImpl<$Res, _$WorkLogEntityImpl>
    implements _$$WorkLogEntityImplCopyWith<$Res> {
  __$$WorkLogEntityImplCopyWithImpl(
      _$WorkLogEntityImpl _value, $Res Function(_$WorkLogEntityImpl) _then)
      : super(_value, _then);

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
    return _then(_$WorkLogEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkLogType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WorkLogEntityImpl implements _WorkLogEntity {
  const _$WorkLogEntityImpl(
      {required this.id,
      required this.workOrderId,
      required this.type,
      required this.description,
      required this.timestamp,
      this.notes,
      this.latitude,
      this.longitude,
      this.userId,
      this.userName});

  @override
  final int id;
  @override
  final int workOrderId;
  @override
  final WorkLogType type;
  @override
  final String description;
  @override
  final DateTime timestamp;
  @override
  final String? notes;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? userId;
  @override
  final String? userName;

  @override
  String toString() {
    return 'WorkLogEntity(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLogEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLogEntityImplCopyWith<_$WorkLogEntityImpl> get copyWith =>
      __$$WorkLogEntityImplCopyWithImpl<_$WorkLogEntityImpl>(this, _$identity);
}

abstract class _WorkLogEntity implements WorkLogEntity {
  const factory _WorkLogEntity(
      {required final int id,
      required final int workOrderId,
      required final WorkLogType type,
      required final String description,
      required final DateTime timestamp,
      final String? notes,
      final double? latitude,
      final double? longitude,
      final String? userId,
      final String? userName}) = _$WorkLogEntityImpl;

  @override
  int get id;
  @override
  int get workOrderId;
  @override
  WorkLogType get type;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  String? get notes;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get userId;
  @override
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$WorkLogEntityImplCopyWith<_$WorkLogEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
