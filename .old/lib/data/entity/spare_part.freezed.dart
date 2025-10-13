// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spare_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SparePartEntity {
  @JsonKey(name: 'part_number')
  String get partNumber;
  @JsonKey(name: 'part_name')
  String get partName;
  @JsonKey(name: 'category')
  String get category;
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable;
  @JsonKey(name: 'unit_price')
  String get unitPrice;
  String get status;

  /// Create a copy of SparePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SparePartEntityCopyWith<SparePartEntity> get copyWith =>
      _$SparePartEntityCopyWithImpl<SparePartEntity>(
          this as SparePartEntity, _$identity);

  /// Serializes this SparePartEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SparePartEntity &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status);

  @override
  String toString() {
    return 'SparePartEntity(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class $SparePartEntityCopyWith<$Res> {
  factory $SparePartEntityCopyWith(
          SparePartEntity value, $Res Function(SparePartEntity) _then) =
      _$SparePartEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'unit_price') String unitPrice,
      String status});
}

/// @nodoc
class _$SparePartEntityCopyWithImpl<$Res>
    implements $SparePartEntityCopyWith<$Res> {
  _$SparePartEntityCopyWithImpl(this._self, this._then);

  final SparePartEntity _self;
  final $Res Function(SparePartEntity) _then;

  /// Create a copy of SparePartEntity
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _self.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SparePartEntity extends SparePartEntity {
  const _SparePartEntity(
      {@JsonKey(name: 'part_number') required this.partNumber,
      @JsonKey(name: 'part_name') required this.partName,
      @JsonKey(name: 'category') this.category = '',
      @JsonKey(name: 'quantity_available') this.quantityAvailable = 0,
      @JsonKey(name: 'unit_price') this.unitPrice = '',
      required this.status})
      : super._();
  factory _SparePartEntity.fromJson(Map<String, dynamic> json) =>
      _$SparePartEntityFromJson(json);

  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  @JsonKey(name: 'part_name')
  final String partName;
  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'quantity_available')
  final int quantityAvailable;
  @override
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @override
  final String status;

  /// Create a copy of SparePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SparePartEntityCopyWith<_SparePartEntity> get copyWith =>
      __$SparePartEntityCopyWithImpl<_SparePartEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SparePartEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SparePartEntity &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status);

  @override
  String toString() {
    return 'SparePartEntity(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$SparePartEntityCopyWith<$Res>
    implements $SparePartEntityCopyWith<$Res> {
  factory _$SparePartEntityCopyWith(
          _SparePartEntity value, $Res Function(_SparePartEntity) _then) =
      __$SparePartEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'unit_price') String unitPrice,
      String status});
}

/// @nodoc
class __$SparePartEntityCopyWithImpl<$Res>
    implements _$SparePartEntityCopyWith<$Res> {
  __$SparePartEntityCopyWithImpl(this._self, this._then);

  final _SparePartEntity _self;
  final $Res Function(_SparePartEntity) _then;

  /// Create a copy of SparePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
  }) {
    return _then(_SparePartEntity(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _self.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
