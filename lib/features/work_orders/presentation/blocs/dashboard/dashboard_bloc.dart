import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_orders_usecase.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetWorkOrdersUseCase _getWorkOrdersUseCase;
  final IWorkOrderRepository _repository;
  final IAuthRepository _authRepository;
  final NetworkInfo _networkInfo;

  DashboardBloc(
    this._getWorkOrdersUseCase,
    this._repository,
    this._authRepository,
    this._networkInfo,
  ) : super(const DashboardState.initial()) {
    on<DashboardEvent>(_onDashboardEvent);
  }

  Future<void> _onDashboardEvent(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    await event.when(
      loadDashboard: () => _loadDashboard(emit),
      filterByStatus: (status) => _filterByStatus(status, emit),
      selectTab: (tabIndex) => _selectTab(tabIndex, emit),
      refreshDashboard: () => _refreshDashboard(emit),
      dismissOfflineBanner: () => _dismissOfflineBanner(emit),
      searchWorkOrders: (query) => _searchWorkOrders(query, emit),
      clearFilters: () => _clearFilters(emit),
      syncPendingWorkOrders: () => _syncPendingWorkOrders(emit),
      assignWorkOrderToSelf: (workOrderId) =>
          _assignWorkOrderToSelf(workOrderId, emit),
      startWorkOrder: (workOrderId) => _startWorkOrder(workOrderId, emit),
      pauseWorkOrder: (workOrderId) => _pauseWorkOrder(workOrderId, emit),
      resumeWorkOrder: (workOrderId) => _resumeWorkOrder(workOrderId, emit),
      completeWorkOrder: (workOrderId) => _completeWorkOrder(workOrderId, emit),
    );
  }

  Future<void> _loadDashboard(Emitter<DashboardState> emit) async {
    emit(const DashboardState.loading());

    final isConnected = await _networkInfo.isConnected;

    final result = await _getWorkOrdersUseCase(GetWorkOrdersParams(
      page: 1,
      limit: 50, // Load more for dashboard
    ));

    await result.fold(
      (failure) async {
        emit(DashboardState.error(
          failure: failure,
          isOffline: !isConnected,
        ));
      },
      (workOrdersData) async {
        final hasPendingSync = await _checkPendingSync();

        // Find current work order (in progress)
        final currentWorkOrder =
            workOrdersData.workOrders.cast<WorkOrderEntity?>().firstWhere(
                  (wo) => wo?.status == WorkOrderStatus.inProgress,
                  orElse: () => null,
                );

        // Calculate status counts
        final statusCounts = _calculateStatusCounts(
          workOrdersData.workOrders,
          workOrdersData.unassignedWorkOrders,
        );

        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrdersData.workOrders,
          unassignedWorkOrders: workOrdersData.unassignedWorkOrders,
          unassignedCount: statusCounts['unassigned']!,
          assignedCount: statusCounts['assigned']!,
          inProgressCount: statusCounts['inProgress']!,
          pausedCount: statusCounts['paused']!,
          completedCount: statusCounts['completed']!,
          filteredWorkOrders: workOrdersData.workOrders,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _filterByStatus(
      String status, Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        // Filter work orders by status
        final newFilteredWorkOrders = _filterWorkOrdersByStatus(
          [...unassignedWorkOrders, ...workOrders],
          status,
        );

        // Update selected tab based on status
        int newSelectedTab = 0;
        switch (status.toLowerCase()) {
          case 'unassigned':
            newSelectedTab = 0;
            break;
          case 'assigned':
            newSelectedTab = 1;
            break;
          case 'in_progress':
            newSelectedTab = 2;
            break;
          case 'paused':
            newSelectedTab = 3;
            break;
          case 'completed':
            newSelectedTab = 4;
            break;
        }

        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrders,
          unassignedWorkOrders: unassignedWorkOrders,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
          selectedTab: newSelectedTab,
          filteredWorkOrders: newFilteredWorkOrders,
          offlineBannerDismissed: offlineBannerDismissed,
          searchQuery: searchQuery,
          statusFilter: status,
          priorityFilter: priorityFilter,
          isOffline: isOffline,
          hasPendingSync: hasPendingSync,
          isLoadingMore: isLoadingMore,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
        ));
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _selectTab(int tabIndex, Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        // Map tab index to status
        String? status;
        switch (tabIndex) {
          case 0:
            status = 'unassigned';
            break;
          case 1:
            status = 'assigned';
            break;
          case 2:
            status = 'in_progress';
            break;
          case 3:
            status = 'paused';
            break;
          case 4:
            status = 'completed';
            break;
        }

        final newFilteredWorkOrders = status != null
            ? _filterWorkOrdersByStatus(
                [...unassignedWorkOrders, ...workOrders],
                status,
              )
            : [...unassignedWorkOrders, ...workOrders];

        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrders,
          unassignedWorkOrders: unassignedWorkOrders,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
          selectedTab: tabIndex,
          filteredWorkOrders: newFilteredWorkOrders,
          offlineBannerDismissed: offlineBannerDismissed,
          searchQuery: searchQuery,
          statusFilter: status,
          priorityFilter: priorityFilter,
          isOffline: isOffline,
          hasPendingSync: hasPendingSync,
          isLoadingMore: isLoadingMore,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
        ));
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _refreshDashboard(Emitter<DashboardState> emit) async {
    // Reload all dashboard data
    add(const DashboardEvent.loadDashboard());
  }

  Future<void> _dismissOfflineBanner(Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrders,
          unassignedWorkOrders: unassignedWorkOrders,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
          selectedTab: selectedTab,
          filteredWorkOrders: filteredWorkOrders,
          offlineBannerDismissed: true,
          searchQuery: searchQuery,
          statusFilter: statusFilter,
          priorityFilter: priorityFilter,
          isOffline: isOffline,
          hasPendingSync: hasPendingSync,
          isLoadingMore: isLoadingMore,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
        ));
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _searchWorkOrders(
      String query, Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        if (query.isEmpty) {
          // Clear search
          emit(DashboardState.loaded(
            currentWorkOrder: currentWorkOrder,
            workOrders: workOrders,
            unassignedWorkOrders: unassignedWorkOrders,
            unassignedCount: unassignedCount,
            assignedCount: assignedCount,
            inProgressCount: inProgressCount,
            pausedCount: pausedCount,
            completedCount: completedCount,
            selectedTab: selectedTab,
            filteredWorkOrders: [...unassignedWorkOrders, ...workOrders],
            offlineBannerDismissed: offlineBannerDismissed,
            searchQuery: null,
            statusFilter: statusFilter,
            priorityFilter: priorityFilter,
            isOffline: isOffline,
            hasPendingSync: hasPendingSync,
            isLoadingMore: isLoadingMore,
            hasReachedMax: hasReachedMax,
            currentPage: currentPage,
          ));
          return;
        }

        // Filter work orders by search query
        final allWorkOrders = [...unassignedWorkOrders, ...workOrders];
        final newFilteredWorkOrders = allWorkOrders.where((wo) {
          final searchLower = query.toLowerCase();
          return wo.woNumber.toLowerCase().contains(searchLower) ||
              wo.summary.toLowerCase().contains(searchLower) ||
              wo.problemDescription.toLowerCase().contains(searchLower) ||
              wo.location.toLowerCase().contains(searchLower);
        }).toList();

        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrders,
          unassignedWorkOrders: unassignedWorkOrders,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
          selectedTab: selectedTab,
          filteredWorkOrders: newFilteredWorkOrders,
          offlineBannerDismissed: offlineBannerDismissed,
          searchQuery: query,
          statusFilter: statusFilter,
          priorityFilter: priorityFilter,
          isOffline: isOffline,
          hasPendingSync: hasPendingSync,
          isLoadingMore: isLoadingMore,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
        ));
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _clearFilters(Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        emit(DashboardState.loaded(
          currentWorkOrder: currentWorkOrder,
          workOrders: workOrders,
          unassignedWorkOrders: unassignedWorkOrders,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
          selectedTab: 0,
          filteredWorkOrders: [...unassignedWorkOrders, ...workOrders],
          offlineBannerDismissed: offlineBannerDismissed,
          searchQuery: null,
          statusFilter: null,
          priorityFilter: null,
          isOffline: isOffline,
          hasPendingSync: hasPendingSync,
          isLoadingMore: isLoadingMore,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
        ));
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _syncPendingWorkOrders(Emitter<DashboardState> emit) async {
    state.maybeWhen(
      loaded: (currentWorkOrder,
          workOrders,
          unassignedWorkOrders,
          unassignedCount,
          assignedCount,
          inProgressCount,
          pausedCount,
          completedCount,
          selectedTab,
          filteredWorkOrders,
          offlineBannerDismissed,
          searchQuery,
          statusFilter,
          priorityFilter,
          isOffline,
          hasPendingSync,
          isLoadingMore,
          hasReachedMax,
          currentPage) {
        emit(DashboardState.syncing(
          workOrders: workOrders,
          currentWorkOrder: currentWorkOrder,
          unassignedCount: unassignedCount,
          assignedCount: assignedCount,
          inProgressCount: inProgressCount,
          pausedCount: pausedCount,
          completedCount: completedCount,
        ));

        _syncWorkOrders(emit);
      },
      orElse: () {}, // Do nothing if not in loaded state
    );
  }

  Future<void> _syncWorkOrders(Emitter<DashboardState> emit) async {

    final result = await _repository.syncPendingWorkOrders();

    result.fold(
      (failure) {
        emit(DashboardState.error(
          failure: failure,
          workOrders: state.maybeWhen(
            loaded: (_, workOrders, __, ___, ____, _____, ______, _______, ________, _________, __________, ___________, ____________, _____________, ______________, _______________, ________________, _________________, __________________) => workOrders,
            syncing: (workOrders, _, __, ___, ____, _____, ______) => workOrders,
            orElse: () => <WorkOrderEntity>[],
          ),
        ));
      },
      (syncedWorkOrders) {
        // Refresh dashboard after sync
        add(const DashboardEvent.loadDashboard());
      },
    );
  }

  Future<void> _assignWorkOrderToSelf(
      int workOrderId, Emitter<DashboardState> emit) async {
    // Get current user ID
    final userResult = await _authRepository.getCurrentUser();
    final userId = userResult.fold(
      (failure) {
        emit(DashboardState.error(
          failure: failure,
          workOrders: state.maybeWhen(
            loaded: (_,
                    workOrders,
                    __,
                    ___,
                    ____,
                    _____,
                    ______,
                    _______,
                    ________,
                    _________,
                    __________,
                    ___________,
                    ____________,
                    _____________,
                    ______________,
                    _______________,
                    ________________,
                    _________________,
                    __________________) =>
                workOrders,
            orElse: () => [],
          ),
        ));
        return null;
      },
      (user) => user.id,
    );

    if (userId == null) return;

    // Call repository to assign work order
    final result = await _repository.assignWorkOrder(
      workOrderId: workOrderId,
      technicianId: userId,
    );

    await result.fold(
      (failure) async {
        emit(DashboardState.error(
          failure: failure,
          workOrders: state.maybeWhen(
            loaded: (_,
                    workOrders,
                    __,
                    ___,
                    ____,
                    _____,
                    ______,
                    _______,
                    ________,
                    _________,
                    __________,
                    ___________,
                    ____________,
                    _____________,
                    ______________,
                    _______________,
                    ________________,
                    _________________,
                    __________________) =>
                workOrders,
            orElse: () => [],
          ),
        ));
      },
      (assignedWorkOrder) async {
        // Refresh dashboard to reflect changes
        add(const DashboardEvent.loadDashboard());
      },
    );
  }

  Future<void> _startWorkOrder(
      int workOrderId, Emitter<DashboardState> emit) async {
    // This would typically require GPS location capture
    // For now, we'll just refresh the dashboard
    // The actual implementation should be in work order details page
    add(const DashboardEvent.loadDashboard());
  }

  Future<void> _pauseWorkOrder(
      int workOrderId, Emitter<DashboardState> emit) async {
    // This would typically require GPS location capture
    // For now, we'll just refresh the dashboard
    // The actual implementation should be in work order details page
    add(const DashboardEvent.loadDashboard());
  }

  Future<void> _resumeWorkOrder(
      int workOrderId, Emitter<DashboardState> emit) async {
    // This would typically require GPS location capture
    // For now, we'll just refresh the dashboard
    // The actual implementation should be in work order details page
    add(const DashboardEvent.loadDashboard());
  }

  Future<void> _completeWorkOrder(
      int workOrderId, Emitter<DashboardState> emit) async {
    // This would typically require GPS location capture and completion form
    // For now, we'll just refresh the dashboard
    // The actual implementation should be in work order details page
    add(const DashboardEvent.loadDashboard());
  }

  // Helper methods
  Map<String, int> _calculateStatusCounts(
    List<WorkOrderEntity> workOrders,
    List<WorkOrderEntity> unassignedWorkOrders,
  ) {
    final counts = <String, int>{
      'unassigned': unassignedWorkOrders.length,
      'assigned': 0,
      'inProgress': 0,
      'paused': 0,
      'completed': 0,
    };

    for (final wo in workOrders) {
      switch (wo.status) {
        case WorkOrderStatus.assigned:
          counts['assigned'] = counts['assigned']! + 1;
          break;
        case WorkOrderStatus.inProgress:
          counts['inProgress'] = counts['inProgress']! + 1;
          break;
        case WorkOrderStatus.paused:
          counts['paused'] = counts['paused']! + 1;
          break;
        case WorkOrderStatus.completed:
          counts['completed'] = counts['completed']! + 1;
          break;
        default:
          break;
      }
    }

    return counts;
  }

  List<WorkOrderEntity> _filterWorkOrdersByStatus(
    List<WorkOrderEntity> workOrders,
    String status,
  ) {
    switch (status.toLowerCase()) {
      case 'unassigned':
        // This should be handled separately as unassigned WOs are in different list
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.created)
            .toList();
      case 'assigned':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.assigned)
            .toList();
      case 'in_progress':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.inProgress)
            .toList();
      case 'paused':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.paused)
            .toList();
      case 'completed':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.completed)
            .toList();
      default:
        return workOrders;
    }
  }

  Future<bool> _checkPendingSync() async {
    final result = await _repository.getCachedWorkOrders();
    return result.fold(
      (failure) => false,
      (workOrders) => workOrders.any((wo) =>
              // Check if any work order has pending sync
              false // For now, return false until Hive model sync is fully implemented
          ),
    );
  }
}

// Use the generated Freezed classes directly:
// - DashboardState.loaded() for loaded state
// - DashboardState.error() for error state  
// - DashboardState.syncing() for syncing state