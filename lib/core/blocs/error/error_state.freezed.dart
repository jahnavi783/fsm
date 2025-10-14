// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorState {
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Failure failure, String? context, bool canRetry,
            VoidCallback? retryAction)?
        error,
    TResult? Function(String message, String details, DateTime occurredAt)?
        criticalError,
    TResult? Function()? dismissed,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res, ErrorState>;
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res, $Val extends ErrorState>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ErrorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return initial();
  }

  @override
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
    return initial?.call();
  }

  @override
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
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ErrorState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Failure failure,
      String? context,
      bool canRetry,
      VoidCallback? retryAction});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? context = freezed,
    Object? canRetry = null,
    Object? retryAction = freezed,
  }) {
    return _then(_$ErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      canRetry: null == canRetry
          ? _value.canRetry
          : canRetry // ignore: cast_nullable_to_non_nullable
              as bool,
      retryAction: freezed == retryAction
          ? _value.retryAction
          : retryAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      {required this.failure,
      this.context,
      this.canRetry = false,
      this.retryAction});

  @override
  final Failure failure;
  @override
  final String? context;
  @override
  @JsonKey()
  final bool canRetry;
  @override
  final VoidCallback? retryAction;

  @override
  String toString() {
    return 'ErrorState.error(failure: $failure, context: $context, canRetry: $canRetry, retryAction: $retryAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
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
    return error(failure, context, canRetry, retryAction);
  }

  @override
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
    return error?.call(failure, context, canRetry, retryAction);
  }

  @override
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
    if (error != null) {
      return error(failure, context, canRetry, retryAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ErrorState {
  const factory _Error(
      {required final Failure failure,
      final String? context,
      final bool canRetry,
      final VoidCallback? retryAction}) = _$ErrorImpl;

  Failure get failure;
  String? get context;
  bool get canRetry;
  VoidCallback? get retryAction;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CriticalErrorImplCopyWith<$Res> {
  factory _$$CriticalErrorImplCopyWith(
          _$CriticalErrorImpl value, $Res Function(_$CriticalErrorImpl) then) =
      __$$CriticalErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String details, DateTime occurredAt});
}

/// @nodoc
class __$$CriticalErrorImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$CriticalErrorImpl>
    implements _$$CriticalErrorImplCopyWith<$Res> {
  __$$CriticalErrorImplCopyWithImpl(
      _$CriticalErrorImpl _value, $Res Function(_$CriticalErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = null,
    Object? occurredAt = null,
  }) {
    return _then(_$CriticalErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      occurredAt: null == occurredAt
          ? _value.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CriticalErrorImpl implements _CriticalError {
  const _$CriticalErrorImpl(
      {required this.message, required this.details, required this.occurredAt});

  @override
  final String message;
  @override
  final String details;
  @override
  final DateTime occurredAt;

  @override
  String toString() {
    return 'ErrorState.criticalError(message: $message, details: $details, occurredAt: $occurredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CriticalErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, occurredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CriticalErrorImplCopyWith<_$CriticalErrorImpl> get copyWith =>
      __$$CriticalErrorImplCopyWithImpl<_$CriticalErrorImpl>(this, _$identity);

  @override
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
    return criticalError(message, details, occurredAt);
  }

  @override
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
    return criticalError?.call(message, details, occurredAt);
  }

  @override
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
    if (criticalError != null) {
      return criticalError(message, details, occurredAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) {
    return criticalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) {
    return criticalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (criticalError != null) {
      return criticalError(this);
    }
    return orElse();
  }
}

abstract class _CriticalError implements ErrorState {
  const factory _CriticalError(
      {required final String message,
      required final String details,
      required final DateTime occurredAt}) = _$CriticalErrorImpl;

  String get message;
  String get details;
  DateTime get occurredAt;
  @JsonKey(ignore: true)
  _$$CriticalErrorImplCopyWith<_$CriticalErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DismissedImplCopyWith<$Res> {
  factory _$$DismissedImplCopyWith(
          _$DismissedImpl value, $Res Function(_$DismissedImpl) then) =
      __$$DismissedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DismissedImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$DismissedImpl>
    implements _$$DismissedImplCopyWith<$Res> {
  __$$DismissedImplCopyWithImpl(
      _$DismissedImpl _value, $Res Function(_$DismissedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DismissedImpl implements _Dismissed {
  const _$DismissedImpl();

  @override
  String toString() {
    return 'ErrorState.dismissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DismissedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return dismissed();
  }

  @override
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
    return dismissed?.call();
  }

  @override
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
    if (dismissed != null) {
      return dismissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_CriticalError value) criticalError,
    required TResult Function(_Dismissed value) dismissed,
  }) {
    return dismissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_CriticalError value)? criticalError,
    TResult? Function(_Dismissed value)? dismissed,
  }) {
    return dismissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_CriticalError value)? criticalError,
    TResult Function(_Dismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (dismissed != null) {
      return dismissed(this);
    }
    return orElse();
  }
}

abstract class _Dismissed implements ErrorState {
  const factory _Dismissed() = _$DismissedImpl;
}
