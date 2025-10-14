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
  String get partNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  String get partName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get category => throw _privateConstructorUsedError;
  @HiveField(3)
  int get quantityAvailable => throw _privateConstructorUsedError;
  @HiveField(4)
  double get unitPrice => throw _privateConstructorUsedError;
  @HiveField(5)
  int get status => throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(6)
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
      {@HiveField(0) String partNumber,
      @HiveField(1) String partName,
      @HiveField(2) String category,
      @HiveField(3) int quantityAvailable,
      @HiveField(4) double unitPrice,
      @HiveField(5) int status,
      @HiveField(6) DateTime cachedAt});
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
    Object? partNumber = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
    Object? cachedAt = null,
  }) {
    return _then(_value.copyWith(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _value.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@HiveField(0) String partNumber,
      @HiveField(1) String partName,
      @HiveField(2) String category,
      @HiveField(3) int quantityAvailable,
      @HiveField(4) double unitPrice,
      @HiveField(5) int status,
      @HiveField(6) DateTime cachedAt});
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
    Object? partNumber = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
    Object? cachedAt = null,
  }) {
    return _then(_$PartHiveModelImpl(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _value.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@HiveField(0) required this.partNumber,
      @HiveField(1) required this.partName,
      @HiveField(2) required this.category,
      @HiveField(3) required this.quantityAvailable,
      @HiveField(4) required this.unitPrice,
      @HiveField(5) required this.status,
      @HiveField(6) required this.cachedAt});

  factory _$PartHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartHiveModelImplFromJson(json);

  @override
  @HiveField(0)
  final String partNumber;
  @override
  @HiveField(1)
  final String partName;
  @override
  @HiveField(2)
  final String category;
  @override
  @HiveField(3)
  final int quantityAvailable;
  @override
  @HiveField(4)
  final double unitPrice;
  @override
  @HiveField(5)
  final int status;
// Store as int for enum
  @override
  @HiveField(6)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'PartHiveModel(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartHiveModelImpl &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status, cachedAt);

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
      {@HiveField(0) required final String partNumber,
      @HiveField(1) required final String partName,
      @HiveField(2) required final String category,
      @HiveField(3) required final int quantityAvailable,
      @HiveField(4) required final double unitPrice,
      @HiveField(5) required final int status,
      @HiveField(6) required final DateTime cachedAt}) = _$PartHiveModelImpl;

  factory _PartHiveModel.fromJson(Map<String, dynamic> json) =
      _$PartHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  String get partNumber;
  @override
  @HiveField(1)
  String get partName;
  @override
  @HiveField(2)
  String get category;
  @override
  @HiveField(3)
  int get quantityAvailable;
  @override
  @HiveField(4)
  double get unitPrice;
  @override
  @HiveField(5)
  int get status;
  @override // Store as int for enum
  @HiveField(6)
  DateTime get cachedAt;
  @override
  @JsonKey(ignore: true)
  _$$PartHiveModelImplCopyWith<_$PartHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
