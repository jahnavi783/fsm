import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/templates/fsm_list_page_template.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/inputs/filter_chip_data.dart';
import '../blocs/parts/parts_bloc.dart';
import '../blocs/parts/parts_event.dart';
import '../blocs/parts/parts_state.dart';
import '../widgets/part_list_card.dart';

@RoutePage()
class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  final ScrollController _scrollController = ScrollController();
  late final PartsBloc _partsBloc;
  String _searchQuery = '';
  List<String> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Initialize PartsBloc and load data
    _partsBloc = getIt<PartsBloc>()
      ..add(const PartsEvent.loadParts())
      ..add(const PartsEvent.loadPartCategories());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _partsBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _partsBloc.add(const PartsEvent.loadMoreParts());
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (query.isNotEmpty) {
      _partsBloc.add(
        PartsEvent.searchParts(
          query: query,
          category:
              _selectedCategories.isNotEmpty ? _selectedCategories.first : null,
        ),
      );
    } else {
      _partsBloc.add(
        PartsEvent.loadParts(
          category:
              _selectedCategories.isNotEmpty ? _selectedCategories.first : null,
        ),
      );
    }
  }

  void _onFilterChanged(List<String> selectedFilters) {
    setState(() {
      _selectedCategories = selectedFilters;
    });

    // Map filter value to category (handle 'all' case)
    final category =
        selectedFilters.isNotEmpty && selectedFilters.first != 'all'
            ? selectedFilters.first
            : null;

    if (_searchQuery.isNotEmpty) {
      _partsBloc.add(
        PartsEvent.searchParts(
          query: _searchQuery,
          category: category,
        ),
      );
    } else {
      _partsBloc.add(
        PartsEvent.loadParts(
          category: category,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _partsBloc,
      child: BlocBuilder<PartsBloc, PartsState>(
        builder: (context, state) {
          return FSMListPageTemplate<String>(
            // Custom gradient app bar
            appBar: FSMAppBar.gradient(
              title: 'Parts',
            ),
            // Search and filters
            showSearch: true,
            searchHint: 'Search parts...',
            searchValue: _searchQuery,
            onSearchChanged: _onSearchChanged,
            onSearchSubmitted: (query) => _onSearchChanged(query),
            showVoiceSearch: false,
            showFilters: true,
            filterOptions: [
              const FilterChipData<String>(
                value: 'all',
                label: 'All',
                leadingIcon: Icons.inventory_2,
              ),
              const FilterChipData<String>(
                value: 'compressor parts',
                label: 'Compressor Parts',
                leadingIcon: Icons.electrical_services,
              ),
              const FilterChipData<String>(
                value: 'valves & pumps',
                label: 'Valves & Pumps',
                leadingIcon: Icons.water_drop,
              ),
              const FilterChipData<String>(
                value: 'mechanical',
                label: 'Mechanical',
                leadingIcon: Icons.settings,
              ),
              const FilterChipData<String>(
                value: 'filters',
                label: 'Filters',
                leadingIcon: Icons.filter_alt,
              ),
              const FilterChipData<String>(
                value: 'drilling components',
                label: 'Drilling Components',
                leadingIcon: Icons.construction,
              ),
            ],
            selectedFilters: _selectedCategories,
            onFilterChanged: _onFilterChanged,
            multiSelectFilters: false,
            // Content
            listContent: _buildListContent(state),
            isLoading: state.isLoading && state.parts.isEmpty,
            isEmpty: state.filteredParts.isEmpty && !state.isLoading,
            hasError: state.isFailure,
            errorMessage: state.errorMessage,
            onRetry: () => _partsBloc.add(
              const PartsEvent.loadParts(page: 1),
            ),
            emptyTitle: 'No Parts Found',
            emptyDescription: 'Try adjusting your search or filter criteria.',
            emptyActionLabel: state.hasFilters ? 'Clear Filters' : null,
            onEmptyAction: state.hasFilters
                ? () {
                    setState(() {
                      _searchQuery = '';
                      _selectedCategories = [];
                    });
                    _partsBloc
                      ..add(const PartsEvent.clearSearch())
                      ..add(const PartsEvent.filterByCategory(null));
                  }
                : null,
            // Actions
            onRefresh: () async {
              _partsBloc.add(
                PartsEvent.loadParts(
                  searchQuery: _searchQuery.isNotEmpty ? _searchQuery : null,
                  category: _selectedCategories.isNotEmpty &&
                          _selectedCategories.first != 'all'
                      ? _selectedCategories.first
                      : null,
                ),
              );
            },
            onVoiceSearchTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildListContent(PartsState state) {
    return ListView.builder(
      // controller: _scrollController,
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      itemCount: state.filteredParts.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.filteredParts.length) {
          return Padding(
            padding: REdgeInsets.all(DesignTokens.space4),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final part = state.filteredParts[index];
        return Padding(
          padding: REdgeInsets.only(bottom: DesignTokens.space3),
          child: PartListCard(
            part: part,
            location:
                'Warehouse A', // TODO: Add actual location from part entity
            onTap: () => _openPartDetails(context, part),
            onDetails: () => _openPartDetails(context, part),
          ),
        );
      },
    );
  }

  void _openPartDetails(BuildContext context, part) {
    context.router.push(
      PartDetailsRoute(partNumber: part.partNumber, part: part),
    );
  }
}
