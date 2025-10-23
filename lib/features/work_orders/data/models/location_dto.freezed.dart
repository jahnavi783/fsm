// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationDto {
  double get latitude;
  double get longitude;
  String? get address;
  String? get city;
  String? get state;
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  String? get country;
  String? get landmark;
  double? get accuracy;
  @JsonKey(name: 'captured_at')
  String? get capturedAt;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<LocationDto> get copyWith =>
      _$LocationDtoCopyWithImpl<LocationDto>(this as LocationDto, _$identity);

  /// Serializes this LocationDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationDto &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, postalCode, country, landmark, accuracy, capturedAt);

  @override
  String toString() {
    return 'LocationDto(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, landmark: $landmark, accuracy: $accuracy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class $LocationDtoCopyWith<$Res> {
  factory $LocationDtoCopyWith(
          LocationDto value, $Res Function(LocationDto) _then) =
      _$LocationDtoCopyWithImpl;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String? address,
      String? city,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      String? country,
      String? landmark,
      double? accuracy,
      @JsonKey(name: 'captured_at') String? capturedAt});
}

/// @nodoc
class _$LocationDtoCopyWithImpl<$Res> implements $LocationDtoCopyWith<$Res> {
  _$LocationDtoCopyWithImpl(this._self, this._then);

  final LocationDto _self;
  final $Res Function(LocationDto) _then;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? landmark = freezed,
    Object? accuracy = freezed,
    Object? capturedAt = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationDto].
extension LocationDtoPatterns on LocationDto {
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
    TResult Function(_LocationDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationDto() when $default != null:
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
    TResult Function(_LocationDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDto():
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
    TResult? Function(_LocationDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDto() when $default != null:
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
            double latitude,
            double longitude,
            String? address,
            String? city,
            String? state,
            @JsonKey(name: 'postal_code') String? postalCode,
            String? country,
            String? landmark,
            double? accuracy,
            @JsonKey(name: 'captured_at') String? capturedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationDto() when $default != null:
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
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
            double latitude,
            double longitude,
            String? address,
            String? city,
            String? state,
            @JsonKey(name: 'postal_code') String? postalCode,
            String? country,
            String? landmark,
            double? accuracy,
            @JsonKey(name: 'captured_at') String? capturedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDto():
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
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
            double latitude,
            double longitude,
            String? address,
            String? city,
            String? state,
            @JsonKey(name: 'postal_code') String? postalCode,
            String? country,
            String? landmark,
            double? accuracy,
            @JsonKey(name: 'captured_at') String? capturedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDto() when $default != null:
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationDto implements LocationDto {
  const _LocationDto(
      {required this.latitude,
      required this.longitude,
      this.address,
      this.city,
      this.state,
      @JsonKey(name: 'postal_code') this.postalCode,
      this.country,
      this.landmark,
      this.accuracy,
      @JsonKey(name: 'captured_at') this.capturedAt});
  factory _LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  final String? country;
  @override
  final String? landmark;
  @override
  final double? accuracy;
  @override
  @JsonKey(name: 'captured_at')
  final String? capturedAt;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationDtoCopyWith<_LocationDto> get copyWith =>
      __$LocationDtoCopyWithImpl<_LocationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationDto &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, postalCode, country, landmark, accuracy, capturedAt);

  @override
  String toString() {
    return 'LocationDto(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, landmark: $landmark, accuracy: $accuracy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$LocationDtoCopyWith<$Res>
    implements $LocationDtoCopyWith<$Res> {
  factory _$LocationDtoCopyWith(
          _LocationDto value, $Res Function(_LocationDto) _then) =
      __$LocationDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String? address,
      String? city,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      String? country,
      String? landmark,
      double? accuracy,
      @JsonKey(name: 'captured_at') String? capturedAt});
}

/// @nodoc
class __$LocationDtoCopyWithImpl<$Res> implements _$LocationDtoCopyWith<$Res> {
  __$LocationDtoCopyWithImpl(this._self, this._then);

  final _LocationDto _self;
  final $Res Function(_LocationDto) _then;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? landmark = freezed,
    Object? accuracy = freezed,
    Object? capturedAt = freezed,
  }) {
    return _then(_LocationDto(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
