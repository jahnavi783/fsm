import 'package:flutter/material.dart';
import '../cards/fsm_stats_card.dart';
import '../states/fsm_empty_state.dart';
import '../states/fsm_error_state.dart';
import '../states/fsm_loading_indicator.dart';
import '../inputs/filter_chip_data.dart';
import '../sections/fsm_stats_section.dart';
import '../sections/fsm_search_filter_header.dart';

/// FSMListPageTemplate - Unified page scaffold for all list pages
///
/// Provides consistent layout structure using Column + Expanded:
/// - Optional app bar with actions
/// - Optional stats section (configurable grid)
/// - Search and filter header (optional)
/// - Scrollable list content with states
/// - Pull-to-refresh support
/// - Floating action button support
/// - Consistent empty, loading, and error states
///
/// Simpler approach than CustomScrollView, easier to understand and maintain.
/// Perfect for Dashboard, Documents, and Parts pages.
class FSMListPageTemplate<T> extends StatelessWidget {
  // Page structure
  final String? title;
  final List<Widget>? appBarActions;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  // Stats section
  final List<StatsCardData>? statsData;
  final String? statsTitle;
  final Widget? statsTitleAction;
  final int statsGridColumns;
  final bool showStats;
  final bool statsLoading;
  final String? statsError;
  final VoidCallback? onStatsRetry;

  // Search and filters
  final String? searchHint;
  final String? searchValue;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final bool showVoiceSearch;
  final bool showSearch;
  final List<FilterChipData<T>>? filterOptions;
  final List<T> selectedFilters;
  final ValueChanged<List<T>>? onFilterChanged;
  final bool multiSelectFilters;
  final bool showFilters;

  // List content and states
  final Widget? listContent;
  final bool isLoading;
  final bool isEmpty;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final IconData? emptyIcon;
  final String? emptyTitle;
  final String? emptyDescription;
  final String? emptyActionLabel;
  final VoidCallback? onEmptyAction;

  // Pull to refresh
  final RefreshCallback? onRefresh;

  // Layout
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const FSMListPageTemplate({
    super.key,
    // Page structure
    this.title,
    this.appBarActions,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    // Stats
    this.statsData,
    this.statsTitle,
    this.statsTitleAction,
    this.statsGridColumns = 2,
    this.showStats = false,
    this.statsLoading = false,
    this.statsError,
    this.onStatsRetry,
    // Search and filters
    this.searchHint,
    this.searchValue,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.showVoiceSearch = false,
    this.showSearch = false,
    this.filterOptions,
    this.selectedFilters = const [],
    this.onFilterChanged,
    this.multiSelectFilters = true,
    this.showFilters = false,
    // List content and states
    this.listContent,
    this.isLoading = false,
    this.isEmpty = false,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.emptyIcon,
    this.emptyTitle,
    this.emptyDescription,
    this.emptyActionLabel,
    this.onEmptyAction,
    // Pull to refresh
    this.onRefresh,
    // Layout
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.scaffoldBackgroundColor;

    Widget body = Column(
      children: [
        // Stats section
        if (showStats)
          FSMStatsSection(
            statsData: statsData ?? [],
            title: statsTitle,
            titleAction: statsTitleAction,
            crossAxisCount: statsGridColumns,
            isLoading: statsLoading,
            errorMessage: statsError,
            onRetry: onStatsRetry,
          ),

        // Search and filter header
        if (showSearch || showFilters)
          FSMSearchFilterHeader<T>(
            searchHint: searchHint,
            searchValue: searchValue,
            onSearchChanged: onSearchChanged,
            onSearchSubmitted: onSearchSubmitted,
            showVoiceSearch: showVoiceSearch,
            showSearch: showSearch,
            filterOptions: filterOptions,
            selectedFilters: selectedFilters,
            onFilterChanged: onFilterChanged,
            multiSelectFilters: multiSelectFilters,
            showFilters: showFilters,
          ),

        // Main content area
        Expanded(
          child: _buildMainContent(context),
        ),
      ],
    );

    // Add pull-to-refresh if provided
    if (onRefresh != null) {
      body = RefreshIndicator(
        onRefresh: onRefresh!,
        child: body,
      );
    }

    // Add padding if provided
    if (padding != null) {
      body = Padding(
        padding: padding!,
        child: body,
      );
    }

    return Scaffold(
      appBar: appBar ??
          (title != null
              ? AppBar(
                  title: Text(title!),
                  actions: appBarActions,
                  backgroundColor: effectiveBackgroundColor,
                )
              : null),
      backgroundColor: effectiveBackgroundColor,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  Widget _buildMainContent(BuildContext context) {
    // Show loading state
    if (isLoading && listContent == null) {
      return const FSMLoadingIndicator.workOrders();
    }

    // Show error state
    if (hasError) {
      return FSMErrorState.network(
        message: errorMessage ?? 'An error occurred while loading data.',
        onRetry: onRetry,
      );
    }

    // Show empty state
    if (isEmpty) {
      return FSMEmptyState(
        icon: emptyIcon ?? Icons.inbox_outlined,
        title: emptyTitle ?? 'No Items Found',
        description: emptyDescription ?? 'There are no items to display.',
        actionLabel: emptyActionLabel,
        onAction: onEmptyAction,
      );
    }

    // Show list content
    return listContent ?? const SizedBox.shrink();
  }
}

/// Pre-configured templates for common page types

/// Dashboard page template with work order specific configuration
class FSMDashboardPageTemplate extends StatelessWidget {
  final List<StatsCardData>? statsData;
  final bool statsLoading;
  final String? statsError;
  final VoidCallback? onStatsRetry;
  final List<String> selectedFilters;
  final ValueChanged<List<String>>? onFilterChanged;
  final Widget? listContent;
  final bool isLoading;
  final bool isEmpty;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final RefreshCallback? onRefresh;
  final Widget? floatingActionButton;
  final List<Widget>? appBarActions;

  const FSMDashboardPageTemplate({
    super.key,
    this.statsData,
    this.statsLoading = false,
    this.statsError,
    this.onStatsRetry,
    this.selectedFilters = const [],
    this.onFilterChanged,
    this.listContent,
    this.isLoading = false,
    this.isEmpty = false,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.onRefresh,
    this.floatingActionButton,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return FSMListPageTemplate<String>(
      title: 'Dashboard',
      appBarActions: appBarActions,
      // Stats
      showStats: true,
      statsData: statsData,
      statsTitle: 'Work Orders',
      statsGridColumns: 2,
      statsLoading: statsLoading,
      statsError: statsError,
      onStatsRetry: onStatsRetry,
      // Filters only (no search for dashboard)
      showSearch: false,
      showFilters: true,
      filterOptions: FSMSearchFilterConfig.workOrderFilters(),
      selectedFilters: selectedFilters,
      onFilterChanged: onFilterChanged,
      multiSelectFilters: false, // Single select for work order status
      // Content
      listContent: listContent,
      isLoading: isLoading,
      isEmpty: isEmpty,
      hasError: hasError,
      errorMessage: errorMessage,
      onRetry: onRetry,
      emptyTitle: 'No Work Orders',
      emptyDescription:
          'There are no work orders matching your current filter.',
      // Actions
      onRefresh: onRefresh,
      floatingActionButton: floatingActionButton,
    );
  }
}

/// Documents page template with document specific configuration
class FSMDocumentsPageTemplate extends StatelessWidget {
  final String? searchValue;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final List<String> selectedFilters;
  final ValueChanged<List<String>>? onFilterChanged;
  final Widget? listContent;
  final bool isLoading;
  final bool isEmpty;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final RefreshCallback? onRefresh;
  final Widget? floatingActionButton;
  final List<Widget>? appBarActions;

  const FSMDocumentsPageTemplate({
    super.key,
    this.searchValue,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.selectedFilters = const [],
    this.onFilterChanged,
    this.listContent,
    this.isLoading = false,
    this.isEmpty = false,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.onRefresh,
    this.floatingActionButton,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return FSMListPageTemplate<String>(
      title: 'Documents',
      appBarActions: appBarActions,
      // No stats section for documents
      showStats: false,
      // Search and filters
      showSearch: true,
      searchHint: 'Search documents...',
      searchValue: searchValue,
      onSearchChanged: onSearchChanged,
      onSearchSubmitted: onSearchSubmitted,
      showVoiceSearch: true,
      showFilters: true,
      filterOptions: FSMSearchFilterConfig.documentFilters(),
      selectedFilters: selectedFilters,
      onFilterChanged: onFilterChanged,
      multiSelectFilters: true,
      // Content
      listContent: listContent,
      isLoading: isLoading,
      isEmpty: isEmpty,
      hasError: hasError,
      errorMessage: errorMessage,
      onRetry: onRetry,
      emptyTitle: 'No Documents Found',
      emptyDescription: 'Try adjusting your search or filter criteria.',
      // Actions
      onRefresh: onRefresh,
      floatingActionButton: floatingActionButton,
    );
  }
}

/// Parts page template with parts specific configuration
class FSMPartsPageTemplate extends StatelessWidget {
  final List<StatsCardData>? statsData;
  final bool statsLoading;
  final String? statsError;
  final VoidCallback? onStatsRetry;
  final String? searchValue;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final List<String> selectedFilters;
  final ValueChanged<List<String>>? onFilterChanged;
  final Widget? listContent;
  final bool isLoading;
  final bool isEmpty;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final RefreshCallback? onRefresh;
  final Widget? floatingActionButton;
  final List<Widget>? appBarActions;

  const FSMPartsPageTemplate({
    super.key,
    this.statsData,
    this.statsLoading = false,
    this.statsError,
    this.onStatsRetry,
    this.searchValue,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.selectedFilters = const [],
    this.onFilterChanged,
    this.listContent,
    this.isLoading = false,
    this.isEmpty = false,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.onRefresh,
    this.floatingActionButton,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return FSMListPageTemplate<String>(
      title: 'Parts',
      appBarActions: appBarActions,
      // Stats (inventory overview)
      showStats: true,
      statsData: statsData,
      statsTitle: 'Inventory',
      statsGridColumns: 3, // Horizontal layout for parts stats
      statsLoading: statsLoading,
      statsError: statsError,
      onStatsRetry: onStatsRetry,
      // Search and filters
      showSearch: true,
      searchHint: 'Search parts...',
      searchValue: searchValue,
      onSearchChanged: onSearchChanged,
      onSearchSubmitted: onSearchSubmitted,
      showVoiceSearch: false,
      showFilters: true,
      filterOptions: FSMSearchFilterConfig.partFilters(),
      selectedFilters: selectedFilters,
      onFilterChanged: onFilterChanged,
      multiSelectFilters: false, // Single select for part categories
      // Content
      listContent: listContent,
      isLoading: isLoading,
      isEmpty: isEmpty,
      hasError: hasError,
      errorMessage: errorMessage,
      onRetry: onRetry,
      emptyTitle: 'No Parts Found',
      emptyDescription: 'Try adjusting your search or category filter.',
      // Actions
      onRefresh: onRefresh,
      floatingActionButton: floatingActionButton,
    );
  }
}
