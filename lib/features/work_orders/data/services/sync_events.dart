// lib/core/sync/sync_events.dart

import 'dart:async';

class SyncEvents {
  SyncEvents._();
  static final SyncEvents instance = SyncEvents._();

  final StreamController<SyncEvent> _controller =
      StreamController<SyncEvent>.broadcast();

  Stream<SyncEvent> get stream => _controller.stream;

  void notify(SyncEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  void dispose() {
    _controller.close();
  }
}

enum SyncEventType {
  syncStarted,
  syncCompleted,
  syncIncomplete,
  syncError,
}

class SyncEvent {
  final SyncEventType type;
  final int pendingCount;

  SyncEvent({
    required this.type,
    this.pendingCount = 0,
  });
}
