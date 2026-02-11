import 'package:auto_route/auto_route.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';

import '../../../../core/router/app_router.gr.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../work_orders/domain/entities/work_order_entity.dart';
import '../../../work_orders/domain/repositories/i_work_order_repository.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final EventController _eventController = EventController();
  late final IWorkOrderRepository _repo;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _repo = getIt<IWorkOrderRepository>();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final result = await _repo.getWorkOrders(page: 1, limit: 200);

    result.fold(
      (failure) => print("Calendar load failed: ${failure.message}"),
      (data) {
        // _eventController.removeAll();

        for (final wo in data.workOrders) {
          // Filter out completed/rejected
          if (wo.status == WorkOrderStatus.completed ||
              wo.status == WorkOrderStatus.rejected) continue;

          final date = wo.visitDate;

          final event = CalendarEventData(
            date: date,
            startTime: date,
            endTime: date.add(const Duration(hours: 1)),
            title: wo.woNumber,
            description: wo.problemDescription,
            color: Color(0xFF0C8B7E),
            event: wo,
          );

          _eventController.add(event);
        }

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CalendarControllerProvider(
          controller: _eventController,
          child: Scaffold(
            appBar: FSMAppBar.gradient(
              title: "Calendar",
              bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(text: "Week"),
                  Tab(text: "Day"),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                _WeekViewTab(),
                _DayViewTab(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WeekViewTab extends StatelessWidget {
  const _WeekViewTab();
  Widget _buildOutlookEventTile(
    DateTime date,
    List<CalendarEventData> events,
    Rect boundary,
    DateTime start,
    DateTime end,
  ) {
    final event = events.first;
    final wo = event.event as WorkOrderEntity;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: event.color ?? Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // STATUS LABEL (Outlook-style)
          Text(
            '${wo.status.displayName} Work Order',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WeekView(
      showLiveTimeLineInAllDays: false,
      heightPerMinute: 1.0,
      timeLineWidth: 60,
      startHour: 0,
      eventTileBuilder: _buildOutlookEventTile,
      endHour: 24,
      timeLineBuilder: (date) {
        // Removes duplicate hour text
        final hour = date.hour > 12 ? date.hour - 12 : date.hour;
        final suffix = date.hour >= 12 ? 'pm' : 'am';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('$hour $suffix',
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        );
      },
      onEventTap: (events, date) {
        final wo = events.first.event as WorkOrderEntity;
        context.router.push(WorkOrderDetailsRoute(workOrderId: wo.id));
      },
    );
  }
}

class _DayViewTab extends StatelessWidget {
  const _DayViewTab();

  @override
  Widget build(BuildContext context) {
    Widget _buildOutlookEventTile(
      DateTime date,
      List<CalendarEventData> events,
      Rect boundary,
      DateTime start,
      DateTime end,
    ) {
      final event = events.first;
      final wo = event.event as WorkOrderEntity;

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: event.color ?? Colors.blue,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // STATUS LABEL (Outlook-style)
            Text(
              '${wo.status.displayName} Work Order',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      );
    }

    return DayView(
      showVerticalLine: true,
      heightPerMinute: 1.0,
      startHour: 0,
      endHour: 24,
      eventTileBuilder: _buildOutlookEventTile,
      timeLineWidth: 60,
      timeLineBuilder: (date) {
        // Removes duplicate time labels
        final hour = date.hour > 12 ? date.hour - 12 : date.hour;
        // final hour = (date.hour % 12 == 0) ? 12 : (date.hour % 12);
        final suffix = date.hour >= 12 ? 'pm' : 'am';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('$hour $suffix',
              style: const TextStyle(fontSize: 12, color: Colors.black)),
        );
      },
      onEventTap: (events, date) {
        final wo = events.first.event as WorkOrderEntity;
        context.router.push(WorkOrderDetailsRoute(workOrderId: wo.id));
      },
    );
  }
}
