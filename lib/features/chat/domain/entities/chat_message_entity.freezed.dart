// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageEntity {
  /// Unique identifier for the message
  String get id;

  /// Session ID this message belongs to
  String get sessionId;

  /// Role of the message sender: 'user' or 'assistant'
  String get role;

  /// Message content/text
  String get content;

  /// When the message was created
  DateTime get timestamp;

  /// Optional: Tools used by assistant to generate response
  List<String>? get toolsUsed;

  /// Whether this message has been synced to the server
  /// Used for offline-first functionality
  bool get isSynced;

  /// Whether this message is pending send (in offline queue)
  bool get isPending;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageEntityCopyWith<ChatMessageEntity> get copyWith =>
      _$ChatMessageEntityCopyWithImpl<ChatMessageEntity>(
          this as ChatMessageEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.toolsUsed, toolsUsed) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      role,
      content,
      timestamp,
      const DeepCollectionEquality().hash(toolsUsed),
      isSynced,
      isPending);

  @override
  String toString() {
    return 'ChatMessageEntity(id: $id, sessionId: $sessionId, role: $role, content: $content, timestamp: $timestamp, toolsUsed: $toolsUsed, isSynced: $isSynced, isPending: $isPending)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageEntityCopyWith<$Res> {
  factory $ChatMessageEntityCopyWith(
          ChatMessageEntity value, $Res Function(ChatMessageEntity) _then) =
      _$ChatMessageEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String role,
      String content,
      DateTime timestamp,
      List<String>? toolsUsed,
      bool isSynced,
      bool isPending});
}

/// @nodoc
class _$ChatMessageEntityCopyWithImpl<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  _$ChatMessageEntityCopyWithImpl(this._self, this._then);

  final ChatMessageEntity _self;
  final $Res Function(ChatMessageEntity) _then;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
    Object? toolsUsed = freezed,
    Object? isSynced = null,
    Object? isPending = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toolsUsed: freezed == toolsUsed
          ? _self.toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isSynced: null == isSynced
          ? _self.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      isPending: null == isPending
          ? _self.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatMessageEntity].
extension ChatMessageEntityPatterns on ChatMessageEntity {
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
    TResult Function(_ChatMessageEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity() when $default != null:
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
    TResult Function(_ChatMessageEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity():
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
    TResult? Function(_ChatMessageEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity() when $default != null:
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
            String id,
            String sessionId,
            String role,
            String content,
            DateTime timestamp,
            List<String>? toolsUsed,
            bool isSynced,
            bool isPending)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity() when $default != null:
        return $default(_that.id, _that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed, _that.isSynced, _that.isPending);
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
            String id,
            String sessionId,
            String role,
            String content,
            DateTime timestamp,
            List<String>? toolsUsed,
            bool isSynced,
            bool isPending)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity():
        return $default(_that.id, _that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed, _that.isSynced, _that.isPending);
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
            String id,
            String sessionId,
            String role,
            String content,
            DateTime timestamp,
            List<String>? toolsUsed,
            bool isSynced,
            bool isPending)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageEntity() when $default != null:
        return $default(_that.id, _that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed, _that.isSynced, _that.isPending);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChatMessageEntity extends ChatMessageEntity {
  const _ChatMessageEntity(
      {required this.id,
      required this.sessionId,
      required this.role,
      required this.content,
      required this.timestamp,
      final List<String>? toolsUsed,
      this.isSynced = false,
      this.isPending = false})
      : _toolsUsed = toolsUsed,
        super._();

  /// Unique identifier for the message
  @override
  final String id;

  /// Session ID this message belongs to
  @override
  final String sessionId;

  /// Role of the message sender: 'user' or 'assistant'
  @override
  final String role;

  /// Message content/text
  @override
  final String content;

  /// When the message was created
  @override
  final DateTime timestamp;

  /// Optional: Tools used by assistant to generate response
  final List<String>? _toolsUsed;

  /// Optional: Tools used by assistant to generate response
  @override
  List<String>? get toolsUsed {
    final value = _toolsUsed;
    if (value == null) return null;
    if (_toolsUsed is EqualUnmodifiableListView) return _toolsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Whether this message has been synced to the server
  /// Used for offline-first functionality
  @override
  @JsonKey()
  final bool isSynced;

  /// Whether this message is pending send (in offline queue)
  @override
  @JsonKey()
  final bool isPending;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageEntityCopyWith<_ChatMessageEntity> get copyWith =>
      __$ChatMessageEntityCopyWithImpl<_ChatMessageEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._toolsUsed, _toolsUsed) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      role,
      content,
      timestamp,
      const DeepCollectionEquality().hash(_toolsUsed),
      isSynced,
      isPending);

  @override
  String toString() {
    return 'ChatMessageEntity(id: $id, sessionId: $sessionId, role: $role, content: $content, timestamp: $timestamp, toolsUsed: $toolsUsed, isSynced: $isSynced, isPending: $isPending)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageEntityCopyWith<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  factory _$ChatMessageEntityCopyWith(
          _ChatMessageEntity value, $Res Function(_ChatMessageEntity) _then) =
      __$ChatMessageEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String role,
      String content,
      DateTime timestamp,
      List<String>? toolsUsed,
      bool isSynced,
      bool isPending});
}

/// @nodoc
class __$ChatMessageEntityCopyWithImpl<$Res>
    implements _$ChatMessageEntityCopyWith<$Res> {
  __$ChatMessageEntityCopyWithImpl(this._self, this._then);

  final _ChatMessageEntity _self;
  final $Res Function(_ChatMessageEntity) _then;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
    Object? toolsUsed = freezed,
    Object? isSynced = null,
    Object? isPending = null,
  }) {
    return _then(_ChatMessageEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toolsUsed: freezed == toolsUsed
          ? _self._toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isSynced: null == isSynced
          ? _self.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      isPending: null == isPending
          ? _self.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
