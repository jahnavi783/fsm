import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/fsm_card.dart';
import '../blocs/parts/parts_bloc.dart';
import '../blocs/parts/parts_event.dart';
import '../blocs/parts/parts_state.dart';
import '../widgets/part_card.dart';
import '../widgets/parts_search_bar.dart';
import '../widgets/parts_filter_chips.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
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
      appBar: FSMAppBar.gradient(
        title: 'Parts Management',
        subtitle: 'Inventory & Stock Management',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'All Parts'),
                Tab(text: 'Low Stock'),
                Tab(text: 'Inventory'),
              ],
            ),
          ),
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
              // Summary cards
              _buildSummaryCards(state),

              // Search and filters
              if (_tabController.index == 0) ...[
                PartsSearchBar(
                  initialQuery: state.searchQuery,
                  onChanged: (query) {
                    if (query.isEmpty) {
                      context
                          .read<PartsBloc>()
                          .add(const PartsEvent.clearSearch());
                    }
                  },
                  onSubmitted: (query) {
                    context
                        .read<PartsBloc>()
                        .add(PartsEvent.searchParts(query: query));
                  },
                  onClear: () {
                    context
                        .read<PartsBloc>()
                        .add(const PartsEvent.clearSearch());
                  },
                ),
                PartsFilterChips(
                  categories: state.categories,
                  selectedCategory: state.selectedCategory,
                  selectedStatus: state.selectedStatus,
                  onCategoryChanged: (category) {
                    context
                        .read<PartsBloc>()
                        .add(PartsEvent.filterByCategory(category));
                  },
                  onStatusChanged: (status) {
                    context
                        .read<PartsBloc>()
                        .add(PartsEvent.filterByStatus(status));
                  },
                  onClearFilters: () {
                    context.read<PartsBloc>()
                      ..add(const PartsEvent.filterByCategory(null))
                      ..add(const PartsEvent.filterByStatus(null));
                  },
                ),
              ],

              // Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAllPartsTab(state),
                    _buildLowStockTab(state),
                    _buildInventoryTab(state),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSummaryCards(PartsState state) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: FSMCard(
              padding: EdgeInsets.all(12.w),
              child: _buildSummaryCardContent(
                title: 'Total Parts',
                value: state.parts.length.toString(),
                icon: Icons.inventory_2,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: FSMCard(
              padding: EdgeInsets.all(12.w),
              child: _buildSummaryCardContent(
                title: 'Low Stock',
                value: state.lowStockCount.toString(),
                icon: Icons.warning,
                color: Colors.orange,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: FSMCard(
              padding: EdgeInsets.all(12.w),
              child: _buildSummaryCardContent(
                title: 'Out of Stock',
                value: state.outOfStockCount.toString(),
                icon: Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCardContent({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24.sp,
          color: color,
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAllPartsTab(PartsState state) {
    if (state.isLoading && state.parts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.parts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64.sp,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.h),
            Text(
              'No parts found',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            if (state.hasFilters) ...[
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {
                  context.read<PartsBloc>()
                    ..add(const PartsEvent.clearSearch())
                    ..add(const PartsEvent.filterByCategory(null))
                    ..add(const PartsEvent.filterByStatus(null));
                },
                child: const Text('Clear filters'),
              ),
            ],
          ],
        ),
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
          return PartCard(
            part: part,
            onTap: () {
              // TODO: Navigate to part details
            },
            onUpdateInventory: () {
              _showInventoryUpdateForm(context, part);
            },
          );
        },
      ),
    );
  }

  Widget _buildLowStockTab(PartsState state) {
    if (state.lowStockParts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64.sp,
              color: Colors.green[400],
            ),
            SizedBox(height: 16.h),
            Text(
              'No low stock parts',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'All parts are adequately stocked',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: state.lowStockParts.length,
      itemBuilder: (context, index) {
        final part = state.lowStockParts[index];
        return PartCard(
          part: part,
          onTap: () {
            // TODO: Navigate to part details
          },
          onUpdateInventory: () {
            _showInventoryUpdateForm(context, part);
          },
        );
      },
    );
  }

  Widget _buildInventoryTab(PartsState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            size: 64.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            'Inventory Management',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Coming soon...',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  void _showInventoryUpdateForm(BuildContext context, part) {
    // TODO: Implement inventory update form
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inventory update feature coming soon'),
      ),
    );
  }
}
