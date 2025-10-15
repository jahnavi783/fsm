import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/lazy_loading_service.dart';
import 'enhanced_loading_indicator.dart';
import 'error_boundary_widget.dart';

/// Lazy loading list widget with automatic pagination
class LazyLoadingList<T> extends StatefulWidget {
  final LazyLoadingController<T> controller;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? separator;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const LazyLoadingList({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.separator,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.padding,
    this.scrollController,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  State<LazyLoadingList<T>> createState() => _LazyLoadingListState<T>();
}

class _LazyLoadingListState<T> extends State<LazyLoadingList<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);

    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.loadInitial();
    });
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      widget.controller.loadNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LazyLoadingState<T>>(
      stream: widget.controller.stateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildLoadingWidget();
        }

        final state = snapshot.data!;

        if (state.hasError && state.items.isEmpty) {
          return _buildErrorWidget(state.error!);
        }

        if (state.isEmpty) {
          return _buildEmptyWidget();
        }

        return _buildList(state);
      },
    );
  }

  Widget _buildList(LazyLoadingState<T> state) {
    final itemCount = state.items.length + (state.isLoading ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      padding: widget.padding ?? EdgeInsets.all(16.w),
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        if (index >= state.items.length) return const SizedBox.shrink();
        return widget.separator ?? SizedBox(height: 8.h);
      },
      itemBuilder: (context, index) {
        // Show loading indicator at the end
        if (index >= state.items.length) {
          return _buildLoadingWidget();
        }

        final item = state.items[index];

        // Check for preload
        widget.controller.checkPreload(index);

        return ErrorBoundaryWidget(
          child: widget.itemBuilder(context, item, index),
          onError: (error, stackTrace) {
            debugPrint('Error in list item $index: $error');
          },
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    return widget.loadingWidget ??
        Container(
          padding: EdgeInsets.all(16.w),
          child: const Center(
            child: EnhancedLoadingIndicator(
              style: LoadingStyle.circular,
            ),
          ),
        );
  }

  Widget _buildErrorWidget(String error) {
    return widget.errorWidget ??
        DefaultErrorWidget(
          error: error,
          onRetry: () => widget.controller.refresh(),
        );
  }

  Widget _buildEmptyWidget() {
    return widget.emptyWidget ??
        EmptyStateWidget(
          title: 'No items found',
          message: 'There are no items to display.',
          onAction: () => widget.controller.refresh(),
          actionLabel: 'Refresh',
        );
  }
}

/// Grid version of lazy loading list
class LazyLoadingGrid<T> extends StatefulWidget {
  final LazyLoadingController<T> controller;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? childAspectRatio;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const LazyLoadingGrid({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.padding,
    this.scrollController,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  State<LazyLoadingGrid<T>> createState() => _LazyLoadingGridState<T>();
}

class _LazyLoadingGridState<T> extends State<LazyLoadingGrid<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);

    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.loadInitial();
    });
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      widget.controller.loadNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LazyLoadingState<T>>(
      stream: widget.controller.stateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildLoadingWidget();
        }

        final state = snapshot.data!;

        if (state.hasError && state.items.isEmpty) {
          return _buildErrorWidget(state.error!);
        }

        if (state.isEmpty) {
          return _buildEmptyWidget();
        }

        return _buildGrid(state);
      },
    );
  }

  Widget _buildGrid(LazyLoadingState<T> state) {
    return CustomScrollView(
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      slivers: [
        SliverPadding(
          padding: widget.padding ?? EdgeInsets.all(16.w),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              mainAxisSpacing: widget.mainAxisSpacing ?? 8.h,
              crossAxisSpacing: widget.crossAxisSpacing ?? 8.w,
              childAspectRatio: widget.childAspectRatio ?? 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = state.items[index];

                // Check for preload
                widget.controller.checkPreload(index);

                return ErrorBoundaryWidget(
                  child: widget.itemBuilder(context, item, index),
                  onError: (error, stackTrace) {
                    debugPrint('Error in grid item $index: $error');
                  },
                );
              },
              childCount: state.items.length,
            ),
          ),
        ),
        if (state.isLoading)
          SliverToBoxAdapter(
            child: _buildLoadingWidget(),
          ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return widget.loadingWidget ??
        Container(
          padding: EdgeInsets.all(16.w),
          child: const Center(
            child: EnhancedLoadingIndicator(
              style: LoadingStyle.circular,
            ),
          ),
        );
  }

  Widget _buildErrorWidget(String error) {
    return widget.errorWidget ??
        DefaultErrorWidget(
          error: error,
          onRetry: () => widget.controller.refresh(),
        );
  }

  Widget _buildEmptyWidget() {
    return widget.emptyWidget ??
        EmptyStateWidget(
          title: 'No items found',
          message: 'There are no items to display.',
          onAction: () => widget.controller.refresh(),
          actionLabel: 'Refresh',
        );
  }
}
