part of 'fsm_work_orders_cubit.dart';

sealed class FsmWorkOrdersState extends Equatable {
  const FsmWorkOrdersState();

  @override
  List<Object> get props => [];
}

final class FsmWorkOrderInitial extends FsmWorkOrdersState {}

final class FsmWorkOrdersLoading extends FsmWorkOrdersState {
  final WorkOrderStatus status;
  final bool isRefreshing;

  const FsmWorkOrdersLoading({required this.status, this.isRefreshing = false});

  @override
  List<Object> get props => [status, isRefreshing];
}

final class FsmWorkOrdersSuccess extends FsmWorkOrdersState {
  final Map<WorkOrderStatus, List<WorkOrderEntity>> workOrderMap;
  final WorkOrderStatus activeStatus;
  final int page;
  final int total;

  const FsmWorkOrdersSuccess(
      {required this.workOrderMap,
      required this.activeStatus,
      this.page = 1,
      required this.total});

  // Add copyWith method to easily update state
  FsmWorkOrdersSuccess copyWith({
    Map<WorkOrderStatus, List<WorkOrderEntity>>? workOrderMap,
    WorkOrderStatus? activeStatus,
    int? page,
    int? total,
  }) {
    return FsmWorkOrdersSuccess(
      workOrderMap: workOrderMap ?? this.workOrderMap,
      activeStatus: activeStatus ?? this.activeStatus,
      page: page ?? this.page,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [workOrderMap, activeStatus, page, total];
}

final class FsmWorkOrdersFailure extends FsmWorkOrdersState {
  final String error;
  final WorkOrderStatus status;

  const FsmWorkOrdersFailure({required this.error, required this.status});

  @override
  List<Object> get props => [error];
}
