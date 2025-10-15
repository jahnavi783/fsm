import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class LazyLoadingService {
  final Map<String, LazyLoadingController> _controllers = {};

  /// Create a lazy loading controller for a specific data type
  LazyLoadingController<T> createController<T>({
    required String key,
    required Future<List<T>> Function(int page, int limit) dataLoader,
    int pageSize = 20,
    int preloadThreshold = 5,
  }) {
    final controller = LazyLoadingController<T>(
      dataLoader: dataLoader,
      pageSize: pageSize,
      preloadThreshold: preloadThreshold,
    );

    _controllers[key] = controller;
    return controller;
  }

  /// Get existing controller
  LazyLoadingController<T>? getController<T>(String key) {
    return _controllers[key] as LazyLoadingController<T>?;
  }

  /// Remove controller
  void removeController(String key) {
    final controller = _controllers.remove(key);
    controller?.dispose();
  }

  /// Clear all controllers
  void clearAll() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
  }
}

/// Controller for managing lazy loading of paginated data
class LazyLoadingController<T> {
  final Future<List<T>> Function(int page, int limit) dataLoader;
  final int pageSize;
  final int preloadThreshold;

  final List<T> _items = [];
  final StreamController<LazyLoadingState<T>> _stateController =
      StreamController<LazyLoadingState<T>>.broadcast();

  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasReachedEnd = false;
  String? _error;

  LazyLoadingController({
    required this.dataLoader,
    this.pageSize = 20,
    this.preloadThreshold = 5,
  });

  /// Stream of loading states
  Stream<LazyLoadingState<T>> get stateStream => _stateController.stream;

  /// Current items
  List<T> get items => List.unmodifiable(_items);

  /// Whether currently loading
  bool get isLoading => _isLoading;

  /// Whether all data has been loaded
  bool get hasReachedEnd => _hasReachedEnd;

  /// Current error message
  String? get error => _error;

  /// Load initial data
  Future<void> loadInitial() async {
    if (_isLoading) return;

    _reset();
    await _loadPage(0);
  }

  /// Load next page
  Future<void> loadNext() async {
    if (_isLoading || _hasReachedEnd) return;

    await _loadPage(_currentPage + 1);
  }

  /// Check if should preload based on current index
  void checkPreload(int currentIndex) {
    if (!_isLoading &&
        !_hasReachedEnd &&
        currentIndex >= _items.length - preloadThreshold) {
      loadNext();
    }
  }

  /// Refresh data (reload from beginning)
  Future<void> refresh() async {
    _reset();
    await _loadPage(0);
  }

  /// Reset state
  void _reset() {
    _items.clear();
    _currentPage = 0;
    _hasReachedEnd = false;
    _error = null;
  }

  /// Load a specific page
  Future<void> _loadPage(int page) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    _emitState();

    try {
      final newItems = await dataLoader(page, pageSize);

      if (newItems.isEmpty) {
        _hasReachedEnd = true;
      } else {
        _items.addAll(newItems);
        _currentPage = page;

        // Check if we got fewer items than requested (end of data)
        if (newItems.length < pageSize) {
          _hasReachedEnd = true;
        }
      }
    } catch (e) {
      _error = e.toString();
      if (kDebugMode) {
        print('LazyLoadingController error: $e');
      }
    } finally {
      _isLoading = false;
      _emitState();
    }
  }

  /// Emit current state
  void _emitState() {
    _stateController.add(LazyLoadingState<T>(
      items: List.unmodifiable(_items),
      isLoading: _isLoading,
      hasReachedEnd: _hasReachedEnd,
      error: _error,
    ));
  }

  /// Dispose resources
  void dispose() {
    _stateController.close();
  }
}

/// State class for lazy loading
class LazyLoadingState<T> {
  final List<T> items;
  final bool isLoading;
  final bool hasReachedEnd;
  final String? error;

  const LazyLoadingState({
    required this.items,
    required this.isLoading,
    required this.hasReachedEnd,
    this.error,
  });

  bool get hasError => error != null;
  bool get isEmpty => items.isEmpty && !isLoading;
}
