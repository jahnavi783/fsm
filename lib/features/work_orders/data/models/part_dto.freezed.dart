// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartDto {
  int? get quantity;
  String? get partName;
  num? get unitPrice;
  String? get partNumber;

  /// Create a copy of PartDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartDtoCopyWith<PartDto> get copyWith =>
      _$PartDtoCopyWithImpl<PartDto>(this as PartDto, _$identity);

  /// Serializes this PartDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartDto &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, partName, unitPrice, partNumber);

  @override
  String toString() {
    return 'PartDto(quantity: $quantity, partName: $partName, unitPrice: $unitPrice, partNumber: $partNumber)';
  }
}

/// @nodoc
abstract mixin class $PartDtoCopyWith<$Res> {
  factory $PartDtoCopyWith(PartDto value, $Res Function(PartDto) _then) =
      _$PartDtoCopyWithImpl;
  @useResult
  $Res call(
      {int? quantity, String? partName, num? unitPrice, String? partNumber});
}

/// @nodoc
class _$PartDtoCopyWithImpl<$Res> implements $PartDtoCopyWith<$Res> {
  _$PartDtoCopyWithImpl(this._self, this._then);

  final PartDto _self;
  final $Res Function(PartDto) _then;

  /// Create a copy of PartDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? partName = freezed,
    Object? unitPrice = freezed,
    Object? partNumber = freezed,
  }) {
    return _then(_self.copyWith(
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: freezed == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      partNumber: freezed == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartDto].
extension PartDtoPatterns on PartDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PartDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PartDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PartDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? quantity, String? partName, num? unitPrice,
            String? partNumber)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
        return $default(
            _that.quantity, _that.partName, _that.unitPrice, _that.partNumber);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? quantity, String? partName, num? unitPrice, String? partNumber)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto():
        return $default(
            _that.quantity, _that.partName, _that.unitPrice, _that.partNumber);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? quantity, String? partName, num? unitPrice,
            String? partNumber)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
        return $default(
            _that.quantity, _that.partName, _that.unitPrice, _that.partNumber);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartDto implements PartDto {
  const _PartDto(
      {this.quantity, this.partName, this.unitPrice, this.partNumber});
  factory _PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);

  @override
  final int? quantity;
  @override
  final String? partName;
  @override
  final num? unitPrice;
  @override
  final String? partNumber;

  /// Create a copy of PartDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartDtoCopyWith<_PartDto> get copyWith =>
      __$PartDtoCopyWithImpl<_PartDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartDto &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, partName, unitPrice, partNumber);

  @override
  String toString() {
    return 'PartDto(quantity: $quantity, partName: $partName, unitPrice: $unitPrice, partNumber: $partNumber)';
  }
}

/// @nodoc
abstract mixin class _$PartDtoCopyWith<$Res> implements $PartDtoCopyWith<$Res> {
  factory _$PartDtoCopyWith(_PartDto value, $Res Function(_PartDto) _then) =
      __$PartDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? quantity, String? partName, num? unitPrice, String? partNumber});
}

/// @nodoc
class __$PartDtoCopyWithImpl<$Res> implements _$PartDtoCopyWith<$Res> {
  __$PartDtoCopyWithImpl(this._self, this._then);

  final _PartDto _self;
  final $Res Function(_PartDto) _then;

  /// Create a copy of PartDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantity = freezed,
    Object? partName = freezed,
    Object? unitPrice = freezed,
    Object? partNumber = freezed,
  }) {
    return _then(_PartDto(
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: freezed == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      partNumber: freezed == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
