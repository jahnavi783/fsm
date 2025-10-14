import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../connectivity/connectivity_bloc.dart';
import '../connectivity/connectivity_state.dart';
import 'sync_event.dart';
import 'sync_state.dart';

@singleton
class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final ConnectivityBloc _connectivityBloc;
  StreamSubscription<ConnectivityState>? _connectivitySubscription;
  Timer? _autoSyncTimer;

  SyncBloc(this._connectivityBloc) : super(const SyncState.initial()) {
    on<SyncEvent>((event, emit) async {
      await event.when(
        started: () => _onStarted(emit),
        syncRequested: () => _onSyncRequested(emit),
        syncCompleted: () => _onSyncCompleted(emit),
        syncFailed: (error) => _onSyncFailed(emit, error),
        pendingChangesDetected: (count) =>
            _onPendingChangesDetected(emit, count),
        autoSyncTriggered: () => _onAutoSyncTriggered(emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<SyncState> emit) async {
    // Listen to connectivity changes for auto-sync
    _connectivitySubscription =
        _connectivityBloc.stream.listen((connectivityState) {
      connectivityState.whenOrNull(
        connected: () {
          // Trigger auto-sync when connection is restored
          add(const SyncEvent.autoSyncTriggered());
        },
      );
    });

    // Set up periodic auto-sync (every 5 minutes when connected)
    _autoSyncTimer = Timer.periodic(
      const Duration(minutes: 5),
      (_) => add(const SyncEvent.autoSyncTriggered()),
    );

    // Check for pending changes on startup
    _checkPendingChanges();
  }

  Future<void> _onSyncRequested(Emitter<SyncState> emit) async {
    final connectivityState = _connectivityBloc.state;

    // Only sync if connected
    final isConnected = connectivityState.whenOrNull(
          connected: () => true,
        ) ??
        false;

    if (!isConnected) {
      emit(SyncState.syncFailed(
        error: 'No internet connection',
        failedAt: DateTime.now(),
        pendingItems: await _getPendingItemsCount(),
      ));
      return;
    }

    try {
      final pendingItems = await _getPendingItemsCount();

      if (pendingItems == 0) {
        emit(SyncState.synced(
          lastSyncTime: DateTime.now(),
          syncedItems: 0,
        ));
        return;
      }

      emit(SyncState.syncing(
        totalItems: pendingItems,
        syncedItems: 0,
      ));

      // Simulate sync process (replace with actual sync logic)
      await _performSync(emit, pendingItems);

      emit(SyncState.synced(
        lastSyncTime: DateTime.now(),
        syncedItems: pendingItems,
      ));

      add(const SyncEvent.syncCompleted());
    } catch (e) {
      add(SyncEvent.syncFailed(e.toString()));
    }
  }

  Future<void> _onSyncCompleted(Emitter<SyncState> emit) async {
    // Sync completed successfully, check for any remaining pending changes
    _checkPendingChanges();
  }

  Future<void> _onSyncFailed(Emitter<SyncState> emit, String error) async {
    final pendingItems = await _getPendingItemsCount();

    emit(SyncState.syncFailed(
      error: error,
      failedAt: DateTime.now(),
      pendingItems: pendingItems,
    ));
  }

  Future<void> _onPendingChangesDetected(
      Emitter<SyncState> emit, int count) async {
    if (count > 0) {
      emit(SyncState.pendingSync(
        pendingItems: count,
        lastSyncTime: _getLastSyncTime(),
      ));
    }
  }

  Future<void> _onAutoSyncTriggered(Emitter<SyncState> emit) async {
    final connectivityState = _connectivityBloc.state;

    // Only auto-sync if connected and there are pending changes
    final isConnected = connectivityState.whenOrNull(
          connected: () => true,
        ) ??
        false;

    if (isConnected) {
      final pendingItems = await _getPendingItemsCount();
      if (pendingItems > 0) {
        add(const SyncEvent.syncRequested());
      }
    }
  }

  Future<void> _performSync(Emitter<SyncState> emit, int totalItems) async {
    // This is a placeholder for actual sync logic
    // In a real implementation, this would:
    // 1. Get all pending work order updates
    // 2. Get all pending document downloads
    // 3. Get all pending inventory updates
    // 4. Sync each item and update progress

    for (int i = 0; i < totalItems; i++) {
      await Future.delayed(
          const Duration(milliseconds: 100)); // Simulate network delay

      emit(SyncState.syncing(
        totalItems: totalItems,
        syncedItems: i + 1,
        currentItem: 'Syncing item ${i + 1}',
      ));
    }
  }

  Future<int> _getPendingItemsCount() async {
    // This is a placeholder - in a real implementation, this would:
    // 1. Count pending work order updates in Hive
    // 2. Count pending document downloads
    // 3. Count pending inventory updates
    // 4. Return total count

    // For now, return a random number for demonstration
    return 0; // No pending items by default
  }

  DateTime? _getLastSyncTime() {
    // This would retrieve the last sync time from local storage
    // For now, return null
    return null;
  }

  void _checkPendingChanges() async {
    final pendingCount = await _getPendingItemsCount();
    if (pendingCount > 0) {
      add(SyncEvent.pendingChangesDetected(pendingCount));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    _autoSyncTimer?.cancel();
    return super.close();
  }
}
