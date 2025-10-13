// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkLogDto _$WorkLogDtoFromJson(Map<String, dynamic> json) {
  return _WorkLogDto.fromJson(json);
}

/// @nodoc
mixin _$WorkLogDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_order_id')
  int get workOrderId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkLogDtoCopyWith<WorkLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLogDtoCopyWith<$Res> {
  factory $WorkLogDtoCopyWith(
          WorkLogDto value, $Res Function(WorkLogDto) then) =
      _$WorkLogDtoCopyWithImpl<$Res, WorkLogDto>;
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
class _$WorkLogDtoCopyWithImpl<$Res, $Val extends WorkLogDto>
    implements $WorkLogDtoCopyWith<$Res> {
  _$WorkLogDtoCopyWithImpl(this._value, this._then);

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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$WorkLogDtoImplCopyWith<$Res>
    implements $WorkLogDtoCopyWith<$Res> {
  factory _$$WorkLogDtoImplCopyWith(
          _$WorkLogDtoImpl value, $Res Function(_$WorkLogDtoImpl) then) =
      __$$WorkLogDtoImplCopyWithImpl<$Res>;
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
class __$$WorkLogDtoImplCopyWithImpl<$Res>
    extends _$WorkLogDtoCopyWithImpl<$Res, _$WorkLogDtoImpl>
    implements _$$WorkLogDtoImplCopyWith<$Res> {
  __$$WorkLogDtoImplCopyWithImpl(
      _$WorkLogDtoImpl _value, $Res Function(_$WorkLogDtoImpl) _then)
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
    return _then(_$WorkLogDtoImpl(
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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$WorkLogDtoImpl implements _WorkLogDto {
  const _$WorkLogDtoImpl(
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

  factory _$WorkLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkLogDtoImplFromJson(json);

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

  @override
  String toString() {
    return 'WorkLogDto(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLogDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLogDtoImplCopyWith<_$WorkLogDtoImpl> get copyWith =>
      __$$WorkLogDtoImplCopyWithImpl<_$WorkLogDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkLogDtoImplToJson(
      this,
    );
  }
}

abstract class _WorkLogDto implements WorkLogDto {
  const factory _WorkLogDto(
      {required final int id,
      @JsonKey(name: 'work_order_id') required final int workOrderId,
      required final String type,
      required final String description,
      required final String timestamp,
      final String? notes,
      final double? latitude,
      final double? longitude,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'user_name') final String? userName}) = _$WorkLogDtoImpl;

  factory _WorkLogDto.fromJson(Map<String, dynamic> json) =
      _$WorkLogDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'work_order_id')
  int get workOrderId;
  @override
  String get type;
  @override
  String get description;
  @override
  String get timestamp;
  @override
  String? get notes;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$WorkLogDtoImplCopyWith<_$WorkLogDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
