// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSessionEntity {
  /// Unique session identifier from server
  String get sessionId;

  /// User ID who owns this session
  int get userId;

  /// User email (for reference)
  String get userEmail;

  /// User role (e.g., 'technician')
  String get userRole;

  /// When the session was created
  DateTime get createdAt;

  /// Last activity timestamp
  DateTime get updatedAt;

  /// Whether the session is currently active
  bool get isActive;

  /// Optional: User's first name
  String? get firstName;

  /// Optional: User's last name
  String? get lastName;

  /// Number of messages in this session
  int get messageCount;

  /// Create a copy of ChatSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionEntityCopyWith<ChatSessionEntity> get copyWith =>
      _$ChatSessionEntityCopyWithImpl<ChatSessionEntity>(
          this as ChatSessionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionEntity &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      userId,
      userEmail,
      userRole,
      createdAt,
      updatedAt,
      isActive,
      firstName,
      lastName,
      messageCount);

  @override
  String toString() {
    return 'ChatSessionEntity(sessionId: $sessionId, userId: $userId, userEmail: $userEmail, userRole: $userRole, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, firstName: $firstName, lastName: $lastName, messageCount: $messageCount)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionEntityCopyWith<$Res> {
  factory $ChatSessionEntityCopyWith(
          ChatSessionEntity value, $Res Function(ChatSessionEntity) _then) =
      _$ChatSessionEntityCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      int userId,
      String userEmail,
      String userRole,
      DateTime createdAt,
      DateTime updatedAt,
      bool isActive,
      String? firstName,
      String? lastName,
      int messageCount});
}

/// @nodoc
class _$ChatSessionEntityCopyWithImpl<$Res>
    implements $ChatSessionEntityCopyWith<$Res> {
  _$ChatSessionEntityCopyWithImpl(this._self, this._then);

  final ChatSessionEntity _self;
  final $Res Function(ChatSessionEntity) _then;

  /// Create a copy of ChatSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? userEmail = null,
    Object? userRole = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? messageCount = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _self.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatSessionEntity].
extension ChatSessionEntityPatterns on ChatSessionEntity {
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
    TResult Function(_ChatSessionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity() when $default != null:
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
    TResult Function(_ChatSessionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity():
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
    TResult? Function(_ChatSessionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity() when $default != null:
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
            String sessionId,
            int userId,
            String userEmail,
            String userRole,
            DateTime createdAt,
            DateTime updatedAt,
            bool isActive,
            String? firstName,
            String? lastName,
            int messageCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity() when $default != null:
        return $default(
            _that.sessionId,
            _that.userId,
            _that.userEmail,
            _that.userRole,
            _that.createdAt,
            _that.updatedAt,
            _that.isActive,
            _that.firstName,
            _that.lastName,
            _that.messageCount);
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
            String sessionId,
            int userId,
            String userEmail,
            String userRole,
            DateTime createdAt,
            DateTime updatedAt,
            bool isActive,
            String? firstName,
            String? lastName,
            int messageCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity():
        return $default(
            _that.sessionId,
            _that.userId,
            _that.userEmail,
            _that.userRole,
            _that.createdAt,
            _that.updatedAt,
            _that.isActive,
            _that.firstName,
            _that.lastName,
            _that.messageCount);
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
            String sessionId,
            int userId,
            String userEmail,
            String userRole,
            DateTime createdAt,
            DateTime updatedAt,
            bool isActive,
            String? firstName,
            String? lastName,
            int messageCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionEntity() when $default != null:
        return $default(
            _that.sessionId,
            _that.userId,
            _that.userEmail,
            _that.userRole,
            _that.createdAt,
            _that.updatedAt,
            _that.isActive,
            _that.firstName,
            _that.lastName,
            _that.messageCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChatSessionEntity extends ChatSessionEntity {
  const _ChatSessionEntity(
      {required this.sessionId,
      required this.userId,
      required this.userEmail,
      required this.userRole,
      required this.createdAt,
      required this.updatedAt,
      this.isActive = true,
      this.firstName,
      this.lastName,
      this.messageCount = 0})
      : super._();

  /// Unique session identifier from server
  @override
  final String sessionId;

  /// User ID who owns this session
  @override
  final int userId;

  /// User email (for reference)
  @override
  final String userEmail;

  /// User role (e.g., 'technician')
  @override
  final String userRole;

  /// When the session was created
  @override
  final DateTime createdAt;

  /// Last activity timestamp
  @override
  final DateTime updatedAt;

  /// Whether the session is currently active
  @override
  @JsonKey()
  final bool isActive;

  /// Optional: User's first name
  @override
  final String? firstName;

  /// Optional: User's last name
  @override
  final String? lastName;

  /// Number of messages in this session
  @override
  @JsonKey()
  final int messageCount;

  /// Create a copy of ChatSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionEntityCopyWith<_ChatSessionEntity> get copyWith =>
      __$ChatSessionEntityCopyWithImpl<_ChatSessionEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionEntity &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      userId,
      userEmail,
      userRole,
      createdAt,
      updatedAt,
      isActive,
      firstName,
      lastName,
      messageCount);

  @override
  String toString() {
    return 'ChatSessionEntity(sessionId: $sessionId, userId: $userId, userEmail: $userEmail, userRole: $userRole, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, firstName: $firstName, lastName: $lastName, messageCount: $messageCount)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionEntityCopyWith<$Res>
    implements $ChatSessionEntityCopyWith<$Res> {
  factory _$ChatSessionEntityCopyWith(
          _ChatSessionEntity value, $Res Function(_ChatSessionEntity) _then) =
      __$ChatSessionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      int userId,
      String userEmail,
      String userRole,
      DateTime createdAt,
      DateTime updatedAt,
      bool isActive,
      String? firstName,
      String? lastName,
      int messageCount});
}

/// @nodoc
class __$ChatSessionEntityCopyWithImpl<$Res>
    implements _$ChatSessionEntityCopyWith<$Res> {
  __$ChatSessionEntityCopyWithImpl(this._self, this._then);

  final _ChatSessionEntity _self;
  final $Res Function(_ChatSessionEntity) _then;

  /// Create a copy of ChatSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? userEmail = null,
    Object? userRole = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? messageCount = null,
  }) {
    return _then(_ChatSessionEntity(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _self.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
