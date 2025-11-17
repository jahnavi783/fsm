// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent()';
  }
}

/// @nodoc
class $ChatEventCopyWith<$Res> {
  $ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}

/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_RestoreSession value)? restoreSession,
    TResult Function(_SyncPendingMessages value)? syncPendingMessages,
    TResult Function(_ClearData value)? clearData,
    TResult Function(_MarkMessageSeen value)? markMessageSeen,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize() when initialize != null:
        return initialize(_that);
      case _StartSession() when startSession != null:
        return startSession(_that);
      case _SendMessage() when sendMessage != null:
        return sendMessage(_that);
      case _LoadHistory() when loadHistory != null:
        return loadHistory(_that);
      case _EndSession() when endSession != null:
        return endSession(_that);
      case _RestoreSession() when restoreSession != null:
        return restoreSession(_that);
      case _SyncPendingMessages() when syncPendingMessages != null:
        return syncPendingMessages(_that);
      case _ClearData() when clearData != null:
        return clearData(_that);
      case _MarkMessageSeen() when markMessageSeen != null:
        return markMessageSeen(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_RestoreSession value) restoreSession,
    required TResult Function(_SyncPendingMessages value) syncPendingMessages,
    required TResult Function(_ClearData value) clearData,
    required TResult Function(_MarkMessageSeen value) markMessageSeen,
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize():
        return initialize(_that);
      case _StartSession():
        return startSession(_that);
      case _SendMessage():
        return sendMessage(_that);
      case _LoadHistory():
        return loadHistory(_that);
      case _EndSession():
        return endSession(_that);
      case _RestoreSession():
        return restoreSession(_that);
      case _SyncPendingMessages():
        return syncPendingMessages(_that);
      case _ClearData():
        return clearData(_that);
      case _MarkMessageSeen():
        return markMessageSeen(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_RestoreSession value)? restoreSession,
    TResult? Function(_SyncPendingMessages value)? syncPendingMessages,
    TResult? Function(_ClearData value)? clearData,
    TResult? Function(_MarkMessageSeen value)? markMessageSeen,
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize() when initialize != null:
        return initialize(_that);
      case _StartSession() when startSession != null:
        return startSession(_that);
      case _SendMessage() when sendMessage != null:
        return sendMessage(_that);
      case _LoadHistory() when loadHistory != null:
        return loadHistory(_that);
      case _EndSession() when endSession != null:
        return endSession(_that);
      case _RestoreSession() when restoreSession != null:
        return restoreSession(_that);
      case _SyncPendingMessages() when syncPendingMessages != null:
        return syncPendingMessages(_that);
      case _ClearData() when clearData != null:
        return clearData(_that);
      case _MarkMessageSeen() when markMessageSeen != null:
        return markMessageSeen(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? startSession,
    TResult Function(String message)? sendMessage,
    TResult Function(bool forceRefresh)? loadHistory,
    TResult Function()? endSession,
    TResult Function()? restoreSession,
    TResult Function()? syncPendingMessages,
    TResult Function()? clearData,
    TResult Function(String messageId)? markMessageSeen,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize() when initialize != null:
        return initialize();
      case _StartSession() when startSession != null:
        return startSession();
      case _SendMessage() when sendMessage != null:
        return sendMessage(_that.message);
      case _LoadHistory() when loadHistory != null:
        return loadHistory(_that.forceRefresh);
      case _EndSession() when endSession != null:
        return endSession();
      case _RestoreSession() when restoreSession != null:
        return restoreSession();
      case _SyncPendingMessages() when syncPendingMessages != null:
        return syncPendingMessages();
      case _ClearData() when clearData != null:
        return clearData();
      case _MarkMessageSeen() when markMessageSeen != null:
        return markMessageSeen(_that.messageId);
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() startSession,
    required TResult Function(String message) sendMessage,
    required TResult Function(bool forceRefresh) loadHistory,
    required TResult Function() endSession,
    required TResult Function() restoreSession,
    required TResult Function() syncPendingMessages,
    required TResult Function() clearData,
    required TResult Function(String messageId) markMessageSeen,
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize():
        return initialize();
      case _StartSession():
        return startSession();
      case _SendMessage():
        return sendMessage(_that.message);
      case _LoadHistory():
        return loadHistory(_that.forceRefresh);
      case _EndSession():
        return endSession();
      case _RestoreSession():
        return restoreSession();
      case _SyncPendingMessages():
        return syncPendingMessages();
      case _ClearData():
        return clearData();
      case _MarkMessageSeen():
        return markMessageSeen(_that.messageId);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? startSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function(bool forceRefresh)? loadHistory,
    TResult? Function()? endSession,
    TResult? Function()? restoreSession,
    TResult? Function()? syncPendingMessages,
    TResult? Function()? clearData,
    TResult? Function(String messageId)? markMessageSeen,
  }) {
    final _that = this;
    switch (_that) {
      case _Initialize() when initialize != null:
        return initialize();
      case _StartSession() when startSession != null:
        return startSession();
      case _SendMessage() when sendMessage != null:
        return sendMessage(_that.message);
      case _LoadHistory() when loadHistory != null:
        return loadHistory(_that.forceRefresh);
      case _EndSession() when endSession != null:
        return endSession();
      case _RestoreSession() when restoreSession != null:
        return restoreSession();
      case _SyncPendingMessages() when syncPendingMessages != null:
        return syncPendingMessages();
      case _ClearData() when clearData != null:
        return clearData();
      case _MarkMessageSeen() when markMessageSeen != null:
        return markMessageSeen(_that.messageId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initialize implements ChatEvent {
  const _Initialize();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.initialize()';
  }
}

/// @nodoc

class _StartSession implements ChatEvent {
  const _StartSession();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StartSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.startSession()';
  }
}

/// @nodoc

class _SendMessage implements ChatEvent {
  const _SendMessage({required this.message});

  final String message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendMessageCopyWith<_SendMessage> get copyWith =>
      __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChatEvent.sendMessage(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(
          _SendMessage value, $Res Function(_SendMessage) _then) =
      __$SendMessageCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$SendMessageCopyWithImpl<$Res> implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_SendMessage(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoadHistory implements ChatEvent {
  const _LoadHistory({this.forceRefresh = false});

  @JsonKey()
  final bool forceRefresh;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadHistoryCopyWith<_LoadHistory> get copyWith =>
      __$LoadHistoryCopyWithImpl<_LoadHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadHistory &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  @override
  String toString() {
    return 'ChatEvent.loadHistory(forceRefresh: $forceRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadHistoryCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$LoadHistoryCopyWith(
          _LoadHistory value, $Res Function(_LoadHistory) _then) =
      __$LoadHistoryCopyWithImpl;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class __$LoadHistoryCopyWithImpl<$Res> implements _$LoadHistoryCopyWith<$Res> {
  __$LoadHistoryCopyWithImpl(this._self, this._then);

  final _LoadHistory _self;
  final $Res Function(_LoadHistory) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(_LoadHistory(
      forceRefresh: null == forceRefresh
          ? _self.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _EndSession implements ChatEvent {
  const _EndSession();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EndSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.endSession()';
  }
}

/// @nodoc

class _RestoreSession implements ChatEvent {
  const _RestoreSession();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RestoreSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.restoreSession()';
  }
}

/// @nodoc

class _SyncPendingMessages implements ChatEvent {
  const _SyncPendingMessages();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SyncPendingMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.syncPendingMessages()';
  }
}

/// @nodoc

class _ClearData implements ChatEvent {
  const _ClearData();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClearData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatEvent.clearData()';
  }
}

/// @nodoc

class _MarkMessageSeen implements ChatEvent {
  const _MarkMessageSeen({required this.messageId});

  final String messageId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarkMessageSeenCopyWith<_MarkMessageSeen> get copyWith =>
      __$MarkMessageSeenCopyWithImpl<_MarkMessageSeen>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarkMessageSeen &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  @override
  String toString() {
    return 'ChatEvent.markMessageSeen(messageId: $messageId)';
  }
}

/// @nodoc
abstract mixin class _$MarkMessageSeenCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$MarkMessageSeenCopyWith(
          _MarkMessageSeen value, $Res Function(_MarkMessageSeen) _then) =
      __$MarkMessageSeenCopyWithImpl;
  @useResult
  $Res call({String messageId});
}

/// @nodoc
class __$MarkMessageSeenCopyWithImpl<$Res>
    implements _$MarkMessageSeenCopyWith<$Res> {
  __$MarkMessageSeenCopyWithImpl(this._self, this._then);

  final _MarkMessageSeen _self;
  final $Res Function(_MarkMessageSeen) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_MarkMessageSeen(
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
