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
  String get partNumber;
  String get partName;
  String get category;
  int get quantityAvailable;
  double get unitPrice;
  PartStatus get status;

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

  @override
  String toString() {
    return 'PartEntity(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PartEntityCopyWith<$Res> {
  factory $PartEntityCopyWith(
          PartEntity value, $Res Function(PartEntity) _then) =
      _$PartEntityCopyWithImpl;
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
class _$PartEntityCopyWithImpl<$Res> implements $PartEntityCopyWith<$Res> {
  _$PartEntityCopyWithImpl(this._self, this._then);

  final PartEntity _self;
  final $Res Function(PartEntity) _then;

  /// Create a copy of PartEntity
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
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus,
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
    TResult Function(String partNumber, String partName, String category,
            int quantityAvailable, double unitPrice, PartStatus status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartEntity() when $default != null:
        return $default(_that.partNumber, _that.partName, _that.category,
            _that.quantityAvailable, _that.unitPrice, _that.status);
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
    TResult Function(String partNumber, String partName, String category,
            int quantityAvailable, double unitPrice, PartStatus status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartEntity():
        return $default(_that.partNumber, _that.partName, _that.category,
            _that.quantityAvailable, _that.unitPrice, _that.status);
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
    TResult? Function(String partNumber, String partName, String category,
            int quantityAvailable, double unitPrice, PartStatus status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartEntity() when $default != null:
        return $default(_that.partNumber, _that.partName, _that.category,
            _that.quantityAvailable, _that.unitPrice, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PartEntity extends PartEntity {
  const _PartEntity(
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

  @override
  String toString() {
    return 'PartEntity(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
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
      {String partNumber,
      String partName,
      String category,
      int quantityAvailable,
      double unitPrice,
      PartStatus status});
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
    Object? partNumber = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
  }) {
    return _then(_PartEntity(
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
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus,
    ));
  }
}

// dart format on
