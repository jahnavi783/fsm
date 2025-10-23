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
  @JsonKey(name: 'part_number')
  String get partNumber;
  @JsonKey(name: 'part_name')
  String get partName;
  String get category;
  @JsonKey(name: 'quantity_available')
  int get quantityAvailable;
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  String get status;

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
    return 'PartDto(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PartDtoCopyWith<$Res> {
  factory $PartDtoCopyWith(PartDto value, $Res Function(PartDto) _then) =
      _$PartDtoCopyWithImpl;
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
class _$PartDtoCopyWithImpl<$Res> implements $PartDtoCopyWith<$Res> {
  _$PartDtoCopyWithImpl(this._self, this._then);

  final PartDto _self;
  final $Res Function(PartDto) _then;

  /// Create a copy of PartDto
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
              as String,
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
    TResult Function(
            @JsonKey(name: 'part_number') String partNumber,
            @JsonKey(name: 'part_name') String partName,
            String category,
            @JsonKey(name: 'quantity_available') int quantityAvailable,
            @JsonKey(name: 'unit_price') double unitPrice,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'part_number') String partNumber,
            @JsonKey(name: 'part_name') String partName,
            String category,
            @JsonKey(name: 'quantity_available') int quantityAvailable,
            @JsonKey(name: 'unit_price') double unitPrice,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto():
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
    TResult? Function(
            @JsonKey(name: 'part_number') String partNumber,
            @JsonKey(name: 'part_name') String partName,
            String category,
            @JsonKey(name: 'quantity_available') int quantityAvailable,
            @JsonKey(name: 'unit_price') double unitPrice,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartDto() when $default != null:
        return $default(_that.partNumber, _that.partName, _that.category,
            _that.quantityAvailable, _that.unitPrice, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartDto implements PartDto {
  const _PartDto(
      {@JsonKey(name: 'part_number') required this.partNumber,
      @JsonKey(name: 'part_name') required this.partName,
      required this.category,
      @JsonKey(name: 'quantity_available') required this.quantityAvailable,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      required this.status});
  factory _PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);

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
    return 'PartDto(partNumber: $partNumber, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PartDtoCopyWith<$Res> implements $PartDtoCopyWith<$Res> {
  factory _$PartDtoCopyWith(_PartDto value, $Res Function(_PartDto) _then) =
      __$PartDtoCopyWithImpl;
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
class __$PartDtoCopyWithImpl<$Res> implements _$PartDtoCopyWith<$Res> {
  __$PartDtoCopyWithImpl(this._self, this._then);

  final _PartDto _self;
  final $Res Function(_PartDto) _then;

  /// Create a copy of PartDto
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
    return _then(_PartDto(
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
              as String,
    ));
  }
}

/// @nodoc
mixin _$PartsResponse {
  List<PartDto> get parts;

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
            const DeepCollectionEquality().equals(other.parts, parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(parts));

  @override
  String toString() {
    return 'PartsResponse(parts: $parts)';
  }
}

/// @nodoc
abstract mixin class $PartsResponseCopyWith<$Res> {
  factory $PartsResponseCopyWith(
          PartsResponse value, $Res Function(PartsResponse) _then) =
      _$PartsResponseCopyWithImpl;
  @useResult
  $Res call({List<PartDto> parts});
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
  }) {
    return _then(_self.copyWith(
      parts: null == parts
          ? _self.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
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
    TResult Function(List<PartDto> parts)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
        return $default(_that.parts);
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
    TResult Function(List<PartDto> parts) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse():
        return $default(_that.parts);
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
    TResult? Function(List<PartDto> parts)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsResponse() when $default != null:
        return $default(_that.parts);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartsResponse implements PartsResponse {
  const _PartsResponse({required final List<PartDto> parts}) : _parts = parts;
  factory _PartsResponse.fromJson(Map<String, dynamic> json) =>
      _$PartsResponseFromJson(json);

  final List<PartDto> _parts;
  @override
  List<PartDto> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

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
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_parts));

  @override
  String toString() {
    return 'PartsResponse(parts: $parts)';
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
  $Res call({List<PartDto> parts});
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
  }) {
    return _then(_PartsResponse(
      parts: null == parts
          ? _self._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
    ));
  }
}

// dart format on
