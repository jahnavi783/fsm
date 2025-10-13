import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';

import '../../core/components/gradient_appbar_widget.dart';
import '../job_details/job_details_page.dart';
import '../work_order/work_order_bloc.dart';
import 'cubit/calendar_cubit.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit()..fetchAllWorkOrders(),
      child: const CalendarViewContent(),
    );
  }
}

class CalendarViewContent extends StatefulWidget {
  const CalendarViewContent({super.key});

  @override
  State<CalendarViewContent> createState() => _CalendarViewContentState();
}

class _CalendarViewContentState extends State<CalendarViewContent> {
  final EventController<WorkOrderEntity> _eventController =
      EventController<WorkOrderEntity>();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      appBar: GradientAppBar(
        title: const Text(
          "Calendar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: BlocConsumer<CalendarCubit, CalendarState>(
        listener: (context, state) {
          if (state is CalendarSuccess) {
            final events = <CalendarEventData<WorkOrderEntity>>[];
            final workOrders = state.workOrders;

            for (final workOrder in workOrders) {
              if (workOrder.visitDate != null) {
                final startTime = workOrder.visitDate!;
                final endTime =
                    startTime.add(Duration(minutes: workOrder.duration));

                events.add(CalendarEventData<WorkOrderEntity>(
                  title: workOrder.summary,
                  description: workOrder.problemDescription,
                  date: startTime,
                  startTime: startTime,
                  endTime: endTime,
                  event: workOrder,
                ));
              }
            }
            _eventController.removeWhere((_) => true);
            _eventController.addAll(events);
          } else if (state is CalendarFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to load work orders: ${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CalendarLoading && _eventController.allEvents.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CalendarFailure && _eventController.allEvents.isEmpty) {
            return Center(
                child: Text('Failed to load work orders: ${state.error}'));
          }

          return DayView<WorkOrderEntity>(
            controller: _eventController,
            showVerticalLine: true,
            showLiveTimeLineInAllDays: true,
            minDay: DateTime(1990),
            maxDay: DateTime(2050),
            initialDay: today,
            heightPerMinute: 3,
            emulateVerticalOffsetBy: 10,
            onEventTap: (eventList, date) {
              if (eventList.isNotEmpty) {
                final workOrder = eventList.first.event;
                if (workOrder != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => WorkOrderBloc(workOrder),
                        child: JobDetailsPage(),
                      ),
                    ),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
