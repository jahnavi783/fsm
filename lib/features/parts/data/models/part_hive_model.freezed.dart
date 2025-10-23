// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartHiveModel {
  @HiveField(0)
  String get partNumber;
  @HiveField(1)
  String get partName;
  @HiveField(2)
  String get category;
  @HiveField(3)
  int get quantityAvailable;
  @HiveField(4)
  double get unitPrice;
  @HiveField(5)
  int get status; // Store as int for enum
  @HiveField(6)
  DateTime get cachedAt;

  /// Create a copy of PartHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartHiveModelCopyWith<PartHiveModel> get copyWith =>
      _$PartHiveModelCopyWithImpl<PartHiveModel>(
          this as PartHiveModel, _$identity);

  /// Serializes this PartHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status, cachedAt);

  @override
  String toString() {
    return 'PartHiveModel(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class $PartHiveModelCopyWith<$Res> {
  factory $PartHiveModelCopyWith(
          PartHiveModel value, $Res Function(PartHiveModel) _then) =
      _$PartHiveModelCopyWithImpl;
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
class _$PartHiveModelCopyWithImpl<$Res>
    implements $PartHiveModelCopyWith<$Res> {
  _$PartHiveModelCopyWithImpl(this._self, this._then);

  final PartHiveModel _self;
  final $Res Function(PartHiveModel) _then;

  /// Create a copy of PartHiveModel
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
    Object? cachedAt = null,
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
              as int,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartHiveModel].
extension PartHiveModelPatterns on PartHiveModel {
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
    TResult Function(_PartHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel() when $default != null:
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
    TResult Function(_PartHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel():
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
    TResult? Function(_PartHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel() when $default != null:
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
            @HiveField(0) String partNumber,
            @HiveField(1) String partName,
            @HiveField(2) String category,
            @HiveField(3) int quantityAvailable,
            @HiveField(4) double unitPrice,
            @HiveField(5) int status,
            @HiveField(6) DateTime cachedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel() when $default != null:
        return $default(
            _that.partNumber,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status,
            _that.cachedAt);
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
            @HiveField(0) String partNumber,
            @HiveField(1) String partName,
            @HiveField(2) String category,
            @HiveField(3) int quantityAvailable,
            @HiveField(4) double unitPrice,
            @HiveField(5) int status,
            @HiveField(6) DateTime cachedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel():
        return $default(
            _that.partNumber,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status,
            _that.cachedAt);
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
            @HiveField(0) String partNumber,
            @HiveField(1) String partName,
            @HiveField(2) String category,
            @HiveField(3) int quantityAvailable,
            @HiveField(4) double unitPrice,
            @HiveField(5) int status,
            @HiveField(6) DateTime cachedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartHiveModel() when $default != null:
        return $default(
            _that.partNumber,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status,
            _that.cachedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartHiveModel implements PartHiveModel {
  const _PartHiveModel(
      {@HiveField(0) required this.partNumber,
      @HiveField(1) required this.partName,
      @HiveField(2) required this.category,
      @HiveField(3) required this.quantityAvailable,
      @HiveField(4) required this.unitPrice,
      @HiveField(5) required this.status,
      @HiveField(6) required this.cachedAt});
  factory _PartHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartHiveModelFromJson(json);

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

  /// Create a copy of PartHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartHiveModelCopyWith<_PartHiveModel> get copyWith =>
      __$PartHiveModelCopyWithImpl<_PartHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, partName, category,
      quantityAvailable, unitPrice, status, cachedAt);

  @override
  String toString() {
    return 'PartHiveModel(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class _$PartHiveModelCopyWith<$Res>
    implements $PartHiveModelCopyWith<$Res> {
  factory _$PartHiveModelCopyWith(
          _PartHiveModel value, $Res Function(_PartHiveModel) _then) =
      __$PartHiveModelCopyWithImpl;
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
class __$PartHiveModelCopyWithImpl<$Res>
    implements _$PartHiveModelCopyWith<$Res> {
  __$PartHiveModelCopyWithImpl(this._self, this._then);

  final _PartHiveModel _self;
  final $Res Function(_PartHiveModel) _then;

  /// Create a copy of PartHiveModel
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
    Object? cachedAt = null,
  }) {
    return _then(_PartHiveModel(
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
              as int,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
