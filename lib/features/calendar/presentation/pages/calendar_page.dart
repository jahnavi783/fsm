import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/services/location_service.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_event.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_state.dart';
import 'package:fsm/features/calendar/presentation/widgets/calendar_view_widget.dart';
import 'package:fsm/features/calendar/presentation/widgets/calendar_view_switcher.dart';
import 'package:fsm/features/calendar/presentation/widgets/date_navigation.dart';
import 'package:fsm/features/calendar/presentation/widgets/event_card.dart';
import 'package:fsm/features/calendar/presentation/widgets/route_optimization_display.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final LocationService _locationService = getIt<LocationService>();
  CalendarEventType? _selectedTypeFilter;
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load initial calendar data for current month
    final now = DateTime.now();
    context.read<CalendarBloc>().add(
          CalendarEvent.loadMonthlySchedule(month: now, isRefresh: true),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FSMAppBar.gradient(
        title: 'Calendar',
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'refresh':
                  context.read<CalendarBloc>().add(
                        const CalendarEvent.refreshEvents(),
                      );
                  break;
                case 'sync':
                  context.read<CalendarBloc>().add(
                        const CalendarEvent.syncPendingChanges(),
                      );
                  break;
                case 'optimize_route':
                  _optimizeRoute();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'refresh',
                child: Row(
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(width: 8),
                    Text('Refresh'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'sync',
                child: Row(
                  children: [
                    Icon(Icons.sync),
                    SizedBox(width: 8),
                    Text('Sync Changes'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'optimize_route',
                child: Row(
                  children: [
                    Icon(Icons.route),
                    SizedBox(width: 8),
                    Text('Optimize Route'),
                  ],
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.calendar_view_month),
              text: 'Calendar',
            ),
            Tab(
              icon: Icon(Icons.route),
              text: 'Route',
            ),
          ],
        ),
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          return Column(
            children: [
              // View switcher and date navigation
              state.maybeWhen(
                loaded: (events,
                    currentDate,
                    viewType,
                    typeFilter,
                    searchQuery,
                    isOffline,
                    hasPendingSync,
                    optimizedRoute,
                    conflictingEvents) {
                  return Column(
                    children: [
                      // Offline indicator
                      if (isOffline) ...[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          color: Colors.orange.withValues(alpha: 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_off,
                                size: 16.sp,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'You are offline',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Pending sync indicator
                      if (hasPendingSync) ...[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          color: Colors.blue.withValues(alpha: 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sync_problem,
                                size: 16.sp,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Changes pending sync',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Calendar view switcher
                      CalendarViewSwitcher(
                        currentViewType: viewType,
                        onViewChanged: (newViewType) {
                          context.read<CalendarBloc>().add(
                                CalendarEvent.changeView(newViewType),
                              );
                        },
                      ),

                      // Date navigation
                      DateNavigation(
                        currentDate: currentDate,
                        viewType: viewType,
                        onDateChanged: (date) {
                          context.read<CalendarBloc>().add(
                                CalendarEvent.navigateToDate(date),
                              );
                        },
                        onTodayTap: () {
                          context.read<CalendarBloc>().add(
                                CalendarEvent.navigateToDate(DateTime.now()),
                              );
                        },
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),

              // Main content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCalendarView(state),
                    _buildRouteView(state),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateEventDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCalendarView(CalendarState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (events, currentDate, viewType, typeFilter, searchQuery,
          isOffline, hasPendingSync, optimizedRoute, conflictingEvents) {
        // Filter events based on current filters
        var filteredEvents = events;
        if (_selectedTypeFilter != null) {
          filteredEvents = events
              .where((event) => event.type == _selectedTypeFilter)
              .toList();
        }
        if (_searchQuery != null && _searchQuery!.isNotEmpty) {
          filteredEvents = filteredEvents
              .where((event) =>
                  event.title
                      .toLowerCase()
                      .contains(_searchQuery!.toLowerCase()) ||
                  event.description
                      .toLowerCase()
                      .contains(_searchQuery!.toLowerCase()))
              .toList();
        }

        return Column(
          children: [
            // Calendar view
            Expanded(
              flex: 3,
              child: CalendarViewWidget(
                events: filteredEvents,
                viewType: viewType,
                currentDate: currentDate,
                onEventTap: (event) => _showEventDetails(context, event),
                onDateTap: (date) {
                  context.read<CalendarBloc>().add(
                        CalendarEvent.navigateToDate(date),
                      );
                },
                onDateRangeSelected: (start, end) {
                  context.read<CalendarBloc>().add(
                        CalendarEvent.loadEvents(
                          startDate: start,
                          endDate: end,
                          isRefresh: true,
                        ),
                      );
                },
              ),
            ),

            // Events list for selected date
            if (viewType == CalendarViewType.day) ...[
              Container(
                height: 1.h,
                color: Colors.grey.withValues(alpha: 0.3),
              ),
              Expanded(
                flex: 2,
                child: _buildDayEventsList(filteredEvents, currentDate),
              ),
            ],
          ],
        );
      },
      error: (failure, events, currentDate, viewType, isOffline) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isOffline ? Icons.wifi_off : Icons.error_outline,
              size: 64.sp,
              color: Colors.red,
            ),
            SizedBox(height: 16.h),
            Text(
              isOffline ? 'You are offline' : 'Error loading calendar',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              failure.message,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                context.read<CalendarBloc>().add(
                      const CalendarEvent.refreshEvents(),
                    );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      syncing: (events, currentDate, viewType) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Syncing calendar changes...'),
          ],
        ),
      ),
      eventCreated: (event, events, currentDate, viewType) =>
          _buildCalendarView(CalendarState.loaded(
        events: events,
        currentDate: currentDate,
        viewType: viewType,
      )),
      eventUpdated: (event, events, currentDate, viewType) =>
          _buildCalendarView(CalendarState.loaded(
        events: events,
        currentDate: currentDate,
        viewType: viewType,
      )),
      eventDeleted: (eventId, events, currentDate, viewType) =>
          _buildCalendarView(CalendarState.loaded(
        events: events,
        currentDate: currentDate,
        viewType: viewType,
      )),
      routeOptimized: (optimizedRoute, events, currentDate, viewType) =>
          _buildCalendarView(CalendarState.loaded(
        events: events,
        currentDate: currentDate,
        viewType: viewType,
        optimizedRoute: optimizedRoute,
      )),
      conflictsFound: (conflictingEvents, events, currentDate, viewType) =>
          _buildCalendarView(CalendarState.loaded(
        events: events,
        currentDate: currentDate,
        viewType: viewType,
        conflictingEvents: conflictingEvents,
      )),
    );
  }

  Widget _buildRouteView(CalendarState state) {
    return state.maybeWhen(
      loaded: (events, currentDate, viewType, typeFilter, searchQuery,
          isOffline, hasPendingSync, optimizedRoute, conflictingEvents) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // Route optimization display
              RouteOptimizationDisplay(
                optimizedRoute: optimizedRoute ?? [],
                onOptimizeRoute: () => _optimizeRoute(),
                onEventTap: (event) => _showEventDetails(context, event),
                isLoading: false,
              ),

              // Work orders for today
              if (optimizedRoute == null || optimizedRoute.isEmpty) ...[
                _buildTodayWorkOrders(events),
              ],
            ],
          ),
        );
      },
      orElse: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildDayEventsList(
      List<CalendarEventEntity> events, DateTime currentDate) {
    // Filter events for the current date
    final dayEvents = events.where((event) {
      final eventDate = DateTime(
        event.startTime.year,
        event.startTime.month,
        event.startTime.day,
      );
      final selectedDate = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
      );
      return eventDate == selectedDate;
    }).toList();

    if (dayEvents.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 48.sp,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
            SizedBox(height: 12.h),
            Text(
              'No events for this day',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: dayEvents.length,
      itemBuilder: (context, index) {
        final event = dayEvents[index];
        return EventCard(
          event: event,
          onTap: () => _showEventDetails(context, event),
          showActions: true,
          onEdit: () => _showEditEventDialog(context, event),
          onDelete: () => _deleteEvent(event),
        );
      },
    );
  }

  Widget _buildTodayWorkOrders(List<CalendarEventEntity> events) {
    final today = DateTime.now();
    final todayWorkOrders = events.where((event) {
      final eventDate = DateTime(
        event.startTime.year,
        event.startTime.month,
        event.startTime.day,
      );
      final todayDate = DateTime(today.year, today.month, today.day);
      return eventDate == todayDate &&
          event.type == CalendarEventType.workOrder;
    }).toList();

    if (todayWorkOrders.isEmpty) {
      return Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.work_off,
                size: 48.sp,
                color: Colors.grey.withValues(alpha: 0.5),
              ),
              SizedBox(height: 12.h),
              Text(
                'No work orders for today',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Work Orders',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          ...todayWorkOrders.map((event) => EventCard(
                event: event,
                onTap: () => _showEventDetails(context, event),
              )),
        ],
      ),
    );
  }

  void _showEventDetails(BuildContext context, CalendarEventEntity event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Event details
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: EventCard(
                      event: event,
                      showActions: true,
                      onEdit: () {
                        Navigator.pop(context);
                        _showEditEventDialog(context, event);
                      },
                      onDelete: () {
                        Navigator.pop(context);
                        _deleteEvent(event);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Events'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Event Type:'),
            SizedBox(height: 8.h),
            DropdownButton<CalendarEventType?>(
              value: _selectedTypeFilter,
              isExpanded: true,
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text('All Types'),
                ),
                ...CalendarEventType.values.map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedTypeFilter = value;
                });
                Navigator.pop(context);
                context.read<CalendarBloc>().add(
                      CalendarEvent.filterByType(value),
                    );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedTypeFilter = null;
              });
              Navigator.pop(context);
              context.read<CalendarBloc>().add(
                    const CalendarEvent.clearFilters(),
                  );
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Events'),
        content: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Enter event title or description...',
            prefixIcon: Icon(Icons.search),
          ),
          autofocus: true,
          onSubmitted: (query) {
            Navigator.of(context).pop();
            setState(() {
              _searchQuery = query.isEmpty ? null : query;
            });
            context.read<CalendarBloc>().add(
                  CalendarEvent.searchEvents(query),
                );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              final query = searchController.text.trim();
              setState(() {
                _searchQuery = query.isEmpty ? null : query;
              });
              context.read<CalendarBloc>().add(
                    CalendarEvent.searchEvents(query),
                  );
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showCreateEventDialog(BuildContext context) {
    // TODO: Implement create event dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Create event feature coming soon'),
      ),
    );
  }

  void _showEditEventDialog(BuildContext context, CalendarEventEntity event) {
    // TODO: Implement edit event dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit event feature coming soon'),
      ),
    );
  }

  void _deleteEvent(CalendarEventEntity event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Event'),
        content: Text('Are you sure you want to delete "${event.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<CalendarBloc>().add(
                    CalendarEvent.deleteEvent(event.id),
                  );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _optimizeRoute() async {
    try {
      final position = await _locationService.getCurrentLocation();
      final today = DateTime.now();

      context.read<CalendarBloc>().add(
            CalendarEvent.optimizeRoute(
              date: today,
              currentLatitude: position.latitude ?? 0,
              currentLongitude: position.longitude ?? 0,
            ),
          );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to get location: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
