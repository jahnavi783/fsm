import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Custom theme extensions for the FSM app
/// These extensions provide additional theming capabilities beyond Material 3's default theme

@immutable
class FSMThemeExtension extends ThemeExtension<FSMThemeExtension> {
  const FSMThemeExtension({
    required this.cardGradient,
    required this.statusColors,
    required this.statusTextColors,
    required this.priorityColors,
    required this.shadowColors,
    required this.actionColors,
    required this.syncStatusColors,
    required this.stockColors,
    required this.workOrderCardBackground,
    required this.workOrderCardBorder,
    required this.searchBarBackground,
    required this.chipBackground,
    required this.avatarBackground,
    required this.fabBackground,
    required this.bottomSheetBackground,
    required this.offlineBannerBackground,
  });

  final LinearGradient cardGradient;
  final Map<String, Color> statusColors;
  final Map<String, Color> statusTextColors;
  final Map<String, Color> priorityColors;
  final Map<String, Color> shadowColors;
  final Map<String, Color> actionColors;
  final Map<String, Color> syncStatusColors;
  final Map<String, Color> stockColors;
  final Color workOrderCardBackground;
  final Color workOrderCardBorder;
  final Color searchBarBackground;
  final Color chipBackground;
  final Color avatarBackground;
  final Color fabBackground;
  final Color bottomSheetBackground;
  final Color offlineBannerBackground;

  /// Light theme extension (Redesign 2025 - Teal/Green)
  static const FSMThemeExtension light = FSMThemeExtension(
    cardGradient: AppColors.primaryGradient, // Teal to Green gradient
    statusColors: {
      'unassigned': AppColors.statusUnassigned,
      'assigned': AppColors.statusAssigned,
      'in_progress': AppColors.statusInProgress,
      'paused': AppColors.statusPaused,
      'completed': AppColors.statusCompleted,
      'cancelled': AppColors.statusCancelled,
      'rejected': AppColors.statusRejected,
    },
    statusTextColors: {
      'unassigned': Color(0xFF424242),
      'assigned': Color(0xFF1976D2),
      'in_progress': Color(0xFFE65100),
      'paused': Color(0xFF7B1FA2),
      'completed': Color(0xFF388E3C),
      'cancelled': Color(0xFFD32F2F),
      'rejected': Color(0xFF5D4037),
    },
    priorityColors: {
      'low': AppColors.priorityLow,
      'medium': AppColors.priorityMedium,
      'high': AppColors.priorityHigh,
      'urgent': AppColors.priorityUrgent,
    },
    shadowColors: {
      'card': Color(0x0F000000),
      'elevated': Color(0x1A000000),
      'floating': Color(0x26000000),
    },
    actionColors: {
      'start': AppColors.actionStart,
      'pause': AppColors.actionPause,
      'resume': AppColors.actionResume,
      'complete': AppColors.actionComplete,
      'cancel': AppColors.actionCancel,
      'reject': AppColors.actionReject,
    },
    syncStatusColors: {
      'offline': AppColors.offline,
      'syncing': AppColors.syncing,
      'synced': AppColors.synced,
      'failed': AppColors.syncFailed,
      'pending': AppColors.pendingSync,
    },
    stockColors: {
      'high': AppColors.stockHigh,
      'medium': AppColors.stockMedium,
      'low': AppColors.stockLow,
      'out': AppColors.stockOut,
    },
    workOrderCardBackground: AppColors.surface,
    workOrderCardBorder: AppColors.cardBorder,
    searchBarBackground: AppColors.searchBackground,
    chipBackground: AppColors.surfaceVariant,
    avatarBackground: AppColors.primary, // Teal
    fabBackground: AppColors.secondary, // Green accent for FAB
    bottomSheetBackground: AppColors.surface,
    offlineBannerBackground: Color(0xFFFFF8E1), // Amber/Yellow
  );

  /// Dark theme extension (Redesign 2025 - Teal/Green)
  static const FSMThemeExtension dark = FSMThemeExtension(
    cardGradient: LinearGradient(
      colors: [Color(0xFF00695C), Color(0xFF388E3C)], // Teal Dark to Green Dark
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    statusColors: {
      'unassigned': Color(0xFF424242), // Dark gray
      'assigned': Color(0xFF64B5F6), // Light blue
      'in_progress': Color(0xFFFFB74D), // Orange
      'paused': Color(0xFFBA68C8), // Purple
      'completed': Color(0xFF81C784), // Green
      'cancelled': Color(0xFFEF5350), // Red
      'rejected': Color(0xFFA1887F), // Brown
    },
    statusTextColors: {
      'unassigned': Color(0xFFE0E0E0),
      'assigned': Color(0xFF90CAF9),
      'in_progress': Color(0xFFFFCC02),
      'paused': Color(0xFFCE93D8),
      'completed': Color(0xFFA5D6A7),
      'cancelled': Color(0xFFEF5350),
      'rejected': Color(0xFFBCAAA4),
    },
    priorityColors: {
      'low': Color(0xFF64B5F6), // Light blue (matches redesign)
      'medium': Color(0xFFFFB74D), // Light orange (matches redesign)
      'high': Color(0xFFE57373), // Light red (matches redesign)
      'urgent': Color(0xFFE57373), // Light red (same as high)
    },
    shadowColors: {
      'card': Color(0x40000000),
      'elevated': Color(0x60000000),
      'floating': Color(0x80000000),
    },
    actionColors: {
      'start': Color(0xFF81C784),
      'pause': Color(0xFFFFB74D),
      'resume': Color(0xFF64B5F6),
      'complete': Color(0xFF81C784),
      'cancel': Color(0xFFEF5350),
      'reject': Color(0xFFA1887F),
    },
    syncStatusColors: {
      'offline': Color(0xFFFFB74D),
      'syncing': Color(0xFF64B5F6),
      'synced': Color(0xFF81C784),
      'failed': Color(0xFFEF5350),
      'pending': Color(0xFFFFB74D),
    },
    stockColors: {
      'high': Color(0xFF81C784),
      'medium': Color(0xFFFFB74D),
      'low': Color(0xFFEF5350),
      'out': Color(0xFF9E9E9E),
    },
    workOrderCardBackground: AppColors.surfaceDark,
    workOrderCardBorder: AppColors.outlineDark,
    searchBarBackground: Color(0xFF2A2A2A),
    chipBackground: AppColors.surfaceVariantDark,
    avatarBackground: AppColors.primaryDark, // Teal Light
    fabBackground: AppColors.secondaryDark, // Green Light for FAB
    bottomSheetBackground: AppColors.surfaceDark,
    offlineBannerBackground: Color(0xFF4E342E), // Dark amber/brown
  );

  @override
  FSMThemeExtension copyWith({
    LinearGradient? cardGradient,
    Map<String, Color>? statusColors,
    Map<String, Color>? statusTextColors,
    Map<String, Color>? priorityColors,
    Map<String, Color>? shadowColors,
    Map<String, Color>? actionColors,
    Map<String, Color>? syncStatusColors,
    Map<String, Color>? stockColors,
    Color? workOrderCardBackground,
    Color? workOrderCardBorder,
    Color? searchBarBackground,
    Color? chipBackground,
    Color? avatarBackground,
    Color? fabBackground,
    Color? bottomSheetBackground,
    Color? offlineBannerBackground,
  }) {
    return FSMThemeExtension(
      cardGradient: cardGradient ?? this.cardGradient,
      statusColors: statusColors ?? this.statusColors,
      statusTextColors: statusTextColors ?? this.statusTextColors,
      priorityColors: priorityColors ?? this.priorityColors,
      shadowColors: shadowColors ?? this.shadowColors,
      actionColors: actionColors ?? this.actionColors,
      syncStatusColors: syncStatusColors ?? this.syncStatusColors,
      stockColors: stockColors ?? this.stockColors,
      workOrderCardBackground:
          workOrderCardBackground ?? this.workOrderCardBackground,
      workOrderCardBorder: workOrderCardBorder ?? this.workOrderCardBorder,
      searchBarBackground: searchBarBackground ?? this.searchBarBackground,
      chipBackground: chipBackground ?? this.chipBackground,
      avatarBackground: avatarBackground ?? this.avatarBackground,
      fabBackground: fabBackground ?? this.fabBackground,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
      offlineBannerBackground:
          offlineBannerBackground ?? this.offlineBannerBackground,
    );
  }

  @override
  FSMThemeExtension lerp(FSMThemeExtension? other, double t) {
    if (other is! FSMThemeExtension) {
      return this;
    }

    return FSMThemeExtension(
      cardGradient: LinearGradient.lerp(cardGradient, other.cardGradient, t) ??
          cardGradient,
      statusColors: _lerpColorMap(statusColors, other.statusColors, t),
      statusTextColors:
          _lerpColorMap(statusTextColors, other.statusTextColors, t),
      priorityColors: _lerpColorMap(priorityColors, other.priorityColors, t),
      shadowColors: _lerpColorMap(shadowColors, other.shadowColors, t),
      actionColors: _lerpColorMap(actionColors, other.actionColors, t),
      syncStatusColors:
          _lerpColorMap(syncStatusColors, other.syncStatusColors, t),
      stockColors: _lerpColorMap(stockColors, other.stockColors, t),
      workOrderCardBackground: Color.lerp(
              workOrderCardBackground, other.workOrderCardBackground, t) ??
          workOrderCardBackground,
      workOrderCardBorder:
          Color.lerp(workOrderCardBorder, other.workOrderCardBorder, t) ??
              workOrderCardBorder,
      searchBarBackground:
          Color.lerp(searchBarBackground, other.searchBarBackground, t) ??
              searchBarBackground,
      chipBackground:
          Color.lerp(chipBackground, other.chipBackground, t) ?? chipBackground,
      avatarBackground:
          Color.lerp(avatarBackground, other.avatarBackground, t) ??
              avatarBackground,
      fabBackground:
          Color.lerp(fabBackground, other.fabBackground, t) ?? fabBackground,
      bottomSheetBackground:
          Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t) ??
              bottomSheetBackground,
      offlineBannerBackground: Color.lerp(
              offlineBannerBackground, other.offlineBannerBackground, t) ??
          offlineBannerBackground,
    );
  }

  Map<String, Color> _lerpColorMap(
      Map<String, Color> a, Map<String, Color> b, double t) {
    final result = <String, Color>{};
    final keys = {...a.keys, ...b.keys};

    for (final key in keys) {
      final colorA = a[key];
      final colorB = b[key];

      if (colorA != null && colorB != null) {
        result[key] = Color.lerp(colorA, colorB, t)!;
      } else {
        result[key] = colorA ?? colorB!;
      }
    }

    return result;
  }
}

/// Extension methods for easy access to FSM theme extensions
extension FSMThemeExtensionContext on BuildContext {
  FSMThemeExtension get fsmTheme {
    return Theme.of(this).extension<FSMThemeExtension>() ??
        FSMThemeExtension.light;
  }
}

/// Helper extension for getting theme colors
extension FSMThemeHelpers on FSMThemeExtension {
  Color getStatusColor(String status) {
    return statusColors[status.toLowerCase()] ?? statusColors['assigned']!;
  }

  Color getPriorityColor(String priority) {
    return priorityColors[priority.toLowerCase()] ?? priorityColors['medium']!;
  }

  Color getShadowColor(String type) {
    return shadowColors[type.toLowerCase()] ?? shadowColors['card']!;
  }

  Color getActionColor(String action) {
    return actionColors[action.toLowerCase()] ?? actionColors['start']!;
  }

  Color getSyncStatusColor(String status) {
    return syncStatusColors[status.toLowerCase()] ??
        syncStatusColors['offline']!;
  }

  Color getStockColor(String level) {
    return stockColors[level.toLowerCase()] ?? stockColors['medium']!;
  }

  /// Convenience method to get stock color by quantity levels
  Color getStockColorByQuantity(
      int quantity, int minQuantity, int maxQuantity) {
    if (quantity == 0) return stockColors['out']!;
    if (quantity <= minQuantity) return stockColors['low']!;
    if (quantity < maxQuantity * 0.5) return stockColors['medium']!;
    return stockColors['high']!;
  }
}
