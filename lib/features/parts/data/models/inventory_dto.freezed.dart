// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryDto {
  @JsonKey(name: 'part_id')
  int get partId;
  @JsonKey(name: 'part_number')
  String get partNumber;
  int get quantity;
  @JsonKey(name: 'min_quantity')
  int get minQuantity;
  @JsonKey(name: 'max_quantity')
  int get maxQuantity;
  @JsonKey(name: 'last_updated')
  String get lastUpdated;
  String get location;
  String? get notes;

  /// Create a copy of InventoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryDtoCopyWith<InventoryDto> get copyWith =>
      _$InventoryDtoCopyWithImpl<InventoryDto>(
          this as InventoryDto, _$identity);

  /// Serializes this InventoryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryDto &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partId, partNumber, quantity,
      minQuantity, maxQuantity, lastUpdated, location, notes);

  @override
  String toString() {
    return 'InventoryDto(partId: $partId, partNumber: $partNumber, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, lastUpdated: $lastUpdated, location: $location, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InventoryDtoCopyWith<$Res> {
  factory $InventoryDtoCopyWith(
          InventoryDto value, $Res Function(InventoryDto) _then) =
      _$InventoryDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'part_number') String partNumber,
      int quantity,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      @JsonKey(name: 'last_updated') String lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class _$InventoryDtoCopyWithImpl<$Res> implements $InventoryDtoCopyWith<$Res> {
  _$InventoryDtoCopyWithImpl(this._self, this._then);

  final InventoryDto _self;
  final $Res Function(InventoryDto) _then;

  /// Create a copy of InventoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? partNumber = null,
    Object? quantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? lastUpdated = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _self.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryDto].
extension InventoryDtoPatterns on InventoryDto {
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
    TResult Function(_InventoryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryDto() when $default != null:
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
    TResult Function(_InventoryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryDto():
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
    TResult? Function(_InventoryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryDto() when $default != null:
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'part_number') String partNumber,
            int quantity,
            @JsonKey(name: 'min_quantity') int minQuantity,
            @JsonKey(name: 'max_quantity') int maxQuantity,
            @JsonKey(name: 'last_updated') String lastUpdated,
            String location,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryDto() when $default != null:
        return $default(
            _that.partId,
            _that.partNumber,
            _that.quantity,
            _that.minQuantity,
            _that.maxQuantity,
            _that.lastUpdated,
            _that.location,
            _that.notes);
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'part_number') String partNumber,
            int quantity,
            @JsonKey(name: 'min_quantity') int minQuantity,
            @JsonKey(name: 'max_quantity') int maxQuantity,
            @JsonKey(name: 'last_updated') String lastUpdated,
            String location,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryDto():
        return $default(
            _that.partId,
            _that.partNumber,
            _that.quantity,
            _that.minQuantity,
            _that.maxQuantity,
            _that.lastUpdated,
            _that.location,
            _that.notes);
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'part_number') String partNumber,
            int quantity,
            @JsonKey(name: 'min_quantity') int minQuantity,
            @JsonKey(name: 'max_quantity') int maxQuantity,
            @JsonKey(name: 'last_updated') String lastUpdated,
            String location,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryDto() when $default != null:
        return $default(
            _that.partId,
            _that.partNumber,
            _that.quantity,
            _that.minQuantity,
            _that.maxQuantity,
            _that.lastUpdated,
            _that.location,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryDto implements InventoryDto {
  const _InventoryDto(
      {@JsonKey(name: 'part_id') required this.partId,
      @JsonKey(name: 'part_number') required this.partNumber,
      required this.quantity,
      @JsonKey(name: 'min_quantity') required this.minQuantity,
      @JsonKey(name: 'max_quantity') required this.maxQuantity,
      @JsonKey(name: 'last_updated') required this.lastUpdated,
      required this.location,
      this.notes});
  factory _InventoryDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryDtoFromJson(json);

  @override
  @JsonKey(name: 'part_id')
  final int partId;
  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'min_quantity')
  final int minQuantity;
  @override
  @JsonKey(name: 'max_quantity')
  final int maxQuantity;
  @override
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @override
  final String location;
  @override
  final String? notes;

  /// Create a copy of InventoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryDtoCopyWith<_InventoryDto> get copyWith =>
      __$InventoryDtoCopyWithImpl<_InventoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryDto &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partId, partNumber, quantity,
      minQuantity, maxQuantity, lastUpdated, location, notes);

  @override
  String toString() {
    return 'InventoryDto(partId: $partId, partNumber: $partNumber, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, lastUpdated: $lastUpdated, location: $location, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InventoryDtoCopyWith<$Res>
    implements $InventoryDtoCopyWith<$Res> {
  factory _$InventoryDtoCopyWith(
          _InventoryDto value, $Res Function(_InventoryDto) _then) =
      __$InventoryDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'part_number') String partNumber,
      int quantity,
      @JsonKey(name: 'min_quantity') int minQuantity,
      @JsonKey(name: 'max_quantity') int maxQuantity,
      @JsonKey(name: 'last_updated') String lastUpdated,
      String location,
      String? notes});
}

/// @nodoc
class __$InventoryDtoCopyWithImpl<$Res>
    implements _$InventoryDtoCopyWith<$Res> {
  __$InventoryDtoCopyWithImpl(this._self, this._then);

  final _InventoryDto _self;
  final $Res Function(_InventoryDto) _then;

  /// Create a copy of InventoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partId = null,
    Object? partNumber = null,
    Object? quantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? lastUpdated = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_InventoryDto(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _self.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$InventoryUpdateDto {
  @JsonKey(name: 'part_id')
  int get partId;
  @JsonKey(name: 'quantity_change')
  int get quantityChange;
  String get type;
  String get reason;
  String get timestamp;
  @JsonKey(name: 'work_order_id')
  String? get workOrderId;
  String? get notes;

  /// Create a copy of InventoryUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryUpdateDtoCopyWith<InventoryUpdateDto> get copyWith =>
      _$InventoryUpdateDtoCopyWithImpl<InventoryUpdateDto>(
          this as InventoryUpdateDto, _$identity);

  /// Serializes this InventoryUpdateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryUpdateDto &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partId, quantityChange, type,
      reason, timestamp, workOrderId, notes);

  @override
  String toString() {
    return 'InventoryUpdateDto(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, timestamp: $timestamp, workOrderId: $workOrderId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InventoryUpdateDtoCopyWith<$Res> {
  factory $InventoryUpdateDtoCopyWith(
          InventoryUpdateDto value, $Res Function(InventoryUpdateDto) _then) =
      _$InventoryUpdateDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      String timestamp,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class _$InventoryUpdateDtoCopyWithImpl<$Res>
    implements $InventoryUpdateDtoCopyWith<$Res> {
  _$InventoryUpdateDtoCopyWithImpl(this._self, this._then);

  final InventoryUpdateDto _self;
  final $Res Function(InventoryUpdateDto) _then;

  /// Create a copy of InventoryUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? timestamp = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _self.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryUpdateDto].
extension InventoryUpdateDtoPatterns on InventoryUpdateDto {
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
    TResult Function(_InventoryUpdateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto() when $default != null:
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
    TResult Function(_InventoryUpdateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto():
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
    TResult? Function(_InventoryUpdateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto() when $default != null:
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            String timestamp,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto() when $default != null:
        return $default(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.timestamp, _that.workOrderId, _that.notes);
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            String timestamp,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto():
        return $default(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.timestamp, _that.workOrderId, _that.notes);
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
            @JsonKey(name: 'part_id') int partId,
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            String timestamp,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateDto() when $default != null:
        return $default(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.timestamp, _that.workOrderId, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryUpdateDto implements InventoryUpdateDto {
  const _InventoryUpdateDto(
      {@JsonKey(name: 'part_id') required this.partId,
      @JsonKey(name: 'quantity_change') required this.quantityChange,
      required this.type,
      required this.reason,
      required this.timestamp,
      @JsonKey(name: 'work_order_id') this.workOrderId,
      this.notes});
  factory _InventoryUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryUpdateDtoFromJson(json);

  @override
  @JsonKey(name: 'part_id')
  final int partId;
  @override
  @JsonKey(name: 'quantity_change')
  final int quantityChange;
  @override
  final String type;
  @override
  final String reason;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'work_order_id')
  final String? workOrderId;
  @override
  final String? notes;

  /// Create a copy of InventoryUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryUpdateDtoCopyWith<_InventoryUpdateDto> get copyWith =>
      __$InventoryUpdateDtoCopyWithImpl<_InventoryUpdateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryUpdateDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryUpdateDto &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partId, quantityChange, type,
      reason, timestamp, workOrderId, notes);

  @override
  String toString() {
    return 'InventoryUpdateDto(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, timestamp: $timestamp, workOrderId: $workOrderId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InventoryUpdateDtoCopyWith<$Res>
    implements $InventoryUpdateDtoCopyWith<$Res> {
  factory _$InventoryUpdateDtoCopyWith(
          _InventoryUpdateDto value, $Res Function(_InventoryUpdateDto) _then) =
      __$InventoryUpdateDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_id') int partId,
      @JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      String timestamp,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class __$InventoryUpdateDtoCopyWithImpl<$Res>
    implements _$InventoryUpdateDtoCopyWith<$Res> {
  __$InventoryUpdateDtoCopyWithImpl(this._self, this._then);

  final _InventoryUpdateDto _self;
  final $Res Function(_InventoryUpdateDto) _then;

  /// Create a copy of InventoryUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? timestamp = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_InventoryUpdateDto(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _self.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$InventoryUpdateRequest {
  @JsonKey(name: 'quantity_change')
  int get quantityChange;
  String get type;
  String get reason;
  @JsonKey(name: 'work_order_id')
  String? get workOrderId;
  String? get notes;

  /// Create a copy of InventoryUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryUpdateRequestCopyWith<InventoryUpdateRequest> get copyWith =>
      _$InventoryUpdateRequestCopyWithImpl<InventoryUpdateRequest>(
          this as InventoryUpdateRequest, _$identity);

  /// Serializes this InventoryUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryUpdateRequest &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, quantityChange, type, reason, workOrderId, notes);

  @override
  String toString() {
    return 'InventoryUpdateRequest(quantityChange: $quantityChange, type: $type, reason: $reason, workOrderId: $workOrderId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InventoryUpdateRequestCopyWith<$Res> {
  factory $InventoryUpdateRequestCopyWith(InventoryUpdateRequest value,
          $Res Function(InventoryUpdateRequest) _then) =
      _$InventoryUpdateRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class _$InventoryUpdateRequestCopyWithImpl<$Res>
    implements $InventoryUpdateRequestCopyWith<$Res> {
  _$InventoryUpdateRequestCopyWithImpl(this._self, this._then);

  final InventoryUpdateRequest _self;
  final $Res Function(InventoryUpdateRequest) _then;

  /// Create a copy of InventoryUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      quantityChange: null == quantityChange
          ? _self.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryUpdateRequest].
extension InventoryUpdateRequestPatterns on InventoryUpdateRequest {
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
    TResult Function(_InventoryUpdateRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest() when $default != null:
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
    TResult Function(_InventoryUpdateRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest():
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
    TResult? Function(_InventoryUpdateRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest() when $default != null:
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
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest() when $default != null:
        return $default(_that.quantityChange, _that.type, _that.reason,
            _that.workOrderId, _that.notes);
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
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest():
        return $default(_that.quantityChange, _that.type, _that.reason,
            _that.workOrderId, _that.notes);
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
            @JsonKey(name: 'quantity_change') int quantityChange,
            String type,
            String reason,
            @JsonKey(name: 'work_order_id') String? workOrderId,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryUpdateRequest() when $default != null:
        return $default(_that.quantityChange, _that.type, _that.reason,
            _that.workOrderId, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryUpdateRequest implements InventoryUpdateRequest {
  const _InventoryUpdateRequest(
      {@JsonKey(name: 'quantity_change') required this.quantityChange,
      required this.type,
      required this.reason,
      @JsonKey(name: 'work_order_id') this.workOrderId,
      this.notes});
  factory _InventoryUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$InventoryUpdateRequestFromJson(json);

  @override
  @JsonKey(name: 'quantity_change')
  final int quantityChange;
  @override
  final String type;
  @override
  final String reason;
  @override
  @JsonKey(name: 'work_order_id')
  final String? workOrderId;
  @override
  final String? notes;

  /// Create a copy of InventoryUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryUpdateRequestCopyWith<_InventoryUpdateRequest> get copyWith =>
      __$InventoryUpdateRequestCopyWithImpl<_InventoryUpdateRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryUpdateRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryUpdateRequest &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, quantityChange, type, reason, workOrderId, notes);

  @override
  String toString() {
    return 'InventoryUpdateRequest(quantityChange: $quantityChange, type: $type, reason: $reason, workOrderId: $workOrderId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InventoryUpdateRequestCopyWith<$Res>
    implements $InventoryUpdateRequestCopyWith<$Res> {
  factory _$InventoryUpdateRequestCopyWith(_InventoryUpdateRequest value,
          $Res Function(_InventoryUpdateRequest) _then) =
      __$InventoryUpdateRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quantity_change') int quantityChange,
      String type,
      String reason,
      @JsonKey(name: 'work_order_id') String? workOrderId,
      String? notes});
}

/// @nodoc
class __$InventoryUpdateRequestCopyWithImpl<$Res>
    implements _$InventoryUpdateRequestCopyWith<$Res> {
  __$InventoryUpdateRequestCopyWithImpl(this._self, this._then);

  final _InventoryUpdateRequest _self;
  final $Res Function(_InventoryUpdateRequest) _then;

  /// Create a copy of InventoryUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_InventoryUpdateRequest(
      quantityChange: null == quantityChange
          ? _self.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PartsResponse {
  List<PartDto>
      get parts; // Optional pagination fields for backward compatibility
  @JsonKey(name: 'total_count')
  int get totalCount;
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'total_pages')
  int get totalPages;

  /// Create a copy of PartsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartsResponseCopyWith<PartsResponse> get copyWith =>
      _$PartsResponseCopyWithImpl<PartsResponse>(
          this as PartsResponse, _$identity);

  /// Serializes this PartsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartsResponse &&
            const DeepCollectionEquality().equals(other.parts, parts) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(parts),
      totalCount,
      currentPage,
      totalPages);

  @override
  String toString() {
    return 'PartsResponse(parts: $parts, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $PartsResponseCopyWith<$Res> {
  factory $PartsResponseCopyWith(
          PartsResponse value, $Res Function(PartsResponse) _then) =
      _$PartsResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<PartDto> parts,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class _$PartsResponseCopyWithImpl<$Res>
    implements $PartsResponseCopyWith<$Res> {
  _$PartsResponseCopyWithImpl(this._self, this._then);

  final PartsResponse _self;
  final $Res Function(PartsResponse) _then;

  /// Create a copy of PartsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_self.copyWith(
      parts: null == parts
          ? _self.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartsResponse].
extension PartsResponsePatterns on PartsResponse {
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
    TResult Function(_PartsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
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
    TResult Function(_PartsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse():
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
    TResult? Function(_PartsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
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
            List<PartDto> parts,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
        return $default(
            _that.parts, _that.totalCount, _that.currentPage, _that.totalPages);
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
            List<PartDto> parts,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse():
        return $default(
            _that.parts, _that.totalCount, _that.currentPage, _that.totalPages);
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
            List<PartDto> parts,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
        return $default(
            _that.parts, _that.totalCount, _that.currentPage, _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartsResponse implements PartsResponse {
  const _PartsResponse(
      {required final List<PartDto> parts,
      @JsonKey(name: 'total_count') this.totalCount = 0,
      @JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'total_pages') this.totalPages = 1})
      : _parts = parts;
  factory _PartsResponse.fromJson(Map<String, dynamic> json) =>
      _$PartsResponseFromJson(json);

  final List<PartDto> _parts;
  @override
  List<PartDto> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

// Optional pagination fields for backward compatibility
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Create a copy of PartsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartsResponseCopyWith<_PartsResponse> get copyWith =>
      __$PartsResponseCopyWithImpl<_PartsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartsResponse &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_parts),
      totalCount,
      currentPage,
      totalPages);

  @override
  String toString() {
    return 'PartsResponse(parts: $parts, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$PartsResponseCopyWith<$Res>
    implements $PartsResponseCopyWith<$Res> {
  factory _$PartsResponseCopyWith(
          _PartsResponse value, $Res Function(_PartsResponse) _then) =
      __$PartsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PartDto> parts,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class __$PartsResponseCopyWithImpl<$Res>
    implements _$PartsResponseCopyWith<$Res> {
  __$PartsResponseCopyWithImpl(this._self, this._then);

  final _PartsResponse _self;
  final $Res Function(_PartsResponse) _then;

  /// Create a copy of PartsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? parts = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_PartsResponse(
      parts: null == parts
          ? _self._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$InventoryResponse {
  List<InventoryDto> get inventory;
  @JsonKey(name: 'total_count')
  int get totalCount;
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'total_pages')
  int get totalPages;

  /// Create a copy of InventoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryResponseCopyWith<InventoryResponse> get copyWith =>
      _$InventoryResponseCopyWithImpl<InventoryResponse>(
          this as InventoryResponse, _$identity);

  /// Serializes this InventoryResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryResponse &&
            const DeepCollectionEquality().equals(other.inventory, inventory) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inventory),
      totalCount,
      currentPage,
      totalPages);

  @override
  String toString() {
    return 'InventoryResponse(inventory: $inventory, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $InventoryResponseCopyWith<$Res> {
  factory $InventoryResponseCopyWith(
          InventoryResponse value, $Res Function(InventoryResponse) _then) =
      _$InventoryResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class _$InventoryResponseCopyWithImpl<$Res>
    implements $InventoryResponseCopyWith<$Res> {
  _$InventoryResponseCopyWithImpl(this._self, this._then);

  final InventoryResponse _self;
  final $Res Function(InventoryResponse) _then;

  /// Create a copy of InventoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventory = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_self.copyWith(
      inventory: null == inventory
          ? _self.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryDto>,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryResponse].
extension InventoryResponsePatterns on InventoryResponse {
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
    TResult Function(_InventoryResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse() when $default != null:
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
    TResult Function(_InventoryResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse():
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
    TResult? Function(_InventoryResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse() when $default != null:
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
            List<InventoryDto> inventory,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse() when $default != null:
        return $default(_that.inventory, _that.totalCount, _that.currentPage,
            _that.totalPages);
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
            List<InventoryDto> inventory,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse():
        return $default(_that.inventory, _that.totalCount, _that.currentPage,
            _that.totalPages);
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
            List<InventoryDto> inventory,
            @JsonKey(name: 'total_count') int totalCount,
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'total_pages') int totalPages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryResponse() when $default != null:
        return $default(_that.inventory, _that.totalCount, _that.currentPage,
            _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryResponse implements InventoryResponse {
  const _InventoryResponse(
      {required final List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'total_pages') required this.totalPages})
      : _inventory = inventory;
  factory _InventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryResponseFromJson(json);

  final List<InventoryDto> _inventory;
  @override
  List<InventoryDto> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Create a copy of InventoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryResponseCopyWith<_InventoryResponse> get copyWith =>
      __$InventoryResponseCopyWithImpl<_InventoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryResponse &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_inventory),
      totalCount,
      currentPage,
      totalPages);

  @override
  String toString() {
    return 'InventoryResponse(inventory: $inventory, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$InventoryResponseCopyWith<$Res>
    implements $InventoryResponseCopyWith<$Res> {
  factory _$InventoryResponseCopyWith(
          _InventoryResponse value, $Res Function(_InventoryResponse) _then) =
      __$InventoryResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<InventoryDto> inventory,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class __$InventoryResponseCopyWithImpl<$Res>
    implements _$InventoryResponseCopyWith<$Res> {
  __$InventoryResponseCopyWithImpl(this._self, this._then);

  final _InventoryResponse _self;
  final $Res Function(_InventoryResponse) _then;

  /// Create a copy of InventoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inventory = null,
    Object? totalCount = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_InventoryResponse(
      inventory: null == inventory
          ? _self._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryDto>,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
