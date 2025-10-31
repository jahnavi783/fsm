import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/blocs/connectivity/connectivity_bloc.dart';
import 'package:fsm/core/blocs/connectivity/connectivity_state.dart';
import 'package:fsm/core/blocs/sync/sync_bloc.dart';
import 'package:fsm/core/blocs/sync/sync_state.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

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
              duration: DesignTokens.durationNormal,
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
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    // Priority: Offline > Syncing > Pending Changes
    return connectivityState.maybeWhen(
      disconnected: () => _BannerData(
        message: "You're offline. Changes will sync when connected.",
        icon: Icons.wifi_off_outlined,
        backgroundColor: fsmTheme.offlineBannerBackground,
        textColor: theme.colorScheme.onSurface,
        pendingCount: null,
        showProgress: false,
      ),
      connected: () {
        return syncState.maybeWhen(
          syncing: (totalItems, syncedItems, currentItem) {
            return _BannerData(
              message: 'Syncing... ($syncedItems/$totalItems)',
              icon: Icons.sync,
              backgroundColor: fsmTheme.syncSyncing.withValues(alpha: 0.1),
              textColor: fsmTheme.syncSyncing,
              pendingCount: totalItems,
              showProgress: true,
            );
          },
          pendingSync: (pendingItems, lastSyncTime) => _BannerData(
            message: 'Pending Changes',
            icon: Icons.cloud_upload_outlined,
            backgroundColor: fsmTheme.syncPending.withValues(alpha: 0.1),
            textColor: fsmTheme.syncPending,
            pendingCount: pendingItems,
            showProgress: false,
          ),
          orElse: () => _BannerData(
            message: 'Connected',
            icon: Icons.check_circle_outline,
            backgroundColor: fsmTheme.syncSynced.withValues(alpha: 0.1),
            textColor: fsmTheme.syncSynced,
            pendingCount: null,
            showProgress: false,
          ),
        );
      },
      orElse: () => _BannerData(
        message: 'Checking Connection...',
        icon: Icons.signal_wifi_statusbar_null,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        textColor: theme.colorScheme.onSurfaceVariant,
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
    final spacing = context.spacing;

    Widget banner = Material(
      color: widget.backgroundColor,
      elevation: spacing.elevationSm,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: REdgeInsets.symmetric(
            horizontal: spacing.space4,
            vertical: spacing.space2,
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                // Icon
                Icon(
                  widget.icon,
                  size: DesignTokens.iconSm.sp,
                  color: widget.textColor,
                ),

                spacing.horizontalSpaceSmall,

                // Message
                Expanded(
                  child: Text(
                    widget.message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                      color: widget.textColor,
                    ),
                  ),
                ),

                // Pending count badge
                if (widget.pendingCount != null &&
                    widget.pendingCount! > 0) ...[
                  Container(
                    padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space2,
                      vertical: DesignTokens.space1,
                    ),
                    decoration: BoxDecoration(
                      color: widget.textColor,
                      borderRadius:
                          BorderRadius.circular(spacing.radiusXs.r),
                    ),
                    child: Text(
                      '${widget.pendingCount}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: DesignTokens.fontWeightBold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  spacing.horizontalSpaceSmall,
                ],

                // Dismiss button
                if (widget.dismissible) ...[
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: DesignTokens.iconSm.sp,
                    color: widget.textColor,
                    onPressed: _dismiss,
                    constraints: BoxConstraints(
                      minWidth: DesignTokens.touchTargetMin.w,
                      minHeight: DesignTokens.touchTargetMin.h,
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
            minHeight: DesignTokens.borderWidthMedium.h,
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
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

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
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space2,
            vertical: DesignTokens.space1,
          ),
          decoration: BoxDecoration(
            color: fsmTheme.syncOffline,
            borderRadius: BorderRadius.circular(spacing.radiusSm.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: DesignTokens.iconXs.sp,
                color: theme.colorScheme.onPrimary,
              ),
              DesignTokens.horizontalSpaceXs,
              Text(
                'Offline',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
