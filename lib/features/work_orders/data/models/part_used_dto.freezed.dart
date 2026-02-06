// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_used_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartUsedDto {
  String? get partNumber;
  @JsonKey(name: 'quantity_used')
  int get quantityUsed;
  String? get partName;
  String? get description;

  /// Create a copy of PartUsedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartUsedDtoCopyWith<PartUsedDto> get copyWith =>
      _$PartUsedDtoCopyWithImpl<PartUsedDto>(this as PartUsedDto, _$identity);

  /// Serializes this PartUsedDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartUsedDto &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedDto(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PartUsedDtoCopyWith<$Res> {
  factory $PartUsedDtoCopyWith(
          PartUsedDto value, $Res Function(PartUsedDto) _then) =
      _$PartUsedDtoCopyWithImpl;
  @useResult
  $Res call(
      {String? partNumber,
      @JsonKey(name: 'quantity_used') int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class _$PartUsedDtoCopyWithImpl<$Res> implements $PartUsedDtoCopyWith<$Res> {
  _$PartUsedDtoCopyWithImpl(this._self, this._then);

  final PartUsedDto _self;
  final $Res Function(PartUsedDto) _then;

  /// Create a copy of PartUsedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = freezed,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      partNumber: freezed == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartUsedDto].
extension PartUsedDtoPatterns on PartUsedDto {
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
    TResult Function(_PartUsedDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto() when $default != null:
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
    TResult Function(_PartUsedDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto():
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
    TResult? Function(_PartUsedDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto() when $default != null:
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
    TResult Function(
            String? partNumber,
            @JsonKey(name: 'quantity_used') int quantityUsed,
            String? partName,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
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
            String? partNumber,
            @JsonKey(name: 'quantity_used') int quantityUsed,
            String? partName,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto():
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
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
    TResult? Function(
            String? partNumber,
            @JsonKey(name: 'quantity_used') int quantityUsed,
            String? partName,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedDto() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartUsedDto implements PartUsedDto {
  const _PartUsedDto(
      {this.partNumber,
      @JsonKey(name: 'quantity_used') required this.quantityUsed,
      this.partName,
      this.description});
  factory _PartUsedDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedDtoFromJson(json);

  @override
  final String? partNumber;
  @override
  @JsonKey(name: 'quantity_used')
  final int quantityUsed;
  @override
  final String? partName;
  @override
  final String? description;

  /// Create a copy of PartUsedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartUsedDtoCopyWith<_PartUsedDto> get copyWith =>
      __$PartUsedDtoCopyWithImpl<_PartUsedDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartUsedDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartUsedDto &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedDto(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PartUsedDtoCopyWith<$Res>
    implements $PartUsedDtoCopyWith<$Res> {
  factory _$PartUsedDtoCopyWith(
          _PartUsedDto value, $Res Function(_PartUsedDto) _then) =
      __$PartUsedDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? partNumber,
      @JsonKey(name: 'quantity_used') int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class __$PartUsedDtoCopyWithImpl<$Res> implements _$PartUsedDtoCopyWith<$Res> {
  __$PartUsedDtoCopyWithImpl(this._self, this._then);

  final _PartUsedDto _self;
  final $Res Function(_PartUsedDto) _then;

  /// Create a copy of PartUsedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = freezed,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_PartUsedDto(
      partNumber: freezed == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
