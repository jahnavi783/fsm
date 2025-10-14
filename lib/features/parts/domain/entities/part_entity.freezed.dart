// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PartEntity {
  String get partNumber => throw _privateConstructorUsedError;
  String get partName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get quantityAvailable => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  PartStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartEntityCopyWith<PartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartEntityCopyWith<$Res> {
  factory $PartEntityCopyWith(
          PartEntity value, $Res Function(PartEntity) then) =
      _$PartEntityCopyWithImpl<$Res, PartEntity>;
  @useResult
  $Res call(
      {String partNumber,
      String partName,
      String category,
      int quantityAvailable,
      double unitPrice,
      PartStatus status});
}

/// @nodoc
class _$PartEntityCopyWithImpl<$Res, $Val extends PartEntity>
    implements $PartEntityCopyWith<$Res> {
  _$PartEntityCopyWithImpl(this._value, this._then);

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
              as PartStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartEntityImplCopyWith<$Res>
    implements $PartEntityCopyWith<$Res> {
  factory _$$PartEntityImplCopyWith(
          _$PartEntityImpl value, $Res Function(_$PartEntityImpl) then) =
      __$$PartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String partNumber,
      String partName,
      String category,
      int quantityAvailable,
      double unitPrice,
      PartStatus status});
}

/// @nodoc
class __$$PartEntityImplCopyWithImpl<$Res>
    extends _$PartEntityCopyWithImpl<$Res, _$PartEntityImpl>
    implements _$$PartEntityImplCopyWith<$Res> {
  __$$PartEntityImplCopyWithImpl(
      _$PartEntityImpl _value, $Res Function(_$PartEntityImpl) _then)
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
  }) {
    return _then(_$PartEntityImpl(
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
              as PartStatus,
    ));
  }
}

/// @nodoc

class _$PartEntityImpl extends _PartEntity {
  const _$PartEntityImpl(
      {required this.partNumber,
      required this.partName,
      required this.category,
      required this.quantityAvailable,
      required this.unitPrice,
      required this.status})
      : super._();

  @override
  final String partNumber;
  @override
  final String partName;
  @override
  final String category;
  @override
  final int quantityAvailable;
  @override
  final double unitPrice;
  @override
  final PartStatus status;

  @override
  String toString() {
    return 'PartEntity(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartEntityImpl &&
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
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartEntityImplCopyWith<_$PartEntityImpl> get copyWith =>
      __$$PartEntityImplCopyWithImpl<_$PartEntityImpl>(this, _$identity);
}

abstract class _PartEntity extends PartEntity {
  const factory _PartEntity(
      {required final String partNumber,
      required final String partName,
      required final String category,
      required final int quantityAvailable,
      required final double unitPrice,
      required final PartStatus status}) = _$PartEntityImpl;
  const _PartEntity._() : super._();

  @override
  String get partNumber;
  @override
  String get partName;
  @override
  String get category;
  @override
  int get quantityAvailable;
  @override
  double get unitPrice;
  @override
  PartStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$PartEntityImplCopyWith<_$PartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
