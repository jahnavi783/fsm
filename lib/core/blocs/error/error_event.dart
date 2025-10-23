import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../error/failures.dart';

part 'error_event.freezed.dart';

@freezed
abstract class ErrorEvent with _$ErrorEvent {
  const factory ErrorEvent.errorOccurred({
    required Failure failure,
    String? context,
    StackTrace? stackTrace,
  }) = _ErrorOccurred;

  const factory ErrorEvent.errorDismissed() = _ErrorDismissed;

  const factory ErrorEvent.retryRequested({
    required VoidCallback retryAction,
  }) = _RetryRequested;

  const factory ErrorEvent.criticalErrorOccurred({
    required String message,
    required String details,
    StackTrace? stackTrace,
  }) = _CriticalErrorOccurred;
}
