// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'captured_by_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CapturedByDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  @JsonKey(name: 'role_id', fromJson: _intFromJson)
  int get roleId;

  /// Create a copy of CapturedByDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CapturedByDtoCopyWith<CapturedByDto> get copyWith =>
      _$CapturedByDtoCopyWithImpl<CapturedByDto>(
          this as CapturedByDto, _$identity);

  /// Serializes this CapturedByDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CapturedByDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, roleId);

  @override
  String toString() {
    return 'CapturedByDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class $CapturedByDtoCopyWith<$Res> {
  factory $CapturedByDtoCopyWith(
          CapturedByDto value, $Res Function(CapturedByDto) _then) =
      _$CapturedByDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'role_id', fromJson: _intFromJson) int roleId});
}

/// @nodoc
class _$CapturedByDtoCopyWithImpl<$Res>
    implements $CapturedByDtoCopyWith<$Res> {
  _$CapturedByDtoCopyWithImpl(this._self, this._then);

  final CapturedByDto _self;
  final $Res Function(CapturedByDto) _then;

  /// Create a copy of CapturedByDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? roleId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CapturedByDto].
extension CapturedByDtoPatterns on CapturedByDto {
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
    TResult Function(_CapturedByDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto() when $default != null:
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
    TResult Function(_CapturedByDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto():
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
    TResult? Function(_CapturedByDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto() when $default != null:
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
            @JsonKey(fromJson: _intFromJson) int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id', fromJson: _intFromJson) int roleId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
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
            @JsonKey(fromJson: _intFromJson) int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id', fromJson: _intFromJson) int roleId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto():
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
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
            @JsonKey(fromJson: _intFromJson) int id,
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            @JsonKey(name: 'role_id', fromJson: _intFromJson) int roleId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CapturedByDto() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.email,
            _that.roleId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CapturedByDto implements CapturedByDto {
  const _CapturedByDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      @JsonKey(name: 'role_id', fromJson: _intFromJson) required this.roleId});
  factory _CapturedByDto.fromJson(Map<String, dynamic> json) =>
      _$CapturedByDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  @JsonKey(name: 'role_id', fromJson: _intFromJson)
  final int roleId;

  /// Create a copy of CapturedByDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CapturedByDtoCopyWith<_CapturedByDto> get copyWith =>
      __$CapturedByDtoCopyWithImpl<_CapturedByDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CapturedByDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CapturedByDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, roleId);

  @override
  String toString() {
    return 'CapturedByDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class _$CapturedByDtoCopyWith<$Res>
    implements $CapturedByDtoCopyWith<$Res> {
  factory _$CapturedByDtoCopyWith(
          _CapturedByDto value, $Res Function(_CapturedByDto) _then) =
      __$CapturedByDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'role_id', fromJson: _intFromJson) int roleId});
}

/// @nodoc
class __$CapturedByDtoCopyWithImpl<$Res>
    implements _$CapturedByDtoCopyWith<$Res> {
  __$CapturedByDtoCopyWithImpl(this._self, this._then);

  final _CapturedByDto _self;
  final $Res Function(_CapturedByDto) _then;

  /// Create a copy of CapturedByDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? roleId = null,
  }) {
    return _then(_CapturedByDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
