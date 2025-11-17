// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSessionDto {
  String get sessionId;
  UserInfoDto get user;
  String? get message;

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionDtoCopyWith<ChatSessionDto> get copyWith =>
      _$ChatSessionDtoCopyWithImpl<ChatSessionDto>(
          this as ChatSessionDto, _$identity);

  /// Serializes this ChatSessionDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, user, message);

  @override
  String toString() {
    return 'ChatSessionDto(sessionId: $sessionId, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionDtoCopyWith<$Res> {
  factory $ChatSessionDtoCopyWith(
          ChatSessionDto value, $Res Function(ChatSessionDto) _then) =
      _$ChatSessionDtoCopyWithImpl;
  @useResult
  $Res call({String sessionId, UserInfoDto user, String? message});

  $UserInfoDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$ChatSessionDtoCopyWithImpl<$Res>
    implements $ChatSessionDtoCopyWith<$Res> {
  _$ChatSessionDtoCopyWithImpl(this._self, this._then);

  final ChatSessionDto _self;
  final $Res Function(ChatSessionDto) _then;

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? user = null,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoDto,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoDtoCopyWith<$Res> get user {
    return $UserInfoDtoCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChatSessionDto].
extension ChatSessionDtoPatterns on ChatSessionDto {
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
    TResult Function(_ChatSessionDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto() when $default != null:
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
    TResult Function(_ChatSessionDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto():
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
    TResult? Function(_ChatSessionDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto() when $default != null:
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
    TResult Function(String sessionId, UserInfoDto user, String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto() when $default != null:
        return $default(_that.sessionId, _that.user, _that.message);
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
    TResult Function(String sessionId, UserInfoDto user, String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto():
        return $default(_that.sessionId, _that.user, _that.message);
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
    TResult? Function(String sessionId, UserInfoDto user, String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionDto() when $default != null:
        return $default(_that.sessionId, _that.user, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatSessionDto extends ChatSessionDto {
  const _ChatSessionDto(
      {required this.sessionId, required this.user, this.message})
      : super._();
  factory _ChatSessionDto.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionDtoFromJson(json);

  @override
  final String sessionId;
  @override
  final UserInfoDto user;
  @override
  final String? message;

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionDtoCopyWith<_ChatSessionDto> get copyWith =>
      __$ChatSessionDtoCopyWithImpl<_ChatSessionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, user, message);

  @override
  String toString() {
    return 'ChatSessionDto(sessionId: $sessionId, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionDtoCopyWith<$Res>
    implements $ChatSessionDtoCopyWith<$Res> {
  factory _$ChatSessionDtoCopyWith(
          _ChatSessionDto value, $Res Function(_ChatSessionDto) _then) =
      __$ChatSessionDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String sessionId, UserInfoDto user, String? message});

  @override
  $UserInfoDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$ChatSessionDtoCopyWithImpl<$Res>
    implements _$ChatSessionDtoCopyWith<$Res> {
  __$ChatSessionDtoCopyWithImpl(this._self, this._then);

  final _ChatSessionDto _self;
  final $Res Function(_ChatSessionDto) _then;

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? user = null,
    Object? message = freezed,
  }) {
    return _then(_ChatSessionDto(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoDto,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChatSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoDtoCopyWith<$Res> get user {
    return $UserInfoDtoCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$UserInfoDto {
  int? get id;
  String get email;
  String get role;
  String? get firstName;
  String? get lastName;

  /// Create a copy of UserInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoDtoCopyWith<UserInfoDto> get copyWith =>
      _$UserInfoDtoCopyWithImpl<UserInfoDto>(this as UserInfoDto, _$identity);

  /// Serializes this UserInfoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfoDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, role, firstName, lastName);

  @override
  String toString() {
    return 'UserInfoDto(id: $id, email: $email, role: $role, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class $UserInfoDtoCopyWith<$Res> {
  factory $UserInfoDtoCopyWith(
          UserInfoDto value, $Res Function(UserInfoDto) _then) =
      _$UserInfoDtoCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String email,
      String role,
      String? firstName,
      String? lastName});
}

/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res> implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._self, this._then);

  final UserInfoDto _self;
  final $Res Function(UserInfoDto) _then;

  /// Create a copy of UserInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserInfoDto].
extension UserInfoDtoPatterns on UserInfoDto {
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
    TResult Function(_UserInfoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto() when $default != null:
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
    TResult Function(_UserInfoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto():
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
    TResult? Function(_UserInfoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto() when $default != null:
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
    TResult Function(int? id, String email, String role, String? firstName,
            String? lastName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto() when $default != null:
        return $default(
            _that.id, _that.email, _that.role, _that.firstName, _that.lastName);
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
    TResult Function(int? id, String email, String role, String? firstName,
            String? lastName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto():
        return $default(
            _that.id, _that.email, _that.role, _that.firstName, _that.lastName);
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
    TResult? Function(int? id, String email, String role, String? firstName,
            String? lastName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoDto() when $default != null:
        return $default(
            _that.id, _that.email, _that.role, _that.firstName, _that.lastName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInfoDto extends UserInfoDto {
  const _UserInfoDto(
      {this.id,
      required this.email,
      required this.role,
      this.firstName,
      this.lastName})
      : super._();
  factory _UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  @override
  final int? id;
  @override
  final String email;
  @override
  final String role;
  @override
  final String? firstName;
  @override
  final String? lastName;

  /// Create a copy of UserInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoDtoCopyWith<_UserInfoDto> get copyWith =>
      __$UserInfoDtoCopyWithImpl<_UserInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, role, firstName, lastName);

  @override
  String toString() {
    return 'UserInfoDto(id: $id, email: $email, role: $role, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$UserInfoDtoCopyWith<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  factory _$UserInfoDtoCopyWith(
          _UserInfoDto value, $Res Function(_UserInfoDto) _then) =
      __$UserInfoDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String email,
      String role,
      String? firstName,
      String? lastName});
}

/// @nodoc
class __$UserInfoDtoCopyWithImpl<$Res> implements _$UserInfoDtoCopyWith<$Res> {
  __$UserInfoDtoCopyWithImpl(this._self, this._then);

  final _UserInfoDto _self;
  final $Res Function(_UserInfoDto) _then;

  /// Create a copy of UserInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_UserInfoDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ChatSessionResponseDto {
  bool get success;
  String get sessionId;
  UserInfoDto? get user;
  String? get message;

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionResponseDtoCopyWith<ChatSessionResponseDto> get copyWith =>
      _$ChatSessionResponseDtoCopyWithImpl<ChatSessionResponseDto>(
          this as ChatSessionResponseDto, _$identity);

  /// Serializes this ChatSessionResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, sessionId, user, message);

  @override
  String toString() {
    return 'ChatSessionResponseDto(success: $success, sessionId: $sessionId, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionResponseDtoCopyWith<$Res> {
  factory $ChatSessionResponseDtoCopyWith(ChatSessionResponseDto value,
          $Res Function(ChatSessionResponseDto) _then) =
      _$ChatSessionResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success, String sessionId, UserInfoDto? user, String? message});

  $UserInfoDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ChatSessionResponseDtoCopyWithImpl<$Res>
    implements $ChatSessionResponseDtoCopyWith<$Res> {
  _$ChatSessionResponseDtoCopyWithImpl(this._self, this._then);

  final ChatSessionResponseDto _self;
  final $Res Function(ChatSessionResponseDto) _then;

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? sessionId = null,
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoDto?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserInfoDtoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChatSessionResponseDto].
extension ChatSessionResponseDtoPatterns on ChatSessionResponseDto {
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
    TResult Function(_ChatSessionResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto() when $default != null:
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
    TResult Function(_ChatSessionResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto():
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
    TResult? Function(_ChatSessionResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto() when $default != null:
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
            bool success, String sessionId, UserInfoDto? user, String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto() when $default != null:
        return $default(
            _that.success, _that.sessionId, _that.user, _that.message);
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
            bool success, String sessionId, UserInfoDto? user, String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto():
        return $default(
            _that.success, _that.sessionId, _that.user, _that.message);
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
            bool success, String sessionId, UserInfoDto? user, String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionResponseDto() when $default != null:
        return $default(
            _that.success, _that.sessionId, _that.user, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatSessionResponseDto extends ChatSessionResponseDto {
  const _ChatSessionResponseDto(
      {required this.success, required this.sessionId, this.user, this.message})
      : super._();
  factory _ChatSessionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionResponseDtoFromJson(json);

  @override
  final bool success;
  @override
  final String sessionId;
  @override
  final UserInfoDto? user;
  @override
  final String? message;

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionResponseDtoCopyWith<_ChatSessionResponseDto> get copyWith =>
      __$ChatSessionResponseDtoCopyWithImpl<_ChatSessionResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, sessionId, user, message);

  @override
  String toString() {
    return 'ChatSessionResponseDto(success: $success, sessionId: $sessionId, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionResponseDtoCopyWith<$Res>
    implements $ChatSessionResponseDtoCopyWith<$Res> {
  factory _$ChatSessionResponseDtoCopyWith(_ChatSessionResponseDto value,
          $Res Function(_ChatSessionResponseDto) _then) =
      __$ChatSessionResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success, String sessionId, UserInfoDto? user, String? message});

  @override
  $UserInfoDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$ChatSessionResponseDtoCopyWithImpl<$Res>
    implements _$ChatSessionResponseDtoCopyWith<$Res> {
  __$ChatSessionResponseDtoCopyWithImpl(this._self, this._then);

  final _ChatSessionResponseDto _self;
  final $Res Function(_ChatSessionResponseDto) _then;

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? sessionId = null,
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_ChatSessionResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoDto?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChatSessionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserInfoDtoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
