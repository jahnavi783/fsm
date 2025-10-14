import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../error/failures.dart';

part 'error_state.freezed.dart';

@freezed
class ErrorState with _$ErrorState {
  const factory ErrorState.initial() = _Initial;
  
  const factory ErrorState.error({
    required Failure failure,
    String? context,
    @Default(false) bool canRetry,
    VoidCallback? retryAction,
  }) = _Error;
  
  const factory ErrorState.criticalError({
    required String message,
    required String details,
    required DateTime occurredAt,
  }) = _CriticalError;
  
  const factory ErrorState.dismissed() = _Dismissed;
}