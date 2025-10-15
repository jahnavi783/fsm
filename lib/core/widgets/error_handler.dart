import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/error/error_bloc.dart';
import '../blocs/error/error_state.dart';
import '../theme/theme.dart';

class GlobalErrorHandler extends StatelessWidget {
  final Widget child;

  const GlobalErrorHandler({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorBloc, ErrorState>(
      listener: (listenerContext, state) {
        state.whenOrNull(
          error: (failure, context1, canRetry, retryAction) {
            _showErrorSnackBar(
              context,
              failure.message,
              canRetry: canRetry,
              retryAction: retryAction,
            );
          },
          criticalError: (message, details, occurredAt) {
            _showCriticalErrorDialog(context, message, details);
          },
        );
      },
      child: child,
    );
  }

  void _showErrorSnackBar(
    BuildContext context,
    String message, {
    bool canRetry = false,
    VoidCallback? retryAction,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.white,
              size: AppDimensions.iconSmall,
            ),
            SizedBox(width: AppDimensions.paddingSmall),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        duration: const Duration(seconds: 4),
        action: canRetry && retryAction != null
            ? SnackBarAction(
                label: 'Retry',
                textColor: AppColors.white,
                onPressed: () {
                  context.read<ErrorBloc>().retry(retryAction);
                },
              )
            : SnackBarAction(
                label: 'Dismiss',
                textColor: AppColors.white,
                onPressed: () {
                  context.read<ErrorBloc>().dismissError();
                },
              ),
      ),
    );
  }

  void _showCriticalErrorDialog(
    BuildContext context,
    String message,
    String details,
  ) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          color: AppColors.error,
          size: AppDimensions.iconLarge,
        ),
        title: Text(
          'Critical Error',
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.error,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.bodyMedium,
            ),
            SizedBox(height: AppDimensions.paddingMedium),
            ExpansionTile(
              title: Text(
                'Technical Details',
                style: AppTextStyles.labelMedium,
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(AppDimensions.paddingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: Text(
                    details,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ErrorBloc>().dismissError();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace stackTrace)? errorBuilder;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorBuilder,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      if (widget.errorBuilder != null) {
        return widget.errorBuilder!(_error!, _stackTrace!);
      }

      return _buildDefaultErrorWidget();
    }

    return widget.child;
  }

  Widget _buildDefaultErrorWidget() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: AppDimensions.iconXLarge,
                color: AppColors.error,
              ),
              SizedBox(height: AppDimensions.spaceMedium),
              Text(
                'Something went wrong',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spaceSmall),
              Text(
                'An unexpected error occurred. Please restart the app.',
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spaceLarge),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _error = null;
                    _stackTrace = null;
                  });
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Catch errors in the widget tree
    FlutterError.onError = (FlutterErrorDetails details) {
      if (mounted) {
        setState(() {
          _error = details.exception;
          _stackTrace = details.stack;
        });

        // Report to error bloc
        context.read<ErrorBloc>().addCriticalError(
              'Widget Error',
              details.toString(),
              stackTrace: details.stack,
            );
      }
    };
  }
}
