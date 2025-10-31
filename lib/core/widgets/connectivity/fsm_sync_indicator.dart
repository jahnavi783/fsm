import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/blocs/sync/sync_bloc.dart';
import 'package:fsm/core/blocs/sync/sync_state.dart';
import 'package:fsm/core/blocs/sync/sync_event.dart';
import 'package:fsm/core/theme/theme.dart';

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
    
    return Container(
      key: const ValueKey('syncing'),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16.w,
                height: 16.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  value: progress,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
                  backgroundColor: AppColors.white.withValues(alpha: 0.3),
                ),
              ),
              SizedBox(width: AppDimensions.paddingSmall),
              Text(
                'Syncing... ($syncedItems/$totalItems)',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          if (currentItem != null) ...[
            SizedBox(height: AppDimensions.paddingXSmall),
            Text(
              currentItem,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSyncedIndicator(DateTime lastSyncTime, int syncedItems) {
    return Container(
      key: const ValueKey('synced'),
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
            Icons.sync,
            size: AppDimensions.iconSmall,
            color: AppColors.white,
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Text(
            'Synced ($syncedItems items)',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncFailedIndicator(BuildContext context, String error, int pendingItems) {
    return Container(
      key: const ValueKey('sync_failed'),
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
            Icons.sync_problem,
            size: AppDimensions.iconSmall,
            color: AppColors.white,
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Flexible(
            child: Text(
              'Sync failed ($pendingItems pending)',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          GestureDetector(
            onTap: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            child: Icon(
              Icons.refresh,
              size: AppDimensions.iconSmall,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingSyncIndicator(BuildContext context, int pendingItems) {
    return Container(
      key: const ValueKey('pending_sync'),
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
          Icon(
            Icons.sync_alt,
            size: AppDimensions.iconSmall,
            color: AppColors.white,
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          Text(
            '$pendingItems items to sync',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(width: AppDimensions.paddingSmall),
          GestureDetector(
            onTap: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            child: Icon(
              Icons.sync,
              size: AppDimensions.iconSmall,
              color: AppColors.white,
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
    return BlocBuilder<SyncBloc, SyncState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          syncing: (_, __, ___) => FloatingActionButton(
            onPressed: null, // Disable during sync
            child: SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          synced: (_, __) => const SizedBox.shrink(),
          syncFailed: (error, failedAt, pendingItems) => FloatingActionButton(
            onPressed: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            backgroundColor: AppColors.error,
            child: Icon(
              Icons.sync_problem,
              color: AppColors.white,
            ),
          ),
          pendingSync: (pendingItems, _) => FloatingActionButton(
            onPressed: () {
              context.read<SyncBloc>().add(const SyncEvent.syncRequested());
            },
            backgroundColor: AppColors.warning,
            child: Badge(
              label: Text(pendingItems.toString()),
              child: Icon(
                Icons.sync,
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}