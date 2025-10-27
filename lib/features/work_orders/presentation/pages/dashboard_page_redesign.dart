// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:fsm/core/blocs/connectivity/connectivity_bloc.dart';
// import 'package:fsm/core/blocs/connectivity/connectivity_state.dart';
// import 'package:fsm/core/router/app_router.gr.dart';
// import 'package:fsm/core/theme/app_dimensions.dart';
//
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:fsm/core/widgets/offline_banner.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';
// import '../widgets/current_wo_card.dart';
// import '../widgets/status_summary_grid.dart';
// import '../widgets/work_order_list_tabs.dart';
//
// /// DashboardPageRedesign - Redesigned dashboard with 2025 UI
// ///
// /// Features:
// /// - FSMAppBar.navigation with hamburger menu
// /// - OfflineBanner (conditional)
// /// - CurrentWOCard (shows active work order)
// /// - StatusSummaryGrid (2x2 status grid)
// /// - WorkOrderListTabs (tabbed work order list)
// /// - AIChatbotFAB (AI assistant FAB)
// ///
// /// Uses new redesigned components and maintains all existing functionality.
// @RoutePage()
// class DashboardPageRedesign extends StatefulWidget {
//   const DashboardPageRedesign({super.key});
//
//   @override
//   State<DashboardPageRedesign> createState() => _DashboardPageRedesignState();
// }
//
// class _DashboardPageRedesignState extends State<DashboardPageRedesign> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//
//     // Load all work orders initially
//     context.read<WorkOrdersListBloc>().add(
//           const WorkOrdersListEvent.loadWorkOrders(page: 1),
//         );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
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
//     return Scaffold(
//       // Simplified Navigation App Bar
//       appBar: FSMAppBar.navigation(
//         title: 'Dashboard',
//         onMenuTap: () => Scaffold.of(context).openDrawer(),
//         onSearchTap: () => _showSearchDialog(context),
//         onRefreshTap: () {
//           context.read<WorkOrdersListBloc>().add(
//                 const WorkOrdersListEvent.refreshWorkOrders(),
//               );
//         },
//         showRefresh:
//             context.select((ConnectivityBloc bloc) => bloc.state.maybeWhen(
//                   disconnected: () => true,
//                   orElse: () => false,
//                 )),
//       ),
//
//       // Main content
//       body: Column(
//         children: [
//           // Offline Banner (conditional)
//           const OfflineBanner(),
//
//           // Scrollable content
//           Expanded(
//             child: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
//               builder: (context, state) {
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     context.read<WorkOrdersListBloc>().add(
//                           const WorkOrdersListEvent.refreshWorkOrders(),
//                         );
//                   },
//                   child: state.when(
//                     initial: () => _buildLoadingState(),
//                     loading: () => _buildLoadingState(),
//                     loaded: (
//                       workOrders,
//                       unassignedWorkOrders,
//                       unassignedCount,
//                       currentPage,
//                       hasReachedMax,
//                       isLoadingMore,
//                       statusFilter,
//                       priorityFilter,
//                       searchQuery,
//                       isOffline,
//                       hasPendingSync,
//                     ) {
//                       return _buildLoadedContent(
//                         workOrders: workOrders,
//                         unassignedCount: unassignedCount,
//                       );
//                     },
//                     error: (failure, workOrders, isOffline) => _buildErrorState(
//                       message: failure.message,
//                       isOffline: isOffline,
//                     ),
//                     syncing: (workOrders) => _buildSyncingState(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//
//       // AI Chatbot FAB (replaces sync FAB) - Commented out until ChatbotRoute is implemented
//       // floatingActionButton: AIChatbotFAB(
//       //   onTap: () => context.router.push(const ChatbotRoute()),
//       //   scrollController: _scrollController,
//       // ),
//     );
//   }
//
//   Widget _buildLoadedContent({
//     required List<WorkOrderEntity> workOrders,
//     required int unassignedCount,
//   }) {
//     // Find current active work order (in progress)
//     final currentWorkOrder = workOrders.firstWhere(
//       (wo) =>
//           wo.status.toLowerCase() == 'in_progress' ||
//           wo.status.toLowerCase() == 'inprogress',
//       orElse: () => workOrders.firstOrNull ?? WorkOrderEntity.empty(),
//     );
//
//     // Calculate status counts
//     final statusCounts = _calculateStatusCounts(workOrders);
//
//     return ListView(
//       controller: _scrollController,
//       padding: EdgeInsets.only(bottom: AppDimensions.paddingLarge),
//       children: [
//         // Current Work Order Card (conditional)
//         if (currentWorkOrder.id != 0)
//           CurrentWOCard(
//             workOrder: currentWorkOrder,
//             onTap: () => context.router.push(
//               WorkOrderDetailsRoute(workOrderId: currentWorkOrder.id),
//             ),
//             onPause: () => _handleWorkOrderAction(currentWorkOrder, 'pause'),
//             onViewParts: () => context.router.push(
//               const PartsRoute(),
//             ),
//             onViewDocs: () => context.router.push(
//               const DocumentsRoute(),
//             ),
//             onComplete: () =>
//                 _handleWorkOrderAction(currentWorkOrder, 'complete'),
//           )
//         else
//           NoCurrentWOCard(
//             onBrowseWorkOrders: () {
//               // Scroll to work order list
//               _scrollController.animateTo(
//                 400,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//               );
//             },
//           ),
//
//         SizedBox(height: AppDimensions.paddingMedium),
//
//         // Status Summary Grid (2x2)
//         StatusSummaryGrid(
//           unassignedCount: unassignedCount,
//           assignedCount: statusCounts['assigned'] ?? 0,
//           pausedCount: statusCounts['paused'] ?? 0,
//           completedCount: statusCounts['completed'] ?? 0,
//           onStatusTap: (status) {
//             // Optional: Implement filter logic if needed
//             // For now, the tabs handle filtering
//           },
//         ),
//
//         SizedBox(height: AppDimensions.paddingMedium),
//
//         // Work Orders List with Tabs
//         SizedBox(
//           height: 600, // Fixed height for tab content
//           child: WorkOrderListTabs(
//             workOrders: workOrders,
//             onWorkOrderTap: (wo) => context.router.push(
//               WorkOrderDetailsRoute(workOrderId: wo.id),
//             ),
//             onStart: (wo) => _handleWorkOrderAction(wo, 'start'),
//             onPause: (wo) => _handleWorkOrderAction(wo, 'pause'),
//             onResume: (wo) => _handleWorkOrderAction(wo, 'resume'),
//             onComplete: (wo) => _handleWorkOrderAction(wo, 'complete'),
//             onRefresh: () async {
//               context.read<WorkOrdersListBloc>().add(
//                     const WorkOrdersListEvent.refreshWorkOrders(),
//                   );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLoadingState() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _buildErrorState({
//     required String message,
//     required bool isOffline,
//   }) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             isOffline ? Icons.wifi_off : Icons.error_outline,
//             size: 64,
//           ),
//           SizedBox(height: AppDimensions.paddingMedium),
//           Text(
//             isOffline ? 'You\'re Offline' : 'Error',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: AppDimensions.paddingSmall),
//           Text(
//             message,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 14),
//           ),
//           SizedBox(height: AppDimensions.paddingMedium),
//           ElevatedButton.icon(
//             onPressed: () {
//               context.read<WorkOrdersListBloc>().add(
//                     const WorkOrdersListEvent.refreshWorkOrders(),
//                   );
//             },
//             icon: const Icon(Icons.refresh),
//             label: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSyncingState() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(),
//           SizedBox(height: 16),
//           Text('Syncing...'),
//         ],
//       ),
//     );
//   }
//
//   Map<String, int> _calculateStatusCounts(List<WorkOrderEntity> workOrders) {
//     final counts = <String, int>{
//       'unassigned': 0,
//       'assigned': 0,
//       'in_progress': 0,
//       'paused': 0,
//       'completed': 0,
//     };
//
//     for (final wo in workOrders) {
//       final status = wo.status.toLowerCase().replaceAll(' ', '_');
//       counts[status] = (counts[status] ?? 0) + 1;
//     }
//
//     return counts;
//   }
//
//   void _handleWorkOrderAction(WorkOrderEntity workOrder, String action) {
//     // Navigate to work order details page where the actual action will be performed
//     // This ensures we have the WorkOrderActionBloc available and can capture GPS location
//     context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
//
//     // Show a snackbar to inform the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           'Navigate to work order details to $action the work order',
//         ),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   void _showSearchDialog(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
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
// }
