import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/connectivity/connectivity_bloc.dart';
import '../blocs/connectivity/connectivity_state.dart';
import '../theme/theme.dart';

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
    return Container(
      key: const ValueKey('checking'),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16.w,
            height: 16.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Text(
            'Checking connection...',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedIndicator() {
    return Container(
      key: const ValueKey('connected'),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wifi,
            size: AppDimensions.iconSmall,
            color: AppColors.white,
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Text(
            'Connected',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisconnectedIndicator() {
    return Container(
      key: const ValueKey('disconnected'),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wifi_off,
            size: AppDimensions.iconSmall,
            color: AppColors.white,
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Text(
            'No connection',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
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
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: state.whenOrNull(disconnected: () => 40.h) ?? 0,
              child: state.whenOrNull(disconnected: () => true) == true
                  ? Container(
                      width: double.infinity,
                      color: AppColors.error,
                      child: Center(
                        child: Text(
                          'No internet connection',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.white,
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
