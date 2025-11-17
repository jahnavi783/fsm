// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageDto {
  String get sessionId;
  String get role;
  String get content;
  String get timestamp;
  List<String>? get toolsUsed;

  /// Create a copy of ChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageDtoCopyWith<ChatMessageDto> get copyWith =>
      _$ChatMessageDtoCopyWithImpl<ChatMessageDto>(
          this as ChatMessageDto, _$identity);

  /// Serializes this ChatMessageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.toolsUsed, toolsUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, role, content,
      timestamp, const DeepCollectionEquality().hash(toolsUsed));

  @override
  String toString() {
    return 'ChatMessageDto(sessionId: $sessionId, role: $role, content: $content, timestamp: $timestamp, toolsUsed: $toolsUsed)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageDtoCopyWith<$Res> {
  factory $ChatMessageDtoCopyWith(
          ChatMessageDto value, $Res Function(ChatMessageDto) _then) =
      _$ChatMessageDtoCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      String role,
      String content,
      String timestamp,
      List<String>? toolsUsed});
}

/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final ChatMessageDto _self;
  final $Res Function(ChatMessageDto) _then;

  /// Create a copy of ChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
    Object? toolsUsed = freezed,
  }) {
    return _then(_self.copyWith(
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
              as String,
      toolsUsed: freezed == toolsUsed
          ? _self.toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatMessageDto].
extension ChatMessageDtoPatterns on ChatMessageDto {
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
    TResult Function(_ChatMessageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto() when $default != null:
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
    TResult Function(_ChatMessageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto():
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
    TResult? Function(_ChatMessageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto() when $default != null:
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
    TResult Function(String sessionId, String role, String content,
            String timestamp, List<String>? toolsUsed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto() when $default != null:
        return $default(_that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed);
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
    TResult Function(String sessionId, String role, String content,
            String timestamp, List<String>? toolsUsed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto():
        return $default(_that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed);
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
    TResult? Function(String sessionId, String role, String content,
            String timestamp, List<String>? toolsUsed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageDto() when $default != null:
        return $default(_that.sessionId, _that.role, _that.content,
            _that.timestamp, _that.toolsUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageDto extends ChatMessageDto {
  const _ChatMessageDto(
      {required this.sessionId,
      required this.role,
      required this.content,
      required this.timestamp,
      final List<String>? toolsUsed})
      : _toolsUsed = toolsUsed,
        super._();
  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);

  @override
  final String sessionId;
  @override
  final String role;
  @override
  final String content;
  @override
  final String timestamp;
  final List<String>? _toolsUsed;
  @override
  List<String>? get toolsUsed {
    final value = _toolsUsed;
    if (value == null) return null;
    if (_toolsUsed is EqualUnmodifiableListView) return _toolsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageDtoCopyWith<_ChatMessageDto> get copyWith =>
      __$ChatMessageDtoCopyWithImpl<_ChatMessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._toolsUsed, _toolsUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, role, content,
      timestamp, const DeepCollectionEquality().hash(_toolsUsed));

  @override
  String toString() {
    return 'ChatMessageDto(sessionId: $sessionId, role: $role, content: $content, timestamp: $timestamp, toolsUsed: $toolsUsed)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageDtoCopyWith<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  factory _$ChatMessageDtoCopyWith(
          _ChatMessageDto value, $Res Function(_ChatMessageDto) _then) =
      __$ChatMessageDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String role,
      String content,
      String timestamp,
      List<String>? toolsUsed});
}

/// @nodoc
class __$ChatMessageDtoCopyWithImpl<$Res>
    implements _$ChatMessageDtoCopyWith<$Res> {
  __$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final _ChatMessageDto _self;
  final $Res Function(_ChatMessageDto) _then;

  /// Create a copy of ChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
    Object? toolsUsed = freezed,
  }) {
    return _then(_ChatMessageDto(
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
              as String,
      toolsUsed: freezed == toolsUsed
          ? _self._toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$ChatMessageResponseDto {
  bool get success;
  String get message;
  List<String>? get toolsUsed;

  /// Create a copy of ChatMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageResponseDtoCopyWith<ChatMessageResponseDto> get copyWith =>
      _$ChatMessageResponseDtoCopyWithImpl<ChatMessageResponseDto>(
          this as ChatMessageResponseDto, _$identity);

  /// Serializes this ChatMessageResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.toolsUsed, toolsUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(toolsUsed));

  @override
  String toString() {
    return 'ChatMessageResponseDto(success: $success, message: $message, toolsUsed: $toolsUsed)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageResponseDtoCopyWith<$Res> {
  factory $ChatMessageResponseDtoCopyWith(ChatMessageResponseDto value,
          $Res Function(ChatMessageResponseDto) _then) =
      _$ChatMessageResponseDtoCopyWithImpl;
  @useResult
  $Res call({bool success, String message, List<String>? toolsUsed});
}

/// @nodoc
class _$ChatMessageResponseDtoCopyWithImpl<$Res>
    implements $ChatMessageResponseDtoCopyWith<$Res> {
  _$ChatMessageResponseDtoCopyWithImpl(this._self, this._then);

  final ChatMessageResponseDto _self;
  final $Res Function(ChatMessageResponseDto) _then;

  /// Create a copy of ChatMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? toolsUsed = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toolsUsed: freezed == toolsUsed
          ? _self.toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatMessageResponseDto].
extension ChatMessageResponseDtoPatterns on ChatMessageResponseDto {
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
    TResult Function(_ChatMessageResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto() when $default != null:
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
    TResult Function(_ChatMessageResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto():
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
    TResult? Function(_ChatMessageResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto() when $default != null:
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
    TResult Function(bool success, String message, List<String>? toolsUsed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto() when $default != null:
        return $default(_that.success, _that.message, _that.toolsUsed);
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
    TResult Function(bool success, String message, List<String>? toolsUsed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto():
        return $default(_that.success, _that.message, _that.toolsUsed);
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
    TResult? Function(bool success, String message, List<String>? toolsUsed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageResponseDto() when $default != null:
        return $default(_that.success, _that.message, _that.toolsUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageResponseDto extends ChatMessageResponseDto {
  const _ChatMessageResponseDto(
      {required this.success,
      required this.message,
      final List<String>? toolsUsed})
      : _toolsUsed = toolsUsed,
        super._();
  factory _ChatMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseDtoFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<String>? _toolsUsed;
  @override
  List<String>? get toolsUsed {
    final value = _toolsUsed;
    if (value == null) return null;
    if (_toolsUsed is EqualUnmodifiableListView) return _toolsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ChatMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageResponseDtoCopyWith<_ChatMessageResponseDto> get copyWith =>
      __$ChatMessageResponseDtoCopyWithImpl<_ChatMessageResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._toolsUsed, _toolsUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_toolsUsed));

  @override
  String toString() {
    return 'ChatMessageResponseDto(success: $success, message: $message, toolsUsed: $toolsUsed)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageResponseDtoCopyWith<$Res>
    implements $ChatMessageResponseDtoCopyWith<$Res> {
  factory _$ChatMessageResponseDtoCopyWith(_ChatMessageResponseDto value,
          $Res Function(_ChatMessageResponseDto) _then) =
      __$ChatMessageResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, List<String>? toolsUsed});
}

/// @nodoc
class __$ChatMessageResponseDtoCopyWithImpl<$Res>
    implements _$ChatMessageResponseDtoCopyWith<$Res> {
  __$ChatMessageResponseDtoCopyWithImpl(this._self, this._then);

  final _ChatMessageResponseDto _self;
  final $Res Function(_ChatMessageResponseDto) _then;

  /// Create a copy of ChatMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? toolsUsed = freezed,
  }) {
    return _then(_ChatMessageResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toolsUsed: freezed == toolsUsed
          ? _self._toolsUsed
          : toolsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$ChatHistoryResponseDto {
  bool get success;
  List<ChatHistoryMessageDto> get history;

  /// Create a copy of ChatHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatHistoryResponseDtoCopyWith<ChatHistoryResponseDto> get copyWith =>
      _$ChatHistoryResponseDtoCopyWithImpl<ChatHistoryResponseDto>(
          this as ChatHistoryResponseDto, _$identity);

  /// Serializes this ChatHistoryResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatHistoryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(history));

  @override
  String toString() {
    return 'ChatHistoryResponseDto(success: $success, history: $history)';
  }
}

/// @nodoc
abstract mixin class $ChatHistoryResponseDtoCopyWith<$Res> {
  factory $ChatHistoryResponseDtoCopyWith(ChatHistoryResponseDto value,
          $Res Function(ChatHistoryResponseDto) _then) =
      _$ChatHistoryResponseDtoCopyWithImpl;
  @useResult
  $Res call({bool success, List<ChatHistoryMessageDto> history});
}

/// @nodoc
class _$ChatHistoryResponseDtoCopyWithImpl<$Res>
    implements $ChatHistoryResponseDtoCopyWith<$Res> {
  _$ChatHistoryResponseDtoCopyWithImpl(this._self, this._then);

  final ChatHistoryResponseDto _self;
  final $Res Function(ChatHistoryResponseDto) _then;

  /// Create a copy of ChatHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? history = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<ChatHistoryMessageDto>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatHistoryResponseDto].
extension ChatHistoryResponseDtoPatterns on ChatHistoryResponseDto {
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
    TResult Function(_ChatHistoryResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto() when $default != null:
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
    TResult Function(_ChatHistoryResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto():
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
    TResult? Function(_ChatHistoryResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto() when $default != null:
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
    TResult Function(bool success, List<ChatHistoryMessageDto> history)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto() when $default != null:
        return $default(_that.success, _that.history);
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
    TResult Function(bool success, List<ChatHistoryMessageDto> history)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto():
        return $default(_that.success, _that.history);
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
    TResult? Function(bool success, List<ChatHistoryMessageDto> history)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryResponseDto() when $default != null:
        return $default(_that.success, _that.history);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatHistoryResponseDto extends ChatHistoryResponseDto {
  const _ChatHistoryResponseDto(
      {required this.success,
      required final List<ChatHistoryMessageDto> history})
      : _history = history,
        super._();
  factory _ChatHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseDtoFromJson(json);

  @override
  final bool success;
  final List<ChatHistoryMessageDto> _history;
  @override
  List<ChatHistoryMessageDto> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of ChatHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatHistoryResponseDtoCopyWith<_ChatHistoryResponseDto> get copyWith =>
      __$ChatHistoryResponseDtoCopyWithImpl<_ChatHistoryResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatHistoryResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatHistoryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'ChatHistoryResponseDto(success: $success, history: $history)';
  }
}

/// @nodoc
abstract mixin class _$ChatHistoryResponseDtoCopyWith<$Res>
    implements $ChatHistoryResponseDtoCopyWith<$Res> {
  factory _$ChatHistoryResponseDtoCopyWith(_ChatHistoryResponseDto value,
          $Res Function(_ChatHistoryResponseDto) _then) =
      __$ChatHistoryResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, List<ChatHistoryMessageDto> history});
}

/// @nodoc
class __$ChatHistoryResponseDtoCopyWithImpl<$Res>
    implements _$ChatHistoryResponseDtoCopyWith<$Res> {
  __$ChatHistoryResponseDtoCopyWithImpl(this._self, this._then);

  final _ChatHistoryResponseDto _self;
  final $Res Function(_ChatHistoryResponseDto) _then;

  /// Create a copy of ChatHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? history = null,
  }) {
    return _then(_ChatHistoryResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<ChatHistoryMessageDto>,
    ));
  }
}

/// @nodoc
mixin _$ChatHistoryMessageDto {
  String get role;
  String get content;
  String get timestamp;

  /// Create a copy of ChatHistoryMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatHistoryMessageDtoCopyWith<ChatHistoryMessageDto> get copyWith =>
      _$ChatHistoryMessageDtoCopyWithImpl<ChatHistoryMessageDto>(
          this as ChatHistoryMessageDto, _$identity);

  /// Serializes this ChatHistoryMessageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatHistoryMessageDto &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content, timestamp);

  @override
  String toString() {
    return 'ChatHistoryMessageDto(role: $role, content: $content, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ChatHistoryMessageDtoCopyWith<$Res> {
  factory $ChatHistoryMessageDtoCopyWith(ChatHistoryMessageDto value,
          $Res Function(ChatHistoryMessageDto) _then) =
      _$ChatHistoryMessageDtoCopyWithImpl;
  @useResult
  $Res call({String role, String content, String timestamp});
}

/// @nodoc
class _$ChatHistoryMessageDtoCopyWithImpl<$Res>
    implements $ChatHistoryMessageDtoCopyWith<$Res> {
  _$ChatHistoryMessageDtoCopyWithImpl(this._self, this._then);

  final ChatHistoryMessageDto _self;
  final $Res Function(ChatHistoryMessageDto) _then;

  /// Create a copy of ChatHistoryMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_self.copyWith(
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
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatHistoryMessageDto].
extension ChatHistoryMessageDtoPatterns on ChatHistoryMessageDto {
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
    TResult Function(_ChatHistoryMessageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto() when $default != null:
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
    TResult Function(_ChatHistoryMessageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto():
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
    TResult? Function(_ChatHistoryMessageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto() when $default != null:
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
    TResult Function(String role, String content, String timestamp)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto() when $default != null:
        return $default(_that.role, _that.content, _that.timestamp);
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
    TResult Function(String role, String content, String timestamp) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto():
        return $default(_that.role, _that.content, _that.timestamp);
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
    TResult? Function(String role, String content, String timestamp)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatHistoryMessageDto() when $default != null:
        return $default(_that.role, _that.content, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatHistoryMessageDto extends ChatHistoryMessageDto {
  const _ChatHistoryMessageDto(
      {required this.role, required this.content, required this.timestamp})
      : super._();
  factory _ChatHistoryMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryMessageDtoFromJson(json);

  @override
  final String role;
  @override
  final String content;
  @override
  final String timestamp;

  /// Create a copy of ChatHistoryMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatHistoryMessageDtoCopyWith<_ChatHistoryMessageDto> get copyWith =>
      __$ChatHistoryMessageDtoCopyWithImpl<_ChatHistoryMessageDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatHistoryMessageDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatHistoryMessageDto &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content, timestamp);

  @override
  String toString() {
    return 'ChatHistoryMessageDto(role: $role, content: $content, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ChatHistoryMessageDtoCopyWith<$Res>
    implements $ChatHistoryMessageDtoCopyWith<$Res> {
  factory _$ChatHistoryMessageDtoCopyWith(_ChatHistoryMessageDto value,
          $Res Function(_ChatHistoryMessageDto) _then) =
      __$ChatHistoryMessageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String role, String content, String timestamp});
}

/// @nodoc
class __$ChatHistoryMessageDtoCopyWithImpl<$Res>
    implements _$ChatHistoryMessageDtoCopyWith<$Res> {
  __$ChatHistoryMessageDtoCopyWithImpl(this._self, this._then);

  final _ChatHistoryMessageDto _self;
  final $Res Function(_ChatHistoryMessageDto) _then;

  /// Create a copy of ChatHistoryMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_ChatHistoryMessageDto(
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
              as String,
    ));
  }
}

/// @nodoc
mixin _$ChatMessageRequestDto {
  String get sessionId;
  String get message;

  /// Create a copy of ChatMessageRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageRequestDtoCopyWith<ChatMessageRequestDto> get copyWith =>
      _$ChatMessageRequestDtoCopyWithImpl<ChatMessageRequestDto>(
          this as ChatMessageRequestDto, _$identity);

  /// Serializes this ChatMessageRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageRequestDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, message);

  @override
  String toString() {
    return 'ChatMessageRequestDto(sessionId: $sessionId, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageRequestDtoCopyWith<$Res> {
  factory $ChatMessageRequestDtoCopyWith(ChatMessageRequestDto value,
          $Res Function(ChatMessageRequestDto) _then) =
      _$ChatMessageRequestDtoCopyWithImpl;
  @useResult
  $Res call({String sessionId, String message});
}

/// @nodoc
class _$ChatMessageRequestDtoCopyWithImpl<$Res>
    implements $ChatMessageRequestDtoCopyWith<$Res> {
  _$ChatMessageRequestDtoCopyWithImpl(this._self, this._then);

  final ChatMessageRequestDto _self;
  final $Res Function(ChatMessageRequestDto) _then;

  /// Create a copy of ChatMessageRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatMessageRequestDto].
extension ChatMessageRequestDtoPatterns on ChatMessageRequestDto {
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
    TResult Function(_ChatMessageRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto() when $default != null:
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
    TResult Function(_ChatMessageRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto():
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
    TResult? Function(_ChatMessageRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto() when $default != null:
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
    TResult Function(String sessionId, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto() when $default != null:
        return $default(_that.sessionId, _that.message);
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
    TResult Function(String sessionId, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto():
        return $default(_that.sessionId, _that.message);
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
    TResult? Function(String sessionId, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatMessageRequestDto() when $default != null:
        return $default(_that.sessionId, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageRequestDto implements ChatMessageRequestDto {
  const _ChatMessageRequestDto(
      {required this.sessionId, required this.message});
  factory _ChatMessageRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageRequestDtoFromJson(json);

  @override
  final String sessionId;
  @override
  final String message;

  /// Create a copy of ChatMessageRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageRequestDtoCopyWith<_ChatMessageRequestDto> get copyWith =>
      __$ChatMessageRequestDtoCopyWithImpl<_ChatMessageRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageRequestDto &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, message);

  @override
  String toString() {
    return 'ChatMessageRequestDto(sessionId: $sessionId, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageRequestDtoCopyWith<$Res>
    implements $ChatMessageRequestDtoCopyWith<$Res> {
  factory _$ChatMessageRequestDtoCopyWith(_ChatMessageRequestDto value,
          $Res Function(_ChatMessageRequestDto) _then) =
      __$ChatMessageRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String sessionId, String message});
}

/// @nodoc
class __$ChatMessageRequestDtoCopyWithImpl<$Res>
    implements _$ChatMessageRequestDtoCopyWith<$Res> {
  __$ChatMessageRequestDtoCopyWithImpl(this._self, this._then);

  final _ChatMessageRequestDto _self;
  final $Res Function(_ChatMessageRequestDto) _then;

  /// Create a copy of ChatMessageRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? message = null,
  }) {
    return _then(_ChatMessageRequestDto(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
