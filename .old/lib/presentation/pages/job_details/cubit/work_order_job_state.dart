part of 'work_order_job_cubit.dart';

sealed class WorkOrderJobState extends Equatable {
  const WorkOrderJobState();

  @override
  List<Object> get props => [];
}

final class WorkOrderJobInitial extends WorkOrderJobState {}

final class Loading extends WorkOrderJobState {}

final class StartJobSuccessState extends WorkOrderJobState {
  final String message;

  const StartJobSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

final class StartJobErrorState extends WorkOrderJobState {
  final String errorMessage;

  const StartJobErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class ViewWorkOrderLoadingState extends WorkOrderJobState {}

final class ViewWorkOrderSuccessState extends WorkOrderJobState {
  final WorkOrderEntity workDetailsModel;

  const ViewWorkOrderSuccessState({required this.workDetailsModel});

  @override
  List<Object> get props => [workDetailsModel];
}

final class ViewWorkOrderErrorState extends WorkOrderJobState {
  final String errorMessage;

  const ViewWorkOrderErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
