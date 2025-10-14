// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryEntity {
  int get partId => throw _privateConstructorUsedError;
  String get partNumber => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get minQuantity => throw _privateConstructorUsedError;
  int get maxQuantity => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InventoryEntityCopyWith<InventoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryEntityCopyWith<$Res> {
  factory $InventoryEntityCopyWith(
          InventoryEntity value, $Res Function(InventoryEntity) then) =
      _$InventoryEntityCopyWithImpl<$Res, InventoryEntity>;
  @useResult
  $Res call(
      {int partId,
      String partNumber,
      int quantity,
      int minQuantity,
      int maxQuantity,
      DateTime lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class _$InventoryEntityCopyWithImpl<$Res, $Val extends InventoryEntity>
    implements $InventoryEntityCopyWith<$Res> {
  _$InventoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? partNumber = null,
    Object? quantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? lastUpdated = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryEntityImplCopyWith<$Res>
    implements $InventoryEntityCopyWith<$Res> {
  factory _$$InventoryEntityImplCopyWith(_$InventoryEntityImpl value,
          $Res Function(_$InventoryEntityImpl) then) =
      __$$InventoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int partId,
      String partNumber,
      int quantity,
      int minQuantity,
      int maxQuantity,
      DateTime lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class __$$InventoryEntityImplCopyWithImpl<$Res>
    extends _$InventoryEntityCopyWithImpl<$Res, _$InventoryEntityImpl>
    implements _$$InventoryEntityImplCopyWith<$Res> {
  __$$InventoryEntityImplCopyWithImpl(
      _$InventoryEntityImpl _value, $Res Function(_$InventoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? partNumber = null,
    Object? quantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? lastUpdated = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_$InventoryEntityImpl(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InventoryEntityImpl extends _InventoryEntity {
  const _$InventoryEntityImpl(
      {required this.partId,
      required this.partNumber,
      required this.quantity,
      required this.minQuantity,
      required this.maxQuantity,
      required this.lastUpdated,
      required this.location,
      this.notes})
      : super._();

  @override
  final int partId;
  @override
  final String partNumber;
  @override
  final int quantity;
  @override
  final int minQuantity;
  @override
  final int maxQuantity;
  @override
  final DateTime lastUpdated;
  @override
  final String location;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryEntity(partId: $partId, partNumber: $partNumber, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, lastUpdated: $lastUpdated, location: $location, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryEntityImpl &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partId, partNumber, quantity,
      minQuantity, maxQuantity, lastUpdated, location, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryEntityImplCopyWith<_$InventoryEntityImpl> get copyWith =>
      __$$InventoryEntityImplCopyWithImpl<_$InventoryEntityImpl>(
          this, _$identity);
}

abstract class _InventoryEntity extends InventoryEntity {
  const factory _InventoryEntity(
      {required final int partId,
      required final String partNumber,
      required final int quantity,
      required final int minQuantity,
      required final int maxQuantity,
      required final DateTime lastUpdated,
      required final String location,
      final String? notes}) = _$InventoryEntityImpl;
  const _InventoryEntity._() : super._();

  @override
  int get partId;
  @override
  String get partNumber;
  @override
  int get quantity;
  @override
  int get minQuantity;
  @override
  int get maxQuantity;
  @override
  DateTime get lastUpdated;
  @override
  String get location;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$InventoryEntityImplCopyWith<_$InventoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryUpdateEntity {
  int get partId => throw _privateConstructorUsedError;
  int get quantityChange => throw _privateConstructorUsedError;
  InventoryUpdateType get type => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get workOrderId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InventoryUpdateEntityCopyWith<InventoryUpdateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryUpdateEntityCopyWith<$Res> {
  factory $InventoryUpdateEntityCopyWith(InventoryUpdateEntity value,
          $Res Function(InventoryUpdateEntity) then) =
      _$InventoryUpdateEntityCopyWithImpl<$Res, InventoryUpdateEntity>;
  @useResult
  $Res call(
      {int partId,
      int quantityChange,
      InventoryUpdateType type,
      String reason,
      DateTime timestamp,
      String? workOrderId,
      String? notes});
}

/// @nodoc
class _$InventoryUpdateEntityCopyWithImpl<$Res,
        $Val extends InventoryUpdateEntity>
    implements $InventoryUpdateEntityCopyWith<$Res> {
  _$InventoryUpdateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? timestamp = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InventoryUpdateType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workOrderId: freezed == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryUpdateEntityImplCopyWith<$Res>
    implements $InventoryUpdateEntityCopyWith<$Res> {
  factory _$$InventoryUpdateEntityImplCopyWith(
          _$InventoryUpdateEntityImpl value,
          $Res Function(_$InventoryUpdateEntityImpl) then) =
      __$$InventoryUpdateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int partId,
      int quantityChange,
      InventoryUpdateType type,
      String reason,
      DateTime timestamp,
      String? workOrderId,
      String? notes});
}

/// @nodoc
class __$$InventoryUpdateEntityImplCopyWithImpl<$Res>
    extends _$InventoryUpdateEntityCopyWithImpl<$Res,
        _$InventoryUpdateEntityImpl>
    implements _$$InventoryUpdateEntityImplCopyWith<$Res> {
  __$$InventoryUpdateEntityImplCopyWithImpl(_$InventoryUpdateEntityImpl _value,
      $Res Function(_$InventoryUpdateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? timestamp = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$InventoryUpdateEntityImpl(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InventoryUpdateType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workOrderId: freezed == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InventoryUpdateEntityImpl implements _InventoryUpdateEntity {
  const _$InventoryUpdateEntityImpl(
      {required this.partId,
      required this.quantityChange,
      required this.type,
      required this.reason,
      required this.timestamp,
      this.workOrderId,
      this.notes});

  @override
  final int partId;
  @override
  final int quantityChange;
  @override
  final InventoryUpdateType type;
  @override
  final String reason;
  @override
  final DateTime timestamp;
  @override
  final String? workOrderId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryUpdateEntity(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, timestamp: $timestamp, workOrderId: $workOrderId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryUpdateEntityImpl &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partId, quantityChange, type,
      reason, timestamp, workOrderId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryUpdateEntityImplCopyWith<_$InventoryUpdateEntityImpl>
      get copyWith => __$$InventoryUpdateEntityImplCopyWithImpl<
          _$InventoryUpdateEntityImpl>(this, _$identity);
}

abstract class _InventoryUpdateEntity implements InventoryUpdateEntity {
  const factory _InventoryUpdateEntity(
      {required final int partId,
      required final int quantityChange,
      required final InventoryUpdateType type,
      required final String reason,
      required final DateTime timestamp,
      final String? workOrderId,
      final String? notes}) = _$InventoryUpdateEntityImpl;

  @override
  int get partId;
  @override
  int get quantityChange;
  @override
  InventoryUpdateType get type;
  @override
  String get reason;
  @override
  DateTime get timestamp;
  @override
  String? get workOrderId;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$InventoryUpdateEntityImplCopyWith<_$InventoryUpdateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
