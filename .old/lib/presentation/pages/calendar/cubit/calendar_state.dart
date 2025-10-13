part of 'calendar_cubit.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarSuccess extends CalendarState {
  final List<WorkOrderEntity> workOrders;

  const CalendarSuccess({required this.workOrders});

  @override
  List<Object> get props => [workOrders];
}

class CalendarFailure extends CalendarState {
  final String error;

  const CalendarFailure({required this.error});

  @override
  List<Object> get props => [error];
}
