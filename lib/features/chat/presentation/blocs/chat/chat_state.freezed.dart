// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {
  /// Current session (null if no active session)
  ChatSessionEntity? get session;

  /// List of messages in the conversation
  List<ChatMessageEntity> get messages;

  /// Loading state
  bool get isLoading;

  /// Bot is typing indicator
  bool get isBotTyping;

  /// Error message if any
  String? get error;

  /// Whether chat is initialized
  bool get isInitialized;

  /// Whether user can send messages
  bool get canSendMessages;

  /// Offline mode indicator
  bool get isOffline;

  /// Number of pending messages waiting to sync
  int get pendingMessageCount;

  /// Last sync timestamp
  DateTime? get lastSyncTime;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<ChatState> get copyWith =>
      _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatState &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBotTyping, isBotTyping) ||
                other.isBotTyping == isBotTyping) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.canSendMessages, canSendMessages) ||
                other.canSendMessages == canSendMessages) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.pendingMessageCount, pendingMessageCount) ||
                other.pendingMessageCount == pendingMessageCount) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      session,
      const DeepCollectionEquality().hash(messages),
      isLoading,
      isBotTyping,
      error,
      isInitialized,
      canSendMessages,
      isOffline,
      pendingMessageCount,
      lastSyncTime);

  @override
  String toString() {
    return 'ChatState(session: $session, messages: $messages, isLoading: $isLoading, isBotTyping: $isBotTyping, error: $error, isInitialized: $isInitialized, canSendMessages: $canSendMessages, isOffline: $isOffline, pendingMessageCount: $pendingMessageCount, lastSyncTime: $lastSyncTime)';
  }
}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) =
      _$ChatStateCopyWithImpl;
  @useResult
  $Res call(
      {ChatSessionEntity? session,
      List<ChatMessageEntity> messages,
      bool isLoading,
      bool isBotTyping,
      String? error,
      bool isInitialized,
      bool canSendMessages,
      bool isOffline,
      int pendingMessageCount,
      DateTime? lastSyncTime});

  $ChatSessionEntityCopyWith<$Res>? get session;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? messages = null,
    Object? isLoading = null,
    Object? isBotTyping = null,
    Object? error = freezed,
    Object? isInitialized = null,
    Object? canSendMessages = null,
    Object? isOffline = null,
    Object? pendingMessageCount = null,
    Object? lastSyncTime = freezed,
  }) {
    return _then(_self.copyWith(
      session: freezed == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as ChatSessionEntity?,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBotTyping: null == isBotTyping
          ? _self.isBotTyping
          : isBotTyping // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isInitialized: null == isInitialized
          ? _self.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      canSendMessages: null == canSendMessages
          ? _self.canSendMessages
          : canSendMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingMessageCount: null == pendingMessageCount
          ? _self.pendingMessageCount
          : pendingMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncTime: freezed == lastSyncTime
          ? _self.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionEntityCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $ChatSessionEntityCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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
    TResult Function(_ChatState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
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
    TResult Function(_ChatState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState():
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
    TResult? Function(_ChatState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
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
            ChatSessionEntity? session,
            List<ChatMessageEntity> messages,
            bool isLoading,
            bool isBotTyping,
            String? error,
            bool isInitialized,
            bool canSendMessages,
            bool isOffline,
            int pendingMessageCount,
            DateTime? lastSyncTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
        return $default(
            _that.session,
            _that.messages,
            _that.isLoading,
            _that.isBotTyping,
            _that.error,
            _that.isInitialized,
            _that.canSendMessages,
            _that.isOffline,
            _that.pendingMessageCount,
            _that.lastSyncTime);
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
            ChatSessionEntity? session,
            List<ChatMessageEntity> messages,
            bool isLoading,
            bool isBotTyping,
            String? error,
            bool isInitialized,
            bool canSendMessages,
            bool isOffline,
            int pendingMessageCount,
            DateTime? lastSyncTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState():
        return $default(
            _that.session,
            _that.messages,
            _that.isLoading,
            _that.isBotTyping,
            _that.error,
            _that.isInitialized,
            _that.canSendMessages,
            _that.isOffline,
            _that.pendingMessageCount,
            _that.lastSyncTime);
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
            ChatSessionEntity? session,
            List<ChatMessageEntity> messages,
            bool isLoading,
            bool isBotTyping,
            String? error,
            bool isInitialized,
            bool canSendMessages,
            bool isOffline,
            int pendingMessageCount,
            DateTime? lastSyncTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
        return $default(
            _that.session,
            _that.messages,
            _that.isLoading,
            _that.isBotTyping,
            _that.error,
            _that.isInitialized,
            _that.canSendMessages,
            _that.isOffline,
            _that.pendingMessageCount,
            _that.lastSyncTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChatState extends ChatState {
  const _ChatState(
      {this.session,
      final List<ChatMessageEntity> messages = const [],
      this.isLoading = false,
      this.isBotTyping = false,
      this.error,
      this.isInitialized = false,
      this.canSendMessages = false,
      this.isOffline = false,
      this.pendingMessageCount = 0,
      this.lastSyncTime})
      : _messages = messages,
        super._();

  /// Current session (null if no active session)
  @override
  final ChatSessionEntity? session;

  /// List of messages in the conversation
  final List<ChatMessageEntity> _messages;

  /// List of messages in the conversation
  @override
  @JsonKey()
  List<ChatMessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Loading state
  @override
  @JsonKey()
  final bool isLoading;

  /// Bot is typing indicator
  @override
  @JsonKey()
  final bool isBotTyping;

  /// Error message if any
  @override
  final String? error;

  /// Whether chat is initialized
  @override
  @JsonKey()
  final bool isInitialized;

  /// Whether user can send messages
  @override
  @JsonKey()
  final bool canSendMessages;

  /// Offline mode indicator
  @override
  @JsonKey()
  final bool isOffline;

  /// Number of pending messages waiting to sync
  @override
  @JsonKey()
  final int pendingMessageCount;

  /// Last sync timestamp
  @override
  final DateTime? lastSyncTime;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBotTyping, isBotTyping) ||
                other.isBotTyping == isBotTyping) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.canSendMessages, canSendMessages) ||
                other.canSendMessages == canSendMessages) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.pendingMessageCount, pendingMessageCount) ||
                other.pendingMessageCount == pendingMessageCount) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      session,
      const DeepCollectionEquality().hash(_messages),
      isLoading,
      isBotTyping,
      error,
      isInitialized,
      canSendMessages,
      isOffline,
      pendingMessageCount,
      lastSyncTime);

  @override
  String toString() {
    return 'ChatState(session: $session, messages: $messages, isLoading: $isLoading, isBotTyping: $isBotTyping, error: $error, isInitialized: $isInitialized, canSendMessages: $canSendMessages, isOffline: $isOffline, pendingMessageCount: $pendingMessageCount, lastSyncTime: $lastSyncTime)';
  }
}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) _then) =
      __$ChatStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChatSessionEntity? session,
      List<ChatMessageEntity> messages,
      bool isLoading,
      bool isBotTyping,
      String? error,
      bool isInitialized,
      bool canSendMessages,
      bool isOffline,
      int pendingMessageCount,
      DateTime? lastSyncTime});

  @override
  $ChatSessionEntityCopyWith<$Res>? get session;
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? session = freezed,
    Object? messages = null,
    Object? isLoading = null,
    Object? isBotTyping = null,
    Object? error = freezed,
    Object? isInitialized = null,
    Object? canSendMessages = null,
    Object? isOffline = null,
    Object? pendingMessageCount = null,
    Object? lastSyncTime = freezed,
  }) {
    return _then(_ChatState(
      session: freezed == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as ChatSessionEntity?,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBotTyping: null == isBotTyping
          ? _self.isBotTyping
          : isBotTyping // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isInitialized: null == isInitialized
          ? _self.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      canSendMessages: null == canSendMessages
          ? _self.canSendMessages
          : canSendMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingMessageCount: null == pendingMessageCount
          ? _self.pendingMessageCount
          : pendingMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncTime: freezed == lastSyncTime
          ? _self.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionEntityCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $ChatSessionEntityCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

// dart format on
