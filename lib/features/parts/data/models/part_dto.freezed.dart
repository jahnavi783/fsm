// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartDto _$PartDtoFromJson(Map<String, dynamic> json) {
  return _PartDto.fromJson(json);
}

/// @nodoc
mixin _$PartDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_number')
  String get partNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_name')
  String get partName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_quantity')
  int get minQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_quantity')
  int get maxQuantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'compatible_models')
  List<String> get compatibleModels => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get specifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartDtoCopyWith<PartDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartDtoCopyWith<$Res> {
  factory $PartDtoCopyWith(PartDto value, $Res Function(PartDto) then) =
      _$PartDtoCopyWithImpl<$Res, PartDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      String description,
      String category,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      String unit,
      String status,
      @JsonKey(name: 'compatible_models') List<String> compatibleModels,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? specifications,
      @JsonKey(name: 'last_updated') String? lastUpdated});
}

/// @nodoc
class _$PartDtoCopyWithImpl<$Res, $Val extends PartDto>
    implements $PartDtoCopyWith<$Res> {
  _$PartDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartDtoImplCopyWith<$Res> implements $PartDtoCopyWith<$Res> {
  factory _$$PartDtoImplCopyWith(
          _$PartDtoImpl value, $Res Function(_$PartDtoImpl) then) =
      __$$PartDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      String description,
      String category,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      String unit,
      String status,
      @JsonKey(name: 'compatible_models') List<String> compatibleModels,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? specifications,
      @JsonKey(name: 'last_updated') String? lastUpdated});
}

/// @nodoc
class __$$PartDtoImplCopyWithImpl<$Res>
    extends _$PartDtoCopyWithImpl<$Res, _$PartDtoImpl>
    implements _$$PartDtoImplCopyWith<$Res> {
  __$$PartDtoImplCopyWithImpl(
      _$PartDtoImpl _value, $Res Function(_$PartDtoImpl) _then)
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
  }) {
    return _then(_$PartDtoImpl(
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
              as String,
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartDtoImpl implements _PartDto {
  const _$PartDtoImpl(
      {required this.id,
      @JsonKey(name: 'part_number') required this.partNumber,
      @JsonKey(name: 'part_name') required this.partName,
      required this.description,
      required this.category,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'quantity_available') required this.quantityAvailable,
      @JsonKey(name: 'min_quantity') required this.minQuantity,
      @JsonKey(name: 'max_quantity') required this.maxQuantity,
      required this.unit,
      required this.status,
      @JsonKey(name: 'compatible_models')
      final List<String> compatibleModels = const [],
      @JsonKey(name: 'image_url') this.imageUrl,
      this.specifications,
      @JsonKey(name: 'last_updated') this.lastUpdated})
      : _compatibleModels = compatibleModels;

  factory _$PartDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  @JsonKey(name: 'part_name')
  final String partName;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;
  @override
  @JsonKey(name: 'quantity_available')
  final int quantityAvailable;
  @override
  @JsonKey(name: 'min_quantity')
  final int minQuantity;
  @override
  @JsonKey(name: 'max_quantity')
  final int maxQuantity;
  @override
  final String unit;
  @override
  final String status;
  final List<String> _compatibleModels;
  @override
  @JsonKey(name: 'compatible_models')
  List<String> get compatibleModels {
    if (_compatibleModels is EqualUnmodifiableListView)
      return _compatibleModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_compatibleModels);
  }

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String? specifications;
  @override
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  @override
  String toString() {
    return 'PartDto(id: $id, partNumber: $partNumber, partName: $partName, description: $description, category: $category, unitPrice: $unitPrice, quantityAvailable: $quantityAvailable, minQuantity: $minQuantity, maxQuantity: $maxQuantity, unit: $unit, status: $status, compatibleModels: $compatibleModels, imageUrl: $imageUrl, specifications: $specifications, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartDtoImpl &&
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
                other.lastUpdated == lastUpdated));
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
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartDtoImplCopyWith<_$PartDtoImpl> get copyWith =>
      __$$PartDtoImplCopyWithImpl<_$PartDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartDtoImplToJson(
      this,
    );
  }
}

abstract class _PartDto implements PartDto {
  const factory _PartDto(
      {required final int id,
      @JsonKey(name: 'part_number') required final String partNumber,
      @JsonKey(name: 'part_name') required final String partName,
      required final String description,
      required final String category,
      @JsonKey(name: 'unit_price') required final double unitPrice,
      @JsonKey(name: 'quantity_available') required final int quantityAvailable,
      @JsonKey(name: 'min_quantity') required final int minQuantity,
      @JsonKey(name: 'max_quantity') required final int maxQuantity,
      required final String unit,
      required final String status,
      @JsonKey(name: 'compatible_models') final List<String> compatibleModels,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final String? specifications,
      @JsonKey(name: 'last_updated')
      final String? lastUpdated}) = _$PartDtoImpl;

  factory _PartDto.fromJson(Map<String, dynamic> json) = _$PartDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'part_number')
  String get partNumber;
  @override
  @JsonKey(name: 'part_name')
  String get partName;
  @override
  String get description;
  @override
  String get category;
  @override
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  @override
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable;
  @override
  @JsonKey(name: 'min_quantity')
  int get minQuantity;
  @override
  @JsonKey(name: 'max_quantity')
  int get maxQuantity;
  @override
  String get unit;
  @override
  String get status;
  @override
  @JsonKey(name: 'compatible_models')
  List<String> get compatibleModels;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String? get specifications;
  @override
  @JsonKey(name: 'last_updated')
  String? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$PartDtoImplCopyWith<_$PartDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
