// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ErrorState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ErrorState()';
  }
}

/// @nodoc
class $ErrorStateCopyWith<$Res> {
  $ErrorStateCopyWith(ErrorState _, $Res Function(ErrorState) __);
}

/// Adds pattern-matching-related methods to [ErrorState].
extension ErrorStatePatterns on ErrorState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Error() when error != null:
        return error(_that);
      case _CriticalError() when criticalError != null:
        return criticalError(_that);
      case _Dismissed() when dismissed != null:
        return dismissed(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Error():
        return error(_that);
      case _CriticalError():
        return criticalError(_that);
      case _Dismissed():
        return dismissed(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Error() when error != null:
        return error(_that);
      case _CriticalError() when criticalError != null:
        return criticalError(_that);
      case _Dismissed() when dismissed != null:
        return dismissed(_that);
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
    TResult Function()? initial,
    TResult Function(Failure failure, String? context, bool canRetry,
            VoidCallback? retryAction)?
        error,
    TResult Function(String message, String details, DateTime occurredAt)?
        criticalError,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Error() when error != null:
        return error(
            _that.failure, _that.context, _that.canRetry, _that.retryAction);
      case _CriticalError() when criticalError != null:
        return criticalError(_that.message, _that.details, _that.occurredAt);
      case _Dismissed() when dismissed != null:
        return dismissed();
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
    required TResult Function() initial,
    required TResult Function(Failure failure, String? context, bool canRetry,
            VoidCallback? retryAction)
        error,
    required TResult Function(
            String message, String details, DateTime occurredAt)
        criticalError,
    required TResult Function() dismissed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Error():
        return error(
            _that.failure, _that.context, _that.canRetry, _that.retryAction);
      case _CriticalError():
        return criticalError(_that.message, _that.details, _that.occurredAt);
      case _Dismissed():
        return dismissed();
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
    TResult? Function()? initial,
    TResult? Function(Failure failure, String? context, bool canRetry,
            VoidCallback? retryAction)?
        error,
    TResult? Function(String message, String details, DateTime occurredAt)?
        criticalError,
    TResult? Function()? dismissed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Error() when error != null:
        return error(
            _that.failure, _that.context, _that.canRetry, _that.retryAction);
      case _CriticalError() when criticalError != null:
        return criticalError(_that.message, _that.details, _that.occurredAt);
      case _Dismissed() when dismissed != null:
        return dismissed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ErrorState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ErrorState.initial()';
  }
}

/// @nodoc

class _Error implements ErrorState {
  const _Error(
      {required this.failure,
      this.context,
      this.canRetry = false,
      this.retryAction});

  final Failure failure;
  final String? context;
  @JsonKey()
  final bool canRetry;
  final VoidCallback? retryAction;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.canRetry, canRetry) ||
                other.canRetry == canRetry) &&
            (identical(other.retryAction, retryAction) ||
                other.retryAction == retryAction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, failure, context, canRetry, retryAction);

  @override
  String toString() {
    return 'ErrorState.error(failure: $failure, context: $context, canRetry: $canRetry, retryAction: $retryAction)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call(
      {Failure failure,
      String? context,
      bool canRetry,
      VoidCallback? retryAction});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? context = freezed,
    Object? canRetry = null,
    Object? retryAction = freezed,
  }) {
    return _then(_Error(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      canRetry: null == canRetry
          ? _self.canRetry
          : canRetry // ignore: cast_nullable_to_non_nullable
              as bool,
      retryAction: freezed == retryAction
          ? _self.retryAction
          : retryAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_self.failure, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _CriticalError implements ErrorState {
  const _CriticalError(
      {required this.message, required this.details, required this.occurredAt});

  final String message;
  final String details;
  final DateTime occurredAt;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CriticalErrorCopyWith<_CriticalError> get copyWith =>
      __$CriticalErrorCopyWithImpl<_CriticalError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CriticalError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, occurredAt);

  @override
  String toString() {
    return 'ErrorState.criticalError(message: $message, details: $details, occurredAt: $occurredAt)';
  }
}

/// @nodoc
abstract mixin class _$CriticalErrorCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory _$CriticalErrorCopyWith(
          _CriticalError value, $Res Function(_CriticalError) _then) =
      __$CriticalErrorCopyWithImpl;
  @useResult
  $Res call({String message, String details, DateTime occurredAt});
}

/// @nodoc
class __$CriticalErrorCopyWithImpl<$Res>
    implements _$CriticalErrorCopyWith<$Res> {
  __$CriticalErrorCopyWithImpl(this._self, this._then);

  final _CriticalError _self;
  final $Res Function(_CriticalError) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? details = null,
    Object? occurredAt = null,
  }) {
    return _then(_CriticalError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      occurredAt: null == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _Dismissed implements ErrorState {
  const _Dismissed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Dismissed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ErrorState.dismissed()';
  }
}

// dart format on
