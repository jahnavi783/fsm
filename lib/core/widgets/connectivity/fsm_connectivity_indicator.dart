import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/blocs/connectivity/connectivity_bloc.dart';
import 'package:fsm/core/blocs/connectivity/connectivity_state.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

class ConnectivityIndicator extends StatelessWidget {
  final bool showWhenConnected;
  final Duration animationDuration;

  const ConnectivityIndicator({
    super.key,
    this.showWhenConnected = false,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: animationDuration,
          child: state.when(
            initial: () => const SizedBox.shrink(),
            checking: () => _buildCheckingIndicator(),
            connected: () => showWhenConnected
                ? _buildConnectedIndicator()
                : const SizedBox.shrink(),
            disconnected: () => _buildDisconnectedIndicator(),
          ),
        );
      },
    );
  }

  Widget _buildCheckingIndicator() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;

        return Container(
          key: const ValueKey('checking'),
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: fsmTheme.warning.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: DesignTokens.iconSm.w,
                height: DesignTokens.iconSm.w,
                child: CircularProgressIndicator(
                  strokeWidth: DesignTokens.borderWidthMedium.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              RSizedBox(width: DesignTokens.space2),
              Text(
                'Checking connection...',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConnectedIndicator() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;

        return Container(
          key: const ValueKey('connected'),
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: fsmTheme.success.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.onPrimary,
              ),
              RSizedBox(width: DesignTokens.space2),
              Text(
                'Connected',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDisconnectedIndicator() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return Container(
          key: const ValueKey('disconnected'),
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.error.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi_off,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.onError,
              ),
              RSizedBox(width: DesignTokens.space2),
              Text(
                'No connection',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onError,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ConnectivityBanner extends StatelessWidget {
  final Widget child;

  const ConnectivityBanner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return Column(
          children: [
            AnimatedContainer(
              duration: DesignTokens.durationNormal,
              height: state.whenOrNull(disconnected: () => 40.h) ?? 0,
              child: state.whenOrNull(disconnected: () => true) == true
                  ? Container(
                      width: double.infinity,
                      color: theme.colorScheme.error,
                      child: Center(
                        child: Text(
                          'No internet connection',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onError,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
