// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryDto _$InventoryDtoFromJson(Map<String, dynamic> json) {
  return _InventoryDto.fromJson(json);
}

/// @nodoc
mixin _$InventoryDto {
  @JsonKey(name: 'part_id')
  int get partId => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_number')
  String get partNumber => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_quantity')
  int get minQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_quantity')
  int get maxQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String get lastUpdated => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryDtoCopyWith<InventoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryDtoCopyWith<$Res> {
  factory $InventoryDtoCopyWith(
          InventoryDto value, $Res Function(InventoryDto) then) =
      _$InventoryDtoCopyWithImpl<$Res, InventoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'part_number') String partNumber,
      int quantity,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      @JsonKey(name: 'last_updated') String lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class _$InventoryDtoCopyWithImpl<$Res, $Val extends InventoryDto>
    implements $InventoryDtoCopyWith<$Res> {
  _$InventoryDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$InventoryDtoImplCopyWith<$Res>
    implements $InventoryDtoCopyWith<$Res> {
  factory _$$InventoryDtoImplCopyWith(
          _$InventoryDtoImpl value, $Res Function(_$InventoryDtoImpl) then) =
      __$$InventoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'part_number') String partNumber,
      int quantity,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      @JsonKey(name: 'last_updated') String lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class __$$InventoryDtoImplCopyWithImpl<$Res>
    extends _$InventoryDtoCopyWithImpl<$Res, _$InventoryDtoImpl>
    implements _$$InventoryDtoImplCopyWith<$Res> {
  __$$InventoryDtoImplCopyWithImpl(
      _$InventoryDtoImpl _value, $Res Function(_$InventoryDtoImpl) _then)
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
    return _then(_$InventoryDtoImpl(
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
              as String,
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
@JsonSerializable()
class _$InventoryDtoImpl implements _InventoryDto {
  const _$InventoryDtoImpl(
      {@JsonKey(name: 'part_id') required this.partId,
      @JsonKey(name: 'part_number') required this.partNumber,
      required this.quantity,
      @JsonKey(name: 'min_quantity') required this.minQuantity,
      @JsonKey(name: 'max_quantity') required this.maxQuantity,
      @JsonKey(name: 'last_updated') required this.lastUpdated,
      required this.location,
      this.notes});

  factory _$InventoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'part_id')
  final int partId;
  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'min_quantity')
  final int minQuantity;
  @override
  @JsonKey(name: 'max_quantity')
  final int maxQuantity;
  @override
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @override
  final String location;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryDto(partId: $partId, partNumber: $partNumber, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, lastUpdated: $lastUpdated, location: $location, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partId, partNumber, quantity,
      minQuantity, maxQuantity, lastUpdated, location, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryDtoImplCopyWith<_$InventoryDtoImpl> get copyWith =>
      __$$InventoryDtoImplCopyWithImpl<_$InventoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryDtoImplToJson(
      this,
    );
  }
}

abstract class _InventoryDto implements InventoryDto {
  const factory _InventoryDto(
      {@JsonKey(name: 'part_id') required final int partId,
      @JsonKey(name: 'part_number') required final String partNumber,
      required final int quantity,
      @JsonKey(name: 'min_quantity') required final int minQuantity,
      @JsonKey(name: 'max_quantity') required final int maxQuantity,
      @JsonKey(name: 'last_updated') required final String lastUpdated,
      required final String location,
      final String? notes}) = _$InventoryDtoImpl;

  factory _InventoryDto.fromJson(Map<String, dynamic> json) =
      _$InventoryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'part_id')
  int get partId;
  @override
  @JsonKey(name: 'part_number')
  String get partNumber;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'min_quantity')
  int get minQuantity;
  @override
  @JsonKey(name: 'max_quantity')
  int get maxQuantity;
  @override
  @JsonKey(name: 'last_updated')
  String get lastUpdated;
  @override
  String get location;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$InventoryDtoImplCopyWith<_$InventoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryUpdateDto _$InventoryUpdateDtoFromJson(Map<String, dynamic> json) {
  return _InventoryUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$InventoryUpdateDto {
  @JsonKey(name: 'part_id')
  int get partId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_change')
  int get quantityChange => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_order_id')
  String? get workOrderId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryUpdateDtoCopyWith<InventoryUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryUpdateDtoCopyWith<$Res> {
  factory $InventoryUpdateDtoCopyWith(
          InventoryUpdateDto value, $Res Function(InventoryUpdateDto) then) =
      _$InventoryUpdateDtoCopyWithImpl<$Res, InventoryUpdateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      String timestamp,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class _$InventoryUpdateDtoCopyWithImpl<$Res, $Val extends InventoryUpdateDto>
    implements $InventoryUpdateDtoCopyWith<$Res> {
  _$InventoryUpdateDtoCopyWithImpl(this._value, this._then);

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
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$InventoryUpdateDtoImplCopyWith<$Res>
    implements $InventoryUpdateDtoCopyWith<$Res> {
  factory _$$InventoryUpdateDtoImplCopyWith(_$InventoryUpdateDtoImpl value,
          $Res Function(_$InventoryUpdateDtoImpl) then) =
      __$$InventoryUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      String timestamp,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class __$$InventoryUpdateDtoImplCopyWithImpl<$Res>
    extends _$InventoryUpdateDtoCopyWithImpl<$Res, _$InventoryUpdateDtoImpl>
    implements _$$InventoryUpdateDtoImplCopyWith<$Res> {
  __$$InventoryUpdateDtoImplCopyWithImpl(_$InventoryUpdateDtoImpl _value,
      $Res Function(_$InventoryUpdateDtoImpl) _then)
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
    return _then(_$InventoryUpdateDtoImpl(
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
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$InventoryUpdateDtoImpl implements _InventoryUpdateDto {
  const _$InventoryUpdateDtoImpl(
      {@JsonKey(name: 'part_id') required this.partId,
      @JsonKey(name: 'quantity_change') required this.quantityChange,
      required this.type,
      required this.reason,
      required this.timestamp,
      @JsonKey(name: 'work_order_id') this.workOrderId,
      this.notes});

  factory _$InventoryUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryUpdateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'part_id')
  final int partId;
  @override
  @JsonKey(name: 'quantity_change')
  final int quantityChange;
  @override
  final String type;
  @override
  final String reason;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'work_order_id')
  final String? workOrderId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryUpdateDto(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, timestamp: $timestamp, workOrderId: $workOrderId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryUpdateDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partId, quantityChange, type,
      reason, timestamp, workOrderId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryUpdateDtoImplCopyWith<_$InventoryUpdateDtoImpl> get copyWith =>
      __$$InventoryUpdateDtoImplCopyWithImpl<_$InventoryUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _InventoryUpdateDto implements InventoryUpdateDto {
  const factory _InventoryUpdateDto(
      {@JsonKey(name: 'part_id') required final int partId,
      @JsonKey(name: 'quantity_change') required final int quantityChange,
      required final String type,
      required final String reason,
      required final String timestamp,
      @JsonKey(name: 'work_order_id') final String? workOrderId,
      final String? notes}) = _$InventoryUpdateDtoImpl;

  factory _InventoryUpdateDto.fromJson(Map<String, dynamic> json) =
      _$InventoryUpdateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'part_id')
  int get partId;
  @override
  @JsonKey(name: 'quantity_change')
  int get quantityChange;
  @override
  String get type;
  @override
  String get reason;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'work_order_id')
  String? get workOrderId;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$InventoryUpdateDtoImplCopyWith<_$InventoryUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryUpdateRequest _$InventoryUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _InventoryUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$InventoryUpdateRequest {
  @JsonKey(name: 'quantity_change')
  int get quantityChange => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_order_id')
  String? get workOrderId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryUpdateRequestCopyWith<InventoryUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryUpdateRequestCopyWith<$Res> {
  factory $InventoryUpdateRequestCopyWith(InventoryUpdateRequest value,
          $Res Function(InventoryUpdateRequest) then) =
      _$InventoryUpdateRequestCopyWithImpl<$Res, InventoryUpdateRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class _$InventoryUpdateRequestCopyWithImpl<$Res,
        $Val extends InventoryUpdateRequest>
    implements $InventoryUpdateRequestCopyWith<$Res> {
  _$InventoryUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$InventoryUpdateRequestImplCopyWith<$Res>
    implements $InventoryUpdateRequestCopyWith<$Res> {
  factory _$$InventoryUpdateRequestImplCopyWith(
          _$InventoryUpdateRequestImpl value,
          $Res Function(_$InventoryUpdateRequestImpl) then) =
      __$$InventoryUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class __$$InventoryUpdateRequestImplCopyWithImpl<$Res>
    extends _$InventoryUpdateRequestCopyWithImpl<$Res,
        _$InventoryUpdateRequestImpl>
    implements _$$InventoryUpdateRequestImplCopyWith<$Res> {
  __$$InventoryUpdateRequestImplCopyWithImpl(
      _$InventoryUpdateRequestImpl _value,
      $Res Function(_$InventoryUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$InventoryUpdateRequestImpl(
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$InventoryUpdateRequestImpl implements _InventoryUpdateRequest {
  const _$InventoryUpdateRequestImpl(
      {@JsonKey(name: 'quantity_change') required this.quantityChange,
      required this.type,
      required this.reason,
      @JsonKey(name: 'work_order_id') this.workOrderId,
      this.notes});

  factory _$InventoryUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryUpdateRequestImplFromJson(json);

  @override
  @JsonKey(name: 'quantity_change')
  final int quantityChange;
  @override
  final String type;
  @override
  final String reason;
  @override
  @JsonKey(name: 'work_order_id')
  final String? workOrderId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryUpdateRequest(quantityChange: $quantityChange, type: $type, reason: $reason, workOrderId: $workOrderId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryUpdateRequestImpl &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, quantityChange, type, reason, workOrderId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryUpdateRequestImplCopyWith<_$InventoryUpdateRequestImpl>
      get copyWith => __$$InventoryUpdateRequestImplCopyWithImpl<
          _$InventoryUpdateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _InventoryUpdateRequest implements InventoryUpdateRequest {
  const factory _InventoryUpdateRequest(
      {@JsonKey(name: 'quantity_change') required final int quantityChange,
      required final String type,
      required final String reason,
      @JsonKey(name: 'work_order_id') final String? workOrderId,
      final String? notes}) = _$InventoryUpdateRequestImpl;

  factory _InventoryUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$InventoryUpdateRequestImpl.fromJson;

  @override
  @JsonKey(name: 'quantity_change')
  int get quantityChange;
  @override
  String get type;
  @override
  String get reason;
  @override
  @JsonKey(name: 'work_order_id')
  String? get workOrderId;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$InventoryUpdateRequestImplCopyWith<_$InventoryUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PartsResponse _$PartsResponseFromJson(Map<String, dynamic> json) {
  return _PartsResponse.fromJson(json);
}

/// @nodoc
mixin _$PartsResponse {
  List<PartDto> get parts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartsResponseCopyWith<PartsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartsResponseCopyWith<$Res> {
  factory $PartsResponseCopyWith(
          PartsResponse value, $Res Function(PartsResponse) then) =
      _$PartsResponseCopyWithImpl<$Res, PartsResponse>;
  @useResult
  $Res call(
      {List<PartDto> parts,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class _$PartsResponseCopyWithImpl<$Res, $Val extends PartsResponse>
    implements $PartsResponseCopyWith<$Res> {
  _$PartsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartsResponseImplCopyWith<$Res>
    implements $PartsResponseCopyWith<$Res> {
  factory _$$PartsResponseImplCopyWith(
          _$PartsResponseImpl value, $Res Function(_$PartsResponseImpl) then) =
      __$$PartsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PartDto> parts,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class __$$PartsResponseImplCopyWithImpl<$Res>
    extends _$PartsResponseCopyWithImpl<$Res, _$PartsResponseImpl>
    implements _$$PartsResponseImplCopyWith<$Res> {
  __$$PartsResponseImplCopyWithImpl(
      _$PartsResponseImpl _value, $Res Function(_$PartsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_$PartsResponseImpl(
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartsResponseImpl implements _PartsResponse {
  const _$PartsResponseImpl(
      {required final List<PartDto> parts,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'total_pages') required this.totalPages})
      : _parts = parts;

  factory _$PartsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartsResponseImplFromJson(json);

  final List<PartDto> _parts;
  @override
  List<PartDto> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  String toString() {
    return 'PartsResponse(parts: $parts, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartsResponseImpl &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_parts),
      totalCount,
      currentPage,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartsResponseImplCopyWith<_$PartsResponseImpl> get copyWith =>
      __$$PartsResponseImplCopyWithImpl<_$PartsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartsResponseImplToJson(
      this,
    );
  }
}

abstract class _PartsResponse implements PartsResponse {
  const factory _PartsResponse(
          {required final List<PartDto> parts,
          @JsonKey(name: 'total_count') required final int totalCount,
          @JsonKey(name: 'current_page') required final int currentPage,
          @JsonKey(name: 'total_pages') required final int totalPages}) =
      _$PartsResponseImpl;

  factory _PartsResponse.fromJson(Map<String, dynamic> json) =
      _$PartsResponseImpl.fromJson;

  @override
  List<PartDto> get parts;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$PartsResponseImplCopyWith<_$PartsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryResponse _$InventoryResponseFromJson(Map<String, dynamic> json) {
  return _InventoryResponse.fromJson(json);
}

/// @nodoc
mixin _$InventoryResponse {
  List<InventoryDto> get inventory => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryResponseCopyWith<InventoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryResponseCopyWith<$Res> {
  factory $InventoryResponseCopyWith(
          InventoryResponse value, $Res Function(InventoryResponse) then) =
      _$InventoryResponseCopyWithImpl<$Res, InventoryResponse>;
  @useResult
  $Res call(
      {List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class _$InventoryResponseCopyWithImpl<$Res, $Val extends InventoryResponse>
    implements $InventoryResponseCopyWith<$Res> {
  _$InventoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventory = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryResponseImplCopyWith<$Res>
    implements $InventoryResponseCopyWith<$Res> {
  factory _$$InventoryResponseImplCopyWith(_$InventoryResponseImpl value,
          $Res Function(_$InventoryResponseImpl) then) =
      __$$InventoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class __$$InventoryResponseImplCopyWithImpl<$Res>
    extends _$InventoryResponseCopyWithImpl<$Res, _$InventoryResponseImpl>
    implements _$$InventoryResponseImplCopyWith<$Res> {
  __$$InventoryResponseImplCopyWithImpl(_$InventoryResponseImpl _value,
      $Res Function(_$InventoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventory = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_$InventoryResponseImpl(
      inventory: null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryResponseImpl implements _InventoryResponse {
  const _$InventoryResponseImpl(
      {required final List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'total_pages') required this.totalPages})
      : _inventory = inventory;

  factory _$InventoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryResponseImplFromJson(json);

  final List<InventoryDto> _inventory;
  @override
  List<InventoryDto> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  String toString() {
    return 'InventoryResponse(inventory: $inventory, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_inventory),
      totalCount,
      currentPage,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryResponseImplCopyWith<_$InventoryResponseImpl> get copyWith =>
      __$$InventoryResponseImplCopyWithImpl<_$InventoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryResponseImplToJson(
      this,
    );
  }
}

abstract class _InventoryResponse implements InventoryResponse {
  const factory _InventoryResponse(
          {required final List<InventoryDto> inventory,
          @JsonKey(name: 'total_count') required final int totalCount,
          @JsonKey(name: 'current_page') required final int currentPage,
          @JsonKey(name: 'total_pages') required final int totalPages}) =
      _$InventoryResponseImpl;

  factory _InventoryResponse.fromJson(Map<String, dynamic> json) =
      _$InventoryResponseImpl.fromJson;

  @override
  List<InventoryDto> get inventory;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$InventoryResponseImplCopyWith<_$InventoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
