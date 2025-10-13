part of 'work_order_bloc.dart';

sealed class WorkOrderState {
  final WorkOrderEntity workOrder;
  const WorkOrderState({required this.workOrder});
}

final class WorkOrderLoadingState extends WorkOrderState {
  final String? message;
  const WorkOrderLoadingState({required super.workOrder, this.message});
}

final class WorkOrderAssignedState extends WorkOrderState {
  const WorkOrderAssignedState({required super.workOrder});
}

final class WorkOrderInProgressState extends WorkOrderState {
  const WorkOrderInProgressState({required super.workOrder});
}

final class WorkOrderPausedState extends WorkOrderState {
  const WorkOrderPausedState({required super.workOrder});
}

final class WorkOrderCompletedState extends WorkOrderState {
  const WorkOrderCompletedState({required super.workOrder});
}

final class WorkOrderRejectedState extends WorkOrderState {
  const WorkOrderRejectedState({required super.workOrder});
}

final class WorkOrderCancelledState extends WorkOrderState {
  const WorkOrderCancelledState({required super.workOrder});
}
