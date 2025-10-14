import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_event.dart';

class CalendarViewWidget extends StatelessWidget {
  final List<CalendarEventEntity> events;
  final CalendarViewType viewType;
  final DateTime currentDate;
  final Function(CalendarEventEntity) onEventTap;
  final Function(DateTime) onDateTap;
  final Function(DateTime, DateTime) onDateRangeSelected;

  const CalendarViewWidget({
    super.key,
    required this.events,
    required this.viewType,
    required this.currentDate,
    required this.onEventTap,
    required this.onDateTap,
    required this.onDateRangeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final calendarEvents = events.map(_convertToCalendarEvent).toList();
    
    return Container(
      height: _getCalendarHeight(),
      child: _buildCalendarView(calendarEvents),
    );
  }

  Widget _buildCalendarView(List<CalendarEventData> calendarEvents) {
    switch (viewType) {
      case CalendarViewType.day:
        return DayView(
          controller: EventController()..addAll(calendarEvents),
          eventTileBuilder: _eventTileBuilder,
          onEventTap: (events, date) {
            if (events.isNotEmpty) {
              final originalEvent = _findOriginalEvent(events.first);
              if (originalEvent != null) {
                onEventTap(originalEvent);
              }
            }
          },
          onDateTap: onDateTap,
          dayTitleBuilder: _dayTitleBuilder,
          timeLineBuilder: _timeLineBuilder,
          hourIndicatorSettings: HourIndicatorSettings(
            height: 1.h,
            color: Colors.grey.withValues(alpha: 0.3),
          ),
          liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
            color: Colors.red,
            showTime: true,
          ),
        );
        
      case CalendarViewType.week:
        return WeekView(
          controller: EventController()..addAll(calendarEvents),
          eventTileBuilder: _eventTileBuilder,
          onEventTap: (events, date) {
            if (events.isNotEmpty) {
              final originalEvent = _findOriginalEvent(events.first);
              if (originalEvent != null) {
                onEventTap(originalEvent);
              }
            }
          },
          onDateTap: onDateTap,
          // weekTitleBuilder: _weekTitleBuilder,
          timeLineBuilder: _timeLineBuilder,
          hourIndicatorSettings: HourIndicatorSettings(
            height: 1.h,
            color: Colors.grey.withValues(alpha: 0.3),
          ),
          liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
            color: Colors.red,
            showTime: true,
          ),
        );
        
      case CalendarViewType.month:
        return MonthView(
          controller: EventController()..addAll(calendarEvents),
          onEventTap: (event, date) {
            final originalEvent = _findOriginalEvent(event);
            if (originalEvent != null) {
              onEventTap(originalEvent);
            }
          },
          onCellTap: (events, date) {
            onDateTap(date);
          },
          // cellBuilder: _monthCellBuilder,
          minMonth: DateTime(2020),
          maxMonth: DateTime(2030),
          initialMonth: currentDate,
          cellAspectRatio: 0.8,
          borderSize: 1,
          borderColor: Colors.grey.withValues(alpha: 0.2),
          headerBuilder: _monthHeaderBuilder,
        );
    }
  }

  CalendarEventData _convertToCalendarEvent(CalendarEventEntity event) {
    return CalendarEventData(
      date: event.startTime,
      startTime: event.startTime,
      endTime: event.endTime,
      title: event.title,
      description: event.description,
      color: _getEventColor(event),
      event: event, // Store original event for reference
    );
  }

  Color _getEventColor(CalendarEventEntity event) {
    if (event.color != null) {
      try {
        return Color(int.parse(event.color!.replaceFirst('#', '0xFF')));
      } catch (e) {
        // Fallback to type-based color
      }
    }
    
    return Color(int.parse(event.type.color.replaceFirst('#', '0xFF')));
  }

  CalendarEventEntity? _findOriginalEvent(CalendarEventData calendarEvent) {
    return calendarEvent.event as CalendarEventEntity?;
  }

  Widget _eventTileBuilder(
    DateTime date,
    List<CalendarEventData> events,
    Rect boundary,
    DateTime startDuration,
    DateTime endDuration,
  ) {
    if (events.isEmpty) return const SizedBox.shrink();
    
    final event = events.first;
    final originalEvent = _findOriginalEvent(event);
    
    return Container(
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: event.color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            event.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (originalEvent != null && !originalEvent.isAllDay) ...[
            Text(
              '${originalEvent.startTime.hour.toString().padLeft(2, '0')}:${originalEvent.startTime.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 9.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _dayTitleBuilder(DateTime date) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          '${_getDayName(date.weekday)} ${date.day}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _weekTitleBuilder(DateTime startDate, DateTime endDate) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          '${startDate.day} - ${endDate.day} ${_getMonthName(startDate.month)} ${startDate.year}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _monthHeaderBuilder(DateTime month) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Center(
        child: Text(
          '${_getMonthName(month.month)} ${month.year}',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _monthCellBuilder(
    DateTime date,
    List<CalendarEventData> events,
    bool isToday,
    bool isInMonth,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isToday 
            ? Colors.blue.withValues(alpha: 0.1)
            : Colors.transparent,
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          // Date number
          Container(
            padding: EdgeInsets.all(4.w),
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                color: isInMonth 
                    ? (isToday ? Colors.blue : Colors.black)
                    : Colors.grey,
              ),
            ),
          ),
          
          // Event indicators
          if (events.isNotEmpty) ...[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                itemCount: events.length > 3 ? 3 : events.length,
                itemBuilder: (context, index) {
                  if (index == 2 && events.length > 3) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 1.h),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Text(
                        '+${events.length - 2}',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  }
                  
                  final event = events[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: event.color,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _timeLineBuilder(DateTime date) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.only(right: 8.w),
      child: Text(
        '${date.hour.toString().padLeft(2, '0')}:00',
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  double _getCalendarHeight() {
    switch (viewType) {
      case CalendarViewType.day:
        return 600.h;
      case CalendarViewType.week:
        return 500.h;
      case CalendarViewType.month:
        return 400.h;
    }
  }

  String _getDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}