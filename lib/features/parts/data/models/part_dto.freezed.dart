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
  @JsonKey(name: 'part_number')
  String get partNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_name')
  String get partName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double get unitPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      String category,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'unit_price') double unitPrice,
      String status});
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
              as String,
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
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'part_name') String partName,
      String category,
      @JsonKey(name: 'quantity_available') int quantityAvailable,
      @JsonKey(name: 'unit_price') double unitPrice,
      String status});
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
    Object? partNumber = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
  }) {
    return _then(_$PartDtoImpl(
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartDtoImpl implements _PartDto {
  const _$PartDtoImpl(
      {@JsonKey(name: 'part_number') required this.partNumber,
      @JsonKey(name: 'part_name') required this.partName,
      required this.category,
      @JsonKey(name: 'quantity_available') required this.quantityAvailable,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      required this.status});

  factory _$PartDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartDtoImplFromJson(json);

  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  @JsonKey(name: 'part_name')
  final String partName;
  @override
  final String category;
  @override
  @JsonKey(name: 'quantity_available')
  final int quantityAvailable;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;
  @override
  final String status;

  @override
  String toString() {
    return 'PartDto(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status);

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
      {@JsonKey(name: 'part_number') required final String partNumber,
      @JsonKey(name: 'part_name') required final String partName,
      required final String category,
      @JsonKey(name: 'quantity_available') required final int quantityAvailable,
      @JsonKey(name: 'unit_price') required final double unitPrice,
      required final String status}) = _$PartDtoImpl;

  factory _PartDto.fromJson(Map<String, dynamic> json) = _$PartDtoImpl.fromJson;

  @override
  @JsonKey(name: 'part_number')
  String get partNumber;
  @override
  @JsonKey(name: 'part_name')
  String get partName;
  @override
  String get category;
  @override
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable;
  @override
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PartDtoImplCopyWith<_$PartDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartsResponse _$PartsResponseFromJson(Map<String, dynamic> json) {
  return _PartsResponse.fromJson(json);
}

/// @nodoc
mixin _$PartsResponse {
  List<PartDto> get parts => throw _privateConstructorUsedError;

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
  $Res call({List<PartDto> parts});
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
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
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
  $Res call({List<PartDto> parts});
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
  }) {
    return _then(_$PartsResponseImpl(
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartsResponseImpl implements _PartsResponse {
  const _$PartsResponseImpl({required final List<PartDto> parts})
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
  String toString() {
    return 'PartsResponse(parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartsResponseImpl &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_parts));

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
  const factory _PartsResponse({required final List<PartDto> parts}) =
      _$PartsResponseImpl;

  factory _PartsResponse.fromJson(Map<String, dynamic> json) =
      _$PartsResponseImpl.fromJson;

  @override
  List<PartDto> get parts;
  @override
  @JsonKey(ignore: true)
  _$$PartsResponseImplCopyWith<_$PartsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
