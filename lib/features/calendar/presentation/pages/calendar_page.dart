// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:fsm/core/widgets/states/fsm_empty_state.dart';
// import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
// import '../../../auth/presentation/blocs/auth/auth_state.dart';
//
// /// CalendarPage - Coming Soon Placeholder (Redesign 2025)
// ///
// /// Displays a "Coming Soon" message for the calendar feature.
// /// The calendar feature is planned for a future release.
// ///
// /// Features:
// /// - Simple FSMAppBar with "Calendar" title
// /// - FSMEmptyState with calendar icon
// /// - "Coming Soon" title and description
// /// - Clean, minimal design
// @RoutePage()
// class CalendarPage extends StatelessWidget {
//   const CalendarPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, authState) {
//         return Scaffold(
//           appBar: FSMAppBar.gradient(
//             title: 'Calendar',
//             actions: [
//               FSMAppBarAction.search(
//                 onPressed: () {
//                   // TODO: Implement search navigation when SearchRoute is available
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Search coming soon')),
//                   );
//                 },
//               ),
//             ],
//           ),
//           body: const FSMEmptyState(
//             icon: Icons.calendar_today,
//             title: 'Coming Soon',
//             description: 'Calendar feature is currently under development. '
//                 'This feature will be available in a future update.',
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    final now = DateTime.now();
  }

  @override
  void dispose() {
    _eventController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CalendarControllerProvider(
          controller: _eventController,
          child: Scaffold(
            appBar: FSMAppBar.gradient(
              title: 'Calendar',
              bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(
                    text: 'Month',
                  ),
                  Tab(text: 'Week'),
                  Tab(text: 'Day'),
                ],
              ),
              actions: [
                // FSMAppBarAction.search(
                //   onPressed: () {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('Search coming soon')),
                //     );
                //   },
                // ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text("Add Event"),
              icon: const Icon(Icons.add),
              onPressed: _addSampleEvent,
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                _MonthViewTab(),
                _WeekViewTab(),
                _DayViewTab(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addSampleEvent() {
    final now = DateTime.now();
    final event = CalendarEventData(
      title: "New Meeting",
      description: "Auto-generated test event",
      date: now,
      startTime: now.add(const Duration(hours: 2)),
      endTime: now.add(const Duration(hours: 3)),
    );

    _eventController.add(event);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('New event added')),
    );
  }
}

// ---------------- MONTH VIEW ----------------
class _MonthViewTab extends StatelessWidget {
  const _MonthViewTab();

  @override
  Widget build(BuildContext context) {
    return MonthView(
      onEventTap: (event, date) =>
          _showEventDialog(context, [event], date, "Month"),
      startDay: WeekDays.monday,
      headerStyle: const HeaderStyle(
        headerTextStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
      cellAspectRatio: 1.2,
      pageTransitionDuration: const Duration(milliseconds: 250),
    );
  }
}

// ---------------- WEEK VIEW ----------------
class _WeekViewTab extends StatelessWidget {
  const _WeekViewTab();

  @override
  Widget build(BuildContext context) {
    return WeekView(
      startDay: WeekDays.monday,
      showLiveTimeLineInAllDays: true,
      onEventTap: (events, date) =>
          _showEventDialog(context, events, date, "Week"),
    );
  }
}

// ---------------- DAY VIEW ----------------
class _DayViewTab extends StatelessWidget {
  const _DayViewTab();

  @override
  Widget build(BuildContext context) {
    return DayView(
      showLiveTimeLineInAllDays: true,
      onEventTap: (events, date) =>
          _showEventDialog(context, events, date, "Day"),
    );
  }
}

// ---------------- EVENT DIALOG ----------------
void _showEventDialog(
  BuildContext context,
  List<CalendarEventData> events,
  DateTime date,
  String viewType,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
          "$viewType Events — ${date.toLocal().toString().split(' ').first}"),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: ListView.separated(
          itemCount: events.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, i) {
            final e = events[i];
            return ListTile(
              title: Text(e.title ?? 'Untitled'),
              subtitle: Text(e.description ?? ''),
              trailing: Text(
                "${_fmt(e.startTime)} - ${_fmt(e.endTime)}",
                style: const TextStyle(
                    fontFeatures: [FontFeature.tabularFigures()]),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        ),
      ],
    ),
  );
}

String _fmt(DateTime? t) {
  if (t == null) return "--:--";
  final h = t.hour.toString().padLeft(2, '0');
  final m = t.minute.toString().padLeft(2, '0');
  return "$h:$m";
}
