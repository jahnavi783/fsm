import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

/// Static helper methods for common BLoC listener patterns.
///
/// This class provides reusable listener implementations for common side effects
/// like showing snackbars, navigation, and error handling.
///
/// Requirements: 5.2, 5.3
///
/// Usage:
/// ```dart
/// BlocListener<MyBloc, MyState>(
///   listenWhen: (previous, current) => previous.hasError != current.hasError,
///   listener: BlocListenerHelpers.showSnackBarOnError,
///   child: MyWidget(),
/// )
/// ```
class BlocListenerHelpers {
  BlocListenerHelpers._(); // Private constructor to prevent instantiation

  /// Shows a snackbar when an error occurs in the state
  ///
  /// Expects the state to have `hasError` and `errorMessage` properties
  static void showSnackBarOnError<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final hasError = (state as dynamic).hasError as bool?;
      final errorMessage = (state as dynamic).errorMessage as String?;

      if (hasError == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage ?? 'An error occurred'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Dismiss',
              textColor: Theme.of(context).colorScheme.onError,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } catch (e) {
      // Fallback error handling
      debugPrint('Error in showSnackBarOnError: $e');
    }
  }

  /// Shows a success snackbar when a success message is available
  ///
  /// Expects the state to have `successMessage` property
  static void showSnackBarOnSuccess<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final successMessage = (state as dynamic).successMessage as String?;

      if (successMessage != null && successMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(successMessage),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error in showSnackBarOnSuccess: $e');
    }
  }

  /// Navigates to a route when the state indicates success
  ///
  /// Expects the state to have `isSuccess` property
  static void navigateOnSuccess<S>(
    BuildContext context,
    S state,
    String route,
  ) {
    try {
      final isSuccess = (state as dynamic).isSuccess as bool?;

      if (isSuccess == true) {
        context.router.pushNamed(route);
      }
    } catch (e) {
      debugPrint('Error in navigateOnSuccess: $e');
    }
  }

  /// Navigates back when the state indicates completion
  ///
  /// Expects the state to have `isCompleted` property
  static void navigateBackOnCompletion<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final isCompleted = (state as dynamic).isCompleted as bool?;

      if (isCompleted == true && context.router.canPop()) {
        context.router.pop();
      }
    } catch (e) {
      debugPrint('Error in navigateBackOnCompletion: $e');
    }
  }

  /// Shows a dialog when the state indicates a confirmation is needed
  ///
  /// Expects the state to have `showConfirmation` and `confirmationMessage` properties
  static void showConfirmationDialog<S>(
    BuildContext context,
    S state, {
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    try {
      final showConfirmation = (state as dynamic).showConfirmation as bool?;
      final message = (state as dynamic).confirmationMessage as String?;

      if (showConfirmation == true) {
        showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Confirmation'),
            content: Text(message ?? 'Are you sure?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onCancel?.call();
                },
                child: Text(cancelText),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onConfirm();
                },
                child: Text(confirmText),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('Error in showConfirmationDialog: $e');
    }
  }

  /// Handles authentication state changes by navigating to login
  ///
  /// Expects the state to have `isAuthenticated` property
  static void handleAuthenticationChange<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final isAuthenticated = (state as dynamic).isAuthenticated as bool?;

      if (isAuthenticated == false) {
        context.router.pushNamed('/login');
      }
    } catch (e) {
      debugPrint('Error in handleAuthenticationChange: $e');
    }
  }

  /// Shows a loading dialog when the state indicates a long-running operation
  ///
  /// Expects the state to have `showLoadingDialog` property
  static void showLoadingDialog<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final showLoading = (state as dynamic).showLoadingDialog as bool?;

      if (showLoading == true) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => const AlertDialog(
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Loading...'),
              ],
            ),
          ),
        );
      } else {
        // Dismiss loading dialog if it's showing
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      debugPrint('Error in showLoadingDialog: $e');
    }
  }

  /// Handles connectivity changes by showing appropriate messages
  ///
  /// Expects the state to have `isOnline` property
  static void handleConnectivityChange<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final isOnline = (state as dynamic).isOnline as bool?;

      if (isOnline != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isOnline ? 'Back online' : 'Offline mode'),
            backgroundColor: isOnline
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error in handleConnectivityChange: $e');
    }
  }

  /// Handles sync status changes by showing appropriate indicators
  ///
  /// Expects the state to have `syncStatus` property
  static void handleSyncStatusChange<S>(
    BuildContext context,
    S state,
  ) {
    try {
      final syncStatus = (state as dynamic).syncStatus?.toString();

      if (syncStatus != null) {
        String message;
        Color backgroundColor;

        switch (syncStatus.toLowerCase()) {
          case 'syncing':
            message = 'Syncing data...';
            backgroundColor = Theme.of(context).colorScheme.primary;
            break;
          case 'completed':
            message = 'Sync completed';
            backgroundColor = Theme.of(context).colorScheme.primary;
            break;
          case 'failed':
            message = 'Sync failed';
            backgroundColor = Theme.of(context).colorScheme.error;
            break;
          default:
            return; // Don't show message for unknown status
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: backgroundColor,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error in handleSyncStatusChange: $e');
    }
  }

  /// Creates a MultiBlocListener configuration for common app-wide listeners
  ///
  /// This is a helper to set up common listeners that most pages need
  static Widget createAppWideListeners({
    required Widget child,
  }) {
    return Builder(
      builder: (context) {
        return MultiBlocListener(
          listeners: [
            // Add common listeners here as needed
            // Example:
            // BlocListener<AuthBloc, AuthState>(
            //   listenWhen: (previous, current) =>
            //     previous.isAuthenticated != current.isAuthenticated,
            //   listener: handleAuthenticationChange,
            // ),
            // BlocListener<ConnectivityBloc, ConnectivityState>(
            //   listenWhen: (previous, current) =>
            //     previous.isOnline != current.isOnline,
            //   listener: handleConnectivityChange,
            // ),
          ],
          child: child,
        );
      },
    );
  }
}
