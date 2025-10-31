import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/blocs/sync/sync_bloc.dart';
import 'package:fsm/core/blocs/sync/sync_state.dart';
import 'package:fsm/core/blocs/sync/sync_event.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

class SyncIndicator extends StatelessWidget {
  final bool showWhenSynced;
  final Duration animationDuration;

  const SyncIndicator({
    super.key,
    this.showWhenSynced = false,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: animationDuration,
          child: state.when(
            initial: () => const SizedBox.shrink(),
            syncing: (totalItems, syncedItems, currentItem) =>
                _buildSyncingIndicator(context, totalItems, syncedItems, currentItem),
            synced: (lastSyncTime, syncedItems) => showWhenSynced
                ? _buildSyncedIndicator(context, lastSyncTime, syncedItems)
                : const SizedBox.shrink(),
            syncFailed: (error, failedAt, pendingItems) =>
                _buildSyncFailedIndicator(context, error, pendingItems),
            pendingSync: (pendingItems, lastSyncTime) =>
                _buildPendingSyncIndicator(context, pendingItems),
          ),
        );
      },
    );
  }

  Widget _buildSyncingIndicator(BuildContext context, int totalItems, int syncedItems, String? currentItem) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;
    final progress = totalItems > 0 ? syncedItems / totalItems : 0.0;

    return Container(
      key: const ValueKey('syncing'),
      padding: spacing.paddingMd,
      decoration: BoxDecoration(
        color: fsmTheme.syncSyncing.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RSizedBox(
                width: DesignTokens.iconXs.w,
                height: DesignTokens.iconXs.w,
                child: CircularProgressIndicator(
                  strokeWidth: DesignTokens.borderWidthMedium.w,
                  value: progress,
                  valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.onPrimary),
                  backgroundColor: theme.colorScheme.onPrimary.withValues(alpha: 0.3),
                ),
              ),
              DesignTokens.horizontalSpaceSmall,
              Text(
                'Syncing... ($syncedItems/$totalItems)',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          if (currentItem != null) ...[
            DesignTokens.verticalSpaceXs,
            Text(
              currentItem,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSyncedIndicator(BuildContext context, DateTime lastSyncTime, int syncedItems) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    return Container(
      key: const ValueKey('synced'),
      padding: spacing.paddingMd,
      decoration: BoxDecoration(
        color: fsmTheme.syncSynced.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sync,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.onPrimary,
          ),
          DesignTokens.horizontalSpaceSmall,
          Text(
            'Synced ($syncedItems items)',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncFailedIndicator(BuildContext context, String error, int pendingItems) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    return Container(
      key: const ValueKey('sync_failed'),
      padding: spacing.paddingMd,
      decoration: BoxDecoration(
        color: fsmTheme.syncFailed.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sync_problem,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.onError,
          ),
          DesignTokens.horizontalSpaceSmall,
          Flexible(
            child: Text(
              'Sync failed ($pendingItems pending)',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
          ),
          DesignTokens.horizontalSpaceSmall,
          GestureDetector(
            onTap: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            child: Icon(
              Icons.refresh,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onError,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingSyncIndicator(BuildContext context, int pendingItems) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    return Container(
      key: const ValueKey('pending_sync'),
      padding: spacing.paddingMd,
      decoration: BoxDecoration(
        color: fsmTheme.syncPending.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sync_alt,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.onPrimary,
          ),
          DesignTokens.horizontalSpaceSmall,
          Text(
            '$pendingItems items to sync',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          DesignTokens.horizontalSpaceSmall,
          GestureDetector(
            onTap: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            child: Icon(
              Icons.sync,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class SyncFloatingActionButton extends StatelessWidget {
  const SyncFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return BlocBuilder<SyncBloc, SyncState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          syncing: (_, __, ___) => FloatingActionButton(
            onPressed: null, // Disable during sync
            child: RSizedBox(
              width: DesignTokens.iconMd.w,
              height: DesignTokens.iconMd.w,
              child: CircularProgressIndicator(
                strokeWidth: DesignTokens.borderWidthMedium.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          synced: (_, __) => const SizedBox.shrink(),
          syncFailed: (error, failedAt, pendingItems) => FloatingActionButton(
            onPressed: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            backgroundColor: fsmTheme.syncFailed,
            child: Icon(
              Icons.sync_problem,
              color: theme.colorScheme.onError,
            ),
          ),
          pendingSync: (pendingItems, _) => FloatingActionButton(
            onPressed: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            backgroundColor: fsmTheme.syncPending,
            child: Badge(
              label: Text(pendingItems.toString()),
              child: Icon(
                Icons.sync,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
