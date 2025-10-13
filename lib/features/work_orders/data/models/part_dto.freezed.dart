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
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_quantity')
  int get stockQuantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'compatible_models')
  List<String> get compatibleModels => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get specifications => throw _privateConstructorUsedError;

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
      String name,
      String description,
      String category,
      double price,
      @JsonKey(name: 'stock_quantity') int stockQuantity,
      String unit,
      @JsonKey(name: 'compatible_models') List<String> compatibleModels,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? specifications});
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
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? stockQuantity = null,
    Object? unit = null,
    Object? compatibleModels = null,
    Object? imageUrl = freezed,
    Object? specifications = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
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
      String name,
      String description,
      String category,
      double price,
      @JsonKey(name: 'stock_quantity') int stockQuantity,
      String unit,
      @JsonKey(name: 'compatible_models') List<String> compatibleModels,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? specifications});
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
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? stockQuantity = null,
    Object? unit = null,
    Object? compatibleModels = null,
    Object? imageUrl = freezed,
    Object? specifications = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartDtoImpl implements _PartDto {
  const _$PartDtoImpl(
      {required this.id,
      @JsonKey(name: 'part_number') required this.partNumber,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      @JsonKey(name: 'stock_quantity') required this.stockQuantity,
      required this.unit,
      @JsonKey(name: 'compatible_models')
      final List<String> compatibleModels = const [],
      @JsonKey(name: 'image_url') this.imageUrl,
      this.specifications})
      : _compatibleModels = compatibleModels;

  factory _$PartDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  final double price;
  @override
  @JsonKey(name: 'stock_quantity')
  final int stockQuantity;
  @override
  final String unit;
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
  String toString() {
    return 'PartDto(id: $id, partNumber: $partNumber, name: $name, description: $description, category: $category, price: $price, stockQuantity: $stockQuantity, unit: $unit, compatibleModels: $compatibleModels, imageUrl: $imageUrl, specifications: $specifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality()
                .equals(other._compatibleModels, _compatibleModels) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      partNumber,
      name,
      description,
      category,
      price,
      stockQuantity,
      unit,
      const DeepCollectionEquality().hash(_compatibleModels),
      imageUrl,
      specifications);

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
      required final String name,
      required final String description,
      required final String category,
      required final double price,
      @JsonKey(name: 'stock_quantity') required final int stockQuantity,
      required final String unit,
      @JsonKey(name: 'compatible_models') final List<String> compatibleModels,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final String? specifications}) = _$PartDtoImpl;

  factory _PartDto.fromJson(Map<String, dynamic> json) = _$PartDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'part_number')
  String get partNumber;
  @override
  String get name;
  @override
  String get description;
  @override
  String get category;
  @override
  double get price;
  @override
  @JsonKey(name: 'stock_quantity')
  int get stockQuantity;
  @override
  String get unit;
  @override
  @JsonKey(name: 'compatible_models')
  List<String> get compatibleModels;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String? get specifications;
  @override
  @JsonKey(ignore: true)
  _$$PartDtoImplCopyWith<_$PartDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
