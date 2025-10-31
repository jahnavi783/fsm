import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/blocs/sync/sync_bloc.dart';
import 'package:fsm/core/blocs/sync/sync_state.dart';
import 'package:fsm/core/blocs/sync/sync_event.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

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
                _buildSyncingIndicator(totalItems, syncedItems, currentItem),
            synced: (lastSyncTime, syncedItems) => showWhenSynced 
                ? _buildSyncedIndicator(lastSyncTime, syncedItems)
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

  Widget _buildSyncingIndicator(int totalItems, int syncedItems, String? currentItem) {
    final progress = totalItems > 0 ? syncedItems / totalItems : 0.0;

    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;

        return Container(
          key: const ValueKey('syncing'),
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: fsmTheme.syncSyncing.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: DesignTokens.iconXs.w,
                    height: DesignTokens.iconXs.w,
                    child: CircularProgressIndicator(
                      strokeWidth: DesignTokens.borderWidthMedium.w,
                      value: progress,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.onPrimary,
                      ),
                      backgroundColor: theme.colorScheme.onPrimary.withValues(alpha: 0.3),
                    ),
                  ),
                  RSizedBox(width: DesignTokens.space2),
                  Text(
                    'Syncing... ($syncedItems/$totalItems)',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              if (currentItem != null) ...[
                RSizedBox(height: DesignTokens.space1),
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
      },
    );
  }

  Widget _buildSyncedIndicator(DateTime lastSyncTime, int syncedItems) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;

        return Container(
          key: const ValueKey('synced'),
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: fsmTheme.syncSynced.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sync,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.onPrimary,
              ),
              RSizedBox(width: DesignTokens.space2),
              Text(
                'Synced ($syncedItems items)',
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

  Widget _buildSyncFailedIndicator(BuildContext context, String error, int pendingItems) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      key: const ValueKey('sync_failed'),
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      decoration: BoxDecoration(
        color: fsmTheme.syncFailed.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sync_problem,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.onPrimary,
          ),
          RSizedBox(width: DesignTokens.space2),
          Flexible(
            child: Text(
              'Sync failed ($pendingItems pending)',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          RSizedBox(width: DesignTokens.space2),
          GestureDetector(
            onTap: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            child: Icon(
              Icons.refresh,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingSyncIndicator(BuildContext context, int pendingItems) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      key: const ValueKey('pending_sync'),
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      decoration: BoxDecoration(
        color: fsmTheme.syncPending.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sync_alt,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.onPrimary,
          ),
          RSizedBox(width: DesignTokens.space2),
          Text(
            '$pendingItems items to sync',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          RSizedBox(width: DesignTokens.space2),
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
            child: SizedBox(
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
              color: theme.colorScheme.onPrimary,
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