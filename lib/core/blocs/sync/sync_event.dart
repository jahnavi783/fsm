import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_event.freezed.dart';

@freezed
class SyncEvent with _$SyncEvent {
  const factory SyncEvent.started() = _Started;
  const factory SyncEvent.syncRequested() = _SyncRequested;
  const factory SyncEvent.syncCompleted() = _SyncCompleted;
  const factory SyncEvent.syncFailed(String error) = _SyncFailed;
  const factory SyncEvent.pendingChangesDetected(int count) = _PendingChangesDetected;
  const factory SyncEvent.autoSyncTriggered() = _AutoSyncTriggered;
}