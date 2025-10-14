// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEventCopyWith<$Res> {
  factory $ErrorEventCopyWith(
          ErrorEvent value, $Res Function(ErrorEvent) then) =
      _$ErrorEventCopyWithImpl<$Res, ErrorEvent>;
}

/// @nodoc
class _$ErrorEventCopyWithImpl<$Res, $Val extends ErrorEvent>
    implements $ErrorEventCopyWith<$Res> {
  _$ErrorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorOccurredImplCopyWith<$Res> {
  factory _$$ErrorOccurredImplCopyWith(
          _$ErrorOccurredImpl value, $Res Function(_$ErrorOccurredImpl) then) =
      __$$ErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure, String? context, StackTrace? stackTrace});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorOccurredImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$ErrorOccurredImpl>
    implements _$$ErrorOccurredImplCopyWith<$Res> {
  __$$ErrorOccurredImplCopyWithImpl(
      _$ErrorOccurredImpl _value, $Res Function(_$ErrorOccurredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? context = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ErrorOccurredImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
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

class _$ErrorOccurredImpl
    with DiagnosticableTreeMixin
    implements _ErrorOccurred {
  const _$ErrorOccurredImpl(
      {required this.failure, this.context, this.stackTrace});

  @override
  final Failure failure;
  @override
  final String? context;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.errorOccurred(failure: $failure, context: $context, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorEvent.errorOccurred'))
      ..add(DiagnosticsProperty('failure', failure))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorOccurredImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, context, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      __$$ErrorOccurredImplCopyWithImpl<_$ErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) {
    return errorOccurred(failure, context, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) {
    return errorOccurred?.call(failure, context, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(failure, context, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class _ErrorOccurred implements ErrorEvent {
  const factory _ErrorOccurred(
      {required final Failure failure,
      final String? context,
      final StackTrace? stackTrace}) = _$ErrorOccurredImpl;

  Failure get failure;
  String? get context;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDismissedImplCopyWith<$Res> {
  factory _$$ErrorDismissedImplCopyWith(_$ErrorDismissedImpl value,
          $Res Function(_$ErrorDismissedImpl) then) =
      __$$ErrorDismissedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorDismissedImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$ErrorDismissedImpl>
    implements _$$ErrorDismissedImplCopyWith<$Res> {
  __$$ErrorDismissedImplCopyWithImpl(
      _$ErrorDismissedImpl _value, $Res Function(_$ErrorDismissedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorDismissedImpl
    with DiagnosticableTreeMixin
    implements _ErrorDismissed {
  const _$ErrorDismissedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.errorDismissed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ErrorEvent.errorDismissed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorDismissedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) {
    return errorDismissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) {
    return errorDismissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (errorDismissed != null) {
      return errorDismissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) {
    return errorDismissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) {
    return errorDismissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (errorDismissed != null) {
      return errorDismissed(this);
    }
    return orElse();
  }
}

abstract class _ErrorDismissed implements ErrorEvent {
  const factory _ErrorDismissed() = _$ErrorDismissedImpl;
}

/// @nodoc
abstract class _$$RetryRequestedImplCopyWith<$Res> {
  factory _$$RetryRequestedImplCopyWith(_$RetryRequestedImpl value,
          $Res Function(_$RetryRequestedImpl) then) =
      __$$RetryRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VoidCallback retryAction});
}

/// @nodoc
class __$$RetryRequestedImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$RetryRequestedImpl>
    implements _$$RetryRequestedImplCopyWith<$Res> {
  __$$RetryRequestedImplCopyWithImpl(
      _$RetryRequestedImpl _value, $Res Function(_$RetryRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAction = null,
  }) {
    return _then(_$RetryRequestedImpl(
      retryAction: null == retryAction
          ? _value.retryAction
          : retryAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$RetryRequestedImpl
    with DiagnosticableTreeMixin
    implements _RetryRequested {
  const _$RetryRequestedImpl({required this.retryAction});

  @override
  final VoidCallback retryAction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.retryRequested(retryAction: $retryAction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorEvent.retryRequested'))
      ..add(DiagnosticsProperty('retryAction', retryAction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetryRequestedImpl &&
            (identical(other.retryAction, retryAction) ||
                other.retryAction == retryAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetryRequestedImplCopyWith<_$RetryRequestedImpl> get copyWith =>
      __$$RetryRequestedImplCopyWithImpl<_$RetryRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) {
    return retryRequested(retryAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) {
    return retryRequested?.call(retryAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (retryRequested != null) {
      return retryRequested(retryAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) {
    return retryRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) {
    return retryRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (retryRequested != null) {
      return retryRequested(this);
    }
    return orElse();
  }
}

abstract class _RetryRequested implements ErrorEvent {
  const factory _RetryRequested({required final VoidCallback retryAction}) =
      _$RetryRequestedImpl;

  VoidCallback get retryAction;
  @JsonKey(ignore: true)
  _$$RetryRequestedImplCopyWith<_$RetryRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CriticalErrorOccurredImplCopyWith<$Res> {
  factory _$$CriticalErrorOccurredImplCopyWith(
          _$CriticalErrorOccurredImpl value,
          $Res Function(_$CriticalErrorOccurredImpl) then) =
      __$$CriticalErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String details, StackTrace? stackTrace});
}

/// @nodoc
class __$$CriticalErrorOccurredImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$CriticalErrorOccurredImpl>
    implements _$$CriticalErrorOccurredImplCopyWith<$Res> {
  __$$CriticalErrorOccurredImplCopyWithImpl(_$CriticalErrorOccurredImpl _value,
      $Res Function(_$CriticalErrorOccurredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$CriticalErrorOccurredImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$CriticalErrorOccurredImpl
    with DiagnosticableTreeMixin
    implements _CriticalErrorOccurred {
  const _$CriticalErrorOccurredImpl(
      {required this.message, required this.details, this.stackTrace});

  @override
  final String message;
  @override
  final String details;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.criticalErrorOccurred(message: $message, details: $details, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorEvent.criticalErrorOccurred'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CriticalErrorOccurredImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CriticalErrorOccurredImplCopyWith<_$CriticalErrorOccurredImpl>
      get copyWith => __$$CriticalErrorOccurredImplCopyWithImpl<
          _$CriticalErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) {
    return criticalErrorOccurred(message, details, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) {
    return criticalErrorOccurred?.call(message, details, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (criticalErrorOccurred != null) {
      return criticalErrorOccurred(message, details, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) {
    return criticalErrorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) {
    return criticalErrorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) {
    if (criticalErrorOccurred != null) {
      return criticalErrorOccurred(this);
    }
    return orElse();
  }
}

abstract class _CriticalErrorOccurred implements ErrorEvent {
  const factory _CriticalErrorOccurred(
      {required final String message,
      required final String details,
      final StackTrace? stackTrace}) = _$CriticalErrorOccurredImpl;

  String get message;
  String get details;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$CriticalErrorOccurredImplCopyWith<_$CriticalErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
