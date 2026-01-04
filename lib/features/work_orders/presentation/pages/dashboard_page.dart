// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/router/app_router.dart';
// import '../../../../core/router/app_router.gr.dart';
// import '../../../../core/theme/design_tokens.dart';
// import '../../../../core/theme/spacing_theme.dart';
// import '../../../../core/utils/work_order_status_helper.dart';
// import '../../../../core/widgets/stats_card.dart' as stats;
// import '../../../../core/widgets/widgets.dart'
//     hide StatsGrid, StatsCard, StatsCardData; // Barrel import, hide duplicates
// import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
// import '../../../auth/presentation/blocs/auth/auth_event.dart';
// import '../../../auth/presentation/blocs/auth/auth_state.dart';
// import '../../../chat/presentation/pages/chatbot_page.dart';
// import '../../domain/entities/work_order_entity.dart';
// import '../blocs/work_orders_list/work_orders_list_bloc.dart';
// import '../blocs/work_orders_list/work_orders_list_event.dart';
// import '../blocs/work_orders_list/work_orders_list_state.dart';
// import '../widgets/current_work_order_card.dart';
// import '../widgets/work_order_list_card.dart';
//
// /// DashboardPage - Work Orders dashboard with tabs and statistics
// ///
// /// Refactored to use shared components:
// /// - [FSMActionButton.extended] for sync FAB
// /// - [FSMEmptyState] for empty list states
// /// - [OfflineBanner] for connectivity indicator
// ///
// /// Maintains all existing functionality:
// /// - Tab-based filtering (Unassigned, Assigned, In Progress, Paused, Completed)
// /// - Stats grid display
// /// - Pull-to-refresh
// /// - Infinite scroll pagination
// /// - Work order action sheets
// /// - BLoC state management
// @RoutePage()
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Filter state - using String to match FilterChipData value type
//   String _selectedFilter =
//       'assigned'; // Default to 'assigned' (previously tab index 1)
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//
//     // Load all work orders initially without status filter
//     context.read<WorkOrdersListBloc>().add(
//           const WorkOrdersListEvent.loadWorkOrders(
//             page: 1,
//           ),
//         );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _onFilterChanged(List<String> selectedFilters) {
//     if (selectedFilters.isNotEmpty &&
//         selectedFilters.first != _selectedFilter) {
//       setState(() {
//         _selectedFilter = selectedFilters.first;
//       });
//     }
//   }
//
//   void _onScroll() {
//     if (_scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent * 0.8) {
//       context.read<WorkOrdersListBloc>().add(
//             const WorkOrdersListEvent.loadMoreWorkOrders(),
//           );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, authState) {
//         // Get user name from auth state
//         final userName = authState.maybeWhen(
//           authenticated: (user) => user.firstName,
//           orElse: () => 'User',
//         );
//         final user = authState is AuthAuthenticated ? authState.user : null;
//
//         return Scaffold(
//           key: _scaffoldKey,
//           backgroundColor: theme.colorScheme.surface,
//
//           // ═══════════════════════════════════════════════════════════
//           // APP BAR - Navigation style with hamburger menu
//           // ═══════════════════════════════════════════════════════════
//           appBar: FSMAppBar.navigation(
//             title: 'Welcome, $userName',
//             onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
//             onSearchTap: () => _showSearchDialog(context),
//             onRefreshTap: _handleRefresh,
//             showRefresh: true,
//           ),
//
//           // ═══════════════════════════════════════════════════════════
//           // DRAWER - FSM Navigation Drawer
//           // ═══════════════════════════════════════════════════════════
//           drawer: FSMDrawer(
//             currentRoute: '/app/dashboard',
//             profileName: user?.fullName ?? 'FSM Technician',
//             profileEmail: user?.email ?? 'technician@fsm.app',
//             employeeId: user?.id.toString() ?? 'EMP-001',
//             profileImageUrl: null,
//             onNavigate: (section) => _navigateToSection(context, section),
//             onLogout: () => _handleLogout(context),
//           ),
//
//           // ═══════════════════════════════════════════════════════════
//           // BODY - Main dashboard content
//           // ═══════════════════════════════════════════════════════════
//           body: Column(
//             children: [
//               // Offline/Sync Banner at top
//               const OfflineBanner(),
//
//               // Main content
//               Expanded(
//                 child: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
//                   builder: (context, state) {
//                     return RefreshIndicator(
//                       onRefresh: () async {
//                         context.read<WorkOrdersListBloc>().add(
//                               const WorkOrdersListEvent.refreshWorkOrders(),
//                             );
//                       },
//                       child: ListView(
//                         controller: _scrollController,
//                         children: [
//                           // Stats Cards
//                           _buildStatsGrid(state),
//
//                           // Current Work Order Card (for in-progress WO)
//                           _buildCurrentWorkOrderCard(state),
//
//                           // Filter Chips - 4 status filters
//                           _buildFilterChips(),
//
//                           // Current tab content
//                           _buildCurrentTabContent(state),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//           // ═══════════════════════════════════════════════════════════
//           // FLOATING ACTION BUTTON - AI Assistant
//           // ═══════════════════════════════════════════════════════════
//           floatingActionButton: FloatingActionButton.extended(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ChatbotPage(),
//                 ),
//               );
//             },
//             label: const Text('AI Assistant'),
//             icon: const Icon(Icons.smart_toy_outlined),
//           ),
//         );
//       },
//     );
//   }
//
//   // Build stats grid as regular widget
//   Widget _buildStatsGrid(WorkOrdersListState state) {
//     final statsData = _getStatsData(state);
//     final spacing = context.spacing;
//
//     return Padding(
//       padding: REdgeInsets.fromLTRB(
//         spacing.space4,
//         spacing.space1,
//         spacing.space4,
//         spacing.space2,
//       ),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: spacing.space3.w,
//           mainAxisSpacing: spacing.space3.h,
//           childAspectRatio: 2.2,
//         ),
//         itemCount: statsData.length,
//         itemBuilder: (context, index) {
//           final data = statsData[index];
//           return stats.StatsCard(
//             title: data.title,
//             count: data.count,
//             icon: data.icon,
//             color: data.color,
//             onTap: data.onTap,
//           );
//         },
//       ),
//     );
//   }
//
//   // Build Current Work Order Card (for in-progress work order)
//   Widget _buildCurrentWorkOrderCard(WorkOrdersListState state) {
//     return state.maybeWhen(
//       loaded: (workOrders,
//           unassignedWorkOrders,
//           unassignedCount,
//           currentPage,
//           hasReachedMax,
//           isLoadingMore,
//           statusFilter,
//           priorityFilter,
//           searchQuery,
//           isOffline,
//           hasPendingSync) {
//         // Find the current in-progress work order
//         final inProgressWorkOrders = workOrders
//             .where((wo) => wo.status == WorkOrderStatus.inProgress)
//             .toList();
//
//         // Only show if there's exactly 1 in-progress work order
//         if (inProgressWorkOrders.length == 1) {
//           final workOrder = inProgressWorkOrders.first;
//           return CurrentWorkOrderCard(
//             workOrder: workOrder,
//             onPause: workOrder.canBePaused
//                 ? () => _handleWorkOrderAction(context, workOrder, 'pause')
//                 : null,
//             onParts: () {
//               // TODO: Navigate to parts screen filtered for this WO
//               context.router
//                   .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//             },
//             onDocs: () {
//               // TODO: Navigate to documents screen filtered for this WO
//               context.router
//                   .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//             },
//             onComplete: workOrder.canBeCompleted
//                 ? () => _handleWorkOrderAction(context, workOrder, 'complete')
//                 : null,
//             onTap: () {
//               context.router
//                   .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//             },
//           );
//         }
//
//         // Hide card if no in-progress work order or multiple (edge case)
//         return const SizedBox.shrink();
//       },
//       orElse: () => const SizedBox.shrink(),
//     );
//   }
//
//   // Build filter chips section
//   Widget _buildFilterChips() {
//     return Container(
//       color: Theme.of(context).scaffoldBackgroundColor,
//       padding: REdgeInsets.symmetric(
//         horizontal: DesignTokens.space4,
//         vertical: DesignTokens.space2,
//       ),
//       child: FSMFilterChipGroup<String>(
//         options: [
//           FilterChipData(
//             value: 'unassigned',
//             label: 'Unassigned',
//             leadingIcon: Icons.inbox_outlined,
//           ),
//           FilterChipData(
//             value: 'assigned',
//             label: 'Assigned',
//             leadingIcon: Icons.assignment_outlined,
//           ),
//           FilterChipData(
//             value: 'paused',
//             label: 'Paused',
//             leadingIcon: Icons.pause_circle_outline,
//           ),
//           FilterChipData(
//             value: 'completed',
//             label: 'Completed',
//             leadingIcon: Icons.check_circle_outline,
//           ),
//         ],
//         selectedValues: [_selectedFilter],
//         onSelectionChanged: _onFilterChanged,
//         multiSelect: false,
//         showClearAll: false,
//         showFilterCount: false,
//         padding: EdgeInsets.zero,
//       ),
//     );
//   }
//
//   // Get stats data for each status - 2x2 grid (4 cards only)
//   List<stats.StatsCardData> _getStatsData(WorkOrdersListState state) {
//     return [
//       stats.StatsCardData(
//         title: 'Unassigned',
//         count: _getUnassignedCount(state),
//         icon: Icons.inbox_outlined,
//         color: Theme.of(context).colorScheme.onSurfaceVariant,
//         onTap: () => _switchToFilter('unassigned'),
//       ),
//       stats.StatsCardData(
//         title: 'Assigned',
//         count: _getCountForStatus(state, WorkOrderStatus.assigned),
//         icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.assigned),
//         color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.assigned),
//         onTap: () => _switchToFilter('assigned'),
//       ),
//       stats.StatsCardData(
//         title: 'Paused',
//         count: _getCountForStatus(state, WorkOrderStatus.paused),
//         icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.paused),
//         color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.paused),
//         onTap: () => _switchToFilter('paused'),
//       ),
//       stats.StatsCardData(
//         title: 'Completed',
//         count: _getCountForStatus(state, WorkOrderStatus.completed),
//         icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.completed),
//         color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.completed),
//         onTap: () => _switchToFilter('completed'),
//       ),
//     ];
//   }
//
//   // Build current filter content based on selected filter
//   Widget _buildCurrentTabContent(WorkOrdersListState state) {
//     // Map filter values to their respective build functions
//     switch (_selectedFilter) {
//       case 'unassigned':
//         return _buildUnassignedWorkOrders(state);
//       case 'assigned':
//         return _buildWorkOrders(WorkOrderStatus.assigned, state);
//       case 'paused':
//         return _buildWorkOrders(WorkOrderStatus.paused, state);
//       case 'completed':
//         return _buildWorkOrders(WorkOrderStatus.completed, state);
//       default:
//         return _buildWorkOrders(WorkOrderStatus.assigned, state);
//     }
//   }
//
//   // Switch to specific filter (frontend filtering only)
//   void _switchToFilter(String filter) {
//     setState(() {
//       _selectedFilter = filter;
//     });
//   }
//
//   Widget _buildWorkOrders(WorkOrderStatus status, WorkOrdersListState state) {
//     return state.when(
//       initial: () => _buildLoadingState(),
//       loading: () => _buildLoadingState(),
//       loaded: (workOrders,
//           unassignedWorkOrders,
//           unassignedCount,
//           currentPage,
//           hasReachedMax,
//           isLoadingMore,
//           statusFilter,
//           priorityFilter,
//           searchQuery,
//           isOffline,
//           hasPendingSync) {
//         // Filter work orders by current tab status
//         final filteredWorkOrders =
//             workOrders.where((wo) => wo.status == status).toList();
//
//         if (filteredWorkOrders.isEmpty) {
//           return _buildEmptyState(status);
//         }
//
//         return Column(
//           children: [
//             ...filteredWorkOrders.map((workOrder) => WorkOrderListCard(
//                   workOrder: workOrder,
//                   onTap: () {
//                     context.router
//                         .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//                   },
//                   onStart: () =>
//                       _handleWorkOrderAction(context, workOrder, 'start'),
//                   onPause: () =>
//                       _handleWorkOrderAction(context, workOrder, 'pause'),
//                   onResume: () =>
//                       _handleWorkOrderAction(context, workOrder, 'resume'),
//                   onComplete: () =>
//                       _handleWorkOrderAction(context, workOrder, 'complete'),
//                 )),
//             if (isLoadingMore)
//               Padding(
//                 padding: REdgeInsets.symmetric(vertical: 16),
//                 child: const Center(
//                   child: CircularProgressIndicator(
//                     color: Color(0xFF116587),
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//       error: (failure, workOrders, isOffline) => _buildErrorState(
//         message: failure.message,
//         isOffline: isOffline,
//       ),
//       syncing: (workOrders) => _buildLoadingState(isSync: true),
//     );
//   }
//
//   // Build empty state for work orders
//   Widget _buildEmptyState(WorkOrderStatus status) {
//     final emptyStateInfo = WorkOrderStatusHelper.getEmptyStateInfo(status);
//
//     return Container(
//       constraints: BoxConstraints(minHeight: 300.h),
//       child: FSMEmptyState(
//         icon: emptyStateInfo['icon'],
//         title: emptyStateInfo['title'],
//         description: emptyStateInfo['subtitle'],
//         iconColor: emptyStateInfo['color'],
//         actionLabel: 'Refresh',
//         onAction: () {
//           context.read<WorkOrdersListBloc>().add(
//                 const WorkOrdersListEvent.refreshWorkOrders(),
//               );
//         },
//       ),
//     );
//   }
//
//   // Build loading state
//   Widget _buildLoadingState({bool isSync = false}) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 300.h, maxHeight: 400.h),
//       child: Center(
//         child: Padding(
//           padding: REdgeInsets.symmetric(horizontal: 32, vertical: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: REdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       const Color(0xFF116587).withValues(alpha: 0.08),
//                       const Color(0xFF116587).withValues(alpha: 0.15),
//                     ],
//                   ),
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: const Color(0xFF116587).withValues(alpha: 0.2),
//                     width: 2,
//                   ),
//                 ),
//                 child: SizedBox(
//                   width: 32.w,
//                   height: 32.w,
//                   child: const CircularProgressIndicator(
//                     color: Color(0xFF116587),
//                     strokeWidth: 3,
//                   ),
//                 ),
//               ),
//               RSizedBox(height: 20),
//               Text(
//                 isSync ? 'Syncing Work Orders' : 'Loading Work Orders',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700,
//                   color: const Color(0xFF1A1A1A),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               RSizedBox(height: 8),
//               Text(
//                 isSync
//                     ? 'Please wait while we sync your latest work orders...'
//                     : 'Please wait while we fetch your work orders...',
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   color: Colors.grey[600],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Build error state
//   Widget _buildErrorState({required String message, required bool isOffline}) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 300.h),
//       child: FSMEmptyState(
//         icon: isOffline ? Icons.wifi_off : Icons.error_outline,
//         title: isOffline ? 'You\'re Offline' : 'Something Went Wrong',
//         description: message,
//         iconColor: isOffline
//             ? Theme.of(context).colorScheme.onSurfaceVariant
//             : Theme.of(context).colorScheme.error,
//         actionLabel: 'Retry',
//         onAction: () {
//           context.read<WorkOrdersListBloc>().add(
//                 const WorkOrdersListEvent.refreshWorkOrders(),
//               );
//         },
//       ),
//     );
//   }
//
//   String _getCountForStatus(WorkOrdersListState state, WorkOrderStatus status) {
//     return state.maybeWhen(
//       loaded: (workOrders, _, __, ___, ____, _____, ______, _______, ________,
//           _________, __________) {
//         return workOrders.where((wo) => wo.status == status).length.toString();
//       },
//       orElse: () => '-',
//     );
//   }
//
//   String _getUnassignedCount(WorkOrdersListState state) {
//     return state.maybeWhen(
//       loaded: (_, __, unassignedCount, ___, ____, _____, ______, _______,
//           ________, _________, __________) {
//         return unassignedCount.toString();
//       },
//       orElse: () => '-',
//     );
//   }
//
//   Widget _buildUnassignedWorkOrders(WorkOrdersListState state) {
//     return state.when(
//       initial: () => _buildLoadingState(),
//       loading: () => _buildLoadingState(),
//       loaded: (workOrders,
//           unassignedWorkOrders,
//           unassignedCount,
//           currentPage,
//           hasReachedMax,
//           isLoadingMore,
//           statusFilter,
//           priorityFilter,
//           searchQuery,
//           isOffline,
//           hasPendingSync) {
//         if (unassignedWorkOrders.isEmpty) {
//           return Container(
//             constraints: BoxConstraints(minHeight: 300.h),
//             child: FSMEmptyState(
//               icon: Icons.inbox_outlined,
//               title: 'No Unassigned Work Orders',
//               description:
//                   'All work orders have been assigned to field engineers.',
//               iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
//             ),
//           );
//         }
//
//         return Column(
//           children: unassignedWorkOrders.map((workOrder) {
//             final theme = Theme.of(context);
//             final spacing = context.spacing;
//
//             return Padding(
//               padding: REdgeInsets.symmetric(
//                 horizontal: DesignTokens.space4,
//                 vertical: DesignTokens.space3,
//               ),
//               child: Column(
//                 children: [
//                   CompactWorkOrderListCard(
//                     workOrder: workOrder,
//                     onTap: () {
//                       context.router.push(
//                           WorkOrderDetailsRoute(workOrderId: workOrder.id));
//                     },
//                   ),
//                   DesignTokens.verticalSpaceSmall,
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       onPressed: () => _assignWorkOrderToSelf(workOrder.id),
//                       icon:
//                           Icon(Icons.person_add, size: DesignTokens.iconSm.sp),
//                       label: Text('Assign to Me',
//                           style: theme.textTheme.labelLarge),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: theme.colorScheme.primary,
//                         foregroundColor: theme.colorScheme.onPrimary,
//                         padding: REdgeInsets.symmetric(
//                           horizontal: DesignTokens.space4,
//                           vertical: DesignTokens.space3,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(spacing.radiusSm.r),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         );
//       },
//       error: (failure, workOrders, isOffline) => _buildErrorState(
//         message: failure.message,
//         isOffline: isOffline,
//       ),
//       syncing: (workOrders) => _buildLoadingState(isSync: true),
//     );
//   }
//
//   void _assignWorkOrderToSelf(int workOrderId) {
//     // Capture the outer context that has access to the WorkOrdersListBloc
//     final outerContext = context;
//
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text('Assign Work Order'),
//         content: const Text(
//             'Are you sure you want to assign this work order to yourself?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(dialogContext).pop(),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop();
//               // Use the captured outer context instead
//               outerContext.read<WorkOrdersListBloc>().add(
//                     WorkOrdersListEvent.assignWorkOrderToSelf(
//                       workOrderId: workOrderId,
//                     ),
//                   );
//               // Switch to Assigned filter after assignment
//               _switchToFilter('assigned');
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Theme.of(context).colorScheme.primary,
//               foregroundColor: Theme.of(context).colorScheme.onPrimary,
//             ),
//             child: const Text('Assign'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showSearchDialog(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
//     // Capture the outer context that has access to the WorkOrdersListBloc
//     final outerContext = context;
//
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text('Search Work Orders'),
//         content: TextField(
//           controller: searchController,
//           decoration: const InputDecoration(
//             hintText: 'Enter work order number or description...',
//             prefixIcon: Icon(Icons.search),
//           ),
//           autofocus: true,
//           onSubmitted: (query) {
//             Navigator.of(dialogContext).pop();
//             if (query.isNotEmpty) {
//               outerContext.read<WorkOrdersListBloc>().add(
//                     WorkOrdersListEvent.searchWorkOrders(query),
//                   );
//             }
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(dialogContext).pop(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop();
//               final query = searchController.text.trim();
//               if (query.isNotEmpty) {
//                 outerContext.read<WorkOrdersListBloc>().add(
//                       WorkOrdersListEvent.searchWorkOrders(query),
//                     );
//               }
//             },
//             child: const Text('Search'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleWorkOrderAction(
//       BuildContext context, WorkOrderEntity workOrder, String action) {
//     // Navigate to work order details page where the actual action will be performed
//     // This ensures we have the WorkOrderActionBloc available and can capture GPS location
//     context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//
//     // Show a snackbar to inform the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//             Text('Navigate to work order details to $action the work order'),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   // ═══════════════════════════════════════════════════════════════════════
//   // NAVIGATION & DRAWER ACTION HELPERS
//   // ═══════════════════════════════════════════════════════════════════════
//
//   /// Navigate to drawer section using Auto Route extensions
//   void _navigateToSection(BuildContext context, String section) {
//     final router = context.router;
//     final drawerSection = _mapStringToDrawerSection(section);
//
//     if (drawerSection != null) {
//       router.navigateToDrawerSection(drawerSection);
//     }
//   }
//
//   /// Map section string to DrawerSection enum
//   DrawerSection? _mapStringToDrawerSection(String section) {
//     switch (section.toLowerCase()) {
//       case 'dashboard':
//         return DrawerSection.dashboard;
//       // case 'work_orders':
//       // case 'workOrders':
//       //   return DrawerSection.workOrders;
//       case 'calendar':
//         return DrawerSection.calendar;
//       case 'documents':
//         return DrawerSection.documents;
//       case 'parts':
//         return DrawerSection.parts;
//       case 'profile':
//         return DrawerSection.profile;
//       case 'settings':
//         return DrawerSection.settings;
//       case 'chat':
//         return DrawerSection.chat;
//       default:
//         return null;
//     }
//   }
//
//   /// Handle user logout
//   void _handleLogout(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: Text('Logout',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.titleMedium),
//         content: Text('Are you sure you want to logout?',
//             style: Theme.of(context).textTheme.bodyMedium),
//         actionsAlignment: MainAxisAlignment.center,
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(dialogContext).pop(),
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               backgroundColor: Theme.of(context).colorScheme.primary,
//               foregroundColor: Theme.of(context).colorScheme.onPrimary,
//             ),
//             child: const Text('Cancel'),
//           ),
//           //changed the button from elevated to textbutton
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop();
//               context.read<AuthBloc>().add(const AuthEvent.logout());
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               backgroundColor: Theme.of(context).colorScheme.error,
//               foregroundColor: Theme.of(context).colorScheme.onError,
//             ),
//             child: const Text('Logout'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleRefresh() {
//     // Trigger a refresh on the dashboard
//     context.read<WorkOrdersListBloc>().add(
//           const WorkOrdersListEvent.refreshWorkOrders(),
//         );
//   }
// }
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/spacing_theme.dart';
import '../../../../core/utils/work_order_status_helper.dart';
import '../../../../core/widgets/inputs/filter_chip_data.dart';
import '../../../../core/widgets/stats_card.dart' as stats;
import '../../../../core/widgets/widgets.dart'
    hide StatsGrid, StatsCard, StatsCardData; // Barrel import, hide duplicates
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../data/services/sync_events.dart' as sync_service;
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_orders_list/work_orders_list_bloc.dart';
import '../blocs/work_orders_list/work_orders_list_event.dart';
import '../blocs/work_orders_list/work_orders_list_state.dart';
import '../widgets/carousels/in_progress_work_order_carousel.dart';
import '../widgets/work_order_list_card.dart';

/// DashboardPage - Work Orders dashboard with tabs and statistics
///
/// Refactored to use shared components:
/// - [FSMActionButton.extended] for sync FAB
/// - [FSMEmptyState] for empty list states
/// - [OfflineBanner] for connectivity indicator
///
/// Maintains all existing functionality:
/// - Tab-based filtering (Unassigned, Assigned, In Progress, Paused, Completed)
/// - Stats grid display
/// - Pull-to-refresh
/// - Infinite scroll pagination
/// - Work order action sheets
/// - BLoC state management
@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Filter state - using String to match FilterChipData value type
  String _selectedFilter =
      'assigned'; // Default to 'assigned' (previously tab index 1)
  StreamSubscription<sync_service.SyncEvent>? _syncSubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load all work orders initially without status filter
    context.read<WorkOrdersListBloc>().add(
          const WorkOrdersListEvent.loadWorkOrders(
            page: 1,
          ),
        );
    _syncSubscription = sync_service.SyncEvents.instance.stream.listen((event) {
      if (event.type == sync_service.SyncEventType.syncCompleted) {
        debugPrint('🔄 Sync completed - refreshing dashboard');
        context.read<WorkOrdersListBloc>().add(
              const WorkOrdersListEvent.refreshWorkOrders(),
            );
        // Show success message to user
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  const Text(
                    'Changes synced successfully',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.black,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16),
              action: SnackBarAction(
                label: '✕',
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _syncSubscription?.cancel();
    super.dispose();
  }

  void _onFilterChanged(List<String> selectedFilters) {
    if (selectedFilters.isNotEmpty &&
        selectedFilters.first != _selectedFilter) {
      setState(() {
        _selectedFilter = selectedFilters.first;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<WorkOrdersListBloc>().add(
            const WorkOrdersListEvent.loadMoreWorkOrders(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        // Get user name from auth state
        final userName = authState.maybeWhen(
          authenticated: (user) => user.firstName,
          orElse: () => 'User',
        );
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: theme.colorScheme.surface,

          // ═══════════════════════════════════════════════════════════
          // APP BAR - Navigation style with hamburger menu
          // ═══════════════════════════════════════════════════════════
          appBar: FSMAppBar.navigation(
            title: 'Welcome, $userName',
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            onSearchTap: () => _showSearchDialog(context),
            onRefreshTap: _handleRefresh,
            showRefresh: true,
          ),

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/dashboard',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onLogout: () => _handleLogout(context),
          ),

          // ═══════════════════════════════════════════════════════════
          // BODY - Main dashboard content
          // ═══════════════════════════════════════════════════════════
          body: Column(
            children: [
              // Offline/Sync Banner at top
              const OfflineBanner(),

              // Main content
              Expanded(
                child: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
                  builder: (context, state) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<WorkOrdersListBloc>().add(
                              const WorkOrdersListEvent.refreshWorkOrders(),
                            );
                      },
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          // In-Progress Work Orders Carousel (above everything)
                          _buildInProgressCarousel(state),

                          // Stats Cards
                          _buildStatsGrid(state),

                          // Filter Chips - 4 status filters
                          _buildFilterChips(),

                          // Current tab content
                          _buildCurrentTabContent(state),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // ═══════════════════════════════════════════════════════════
          // FLOATING ACTION BUTTON - AI Assistant
          // ═══════════════════════════════════════════════════════════
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ChatbotPage(userName: userName),
              //   ),
              // );
              context.router.push(
                ChatbotRoute(userName: userName),
              );
            },
            label: const Text('AI Assistant'),
            icon: const Icon(Icons.smart_toy_outlined),
          ),
        );
      },
    );
  }

  // Build stats grid as regular widget
  Widget _buildStatsGrid(WorkOrdersListState state) {
    final statsData = _getStatsData(state);
    final spacing = context.spacing;

    return Padding(
      padding: REdgeInsets.fromLTRB(
        spacing.space4,
        spacing.space1,
        spacing.space4,
        spacing.space2,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: spacing.space3.w,
          mainAxisSpacing: spacing.space3.h,
          childAspectRatio: 2.2,
        ),
        itemCount: statsData.length,
        itemBuilder: (context, index) {
          final data = statsData[index];
          return stats.StatsCard(
            title: data.title,
            count: data.count,
            icon: data.icon,
            color: data.color,
            onTap: data.onTap,
          );
        },
      ),
    );
  }

  // Build In-Progress Work Orders Carousel
  Widget _buildInProgressCarousel(WorkOrdersListState state) {
    return state.maybeWhen(
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQuery,
          isOffline,
          hasPendingSync) {
        // Find all in-progress work orders
        final inProgressWorkOrders = workOrders
            .where((wo) => wo.status == WorkOrderStatus.inProgress)
            .toList();

        // Return carousel with all in-progress work orders
        return InProgressWorkOrderCarousel(
          workOrders: inProgressWorkOrders,
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  // Build filter chips section
  Widget _buildFilterChips() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: FSMFilterChipGroup<String>(
        options: [
          FilterChipData(
            value: 'unassigned',
            label: 'Unassigned',
            leadingIcon: Icons.inbox_outlined,
          ),
          FilterChipData(
            value: 'assigned',
            label: 'Assigned',
            leadingIcon: Icons.assignment_outlined,
          ),
          FilterChipData(
            value: 'paused',
            label: 'Paused',
            leadingIcon: Icons.pause_circle_outline,
          ),
          FilterChipData(
            value: 'completed',
            label: 'Completed',
            leadingIcon: Icons.check_circle_outline,
          ),
        ],
        selectedValues: [_selectedFilter],
        onSelectionChanged: _onFilterChanged,
        multiSelect: false,
        showClearAll: false,
        showFilterCount: false,
        padding: EdgeInsets.zero,
      ),
    );
  }

  // Get stats data for each status - 2x2 grid (4 cards only)
  List<stats.StatsCardData> _getStatsData(WorkOrdersListState state) {
    return [
      stats.StatsCardData(
        title: 'Unassigned',
        count: _getUnassignedCount(state),
        icon: Icons.inbox_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: () => _switchToFilter('unassigned'),
      ),
      stats.StatsCardData(
        title: 'Assigned',
        count: _getCountForStatus(state, WorkOrderStatus.assigned),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.assigned),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.assigned),
        onTap: () => _switchToFilter('assigned'),
      ),
      stats.StatsCardData(
        title: 'Paused',
        count: _getCountForStatus(state, WorkOrderStatus.paused),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.paused),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.paused),
        onTap: () => _switchToFilter('paused'),
      ),
      stats.StatsCardData(
        title: 'Completed',
        count: _getCountForStatus(state, WorkOrderStatus.completed),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.completed),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.completed),
        onTap: () => _switchToFilter('completed'),
      ),
    ];
  }

  // Build current filter content based on selected filter
  Widget _buildCurrentTabContent(WorkOrdersListState state) {
    // Map filter values to their respective build functions
    switch (_selectedFilter) {
      case 'unassigned':
        return _buildUnassignedWorkOrders(state);
      case 'assigned':
        return _buildWorkOrders(WorkOrderStatus.assigned, state);
      case 'paused':
        return _buildWorkOrders(WorkOrderStatus.paused, state);
      case 'completed':
        return _buildWorkOrders(WorkOrderStatus.completed, state);
      default:
        return _buildWorkOrders(WorkOrderStatus.assigned, state);
    }
  }

  // Switch to specific filter (frontend filtering only)
  void _switchToFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  Widget _buildWorkOrders(WorkOrderStatus status, WorkOrdersListState state) {
    return state.when(
      initial: () => _buildLoadingState(),
      loading: () => _buildLoadingState(),
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQuery,
          isOffline,
          hasPendingSync) {
        // Filter work orders by current tab status
        final filteredWorkOrders =
            workOrders.where((wo) => wo.status == status).toList();

        if (filteredWorkOrders.isEmpty) {
          return _buildEmptyState(status);
        }

        return Column(
          children: [
            ...filteredWorkOrders.map((workOrder) => WorkOrderListCard(
                  workOrder: workOrder,
                  onTap: () {
                    context.router
                        .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
                  },
                  onStart: () =>
                      _handleWorkOrderAction(context, workOrder, 'start'),
                  onPause: () =>
                      _handleWorkOrderAction(context, workOrder, 'pause'),
                  onResume: () =>
                      _handleWorkOrderAction(context, workOrder, 'resume'),
                  onComplete: () =>
                      _handleWorkOrderAction(context, workOrder, 'complete'),
                )),
            if (isLoadingMore)
              Padding(
                padding: REdgeInsets.symmetric(vertical: 16),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF116587),
                  ),
                ),
              ),
          ],
        );
      },
      error: (failure, workOrders, isOffline) => _buildErrorState(
        message: failure.message,
        isOffline: isOffline,
      ),
      syncing: (workOrders) => _buildLoadingState(isSync: true),
    );
  }

  // Build empty state for work orders
  Widget _buildEmptyState(WorkOrderStatus status) {
    final emptyStateInfo = WorkOrderStatusHelper.getEmptyStateInfo(status);

    return Container(
      constraints: BoxConstraints(minHeight: 300.h),
      child: FSMEmptyState(
        icon: emptyStateInfo['icon'],
        title: emptyStateInfo['title'],
        description: emptyStateInfo['subtitle'],
        iconColor: emptyStateInfo['color'],
        actionLabel: 'Refresh',
        onAction: () {
          context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.refreshWorkOrders(),
              );
        },
      ),
    );
  }

  // Build loading state
  Widget _buildLoadingState({bool isSync = false}) {
    return Container(
      constraints: BoxConstraints(minHeight: 300.h, maxHeight: 400.h),
      child: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: REdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF116587).withValues(alpha: 0.08),
                      const Color(0xFF116587).withValues(alpha: 0.15),
                    ],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF116587).withValues(alpha: 0.2),
                    width: 2,
                  ),
                ),
                child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: const CircularProgressIndicator(
                    color: Color(0xFF116587),
                    strokeWidth: 3,
                  ),
                ),
              ),
              RSizedBox(height: 20),
              Text(
                isSync ? 'Syncing Work Orders' : 'Loading Work Orders',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1A1A),
                ),
                textAlign: TextAlign.center,
              ),
              RSizedBox(height: 8),
              Text(
                isSync
                    ? 'Please wait while we sync your latest work orders...'
                    : 'Please wait while we fetch your work orders...',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build error state
  Widget _buildErrorState({required String message, required bool isOffline}) {
    return Container(
      constraints: BoxConstraints(minHeight: 300.h),
      child: FSMEmptyState(
        icon: isOffline ? Icons.wifi_off : Icons.error_outline,
        title: isOffline ? 'You\'re Offline' : 'Something Went Wrong',
        description: message,
        iconColor: isOffline
            ? Theme.of(context).colorScheme.onSurfaceVariant
            : Theme.of(context).colorScheme.error,
        actionLabel: 'Retry',
        onAction: () {
          context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.refreshWorkOrders(),
              );
        },
      ),
    );
  }

  String _getCountForStatus(WorkOrdersListState state, WorkOrderStatus status) {
    return state.maybeWhen(
      loaded: (workOrders, _, __, ___, ____, _____, ______, _______, ________,
          _________, __________) {
        return workOrders.where((wo) => wo.status == status).length.toString();
      },
      orElse: () => '-',
    );
  }

  String _getUnassignedCount(WorkOrdersListState state) {
    return state.maybeWhen(
      loaded: (_, __, unassignedCount, ___, ____, _____, ______, _______,
          ________, _________, __________) {
        return unassignedCount.toString();
      },
      orElse: () => '-',
    );
  }

  Widget _buildUnassignedWorkOrders(WorkOrdersListState state) {
    return state.when(
      initial: () => _buildLoadingState(),
      loading: () => _buildLoadingState(),
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQuery,
          isOffline,
          hasPendingSync) {
        if (unassignedWorkOrders.isEmpty) {
          return Container(
            constraints: BoxConstraints(minHeight: 300.h),
            child: FSMEmptyState(
              icon: Icons.inbox_outlined,
              title: 'No Unassigned Work Orders',
              description:
                  'All work orders have been assigned to field engineers.',
              iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          );
        }

        return Column(
          children: unassignedWorkOrders.map((workOrder) {
            final theme = Theme.of(context);
            final spacing = context.spacing;

            return Padding(
              padding: REdgeInsets.symmetric(
                horizontal: DesignTokens.space4,
                vertical: DesignTokens.space3,
              ),
              child: Column(
                children: [
                  CompactWorkOrderListCard(
                    workOrder: workOrder,
                    onTap: () {
                      context.router.push(
                          WorkOrderDetailsRoute(workOrderId: workOrder.id));
                    },
                  ),
                  DesignTokens.verticalSpaceSmall,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _assignWorkOrderToSelf(workOrder.id),
                      icon: Icon(
                        Icons.person_add,
                        size: DesignTokens.iconSm.sp,
                      ),
                      label: Text(
                        'Assign to Me',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: REdgeInsets.symmetric(
                          horizontal: DesignTokens.space4,
                          vertical: DesignTokens.space3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(spacing.radiusSm.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
      error: (failure, workOrders, isOffline) => _buildErrorState(
        message: failure.message,
        isOffline: isOffline,
      ),
      syncing: (workOrders) => _buildLoadingState(isSync: true),
    );
  }

  void _assignWorkOrderToSelf(int workOrderId) {
    // Capture the outer context that has access to the WorkOrdersListBloc
    final outerContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(
          'Assign Work Order',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        content: const Text(
          'Are you sure you want to assign this work order to yourself?',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              // Use the captured outer context instead
              outerContext.read<WorkOrdersListBloc>().add(
                    WorkOrdersListEvent.assignWorkOrderToSelf(
                      workOrderId: workOrderId,
                    ),
                  );
              // Switch to Assigned filter after assignment
              _switchToFilter('assigned');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text('Assign'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    // Capture the outer context that has access to the WorkOrdersListBloc
    final outerContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Search Work Orders'),
        content: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Enter work order number or description...',
            prefixIcon: Icon(Icons.search),
          ),
          autofocus: true,
          onSubmitted: (query) {
            Navigator.of(dialogContext).pop();
            if (query.isNotEmpty) {
              outerContext.read<WorkOrdersListBloc>().add(
                    WorkOrdersListEvent.searchWorkOrders(query),
                  );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              final query = searchController.text.trim();
              if (query.isNotEmpty) {
                outerContext.read<WorkOrdersListBloc>().add(
                      WorkOrdersListEvent.searchWorkOrders(query),
                    );
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _handleWorkOrderAction(
      BuildContext context, WorkOrderEntity workOrder, String action) {
    // Navigate to work order details page where the actual action will be performed
    // This ensures we have the WorkOrderActionBloc available and can capture GPS location
    context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));

    // Show a snackbar to inform the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Navigate to work order details to $action the work order'),
        duration: const Duration(seconds: 2),
      ),
    );
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
      // case 'work_orders':
      // case 'workOrders':
      //   return DrawerSection.workOrders;
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

  /// Handle user logout
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Logout',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium),
        content: Text('Are you sure you want to logout?',
            style: Theme.of(context).textTheme.bodyMedium),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text('Cancel'),
          ),
          //changed the button from elevated to textbutton
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _handleRefresh() {
    // Trigger a refresh on the dashboard
    context.read<WorkOrdersListBloc>().add(
          const WorkOrdersListEvent.refreshWorkOrders(),
        );
  }
}
