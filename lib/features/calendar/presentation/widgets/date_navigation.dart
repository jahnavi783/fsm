import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_event.dart';
import 'package:intl/intl.dart';

class DateNavigation extends StatelessWidget {
  final DateTime currentDate;
  final CalendarViewType viewType;
  final Function(DateTime) onDateChanged;
  final VoidCallback onTodayTap;

  const DateNavigation({
    super.key,
    required this.currentDate,
    required this.viewType,
    required this.onDateChanged,
    required this.onTodayTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          // Previous button
          IconButton(
            onPressed: () => _navigatePrevious(),
            icon: Icon(
              Icons.chevron_left,
              size: 24.sp,
            ),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // Current date/period display
          Expanded(
            child: GestureDetector(
              onTap: () => _showDatePicker(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _getDateDisplayText(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.calendar_today,
                      size: 16.sp,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // Next button
          IconButton(
            onPressed: () => _navigateNext(),
            icon: Icon(
              Icons.chevron_right,
              size: 24.sp,
            ),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
            ),
          ),
          
          SizedBox(width: 8.w),
          
          // Today button
          TextButton(
            onPressed: onTodayTap,
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDateDisplayText() {
    switch (viewType) {
      case CalendarViewType.day:
        return DateFormat('EEEE, MMMM d, y').format(currentDate);
      case CalendarViewType.week:
        final weekStart = _getWeekStart(currentDate);
        final weekEnd = weekStart.add(const Duration(days: 6));
        if (weekStart.month == weekEnd.month) {
          return '${DateFormat('MMMM d').format(weekStart)} - ${DateFormat('d, y').format(weekEnd)}';
        } else {
          return '${DateFormat('MMM d').format(weekStart)} - ${DateFormat('MMM d, y').format(weekEnd)}';
        }
      case CalendarViewType.month:
        return DateFormat('MMMM y').format(currentDate);
    }
  }

  void _navigatePrevious() {
    DateTime newDate;
    switch (viewType) {
      case CalendarViewType.day:
        newDate = currentDate.subtract(const Duration(days: 1));
        break;
      case CalendarViewType.week:
        newDate = currentDate.subtract(const Duration(days: 7));
        break;
      case CalendarViewType.month:
        newDate = DateTime(currentDate.year, currentDate.month - 1, 1);
        break;
    }
    onDateChanged(newDate);
  }

  void _navigateNext() {
    DateTime newDate;
    switch (viewType) {
      case CalendarViewType.day:
        newDate = currentDate.add(const Duration(days: 1));
        break;
      case CalendarViewType.week:
        newDate = currentDate.add(const Duration(days: 7));
        break;
      case CalendarViewType.month:
        newDate = DateTime(currentDate.year, currentDate.month + 1, 1);
        break;
    }
    onDateChanged(newDate);
  }

  DateTime _getWeekStart(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }

  void _showDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (selectedDate != null) {
      onDateChanged(selectedDate);
    }
  }
}