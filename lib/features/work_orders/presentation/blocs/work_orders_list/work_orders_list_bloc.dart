import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_orders_usecase.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'work_orders_list_event.dart';
import 'work_orders_list_state.dart';

@injectable
class WorkOrdersListBloc
    extends Bloc<WorkOrdersListEvent, WorkOrdersListState> {
  final GetWorkOrdersUseCase _getWorkOrdersUseCase;
  final IWorkOrderRepository _repository;
  final IAuthRepository _authRepository;
  final NetworkInfo _networkInfo;

  WorkOrdersListBloc(
    this._getWorkOrdersUseCase,
    this._repository,
    this._authRepository,
    this._networkInfo,
  ) : super(const WorkOrdersListState.initial()) {
    on<WorkOrdersListEvent>(_onWorkOrdersListEvent);
  }

  Future<void> _onWorkOrdersListEvent(
    WorkOrdersListEvent event,
    Emitter<WorkOrdersListState> emit,
  ) async {
    await event.when(
      loadWorkOrders: (page, limit, status, priority, searchQuery, isRefresh) =>
          _loadWorkOrders(
              page, limit, status, priority, searchQuery, isRefresh, emit),
      loadMoreWorkOrders: () => _loadMoreWorkOrders(emit),
      refreshWorkOrders: () => _refreshWorkOrders(emit),
      filterByStatus: (status) => _filterByStatus(status, emit),
      filterByPriority: (priority) => _filterByPriority(priority, emit),
      searchWorkOrders: (query) => _searchWorkOrders(query, emit),
      clearFilters: () => _clearFilters(emit),
      syncPendingWorkOrders: () => _syncPendingWorkOrders(emit),
      assignWorkOrderToSelf: (workOrderId) =>
          _assignWorkOrderToSelf(workOrderId, emit),
    );
  }

  Future<void> _loadWorkOrders(
    int page,
    int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
    bool isRefresh,
    Emitter<WorkOrdersListState> emit,
  ) async {
    if (isRefresh) {
      emit(const WorkOrdersListState.loading());
    } else {
      state.maybeWhen(
        loaded:
            (_, __, ___, ____, _____, ______, _______, ________, _________, __________, ___________) {},
        orElse: () => emit(const WorkOrdersListState.loading()),
      );
    }

    final isConnected = await _networkInfo.isConnected;

    final result = await _getWorkOrdersUseCase(GetWorkOrdersParams(
      page: page,
      limit: limit,
      status: status,
      priority: priority,
      searchQuery: searchQuery,
    ));

    await result.fold(
      (failure) async {
        final currentWorkOrders = state.maybeWhen(
          loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
                  ________, _________, __________) =>
              workOrders,
          orElse: () => <WorkOrderEntity>[],
        );
        emit(WorkOrdersListState.error(
          failure: failure,
          workOrders: currentWorkOrders,
          isOffline: !isConnected,
        ));
      },
      (workOrdersData) async {
        final hasPendingSync = await _checkPendingSync();
        emit(WorkOrdersListState.loaded(
          workOrders: workOrdersData.workOrders,
          unassignedWorkOrders: workOrdersData.unassignedWorkOrders,
          unassignedCount: workOrdersData.unassignedCount,
          currentPage: page,
          hasReachedMax: workOrdersData.workOrders.length < limit,
          statusFilter: status,
          priorityFilter: priority,
          searchQuery: searchQuery,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _loadMoreWorkOrders(Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    if (!currentState.maybeWhen(
      loaded: (_, __, ___, ____, hasReachedMax, isLoadingMore, ______,
              _______, ________, _________, __________) =>
          !hasReachedMax && !isLoadingMore,
      orElse: () => false,
    )) {
      return;
    }

    final nextPage = currentState.maybeWhen(
      loaded:
          (_, __, ___, currentPage, ____, _____, ______, _______, ________, _________, __________) =>
              currentPage + 1,
      orElse: () => 1,
    );

    // Update state to show loading more
    emit(currentState.maybeWhen(
      loaded: (workOrders, unassignedWorkOrders, unassignedCount, currentPage, hasReachedMax, _, statusFilter,
              priorityFilter, searchQuery, isOffline, hasPendingSync) =>
          WorkOrdersListState.loaded(
        workOrders: workOrders,
        unassignedWorkOrders: unassignedWorkOrders,
        unassignedCount: unassignedCount,
        currentPage: currentPage,
        hasReachedMax: hasReachedMax,
        isLoadingMore: true,
        statusFilter: statusFilter,
        priorityFilter: priorityFilter,
        searchQuery: searchQuery,
        isOffline: isOffline,
        hasPendingSync: hasPendingSync,
      ),
      orElse: () => currentState,
    ));

    final result = await _getWorkOrdersUseCase(GetWorkOrdersParams(
      page: nextPage,
      limit: 20,
      status: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, statusFilter, _______,
                ________, _________, __________) =>
            statusFilter,
        orElse: () => null,
      ),
      priority: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, _______, priorityFilter,
                ________, _________, __________) =>
            priorityFilter,
        orElse: () => null,
      ),
      searchQuery: currentState.maybeWhen(
        loaded:
            (_, __, ___, ____, _____, ______, _______, ________, searchQuery, _________, __________) =>
                searchQuery,
        orElse: () => null,
      ),
    ));

    result.fold(
      (failure) {
        emit(currentState.maybeWhen(
          loaded: (workOrders, unassignedWorkOrders, unassignedCount, currentPage, hasReachedMax, _, statusFilter,
                  priorityFilter, searchQuery, isOffline, hasPendingSync) =>
              WorkOrdersListState.loaded(
            workOrders: workOrders,
            unassignedWorkOrders: unassignedWorkOrders,
            unassignedCount: unassignedCount,
            currentPage: currentPage,
            hasReachedMax: hasReachedMax,
            isLoadingMore: false,
            statusFilter: statusFilter,
            priorityFilter: priorityFilter,
            searchQuery: searchQuery,
            isOffline: isOffline,
            hasPendingSync: hasPendingSync,
          ),
          orElse: () => currentState,
        ));
      },
      (workOrdersData) {
        final currentWorkOrders = currentState.maybeWhen(
          loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
                  ________, _________, __________) =>
              workOrders,
          orElse: () => <WorkOrderEntity>[],
        );
        final allWorkOrders = [...currentWorkOrders, ...workOrdersData.workOrders];

        emit(currentState.maybeWhen(
          loaded: (_, unassignedWorkOrders, unassignedCount, ____, _____, ______, statusFilter, priorityFilter, searchQuery,
                  isOffline, hasPendingSync) =>
              WorkOrdersListState.loaded(
            workOrders: allWorkOrders,
            unassignedWorkOrders: unassignedWorkOrders,
            unassignedCount: unassignedCount,
            currentPage: nextPage,
            hasReachedMax: workOrdersData.workOrders.length < 20,
            isLoadingMore: false,
            statusFilter: statusFilter,
            priorityFilter: priorityFilter,
            searchQuery: searchQuery,
            isOffline: isOffline,
            hasPendingSync: hasPendingSync,
          ),
          orElse: () => currentState,
        ));
      },
    );
  }

  Future<void> _refreshWorkOrders(Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    add(WorkOrdersListEvent.loadWorkOrders(
      page: 1,
      status: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, statusFilter, _______,
                ________, _________, __________) =>
            statusFilter,
        orElse: () => null,
      ),
      priority: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, _______, priorityFilter,
                ________, _________, __________) =>
            priorityFilter,
        orElse: () => null,
      ),
      searchQuery: currentState.maybeWhen(
        loaded:
            (_, __, ___, ____, _____, ______, _______, ________, searchQuery, _________, __________) =>
                searchQuery,
        orElse: () => null,
      ),
      isRefresh: true,
    ));
  }

  Future<void> _filterByStatus(
      WorkOrderStatus? status, Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    add(WorkOrdersListEvent.loadWorkOrders(
      page: 1,
      status: status,
      priority: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, _______, priorityFilter,
                ________, _________, __________) =>
            priorityFilter,
        orElse: () => null,
      ),
      searchQuery: currentState.maybeWhen(
        loaded:
            (_, __, ___, ____, _____, ______, _______, ________, searchQuery, _________, __________) =>
                searchQuery,
        orElse: () => null,
      ),
      isRefresh: true,
    ));
  }

  Future<void> _filterByPriority(
      WorkOrderPriority? priority, Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    add(WorkOrdersListEvent.loadWorkOrders(
      page: 1,
      status: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, statusFilter, _______,
                ________, _________, __________) =>
            statusFilter,
        orElse: () => null,
      ),
      priority: priority,
      searchQuery: currentState.maybeWhen(
        loaded:
            (_, __, ___, ____, _____, ______, _______, ________, searchQuery, _________, __________) =>
                searchQuery,
        orElse: () => null,
      ),
      isRefresh: true,
    ));
  }

  Future<void> _searchWorkOrders(
      String query, Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    add(WorkOrdersListEvent.loadWorkOrders(
      page: 1,
      status: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, statusFilter, _______,
                ________, _________, __________) =>
            statusFilter,
        orElse: () => null,
      ),
      priority: currentState.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, _______, priorityFilter,
                ________, _________, __________) =>
            priorityFilter,
        orElse: () => null,
      ),
      searchQuery: query.isEmpty ? null : query,
      isRefresh: true,
    ));
  }

  Future<void> _clearFilters(Emitter<WorkOrdersListState> emit) async {
    add(const WorkOrdersListEvent.loadWorkOrders(
      page: 1,
      isRefresh: true,
    ));
  }

  Future<void> _syncPendingWorkOrders(Emitter<WorkOrdersListState> emit) async {
    final currentState = state;
    final currentWorkOrders = currentState.maybeWhen(
      loaded:
          (workOrders, _, __, ___, ____, _____, ______, _______, ________, _________, __________) =>
              workOrders,
      orElse: () => <WorkOrderEntity>[],
    );

    emit(WorkOrdersListState.syncing(workOrders: currentWorkOrders));

    final result = await _repository.syncPendingWorkOrders();

    result.fold(
      (failure) {
        emit(WorkOrdersListState.error(
          failure: failure,
          workOrders: currentWorkOrders,
        ));
      },
      (syncedWorkOrders) {
        // Refresh the work orders list after sync
        add(const WorkOrdersListEvent.refreshWorkOrders());
      },
    );
  }

  Future<void> _assignWorkOrderToSelf(
    int workOrderId,
    Emitter<WorkOrdersListState> emit,
  ) async {
    // Get current user ID
    final userResult = await _authRepository.getCurrentUser();
    final userId = userResult.fold(
      (failure) {
        emit(WorkOrdersListState.error(
          failure: failure,
          workOrders: state.maybeWhen(
            loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
                    ________, _________, __________) =>
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
        emit(WorkOrdersListState.error(
          failure: failure,
          workOrders: state.maybeWhen(
            loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
                    ________, _________, __________) =>
                workOrders,
            orElse: () => [],
          ),
        ));
      },
      (assignedWorkOrder) async {
        // Remove from unassigned list and refresh
        state.maybeWhen(
          loaded: (workOrders, unassignedWorkOrders, unassignedCount,
              currentPage, hasReachedMax, isLoadingMore, statusFilter,
              priorityFilter, searchQuery, isOffline, hasPendingSync) {
            // Remove the work order from unassigned list
            final updatedUnassigned = unassignedWorkOrders
                .where((wo) => wo.id != workOrderId)
                .toList();

            // Add to assigned work orders list
            final updatedWorkOrders = [assignedWorkOrder, ...workOrders];

            emit(WorkOrdersListState.loaded(
              workOrders: updatedWorkOrders,
              unassignedWorkOrders: updatedUnassigned,
              unassignedCount: updatedUnassigned.length,
              currentPage: currentPage,
              hasReachedMax: hasReachedMax,
              isLoadingMore: isLoadingMore,
              statusFilter: statusFilter,
              priorityFilter: priorityFilter,
              searchQuery: searchQuery,
              isOffline: isOffline,
              hasPendingSync: hasPendingSync,
            ));
          },
          orElse: () {},
        );
      },
    );
  }

  Future<bool> _checkPendingSync() async {
    final result = await _repository.getCachedWorkOrders();
    return result.fold(
      (failure) => false,
      (workOrders) => workOrders.any((wo) =>
              // Check if any work order has pending sync based on Hive model
              // This would be implemented in the repository to check isPendingSync flag
              false // For now, return false until Hive model sync is fully implemented
          ),
    );
  }
}
