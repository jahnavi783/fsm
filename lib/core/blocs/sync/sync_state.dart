import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_state.freezed.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing({
    required int totalItems,
    required int syncedItems,
    String? currentItem,
  }) = _Syncing;
  const factory SyncState.synced({
    required DateTime lastSyncTime,
    required int syncedItems,
  }) = _Synced;
  const factory SyncState.syncFailed({
    required String error,
    required DateTime failedAt,
    required int pendingItems,
  }) = _SyncFailed;
  const factory SyncState.pendingSync({
    required int pendingItems,
    DateTime? lastSyncTime,
  }) = _PendingSync;
}