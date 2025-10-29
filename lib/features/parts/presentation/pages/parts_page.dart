import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/fsm_empty_state.dart';
import '../blocs/parts/parts_bloc.dart';
import '../blocs/parts/parts_event.dart';
import '../blocs/parts/parts_state.dart';
import '../widgets/part_list_card.dart';
import '../widgets/quick_stats_bar.dart';

@RoutePage()
class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PartsBloc>()
        ..add(const PartsEvent.loadParts())
        ..add(const PartsEvent.loadPartCategories())
        ..add(const PartsEvent.loadLowStockParts()),
      child: const _PartsPageView(),
    );
  }
}

class _PartsPageView extends StatefulWidget {
  const _PartsPageView();

  @override
  State<_PartsPageView> createState() => _PartsPageViewState();
}

class _PartsPageViewState extends State<_PartsPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  // Category tabs
  final List<String> _categories = [
    'All',
    'Electrical',
    'Hydraulic',
    'Mechanical',
    'Tools'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _scrollController.addListener(_onScroll);

    // Listen to tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final category = _tabController.index == 0
            ? null
            : _categories[_tabController.index];
        context.read<PartsBloc>().add(PartsEvent.filterByCategory(category));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PartsBloc>().add(const PartsEvent.loadMoreParts());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: FSMAppBar(
        title: 'Parts',
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          controller: _tabController,
          isScrollable: true,
          tabs: _categories.map((category) => Tab(text: category)).toList(),
        ),
      ),
      body: BlocConsumer<PartsBloc, PartsState>(
        listener: (context, state) {
          if (state.isFailure && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Quick Stats Bar
              QuickStatsBar(
                totalParts: state.parts.length,
                inStock: state.parts.where((p) => p.isInStock).length,
                lowStock: state.lowStockCount,
                isLoading: state.isLoading && state.parts.isEmpty,
                onTotalTap: () {
                  _tabController.animateTo(0);
                  context.read<PartsBloc>().add(const PartsEvent.loadParts());
                },
                onInStockTap: () {
                  _tabController.animateTo(0);
                  context.read<PartsBloc>().add(const PartsEvent.loadParts());
                },
                onLowStockTap: () {
                  _tabController.animateTo(0);
                  context
                      .read<PartsBloc>()
                      .add(const PartsEvent.loadLowStockParts());
                },
              ),

              // Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _categories
                      .map((category) => _buildPartsTab(state, category))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPartsTab(PartsState state, String category) {
    if (state.isLoading && state.parts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.parts.isEmpty) {
      return FSMEmptyState.noData(
        title: 'No Parts Found',
        description: category == 'All'
            ? 'No parts available in the inventory.'
            : 'No $category parts found in the inventory.',
        actionLabel: state.hasFilters ? 'Clear Filters' : null,
        onAction: state.hasFilters
            ? () {
                context.read<PartsBloc>()
                  ..add(const PartsEvent.clearSearch())
                  ..add(const PartsEvent.filterByCategory(null))
                  ..add(const PartsEvent.filterByStatus(null));
              }
            : null,
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<PartsBloc>().add(const PartsEvent.refreshParts());
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: state.parts.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.parts.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final part = state.parts[index];
          return PartListCard(
            part: part,
            location:
                'Warehouse A', // TODO: Add actual location from part entity
            onTap: () {
              // Navigate to part details
              context.router.push(
                  PartDetailsRoute(partNumber: part.partNumber, part: part));
            },
            onDetails: () {
              // Navigate to part details
              context.router.push(
                  PartDetailsRoute(partNumber: part.partNumber, part: part));
            },
          );
        },
      ),
    );
  }
}
