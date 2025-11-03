import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/navigation/fsm_drawer.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../../core/widgets/states/fsm_empty_state.dart';
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
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: FSMAppBar.gradient(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: 'Menu',
              ),
            ),
            title: 'Parts',
            automaticallyImplyLeading: false,
            actions: [
              FSMAppBarAction.search(
                onPressed: () {
                  // TODO: Implement search navigation when SearchRoute is available
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search coming soon')),
                  );
                },
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              controller: _tabController,
              isScrollable: true,
              tabs: _categories.map((category) => Tab(text: category)).toList(),
            ),
          ),

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/parts',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onSync: () => _handleSync(context),
            onScanQR: () => _handleScanQR(context),
            onCheckIn: () => _handleCheckIn(context),
            onLogout: () => _handleLogout(context),
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
                      context
                          .read<PartsBloc>()
                          .add(const PartsEvent.loadParts());
                    },
                    onInStockTap: () {
                      _tabController.animateTo(0);
                      context
                          .read<PartsBloc>()
                          .add(const PartsEvent.loadParts());
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
                          .map((category) =>
                              _buildPartsTabInline(state, category))
                          .toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPartsTabInline(PartsState state, String category) {
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

// ═══════════════════════════════════════════════════════════════════════
// NAVIGATION & DRAWER ACTION HELPERS
// ═══════════════════════════════════════════════════════════════════════

/// Navigate to drawer section using Auto Route extensions
void _navigateToSection(BuildContext context, String section) {
  final router = context.router;
  final drawerSection = _mapStringToDrawerSection(section);

  if (drawerSection != null) {
    router.navigateToDrawerSection(drawerSection);
  }
}

/// Map section string to DrawerSection enum
DrawerSection? _mapStringToDrawerSection(String section) {
  switch (section.toLowerCase()) {
    case 'dashboard':
      return DrawerSection.dashboard;
    case 'work_orders':
    case 'workorders':
      return DrawerSection.workOrders;
    case 'calendar':
      return DrawerSection.calendar;
    case 'documents':
      return DrawerSection.documents;
    case 'parts':
      return DrawerSection.parts;
    case 'profile':
      return DrawerSection.profile;
    case 'settings':
      return DrawerSection.settings;
    case 'chat':
      return DrawerSection.chat;
    default:
      return null;
  }
}

/// Handle sync action
void _handleSync(BuildContext context) {
  // Trigger parts refresh
  context.read<PartsBloc>().add(const PartsEvent.refreshParts());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Syncing parts data...')),
  );
}

/// Handle QR code scanning
void _handleScanQR(BuildContext context) {
  // TODO: Implement QR scanning functionality
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('QR Scanner feature coming soon!')),
  );
}

/// Handle location check-in
void _handleCheckIn(BuildContext context) {
  // TODO: Implement location check-in functionality
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Check-in feature coming soon!')),
  );
}

/// Handle user logout
void _handleLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            context.read<AuthBloc>().add(const AuthEvent.logout());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          child: const Text('Logout'),
        ),
      ],
    ),
  );
}
