import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/blocs/connectivity/connectivity_bloc.dart';
import 'package:fsm/core/blocs/connectivity/connectivity_state.dart';
import 'package:fsm/core/blocs/sync/sync_bloc.dart';
import 'package:fsm/core/blocs/sync/sync_state.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// OfflineBanner - Persistent connectivity indicator with sync status
///
/// Displays when offline with:
/// - Real-time connectivity detection using ConnectivityBloc
/// - Sync status display: offline, syncing, pending changes
/// - Pending changes count display
/// - Tap to view pending changes detail
/// - Dismissible behavior (but reappears if still offline)
/// - Animated entrance/exit
/// - Color-coded status (offline, syncing, pending)
///
/// Use cases:
/// - Persistent banner across all screens when offline
/// - Sync status indicator
/// - Pending changes notification
/// - Network connectivity feedback
class OfflineBanner extends StatelessWidget {
  /// Callback when banner is tapped (to view pending changes)
  final VoidCallback? onTap;

  /// Whether banner can be dismissed temporarily
  final bool dismissible;

  /// Custom message override
  final String? customMessage;

  const OfflineBanner({
    super.key,
    this.onTap,
    this.dismissible = true,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, connectivityState) {
        return BlocBuilder<SyncBloc, SyncState>(
          builder: (context, syncState) {
            // Determine banner visibility and content based on connectivity and sync state
            final shouldShow = _shouldShowBanner(connectivityState, syncState);

            if (!shouldShow) {
              return const SizedBox.shrink();
            }

            final bannerData =
                _getBannerData(connectivityState, syncState, context);

            return AnimatedSlide(
              offset: shouldShow ? Offset.zero : const Offset(0, -1),
              duration: AppDimensions.animationMedium,
              curve: Curves.easeInOut,
              child: _BannerContent(
                message: customMessage ?? bannerData.message,
                icon: bannerData.icon,
                backgroundColor: bannerData.backgroundColor,
                textColor: bannerData.textColor,
                pendingCount: bannerData.pendingCount,
                showProgress: bannerData.showProgress,
                onTap: onTap,
                dismissible: dismissible,
              ),
            );
          },
        );
      },
    );
  }

  bool _shouldShowBanner(
      ConnectivityState connectivityState, SyncState syncState) {
    // Show banner if offline OR if there are pending changes OR if syncing
    return connectivityState.maybeWhen(
          disconnected: () => true,
          connected: () {
            // Also show if syncing or has pending changes
            return syncState.maybeWhen(
              syncing: (totalItems, syncedItems, currentItem) => true,
              pendingSync: (pendingItems, lastSyncTime) => true,
              orElse: () => false,
            );
          },
          orElse: () => false,
        ) ??
        false;
  }

  _BannerData _getBannerData(
    ConnectivityState connectivityState,
    SyncState syncState,
    BuildContext context,
  ) {
    final fsmTheme = context.fsmTheme;

    // Priority: Offline > Syncing > Pending Changes
    return connectivityState.maybeWhen(
      disconnected: () => _BannerData(
        message: "You're offline. Changes will sync when connected.",
        icon: Icons.wifi_off_outlined,
        backgroundColor: fsmTheme.offlineBannerBackground, // Amber/Yellow theme
        textColor: AppColors.textPrimary,
        pendingCount: null,
        showProgress: false,
      ),
      connected: () {
        return syncState.maybeWhen(
          syncing: (totalItems, syncedItems, currentItem) {
            return _BannerData(
              message: 'Syncing... ($syncedItems/$totalItems)',
              icon: Icons.sync,
              backgroundColor: AppColors.syncing.withValues(alpha: 0.1),
              textColor: AppColors.syncing,
              pendingCount: totalItems,
              showProgress: true,
            );
          },
          pendingSync: (pendingItems, lastSyncTime) => _BannerData(
            message: 'Pending Changes',
            icon: Icons.cloud_upload_outlined,
            backgroundColor: AppColors.pendingSync.withValues(alpha: 0.1),
            textColor: AppColors.pendingSync,
            pendingCount: pendingItems,
            showProgress: false,
          ),
          orElse: () => _BannerData(
            message: 'Connected',
            icon: Icons.check_circle_outline,
            backgroundColor: AppColors.synced.withValues(alpha: 0.1),
            textColor: AppColors.synced,
            pendingCount: null,
            showProgress: false,
          ),
        );
      },
      orElse: () => _BannerData(
        message: 'Checking Connection...',
        icon: Icons.signal_wifi_statusbar_null,
        backgroundColor: AppColors.grey200,
        textColor: AppColors.textSecondary,
        pendingCount: null,
        showProgress: false,
      ),
    );
  }
}

/// Internal banner content widget
class _BannerContent extends StatefulWidget {
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final int? pendingCount;
  final bool showProgress;
  final VoidCallback? onTap;
  final bool dismissible;

  const _BannerContent({
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.pendingCount,
    required this.showProgress,
    this.onTap,
    required this.dismissible,
  });

  @override
  State<_BannerContent> createState() => _BannerContentState();
}

class _BannerContentState extends State<_BannerContent> {
  bool _isDismissed = false;

  @override
  void didUpdateWidget(_BannerContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset dismissed state if message changes (e.g., went offline again)
    if (oldWidget.message != widget.message) {
      _isDismissed = false;
    }
  }

  void _dismiss() {
    setState(() {
      _isDismissed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isDismissed && widget.dismissible) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    Widget banner = Material(
      color: widget.backgroundColor,
      elevation: AppDimensions.elevationSmall,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall,
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                // Icon
                Icon(
                  widget.icon,
                  size: AppDimensions.iconSmall,
                  color: widget.textColor,
                ),

                SizedBox(width: AppDimensions.paddingSmall),

                // Message
                Expanded(
                  child: Text(
                    widget.message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: widget.textColor,
                    ),
                  ),
                ),

                // Pending count badge
                if (widget.pendingCount != null &&
                    widget.pendingCount! > 0) ...[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: widget.textColor,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusXSmall),
                    ),
                    child: Text(
                      '${widget.pendingCount}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimensions.paddingSmall),
                ],

                // Dismiss button
                if (widget.dismissible) ...[
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: AppDimensions.iconSmall,
                    color: widget.textColor,
                    onPressed: _dismiss,
                    constraints: BoxConstraints(
                      minWidth: AppDimensions.touchTargetMin,
                      minHeight: AppDimensions.touchTargetMin,
                    ),
                    padding: EdgeInsets.zero,
                    tooltip: 'Dismiss',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    // Add progress indicator if syncing
    if (widget.showProgress) {
      banner = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          banner,
          LinearProgressIndicator(
            backgroundColor: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(widget.textColor),
            minHeight: 2.h,
          ),
        ],
      );
    }

    return banner;
  }
}

/// Data class for banner configuration
class _BannerData {
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final int? pendingCount;
  final bool showProgress;

  const _BannerData({
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.pendingCount,
    required this.showProgress,
  });
}

/// CompactOfflineBanner - Minimal offline indicator (just an icon)
///
/// For situations where space is limited but status indication is needed.
class CompactOfflineBanner extends StatelessWidget {
  const CompactOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, connectivityState) {
        final isOffline = connectivityState.maybeWhen(
          disconnected: () => true,
          orElse: () => false,
        );

        if (!isOffline) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.offline,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: AppDimensions.iconXSmall,
                color: AppColors.white,
              ),
              SizedBox(width: 4.w),
              Text(
                'Offline',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
