// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartEntity {
  int? get quantity;
  String? get partName;
  num? get unitPrice;
  String? get partNumber;

  /// Create a copy of PartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartEntityCopyWith<PartEntity> get copyWith =>
      _$PartEntityCopyWithImpl<PartEntity>(this as PartEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartEntity &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, partName, unitPrice, partNumber);

  @override
  String toString() {
    return 'PartEntity(quantity: $quantity, partName: $partName, unitPrice: $unitPrice, partNumber: $partNumber)';
  }
}

/// @nodoc
abstract mixin class $PartEntityCopyWith<$Res> {
  factory $PartEntityCopyWith(
          PartEntity value, $Res Function(PartEntity) _then) =
      _$PartEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? quantity, String? partName, num? unitPrice, String? partNumber});
}

/// @nodoc
class _$PartEntityCopyWithImpl<$Res> implements $PartEntityCopyWith<$Res> {
  _$PartEntityCopyWithImpl(this._self, this._then);

  final PartEntity _self;
  final $Res Function(PartEntity) _then;

  /// Create a copy of PartEntity
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

/// Adds pattern-matching-related methods to [PartEntity].
extension PartEntityPatterns on PartEntity {
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
    TResult Function(_PartEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartEntity() when $default != null:
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
    TResult Function(_PartEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartEntity():
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
    TResult? Function(_PartEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartEntity() when $default != null:
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
      case _PartEntity() when $default != null:
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
      case _PartEntity():
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
      case _PartEntity() when $default != null:
        return $default(
            _that.quantity, _that.partName, _that.unitPrice, _that.partNumber);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PartEntity implements PartEntity {
  const _PartEntity(
      {this.quantity, this.partName, this.unitPrice, this.partNumber});

  @override
  final int? quantity;
  @override
  final String? partName;
  @override
  final num? unitPrice;
  @override
  final String? partNumber;

  /// Create a copy of PartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartEntityCopyWith<_PartEntity> get copyWith =>
      __$PartEntityCopyWithImpl<_PartEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartEntity &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, partName, unitPrice, partNumber);

  @override
  String toString() {
    return 'PartEntity(quantity: $quantity, partName: $partName, unitPrice: $unitPrice, partNumber: $partNumber)';
  }
}

/// @nodoc
abstract mixin class _$PartEntityCopyWith<$Res>
    implements $PartEntityCopyWith<$Res> {
  factory _$PartEntityCopyWith(
          _PartEntity value, $Res Function(_PartEntity) _then) =
      __$PartEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? quantity, String? partName, num? unitPrice, String? partNumber});
}

/// @nodoc
class __$PartEntityCopyWithImpl<$Res> implements _$PartEntityCopyWith<$Res> {
  __$PartEntityCopyWithImpl(this._self, this._then);

  final _PartEntity _self;
  final $Res Function(_PartEntity) _then;

  /// Create a copy of PartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantity = freezed,
    Object? partName = freezed,
    Object? unitPrice = freezed,
    Object? partNumber = freezed,
  }) {
    return _then(_PartEntity(
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
