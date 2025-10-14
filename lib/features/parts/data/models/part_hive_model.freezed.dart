// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartHiveModel _$PartHiveModelFromJson(Map<String, dynamic> json) {
  return _PartHiveModel.fromJson(json);
}

/// @nodoc
mixin _$PartHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get partNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  String get partName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String get category => throw _privateConstructorUsedError;
  @HiveField(5)
  double get unitPrice => throw _privateConstructorUsedError;
  @HiveField(6)
  int get quantityAvailable => throw _privateConstructorUsedError;
  @HiveField(7)
  int get minQuantity => throw _privateConstructorUsedError;
  @HiveField(8)
  int get maxQuantity => throw _privateConstructorUsedError;
  @HiveField(9)
  String get unit => throw _privateConstructorUsedError;
  @HiveField(10)
  int get status => throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(11)
  List<String> get compatibleModels => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get imageUrl => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get specifications => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  @HiveField(15)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartHiveModelCopyWith<PartHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartHiveModelCopyWith<$Res> {
  factory $PartHiveModelCopyWith(
          PartHiveModel value, $Res Function(PartHiveModel) then) =
      _$PartHiveModelCopyWithImpl<$Res, PartHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String partNumber,
      @HiveField(2) String partName,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) double unitPrice,
      @HiveField(6) int quantityAvailable,
      @HiveField(7) int minQuantity,
      @HiveField(8) int maxQuantity,
      @HiveField(9) String unit,
      @HiveField(10) int status,
      @HiveField(11) List<String> compatibleModels,
      @HiveField(12) String? imageUrl,
      @HiveField(13) String? specifications,
      @HiveField(14) DateTime? lastUpdated,
      @HiveField(15) DateTime cachedAt});
}

/// @nodoc
class _$PartHiveModelCopyWithImpl<$Res, $Val extends PartHiveModel>
    implements $PartHiveModelCopyWith<$Res> {
  _$PartHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partNumber = null,
    Object? partName = null,
    Object? description = null,
    Object? category = null,
    Object? unitPrice = null,
    Object? quantityAvailable = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? unit = null,
    Object? status = null,
    Object? compatibleModels = null,
    Object? imageUrl = freezed,
    Object? specifications = freezed,
    Object? lastUpdated = freezed,
    Object? cachedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantityAvailable: null == quantityAvailable
          ? _value.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      compatibleModels: null == compatibleModels
          ? _value.compatibleModels
          : compatibleModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartHiveModelImplCopyWith<$Res>
    implements $PartHiveModelCopyWith<$Res> {
  factory _$$PartHiveModelImplCopyWith(
          _$PartHiveModelImpl value, $Res Function(_$PartHiveModelImpl) then) =
      __$$PartHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String partNumber,
      @HiveField(2) String partName,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) double unitPrice,
      @HiveField(6) int quantityAvailable,
      @HiveField(7) int minQuantity,
      @HiveField(8) int maxQuantity,
      @HiveField(9) String unit,
      @HiveField(10) int status,
      @HiveField(11) List<String> compatibleModels,
      @HiveField(12) String? imageUrl,
      @HiveField(13) String? specifications,
      @HiveField(14) DateTime? lastUpdated,
      @HiveField(15) DateTime cachedAt});
}

/// @nodoc
class __$$PartHiveModelImplCopyWithImpl<$Res>
    extends _$PartHiveModelCopyWithImpl<$Res, _$PartHiveModelImpl>
    implements _$$PartHiveModelImplCopyWith<$Res> {
  __$$PartHiveModelImplCopyWithImpl(
      _$PartHiveModelImpl _value, $Res Function(_$PartHiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partNumber = null,
    Object? partName = null,
    Object? description = null,
    Object? category = null,
    Object? unitPrice = null,
    Object? quantityAvailable = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? unit = null,
    Object? status = null,
    Object? compatibleModels = null,
    Object? imageUrl = freezed,
    Object? specifications = freezed,
    Object? lastUpdated = freezed,
    Object? cachedAt = null,
  }) {
    return _then(_$PartHiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantityAvailable: null == quantityAvailable
          ? _value.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      compatibleModels: null == compatibleModels
          ? _value._compatibleModels
          : compatibleModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartHiveModelImpl implements _PartHiveModel {
  const _$PartHiveModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.partNumber,
      @HiveField(2) required this.partName,
      @HiveField(3) required this.description,
      @HiveField(4) required this.category,
      @HiveField(5) required this.unitPrice,
      @HiveField(6) required this.quantityAvailable,
      @HiveField(7) required this.minQuantity,
      @HiveField(8) required this.maxQuantity,
      @HiveField(9) required this.unit,
      @HiveField(10) required this.status,
      @HiveField(11) final List<String> compatibleModels = const [],
      @HiveField(12) this.imageUrl,
      @HiveField(13) this.specifications,
      @HiveField(14) this.lastUpdated,
      @HiveField(15) required this.cachedAt})
      : _compatibleModels = compatibleModels;

  factory _$PartHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartHiveModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String partNumber;
  @override
  @HiveField(2)
  final String partName;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final String category;
  @override
  @HiveField(5)
  final double unitPrice;
  @override
  @HiveField(6)
  final int quantityAvailable;
  @override
  @HiveField(7)
  final int minQuantity;
  @override
  @HiveField(8)
  final int maxQuantity;
  @override
  @HiveField(9)
  final String unit;
  @override
  @HiveField(10)
  final int status;
// Store as int for enum
  final List<String> _compatibleModels;
// Store as int for enum
  @override
  @JsonKey()
  @HiveField(11)
  List<String> get compatibleModels {
    if (_compatibleModels is EqualUnmodifiableListView)
      return _compatibleModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_compatibleModels);
  }

  @override
  @HiveField(12)
  final String? imageUrl;
  @override
  @HiveField(13)
  final String? specifications;
  @override
  @HiveField(14)
  final DateTime? lastUpdated;
  @override
  @HiveField(15)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'PartHiveModel(id: $id, partNumber: $partNumber, partName: $partName, description: $description, category: $category, unitPrice: $unitPrice, quantityAvailable: $quantityAvailable, minQuantity: $minQuantity, maxQuantity: $maxQuantity, unit: $unit, status: $status, compatibleModels: $compatibleModels, imageUrl: $imageUrl, specifications: $specifications, lastUpdated: $lastUpdated, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartHiveModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._compatibleModels, _compatibleModels) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      partNumber,
      partName,
      description,
      category,
      unitPrice,
      quantityAvailable,
      minQuantity,
      maxQuantity,
      unit,
      status,
      const DeepCollectionEquality().hash(_compatibleModels),
      imageUrl,
      specifications,
      lastUpdated,
      cachedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartHiveModelImplCopyWith<_$PartHiveModelImpl> get copyWith =>
      __$$PartHiveModelImplCopyWithImpl<_$PartHiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartHiveModelImplToJson(
      this,
    );
  }
}

abstract class _PartHiveModel implements PartHiveModel {
  const factory _PartHiveModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String partNumber,
      @HiveField(2) required final String partName,
      @HiveField(3) required final String description,
      @HiveField(4) required final String category,
      @HiveField(5) required final double unitPrice,
      @HiveField(6) required final int quantityAvailable,
      @HiveField(7) required final int minQuantity,
      @HiveField(8) required final int maxQuantity,
      @HiveField(9) required final String unit,
      @HiveField(10) required final int status,
      @HiveField(11) final List<String> compatibleModels,
      @HiveField(12) final String? imageUrl,
      @HiveField(13) final String? specifications,
      @HiveField(14) final DateTime? lastUpdated,
      @HiveField(15) required final DateTime cachedAt}) = _$PartHiveModelImpl;

  factory _PartHiveModel.fromJson(Map<String, dynamic> json) =
      _$PartHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get partNumber;
  @override
  @HiveField(2)
  String get partName;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  String get category;
  @override
  @HiveField(5)
  double get unitPrice;
  @override
  @HiveField(6)
  int get quantityAvailable;
  @override
  @HiveField(7)
  int get minQuantity;
  @override
  @HiveField(8)
  int get maxQuantity;
  @override
  @HiveField(9)
  String get unit;
  @override
  @HiveField(10)
  int get status;
  @override // Store as int for enum
  @HiveField(11)
  List<String> get compatibleModels;
  @override
  @HiveField(12)
  String? get imageUrl;
  @override
  @HiveField(13)
  String? get specifications;
  @override
  @HiveField(14)
  DateTime? get lastUpdated;
  @override
  @HiveField(15)
  DateTime get cachedAt;
  @override
  @JsonKey(ignore: true)
  _$$PartHiveModelImplCopyWith<_$PartHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryHiveModel _$InventoryHiveModelFromJson(Map<String, dynamic> json) {
  return _InventoryHiveModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryHiveModel {
  @HiveField(0)
  int get partId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get partNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  int get minQuantity => throw _privateConstructorUsedError;
  @HiveField(4)
  int get maxQuantity => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  @HiveField(6)
  String get location => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryHiveModelCopyWith<InventoryHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryHiveModelCopyWith<$Res> {
  factory $InventoryHiveModelCopyWith(
          InventoryHiveModel value, $Res Function(InventoryHiveModel) then) =
      _$InventoryHiveModelCopyWithImpl<$Res, InventoryHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) int partId,
      @HiveField(1) String partNumber,
      @HiveField(2) int quantity,
      @HiveField(3) int minQuantity,
      @HiveField(4) int maxQuantity,
      @HiveField(5) DateTime lastUpdated,
      @HiveField(6) String location,
      @HiveField(7) String? notes,
      @HiveField(8) DateTime cachedAt});
}

/// @nodoc
class _$InventoryHiveModelCopyWithImpl<$Res, $Val extends InventoryHiveModel>
    implements $InventoryHiveModelCopyWith<$Res> {
  _$InventoryHiveModelCopyWithImpl(this._value, this._then);

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
    Object? cachedAt = null,
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
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryHiveModelImplCopyWith<$Res>
    implements $InventoryHiveModelCopyWith<$Res> {
  factory _$$InventoryHiveModelImplCopyWith(_$InventoryHiveModelImpl value,
          $Res Function(_$InventoryHiveModelImpl) then) =
      __$$InventoryHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int partId,
      @HiveField(1) String partNumber,
      @HiveField(2) int quantity,
      @HiveField(3) int minQuantity,
      @HiveField(4) int maxQuantity,
      @HiveField(5) DateTime lastUpdated,
      @HiveField(6) String location,
      @HiveField(7) String? notes,
      @HiveField(8) DateTime cachedAt});
}

/// @nodoc
class __$$InventoryHiveModelImplCopyWithImpl<$Res>
    extends _$InventoryHiveModelCopyWithImpl<$Res, _$InventoryHiveModelImpl>
    implements _$$InventoryHiveModelImplCopyWith<$Res> {
  __$$InventoryHiveModelImplCopyWithImpl(_$InventoryHiveModelImpl _value,
      $Res Function(_$InventoryHiveModelImpl) _then)
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
    Object? cachedAt = null,
  }) {
    return _then(_$InventoryHiveModelImpl(
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
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryHiveModelImpl implements _InventoryHiveModel {
  const _$InventoryHiveModelImpl(
      {@HiveField(0) required this.partId,
      @HiveField(1) required this.partNumber,
      @HiveField(2) required this.quantity,
      @HiveField(3) required this.minQuantity,
      @HiveField(4) required this.maxQuantity,
      @HiveField(5) required this.lastUpdated,
      @HiveField(6) required this.location,
      @HiveField(7) this.notes,
      @HiveField(8) required this.cachedAt});

  factory _$InventoryHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryHiveModelImplFromJson(json);

  @override
  @HiveField(0)
  final int partId;
  @override
  @HiveField(1)
  final String partNumber;
  @override
  @HiveField(2)
  final int quantity;
  @override
  @HiveField(3)
  final int minQuantity;
  @override
  @HiveField(4)
  final int maxQuantity;
  @override
  @HiveField(5)
  final DateTime lastUpdated;
  @override
  @HiveField(6)
  final String location;
  @override
  @HiveField(7)
  final String? notes;
  @override
  @HiveField(8)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'InventoryHiveModel(partId: $partId, partNumber: $partNumber, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, lastUpdated: $lastUpdated, location: $location, notes: $notes, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryHiveModelImpl &&
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
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partId, partNumber, quantity,
      minQuantity, maxQuantity, lastUpdated, location, notes, cachedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryHiveModelImplCopyWith<_$InventoryHiveModelImpl> get copyWith =>
      __$$InventoryHiveModelImplCopyWithImpl<_$InventoryHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryHiveModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryHiveModel implements InventoryHiveModel {
  const factory _InventoryHiveModel(
          {@HiveField(0) required final int partId,
          @HiveField(1) required final String partNumber,
          @HiveField(2) required final int quantity,
          @HiveField(3) required final int minQuantity,
          @HiveField(4) required final int maxQuantity,
          @HiveField(5) required final DateTime lastUpdated,
          @HiveField(6) required final String location,
          @HiveField(7) final String? notes,
          @HiveField(8) required final DateTime cachedAt}) =
      _$InventoryHiveModelImpl;

  factory _InventoryHiveModel.fromJson(Map<String, dynamic> json) =
      _$InventoryHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get partId;
  @override
  @HiveField(1)
  String get partNumber;
  @override
  @HiveField(2)
  int get quantity;
  @override
  @HiveField(3)
  int get minQuantity;
  @override
  @HiveField(4)
  int get maxQuantity;
  @override
  @HiveField(5)
  DateTime get lastUpdated;
  @override
  @HiveField(6)
  String get location;
  @override
  @HiveField(7)
  String? get notes;
  @override
  @HiveField(8)
  DateTime get cachedAt;
  @override
  @JsonKey(ignore: true)
  _$$InventoryHiveModelImplCopyWith<_$InventoryHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
