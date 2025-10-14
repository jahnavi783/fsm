import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../error/failures.dart';
import '../../services/logging_service.dart';
import 'error_event.dart';
import 'error_state.dart';

@singleton
class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final LoggingService _loggingService;

  ErrorBloc(this._loggingService) : super(const ErrorState.initial()) {
    on<ErrorEvent>((event, emit) async {
      await event.when(
        errorOccurred: (failure, context, stackTrace) =>
            _onErrorOccurred(emit, failure, context, stackTrace),
        errorDismissed: () => _onErrorDismissed(emit),
        retryRequested: (retryAction) => _onRetryRequested(emit, retryAction),
        criticalErrorOccurred: (message, details, stackTrace) =>
            _onCriticalErrorOccurred(emit, message, details, stackTrace),
      );
    });
  }

  Future<void> _onErrorOccurred(
    Emitter<ErrorState> emit,
    Failure failure,
    String? context,
    StackTrace? stackTrace,
  ) async {
    // Log the error (in a real app, you'd use a logging service)
    _logError(failure, context, stackTrace);

    // Determine if the error is retryable
    final canRetry = _isRetryableError(failure);

    emit(ErrorState.error(
      failure: failure,
      context: context,
      canRetry: canRetry,
    ));
  }

  Future<void> _onErrorDismissed(Emitter<ErrorState> emit) async {
    emit(const ErrorState.dismissed());
  }

  Future<void> _onRetryRequested(
    Emitter<ErrorState> emit,
    VoidCallback retryAction,
  ) async {
    // Execute the retry action
    try {
      retryAction();
      emit(const ErrorState.dismissed());
    } catch (e) {
      // If retry fails, show the error again
      emit(ErrorState.error(
        failure: ServerFailure(message: 'Retry failed: ${e.toString()}'),
        canRetry: true,
        retryAction: retryAction,
      ));
    }
  }

  Future<void> _onCriticalErrorOccurred(
    Emitter<ErrorState> emit,
    String message,
    String details,
    StackTrace? stackTrace,
  ) async {
    // Log critical error
    _logCriticalError(message, details, stackTrace);

    emit(ErrorState.criticalError(
      message: message,
      details: details,
      occurredAt: DateTime.now(),
    ));
  }

  bool _isRetryableError(Failure failure) {
    return failure.isRetryable;
  }

  void _logError(Failure failure, String? context, StackTrace? stackTrace) {
    _loggingService.error(
      'Error occurred: ${failure.message}',
      tag: 'ERROR_BLOC',
      error: failure,
      stackTrace: stackTrace,
    );

    if (context != null) {
      _loggingService.debug('Error context: $context', tag: 'ERROR_BLOC');
    }
  }

  void _logCriticalError(
      String message, String details, StackTrace? stackTrace) {
    _loggingService.critical(
      'CRITICAL ERROR: $message',
      tag: 'ERROR_BLOC',
      error: details,
      stackTrace: stackTrace,
    );
  }
}

// Extension to easily add errors from anywhere in the app
extension ErrorBlocExtension on ErrorBloc {
  void addError(Failure failure, {String? context, StackTrace? stackTrace}) {
    add(ErrorEvent.errorOccurred(
      failure: failure,
      context: context,
      stackTrace: stackTrace,
    ));
  }

  void addCriticalError(String message, String details,
      {StackTrace? stackTrace}) {
    add(ErrorEvent.criticalErrorOccurred(
      message: message,
      details: details,
      stackTrace: stackTrace,
    ));
  }

  void dismissError() {
    add(const ErrorEvent.errorDismissed());
  }

  void retry(VoidCallback retryAction) {
    add(ErrorEvent.retryRequested(retryAction: retryAction));
  }
}
