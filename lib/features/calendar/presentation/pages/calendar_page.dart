import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/core/widgets/states/fsm_empty_state.dart';

/// CalendarPage - Coming Soon Placeholder (Redesign 2025)
///
/// Displays a "Coming Soon" message for the calendar feature.
/// The calendar feature is planned for a future release.
///
/// Features:
/// - Simple FSMAppBar with "Calendar" title
/// - FSMEmptyState with calendar icon
/// - "Coming Soon" title and description
/// - Clean, minimal design
@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FSMAppBar.navigation(
        title: 'Calendar',
        onMenuTap: () => Scaffold.of(context).openDrawer(),
        onSearchTap: () {
          // TODO: Implement search navigation when SearchRoute is available
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Search coming soon')),
          );
        },
      ),
      body: const FSMEmptyState(
        icon: Icons.calendar_today,
        title: 'Coming Soon',
        description: 'Calendar feature is currently under development. '
            'This feature will be available in a future update.',
      ),
    );
  }
}
