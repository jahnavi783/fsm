import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Custom theme extensions for the FSM app
/// These extensions provide additional theming capabilities beyond Material 3's default theme

@immutable
class FSMThemeExtension extends ThemeExtension<FSMThemeExtension> {
  const FSMThemeExtension({
    required this.cardGradient,
    required this.statusColors,
    required this.priorityColors,
    required this.shadowColors,
    required this.workOrderCardBackground,
    required this.workOrderCardBorder,
    required this.searchBarBackground,
    required this.chipBackground,
    required this.avatarBackground,
  });

  final LinearGradient cardGradient;
  final Map<String, Color> statusColors;
  final Map<String, Color> priorityColors;
  final Map<String, Color> shadowColors;
  final Color workOrderCardBackground;
  final Color workOrderCardBorder;
  final Color searchBarBackground;
  final Color chipBackground;
  final Color avatarBackground;

  /// Light theme extension
  static const FSMThemeExtension light = FSMThemeExtension(
    cardGradient: LinearGradient(
      colors: [Colors.white, Color(0xFFFAFAFA)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    statusColors: {
      'assigned': AppColors.statusAssigned,
      'in_progress': AppColors.statusInProgress,
      'paused': AppColors.statusPaused,
      'completed': AppColors.statusCompleted,
      'cancelled': AppColors.statusCancelled,
      'rejected': AppColors.statusRejected,
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
    workOrderCardBackground: AppColors.surface,
    workOrderCardBorder: AppColors.cardBorder,
    searchBarBackground: AppColors.searchBackground,
    chipBackground: AppColors.surfaceVariant,
    avatarBackground: AppColors.primary,
  );

  /// Dark theme extension
  static const FSMThemeExtension dark = FSMThemeExtension(
    cardGradient: LinearGradient(
      colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    statusColors: {
      'assigned': Color(0xFF64B5F6),
      'in_progress': Color(0xFFFFB74D),
      'paused': Color(0xFFBA68C8),
      'completed': Color(0xFF81C784),
      'cancelled': Color(0xFFEF5350),
      'rejected': Color(0xFFA1887F),
    },
    priorityColors: {
      'low': Color(0xFFFFD54F),
      'medium': Color(0xFF7986CB),
      'high': Color(0xFFE57373),
      'urgent': Color(0xFFFF5722),
    },
    shadowColors: {
      'card': Color(0x40000000),
      'elevated': Color(0x60000000),
      'floating': Color(0x80000000),
    },
    workOrderCardBackground: AppColors.surfaceDark,
    workOrderCardBorder: AppColors.outlineDark,
    searchBarBackground: Color(0xFF2A2A2A),
    chipBackground: AppColors.surfaceVariantDark,
    avatarBackground: AppColors.primaryDark,
  );

  @override
  FSMThemeExtension copyWith({
    LinearGradient? cardGradient,
    Map<String, Color>? statusColors,
    Map<String, Color>? priorityColors,
    Map<String, Color>? shadowColors,
    Color? workOrderCardBackground,
    Color? workOrderCardBorder,
    Color? searchBarBackground,
    Color? chipBackground,
    Color? avatarBackground,
  }) {
    return FSMThemeExtension(
      cardGradient: cardGradient ?? this.cardGradient,
      statusColors: statusColors ?? this.statusColors,
      priorityColors: priorityColors ?? this.priorityColors,
      shadowColors: shadowColors ?? this.shadowColors,
      workOrderCardBackground: workOrderCardBackground ?? this.workOrderCardBackground,
      workOrderCardBorder: workOrderCardBorder ?? this.workOrderCardBorder,
      searchBarBackground: searchBarBackground ?? this.searchBarBackground,
      chipBackground: chipBackground ?? this.chipBackground,
      avatarBackground: avatarBackground ?? this.avatarBackground,
    );
  }

  @override
  FSMThemeExtension lerp(FSMThemeExtension? other, double t) {
    if (other is! FSMThemeExtension) {
      return this;
    }

    return FSMThemeExtension(
      cardGradient: LinearGradient.lerp(cardGradient, other.cardGradient, t) ?? cardGradient,
      statusColors: _lerpColorMap(statusColors, other.statusColors, t),
      priorityColors: _lerpColorMap(priorityColors, other.priorityColors, t),
      shadowColors: _lerpColorMap(shadowColors, other.shadowColors, t),
      workOrderCardBackground: Color.lerp(workOrderCardBackground, other.workOrderCardBackground, t) ?? workOrderCardBackground,
      workOrderCardBorder: Color.lerp(workOrderCardBorder, other.workOrderCardBorder, t) ?? workOrderCardBorder,
      searchBarBackground: Color.lerp(searchBarBackground, other.searchBarBackground, t) ?? searchBarBackground,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t) ?? chipBackground,
      avatarBackground: Color.lerp(avatarBackground, other.avatarBackground, t) ?? avatarBackground,
    );
  }

  Map<String, Color> _lerpColorMap(Map<String, Color> a, Map<String, Color> b, double t) {
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
    return Theme.of(this).extension<FSMThemeExtension>() ?? FSMThemeExtension.light;
  }
}

/// Helper extension for getting status and priority colors
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
}