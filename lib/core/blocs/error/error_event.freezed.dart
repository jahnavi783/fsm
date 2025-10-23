// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ErrorEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ErrorEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent()';
  }
}

/// @nodoc
class $ErrorEventCopyWith<$Res> {
  $ErrorEventCopyWith(ErrorEvent _, $Res Function(ErrorEvent) __);
}

/// Adds pattern-matching-related methods to [ErrorEvent].
extension ErrorEventPatterns on ErrorEvent {
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
    TResult Function(_ErrorOccurred value)? errorOccurred,
    TResult Function(_ErrorDismissed value)? errorDismissed,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred() when errorOccurred != null:
        return errorOccurred(_that);
      case _ErrorDismissed() when errorDismissed != null:
        return errorDismissed(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _CriticalErrorOccurred() when criticalErrorOccurred != null:
        return criticalErrorOccurred(_that);
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
    required TResult Function(_ErrorOccurred value) errorOccurred,
    required TResult Function(_ErrorDismissed value) errorDismissed,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_CriticalErrorOccurred value)
        criticalErrorOccurred,
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred():
        return errorOccurred(_that);
      case _ErrorDismissed():
        return errorDismissed(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _CriticalErrorOccurred():
        return criticalErrorOccurred(_that);
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
    TResult? Function(_ErrorOccurred value)? errorOccurred,
    TResult? Function(_ErrorDismissed value)? errorDismissed,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_CriticalErrorOccurred value)? criticalErrorOccurred,
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred() when errorOccurred != null:
        return errorOccurred(_that);
      case _ErrorDismissed() when errorDismissed != null:
        return errorDismissed(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _CriticalErrorOccurred() when criticalErrorOccurred != null:
        return criticalErrorOccurred(_that);
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
    TResult Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult Function()? errorDismissed,
    TResult Function(VoidCallback retryAction)? retryRequested,
    TResult Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred() when errorOccurred != null:
        return errorOccurred(_that.failure, _that.context, _that.stackTrace);
      case _ErrorDismissed() when errorDismissed != null:
        return errorDismissed();
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that.retryAction);
      case _CriticalErrorOccurred() when criticalErrorOccurred != null:
        return criticalErrorOccurred(
            _that.message, _that.details, _that.stackTrace);
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
    required TResult Function(
            Failure failure, String? context, StackTrace? stackTrace)
        errorOccurred,
    required TResult Function() errorDismissed,
    required TResult Function(VoidCallback retryAction) retryRequested,
    required TResult Function(
            String message, String details, StackTrace? stackTrace)
        criticalErrorOccurred,
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred():
        return errorOccurred(_that.failure, _that.context, _that.stackTrace);
      case _ErrorDismissed():
        return errorDismissed();
      case _RetryRequested():
        return retryRequested(_that.retryAction);
      case _CriticalErrorOccurred():
        return criticalErrorOccurred(
            _that.message, _that.details, _that.stackTrace);
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
    TResult? Function(Failure failure, String? context, StackTrace? stackTrace)?
        errorOccurred,
    TResult? Function()? errorDismissed,
    TResult? Function(VoidCallback retryAction)? retryRequested,
    TResult? Function(String message, String details, StackTrace? stackTrace)?
        criticalErrorOccurred,
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorOccurred() when errorOccurred != null:
        return errorOccurred(_that.failure, _that.context, _that.stackTrace);
      case _ErrorDismissed() when errorDismissed != null:
        return errorDismissed();
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that.retryAction);
      case _CriticalErrorOccurred() when criticalErrorOccurred != null:
        return criticalErrorOccurred(
            _that.message, _that.details, _that.stackTrace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ErrorOccurred with DiagnosticableTreeMixin implements ErrorEvent {
  const _ErrorOccurred({required this.failure, this.context, this.stackTrace});

  final Failure failure;
  final String? context;
  final StackTrace? stackTrace;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorOccurredCopyWith<_ErrorOccurred> get copyWith =>
      __$ErrorOccurredCopyWithImpl<_ErrorOccurred>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _ErrorOccurred &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, context, stackTrace);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.errorOccurred(failure: $failure, context: $context, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$ErrorOccurredCopyWith<$Res>
    implements $ErrorEventCopyWith<$Res> {
  factory _$ErrorOccurredCopyWith(
          _ErrorOccurred value, $Res Function(_ErrorOccurred) _then) =
      __$ErrorOccurredCopyWithImpl;
  @useResult
  $Res call({Failure failure, String? context, StackTrace? stackTrace});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ErrorOccurredCopyWithImpl<$Res>
    implements _$ErrorOccurredCopyWith<$Res> {
  __$ErrorOccurredCopyWithImpl(this._self, this._then);

  final _ErrorOccurred _self;
  final $Res Function(_ErrorOccurred) _then;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? context = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_ErrorOccurred(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }

  /// Create a copy of ErrorEvent
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

class _ErrorDismissed with DiagnosticableTreeMixin implements ErrorEvent {
  const _ErrorDismissed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ErrorEvent.errorDismissed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ErrorDismissed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.errorDismissed()';
  }
}

/// @nodoc

class _RetryRequested with DiagnosticableTreeMixin implements ErrorEvent {
  const _RetryRequested({required this.retryAction});

  final VoidCallback retryAction;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RetryRequestedCopyWith<_RetryRequested> get copyWith =>
      __$RetryRequestedCopyWithImpl<_RetryRequested>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorEvent.retryRequested'))
      ..add(DiagnosticsProperty('retryAction', retryAction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RetryRequested &&
            (identical(other.retryAction, retryAction) ||
                other.retryAction == retryAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAction);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.retryRequested(retryAction: $retryAction)';
  }
}

/// @nodoc
abstract mixin class _$RetryRequestedCopyWith<$Res>
    implements $ErrorEventCopyWith<$Res> {
  factory _$RetryRequestedCopyWith(
          _RetryRequested value, $Res Function(_RetryRequested) _then) =
      __$RetryRequestedCopyWithImpl;
  @useResult
  $Res call({VoidCallback retryAction});
}

/// @nodoc
class __$RetryRequestedCopyWithImpl<$Res>
    implements _$RetryRequestedCopyWith<$Res> {
  __$RetryRequestedCopyWithImpl(this._self, this._then);

  final _RetryRequested _self;
  final $Res Function(_RetryRequested) _then;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? retryAction = null,
  }) {
    return _then(_RetryRequested(
      retryAction: null == retryAction
          ? _self.retryAction
          : retryAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _CriticalErrorOccurred
    with DiagnosticableTreeMixin
    implements ErrorEvent {
  const _CriticalErrorOccurred(
      {required this.message, required this.details, this.stackTrace});

  final String message;
  final String details;
  final StackTrace? stackTrace;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CriticalErrorOccurredCopyWith<_CriticalErrorOccurred> get copyWith =>
      __$CriticalErrorOccurredCopyWithImpl<_CriticalErrorOccurred>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _CriticalErrorOccurred &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, stackTrace);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorEvent.criticalErrorOccurred(message: $message, details: $details, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$CriticalErrorOccurredCopyWith<$Res>
    implements $ErrorEventCopyWith<$Res> {
  factory _$CriticalErrorOccurredCopyWith(_CriticalErrorOccurred value,
          $Res Function(_CriticalErrorOccurred) _then) =
      __$CriticalErrorOccurredCopyWithImpl;
  @useResult
  $Res call({String message, String details, StackTrace? stackTrace});
}

/// @nodoc
class __$CriticalErrorOccurredCopyWithImpl<$Res>
    implements _$CriticalErrorOccurredCopyWith<$Res> {
  __$CriticalErrorOccurredCopyWithImpl(this._self, this._then);

  final _CriticalErrorOccurred _self;
  final $Res Function(_CriticalErrorOccurred) _then;

  /// Create a copy of ErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? details = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_CriticalErrorOccurred(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

// dart format on
