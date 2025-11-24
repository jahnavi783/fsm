import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

import '../inputs/filter_chip_data.dart';
import '../inputs/fsm_filter_chip_group.dart';
import '../inputs/fsm_search_bar.dart';

/// FSMSearchFilterHeader - Standardized search + filter component
///
/// Combines FSMSearchBar and FSMFilterChipGroup with unified behavior:
/// - Optional search functionality with voice search support
/// - Optional filter chips with single/multi-select modes
/// - Consistent spacing and layout
/// - Badge count display for active filters
/// - Responsive design with proper overflow handling
///
/// Use cases:
/// - Dashboard work order filtering
/// - Document search and category filtering
/// - Parts catalog search and category filtering
/// - Any page requiring search and/or filtering
class FSMSearchFilterHeader<T> extends StatefulWidget {
  // Search properties
  final String? searchHint;
  final String? searchValue;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final bool showVoiceSearch;
  final bool showSearch;
  final VoidCallback? onVoiceSearchTap;

  // Filter properties
  final List<FilterChipData<T>>? filterOptions;
  final List<T> selectedFilters;
  final ValueChanged<List<T>>? onFilterChanged;
  final bool multiSelectFilters;
  final bool showClearAll;
  final String clearAllLabel;
  final bool showFilters;

  // Layout properties
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final bool isLoading;

  const FSMSearchFilterHeader({
    super.key,
    // Search
    this.searchHint,
    this.searchValue,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.showVoiceSearch = false,
    this.showSearch = true,
    this.onVoiceSearchTap,

    // Filters
    this.filterOptions,
    this.selectedFilters = const [],
    this.onFilterChanged,
    this.multiSelectFilters = true,
    this.showClearAll = true,
    this.clearAllLabel = 'Clear All',
    this.showFilters = true,
    // Layout
    this.padding,
    this.margin,
    this.height,
    this.isLoading = false,
  });

  /// Search only variant
  const FSMSearchFilterHeader.searchOnly({
    super.key,
    required this.searchHint,
    this.searchValue,
    required this.onSearchChanged,
    this.onSearchSubmitted,
    this.showVoiceSearch = false,
    this.padding,
    this.margin,
    this.height,
    this.onVoiceSearchTap,
    this.isLoading = false,
  })  : showSearch = true,
        filterOptions = null,
        selectedFilters = const [],
        onFilterChanged = null,
        multiSelectFilters = true,
        showClearAll = true,
        clearAllLabel = 'Clear All',
        showFilters = false;

  /// Filters only variant
  const FSMSearchFilterHeader.filtersOnly({
    super.key,
    required this.filterOptions,
    this.selectedFilters = const [],
    required this.onFilterChanged,
    this.multiSelectFilters = true,
    this.showClearAll = true,
    this.clearAllLabel = 'Clear All',
    this.onVoiceSearchTap,
    this.padding,
    this.margin,
    this.height,
    this.isLoading = false,
  })  : showSearch = false,
        searchHint = null,
        searchValue = null,
        onSearchChanged = null,
        onSearchSubmitted = null,
        showVoiceSearch = false,
        showFilters = true;

  @override
  State<FSMSearchFilterHeader<T>> createState() =>
      _FSMSearchFilterHeaderState<T>();
}

class _FSMSearchFilterHeaderState<T> extends State<FSMSearchFilterHeader<T>> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchValue);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FSMSearchFilterHeader<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchValue != widget.searchValue) {
      _searchController.text = widget.searchValue ?? '';
    }
  }

  int get _activeFilterCount => widget.selectedFilters.length;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = widget.padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        );
    final effectiveMargin = widget.margin ?? REdgeInsets.all(0);

    return Container(
      margin: effectiveMargin,
      padding: effectivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          if (widget.showSearch) ...[
            FSMSearchBar(
              hintText: widget.searchHint ?? 'Search...',
              controller: _searchController,
              onChanged: widget.onSearchChanged,
              onSubmitted: widget.onSearchSubmitted,
              showVoiceSearch: widget.showVoiceSearch,
              onVoiceSearchTap: widget.onVoiceSearchTap,
              showFilterButton: widget.showFilters &&
                  widget.filterOptions != null &&
                  widget.filterOptions!.isNotEmpty,
              activeFilterCount:
                  _activeFilterCount > 0 ? _activeFilterCount : null,
              isLoading: widget.isLoading,
              margin: REdgeInsets.all(0),
            ),
            if (widget.showFilters &&
                widget.filterOptions != null &&
                widget.filterOptions!.isNotEmpty)
              RSizedBox(height: DesignTokens.space3),
          ],

          // Filter chips
          if (widget.showFilters &&
              widget.filterOptions != null &&
              widget.filterOptions!.isNotEmpty)
            FSMFilterChipGroup<T>(
              options: widget.filterOptions!,
              selectedValues: widget.selectedFilters,
              onSelectionChanged: widget.onFilterChanged ?? (values) {},
              multiSelect: widget.multiSelectFilters,
              showClearAll: widget.showClearAll,
              clearAllLabel: widget.clearAllLabel,
              padding: REdgeInsets.all(0),
            ),
        ],
      ),
    );
  }
}

/// Helper class for creating common search filter configurations
class FSMSearchFilterConfig {
  FSMSearchFilterConfig._();

  /// Dashboard configuration - work order filters
  static List<FilterChipData<String>> workOrderFilters() {
    return [
      const FilterChipData(
        value: 'all',
        label: 'All',
        leadingIcon: Icons.list_alt,
      ),
      const FilterChipData(
        value: 'unassigned',
        label: 'Unassigned',
        leadingIcon: Icons.assignment,
      ),
      const FilterChipData(
        value: 'assigned',
        label: 'Assigned',
        leadingIcon: Icons.assignment_ind,
      ),
      const FilterChipData(
        value: 'in_progress',
        label: 'In Progress',
        leadingIcon: Icons.engineering,
      ),
      const FilterChipData(
        value: 'paused',
        label: 'Paused',
        leadingIcon: Icons.pause_circle,
      ),
      const FilterChipData(
        value: 'completed',
        label: 'Completed',
        leadingIcon: Icons.check_circle,
      ),
    ];
  }

  /// Document configuration - category filters
  static List<FilterChipData<String>> documentFilters() {
    return [
      const FilterChipData(
        value: 'all',
        label: 'All',
        leadingIcon: Icons.folder_open,
      ),
      const FilterChipData(
        value: 'manuals',
        label: 'Manuals',
        leadingIcon: Icons.menu_book,
      ),
      const FilterChipData(
        value: 'procedures',
        label: 'Procedures',
        leadingIcon: Icons.list_alt,
      ),
      const FilterChipData(
        value: 'forms',
        label: 'Forms',
        leadingIcon: Icons.description,
      ),
      const FilterChipData(
        value: 'reports',
        label: 'Reports',
        leadingIcon: Icons.assessment,
      ),
    ];
  }

  /// Parts configuration - category filters
  static List<FilterChipData<String>> partFilters() {
    return [
      const FilterChipData(
        value: 'all',
        label: 'All',
        leadingIcon: Icons.inventory_2,
      ),
      const FilterChipData(
        value: 'electrical',
        label: 'Electrical',
        leadingIcon: Icons.electrical_services,
      ),
      const FilterChipData(
        value: 'hydraulic',
        label: 'Hydraulic',
        leadingIcon: Icons.water_drop,
      ),
      const FilterChipData(
        value: 'mechanical',
        label: 'Mechanical',
        leadingIcon: Icons.settings,
      ),
      const FilterChipData(
        value: 'tools',
        label: 'Tools',
        leadingIcon: Icons.construction,
      ),
    ];
  }
}
