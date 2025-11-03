import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Custom theme extensions for the FSM app with strongly-typed domain colors.
///
/// This extension provides domain-specific colors beyond Material 3's default theme.
/// All colors are explicitly typed properties instead of Map-based for compile-time safety.
///
/// Usage:
/// ```dart
/// final fsmTheme = context.fsmTheme;
/// Container(color: fsmTheme.statusPending);
/// ```
@immutable
class FSMThemeExtension extends ThemeExtension<FSMThemeExtension> {
  const FSMThemeExtension({
    // Gradient
    required this.cardGradient,
    // Work order priorities
    required this.workOrderLow,
    required this.workOrderMedium,
    required this.workOrderHigh,
    required this.workOrderUrgent,
    // Work order statuses
    required this.statusUnassigned,
    required this.statusAssigned,
    required this.statusInProgress,
    required this.statusPaused,
    required this.statusPending,
    required this.statusCompleted,
    required this.statusCancelled,
    required this.statusRejected,
    required this.statusOverdue,
    // Status text colors
    required this.statusTextUnassigned,
    required this.statusTextAssigned,
    required this.statusTextInProgress,
    required this.statusTextPaused,
    required this.statusTextCompleted,
    required this.statusTextCancelled,
    required this.statusTextRejected,
    // Shadow colors
    required this.shadowCard,
    required this.shadowElevated,
    required this.shadowFloating,
    // Action colors
    required this.actionStart,
    required this.actionPause,
    required this.actionResume,
    required this.actionComplete,
    required this.actionCancel,
    required this.actionReject,
    // Sync status colors
    required this.syncOffline,
    required this.syncSyncing,
    required this.syncSynced,
    required this.syncFailed,
    required this.syncPending,
    // Stock level colors
    required this.stockHigh,
    required this.stockMedium,
    required this.stockLow,
    required this.stockOut,
    // Document type colors
    required this.documentManual,
    required this.documentProcedure,
    required this.documentSchematic,
    required this.documentSpecification,
    required this.documentSafety,
    required this.documentTraining,
    required this.documentReport,
    required this.documentCertificate,
    required this.documentWarranty,
    required this.documentOther,
    // Component-specific colors
    required this.workOrderCardBackground,
    required this.workOrderCardBorder,
    required this.searchBarBackground,
    required this.chipBackground,
    required this.avatarBackground,
    required this.fabBackground,
    required this.bottomSheetBackground,
    required this.offlineBannerBackground,
    // Semantic colors
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    // Background variants
    required this.backgroundElevated,
    required this.backgroundOverlay,
  });

  // ============================================
  // GRADIENT
  // ============================================
  final LinearGradient cardGradient;

  // ============================================
  // WORK ORDER PRIORITIES
  // ============================================
  final Color workOrderLow;
  final Color workOrderMedium;
  final Color workOrderHigh;
  final Color workOrderUrgent;

  // ============================================
  // WORK ORDER STATUSES
  // ============================================
  final Color statusUnassigned;
  final Color statusAssigned;
  final Color statusInProgress;
  final Color statusPaused;
  final Color statusPending;
  final Color statusCompleted;
  final Color statusCancelled;
  final Color statusRejected;
  final Color statusOverdue;

  // ============================================
  // STATUS TEXT COLORS
  // ============================================
  final Color statusTextUnassigned;
  final Color statusTextAssigned;
  final Color statusTextInProgress;
  final Color statusTextPaused;
  final Color statusTextCompleted;
  final Color statusTextCancelled;
  final Color statusTextRejected;

  // ============================================
  // SHADOWS
  // ============================================
  final Color shadowCard;
  final Color shadowElevated;
  final Color shadowFloating;

  // ============================================
  // ACTION COLORS
  // ============================================
  final Color actionStart;
  final Color actionPause;
  final Color actionResume;
  final Color actionComplete;
  final Color actionCancel;
  final Color actionReject;

  // ============================================
  // SYNC STATUS
  // ============================================
  final Color syncOffline;
  final Color syncSyncing;
  final Color syncSynced;
  final Color syncFailed;
  final Color syncPending;

  // ============================================
  // STOCK LEVELS
  // ============================================
  final Color stockHigh;
  final Color stockMedium;
  final Color stockLow;
  final Color stockOut;

  // ============================================
  // DOCUMENT TYPE COLORS
  // ============================================
  final Color documentManual;
  final Color documentProcedure;
  final Color documentSchematic;
  final Color documentSpecification;
  final Color documentSafety;
  final Color documentTraining;
  final Color documentReport;
  final Color documentCertificate;
  final Color documentWarranty;
  final Color documentOther;

  // ============================================
  // COMPONENT-SPECIFIC COLORS
  // ============================================
  final Color workOrderCardBackground;
  final Color workOrderCardBorder;
  final Color searchBarBackground;
  final Color chipBackground;
  final Color avatarBackground;
  final Color fabBackground;
  final Color bottomSheetBackground;
  final Color offlineBannerBackground;

  // ============================================
  // SEMANTIC COLORS
  // ============================================
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  // ============================================
  // BACKGROUND VARIANTS
  // ============================================
  final Color backgroundElevated;
  final Color backgroundOverlay;

  /// Light theme extension (Redesign 2025 - Teal/Green)
  static const FSMThemeExtension light = FSMThemeExtension(
    cardGradient: AppColors.primaryGradient,
    // Work order priorities
    workOrderLow: AppColors.priorityLow,
    workOrderMedium: AppColors.priorityMedium,
    workOrderHigh: AppColors.priorityHigh,
    workOrderUrgent: AppColors.priorityUrgent,
    // Work order statuses
    statusUnassigned: AppColors.statusUnassigned,
    statusAssigned: AppColors.statusAssigned,
    statusInProgress: AppColors.statusInProgress,
    statusPaused: AppColors.statusPaused,
    statusPending: Color(0xFFFF9800), // Orange for pending
    statusCompleted: AppColors.statusCompleted,
    statusCancelled: AppColors.statusCancelled,
    statusRejected: AppColors.statusRejected,
    statusOverdue: Color(0xFFD32F2F), // Red for overdue
    // Status text colors
    statusTextUnassigned: Color(0xFF424242),
    statusTextAssigned: Color(0xFF1976D2),
    statusTextInProgress: Color(0xFFE65100),
    statusTextPaused: Color(0xFF7B1FA2),
    statusTextCompleted: Color(0xFF388E3C),
    statusTextCancelled: Color(0xFFD32F2F),
    statusTextRejected: Color(0xFF5D4037),
    // Shadows
    shadowCard: Color(0x0F000000),
    shadowElevated: Color(0x1A000000),
    shadowFloating: Color(0x26000000),
    // Actions
    actionStart: AppColors.actionStart,
    actionPause: AppColors.actionPause,
    actionResume: AppColors.actionResume,
    actionComplete: AppColors.actionComplete,
    actionCancel: AppColors.actionCancel,
    actionReject: AppColors.actionReject,
    // Sync statuses
    syncOffline: AppColors.offline,
    syncSyncing: AppColors.syncing,
    syncSynced: AppColors.synced,
    syncFailed: AppColors.syncFailed,
    syncPending: AppColors.pendingSync,
    // Stock levels
    stockHigh: AppColors.stockHigh,
    stockMedium: AppColors.stockMedium,
    stockLow: AppColors.stockLow,
    stockOut: AppColors.stockOut,
    // Document types
    documentManual: Color(0xFF1E88E5), // Blue
    documentProcedure: Color(0xFF5E35B1), // Purple
    documentSchematic: Color(0xFF00897B), // Teal
    documentSpecification: Color(0xFF43A047), // Green
    documentSafety: Color(0xFFE53935), // Red
    documentTraining: Color(0xFFFB8C00), // Orange
    documentReport: Color(0xFF3949AB), // Indigo
    documentCertificate: Color(0xFF8E24AA), // Purple
    documentWarranty: Color(0xFF00ACC1), // Cyan
    documentOther: Color(0xFF757575), // Gray
    // Component-specific
    workOrderCardBackground: AppColors.surface,
    workOrderCardBorder: AppColors.cardBorder,
    searchBarBackground: AppColors.searchBackground,
    chipBackground: AppColors.surfaceVariant,
    avatarBackground: AppColors.primary,
    fabBackground: AppColors.secondary,
    bottomSheetBackground: AppColors.surface,
    offlineBannerBackground: Color(0xFFFFF8E1),
    // Semantic
    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    error: Color(0xFFD32F2F),
    info: Color(0xFF2196F3),
    // Background variants
    backgroundElevated: Color(0xFFFAFAFA),
    backgroundOverlay: Color(0x80000000),
  );

  /// Dark theme extension (Redesign 2025 - Teal/Green)
  static const FSMThemeExtension dark = FSMThemeExtension(
    cardGradient: LinearGradient(
      colors: [Color(0xFF00695C), Color(0xFF388E3C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    // Work order priorities
    workOrderLow: Color(0xFF64B5F6),
    workOrderMedium: Color(0xFFFFB74D),
    workOrderHigh: Color(0xFFE57373),
    workOrderUrgent: Color(0xFFE57373),
    // Work order statuses
    statusUnassigned: Color(0xFF424242),
    statusAssigned: Color(0xFF64B5F6),
    statusInProgress: Color(0xFFFFB74D),
    statusPaused: Color(0xFFBA68C8),
    statusPending:
        Color(0xFFFFB74D), // Orange for pending (same as in-progress in dark)
    statusCompleted: Color(0xFF81C784),
    statusCancelled: Color(0xFFEF5350),
    statusRejected: Color(0xFFA1887F),
    statusOverdue: Color(0xFFEF5350),
    // Status text colors
    statusTextUnassigned: Color(0xFFE0E0E0),
    statusTextAssigned: Color(0xFF90CAF9),
    statusTextInProgress: Color(0xFFFFCC02),
    statusTextPaused: Color(0xFFCE93D8),
    statusTextCompleted: Color(0xFFA5D6A7),
    statusTextCancelled: Color(0xFFEF5350),
    statusTextRejected: Color(0xFFBCAAA4),
    // Shadows
    shadowCard: Color(0x40000000),
    shadowElevated: Color(0x60000000),
    shadowFloating: Color(0x80000000),
    // Actions
    actionStart: Color(0xFF81C784),
    actionPause: Color(0xFFFFB74D),
    actionResume: Color(0xFF64B5F6),
    actionComplete: Color(0xFF81C784),
    actionCancel: Color(0xFFEF5350),
    actionReject: Color(0xFFA1887F),
    // Sync statuses
    syncOffline: Color(0xFFFFB74D),
    syncSyncing: Color(0xFF64B5F6),
    syncSynced: Color(0xFF81C784),
    syncFailed: Color(0xFFEF5350),
    syncPending: Color(0xFFFFB74D),
    // Stock levels
    stockHigh: Color(0xFF81C784),
    stockMedium: Color(0xFFFFB74D),
    stockLow: Color(0xFFEF5350),
    stockOut: Color(0xFF9E9E9E),
    // Document types
    documentManual: Color(0xFF64B5F6),
    documentProcedure: Color(0xFF81C784),
    documentSchematic: Color(0xFFBA68C8),
    documentSpecification: Color(0xFFFFB74D),
    documentSafety: Color(0xFFEF5350),
    documentTraining: Color(0xFF4DD0E1),
    documentReport: Color(0xFF90A4AE),
    documentCertificate: Color(0xFFFFD54F),
    documentWarranty: Color(0xFFAED581),
    documentOther: Color(0xFF9E9E9E),
    // Component-specific
    workOrderCardBackground: AppColors.surfaceDark,
    workOrderCardBorder: AppColors.outlineDark,
    searchBarBackground: Color(0xFF2A2A2A),
    chipBackground: AppColors.surfaceVariantDark,
    avatarBackground: AppColors.primaryDark,
    fabBackground: AppColors.secondaryDark,
    bottomSheetBackground: AppColors.surfaceDark,
    offlineBannerBackground: Color(0xFF4E342E),
    // Semantic
    success: Color(0xFF81C784),
    warning: Color(0xFFFFB74D),
    error: Color(0xFFEF5350),
    info: Color(0xFF64B5F6),
    // Background variants
    backgroundElevated: Color(0xFF2A2A2A),
    backgroundOverlay: Color(0xCC000000),
  );

  @override
  FSMThemeExtension copyWith({
    LinearGradient? cardGradient,
    // Priorities
    Color? workOrderLow,
    Color? workOrderMedium,
    Color? workOrderHigh,
    Color? workOrderUrgent,
    // Statuses
    Color? statusUnassigned,
    Color? statusAssigned,
    Color? statusInProgress,
    Color? statusPaused,
    Color? statusPending,
    Color? statusCompleted,
    Color? statusCancelled,
    Color? statusRejected,
    Color? statusOverdue,
    // Status texts
    Color? statusTextUnassigned,
    Color? statusTextAssigned,
    Color? statusTextInProgress,
    Color? statusTextPaused,
    Color? statusTextCompleted,
    Color? statusTextCancelled,
    Color? statusTextRejected,
    // Shadows
    Color? shadowCard,
    Color? shadowElevated,
    Color? shadowFloating,
    // Actions
    Color? actionStart,
    Color? actionPause,
    Color? actionResume,
    Color? actionComplete,
    Color? actionCancel,
    Color? actionReject,
    // Sync
    Color? syncOffline,
    Color? syncSyncing,
    Color? syncSynced,
    Color? syncFailed,
    Color? syncPending,
    // Stock
    Color? stockHigh,
    Color? stockMedium,
    Color? stockLow,
    Color? stockOut,
    // Document types
    Color? documentManual,
    Color? documentProcedure,
    Color? documentSchematic,
    Color? documentSpecification,
    Color? documentSafety,
    Color? documentTraining,
    Color? documentReport,
    Color? documentCertificate,
    Color? documentWarranty,
    Color? documentOther,
    // Components
    Color? workOrderCardBackground,
    Color? workOrderCardBorder,
    Color? searchBarBackground,
    Color? chipBackground,
    Color? avatarBackground,
    Color? fabBackground,
    Color? bottomSheetBackground,
    Color? offlineBannerBackground,
    // Semantic
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    // Backgrounds
    Color? backgroundElevated,
    Color? backgroundOverlay,
  }) {
    return FSMThemeExtension(
      cardGradient: cardGradient ?? this.cardGradient,
      workOrderLow: workOrderLow ?? this.workOrderLow,
      workOrderMedium: workOrderMedium ?? this.workOrderMedium,
      workOrderHigh: workOrderHigh ?? this.workOrderHigh,
      workOrderUrgent: workOrderUrgent ?? this.workOrderUrgent,
      statusUnassigned: statusUnassigned ?? this.statusUnassigned,
      statusAssigned: statusAssigned ?? this.statusAssigned,
      statusInProgress: statusInProgress ?? this.statusInProgress,
      statusPaused: statusPaused ?? this.statusPaused,
      statusPending: statusPending ?? this.statusPending,
      statusCompleted: statusCompleted ?? this.statusCompleted,
      statusCancelled: statusCancelled ?? this.statusCancelled,
      statusRejected: statusRejected ?? this.statusRejected,
      statusOverdue: statusOverdue ?? this.statusOverdue,
      statusTextUnassigned: statusTextUnassigned ?? this.statusTextUnassigned,
      statusTextAssigned: statusTextAssigned ?? this.statusTextAssigned,
      statusTextInProgress: statusTextInProgress ?? this.statusTextInProgress,
      statusTextPaused: statusTextPaused ?? this.statusTextPaused,
      statusTextCompleted: statusTextCompleted ?? this.statusTextCompleted,
      statusTextCancelled: statusTextCancelled ?? this.statusTextCancelled,
      statusTextRejected: statusTextRejected ?? this.statusTextRejected,
      shadowCard: shadowCard ?? this.shadowCard,
      shadowElevated: shadowElevated ?? this.shadowElevated,
      shadowFloating: shadowFloating ?? this.shadowFloating,
      actionStart: actionStart ?? this.actionStart,
      actionPause: actionPause ?? this.actionPause,
      actionResume: actionResume ?? this.actionResume,
      actionComplete: actionComplete ?? this.actionComplete,
      actionCancel: actionCancel ?? this.actionCancel,
      actionReject: actionReject ?? this.actionReject,
      syncOffline: syncOffline ?? this.syncOffline,
      syncSyncing: syncSyncing ?? this.syncSyncing,
      syncSynced: syncSynced ?? this.syncSynced,
      syncFailed: syncFailed ?? this.syncFailed,
      syncPending: syncPending ?? this.syncPending,
      stockHigh: stockHigh ?? this.stockHigh,
      stockMedium: stockMedium ?? this.stockMedium,
      stockLow: stockLow ?? this.stockLow,
      stockOut: stockOut ?? this.stockOut,
      documentManual: documentManual ?? this.documentManual,
      documentProcedure: documentProcedure ?? this.documentProcedure,
      documentSchematic: documentSchematic ?? this.documentSchematic,
      documentSpecification:
          documentSpecification ?? this.documentSpecification,
      documentSafety: documentSafety ?? this.documentSafety,
      documentTraining: documentTraining ?? this.documentTraining,
      documentReport: documentReport ?? this.documentReport,
      documentCertificate: documentCertificate ?? this.documentCertificate,
      documentWarranty: documentWarranty ?? this.documentWarranty,
      documentOther: documentOther ?? this.documentOther,
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
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      backgroundElevated: backgroundElevated ?? this.backgroundElevated,
      backgroundOverlay: backgroundOverlay ?? this.backgroundOverlay,
    );
  }

  @override
  FSMThemeExtension lerp(
    covariant ThemeExtension<FSMThemeExtension>? other,
    double t,
  ) {
    if (other is! FSMThemeExtension) {
      return this;
    }

    return FSMThemeExtension(
      cardGradient: LinearGradient.lerp(cardGradient, other.cardGradient, t) ??
          cardGradient,
      workOrderLow: Color.lerp(workOrderLow, other.workOrderLow, t)!,
      workOrderMedium: Color.lerp(workOrderMedium, other.workOrderMedium, t)!,
      workOrderHigh: Color.lerp(workOrderHigh, other.workOrderHigh, t)!,
      workOrderUrgent: Color.lerp(workOrderUrgent, other.workOrderUrgent, t)!,
      statusUnassigned:
          Color.lerp(statusUnassigned, other.statusUnassigned, t)!,
      statusAssigned: Color.lerp(statusAssigned, other.statusAssigned, t)!,
      statusInProgress:
          Color.lerp(statusInProgress, other.statusInProgress, t)!,
      statusPaused: Color.lerp(statusPaused, other.statusPaused, t)!,
      statusPending: Color.lerp(statusPending, other.statusPending, t)!,
      statusCompleted: Color.lerp(statusCompleted, other.statusCompleted, t)!,
      statusCancelled: Color.lerp(statusCancelled, other.statusCancelled, t)!,
      statusRejected: Color.lerp(statusRejected, other.statusRejected, t)!,
      statusOverdue: Color.lerp(statusOverdue, other.statusOverdue, t)!,
      statusTextUnassigned:
          Color.lerp(statusTextUnassigned, other.statusTextUnassigned, t)!,
      statusTextAssigned:
          Color.lerp(statusTextAssigned, other.statusTextAssigned, t)!,
      statusTextInProgress:
          Color.lerp(statusTextInProgress, other.statusTextInProgress, t)!,
      statusTextPaused:
          Color.lerp(statusTextPaused, other.statusTextPaused, t)!,
      statusTextCompleted:
          Color.lerp(statusTextCompleted, other.statusTextCompleted, t)!,
      statusTextCancelled:
          Color.lerp(statusTextCancelled, other.statusTextCancelled, t)!,
      statusTextRejected:
          Color.lerp(statusTextRejected, other.statusTextRejected, t)!,
      shadowCard: Color.lerp(shadowCard, other.shadowCard, t)!,
      shadowElevated: Color.lerp(shadowElevated, other.shadowElevated, t)!,
      shadowFloating: Color.lerp(shadowFloating, other.shadowFloating, t)!,
      actionStart: Color.lerp(actionStart, other.actionStart, t)!,
      actionPause: Color.lerp(actionPause, other.actionPause, t)!,
      actionResume: Color.lerp(actionResume, other.actionResume, t)!,
      actionComplete: Color.lerp(actionComplete, other.actionComplete, t)!,
      actionCancel: Color.lerp(actionCancel, other.actionCancel, t)!,
      actionReject: Color.lerp(actionReject, other.actionReject, t)!,
      syncOffline: Color.lerp(syncOffline, other.syncOffline, t)!,
      syncSyncing: Color.lerp(syncSyncing, other.syncSyncing, t)!,
      syncSynced: Color.lerp(syncSynced, other.syncSynced, t)!,
      syncFailed: Color.lerp(syncFailed, other.syncFailed, t)!,
      syncPending: Color.lerp(syncPending, other.syncPending, t)!,
      stockHigh: Color.lerp(stockHigh, other.stockHigh, t)!,
      stockMedium: Color.lerp(stockMedium, other.stockMedium, t)!,
      stockLow: Color.lerp(stockLow, other.stockLow, t)!,
      stockOut: Color.lerp(stockOut, other.stockOut, t)!,
      documentManual: Color.lerp(documentManual, other.documentManual, t)!,
      documentProcedure:
          Color.lerp(documentProcedure, other.documentProcedure, t)!,
      documentSchematic:
          Color.lerp(documentSchematic, other.documentSchematic, t)!,
      documentSpecification:
          Color.lerp(documentSpecification, other.documentSpecification, t)!,
      documentSafety: Color.lerp(documentSafety, other.documentSafety, t)!,
      documentTraining:
          Color.lerp(documentTraining, other.documentTraining, t)!,
      documentReport: Color.lerp(documentReport, other.documentReport, t)!,
      documentCertificate:
          Color.lerp(documentCertificate, other.documentCertificate, t)!,
      documentWarranty:
          Color.lerp(documentWarranty, other.documentWarranty, t)!,
      documentOther: Color.lerp(documentOther, other.documentOther, t)!,
      workOrderCardBackground: Color.lerp(
          workOrderCardBackground, other.workOrderCardBackground, t)!,
      workOrderCardBorder:
          Color.lerp(workOrderCardBorder, other.workOrderCardBorder, t)!,
      searchBarBackground:
          Color.lerp(searchBarBackground, other.searchBarBackground, t)!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      avatarBackground:
          Color.lerp(avatarBackground, other.avatarBackground, t)!,
      fabBackground: Color.lerp(fabBackground, other.fabBackground, t)!,
      bottomSheetBackground:
          Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t)!,
      offlineBannerBackground: Color.lerp(
          offlineBannerBackground, other.offlineBannerBackground, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      backgroundElevated:
          Color.lerp(backgroundElevated, other.backgroundElevated, t)!,
      backgroundOverlay:
          Color.lerp(backgroundOverlay, other.backgroundOverlay, t)!,
    );
  }
}

/// Extension methods for easy access to FSM theme extensions
extension FSMThemeExtensionContext on BuildContext {
  FSMThemeExtension get fsmTheme {
    final extension = Theme.of(this).extension<FSMThemeExtension>();
    assert(extension != null, 'FSMThemeExtension not found in theme');
    return extension ?? FSMThemeExtension.light;
  }
}

/// Helper extension for backward compatibility with string-based lookups
///
/// These methods provide fallback for existing code that uses string keys.
/// New code should access properties directly (e.g., fsmTheme.statusPending)
extension FSMThemeHelpers on FSMThemeExtension {
  /// Get status color by string key (backward compatibility)
  Color getStatusColor(String status) {
    return switch (status.toLowerCase()) {
      'unassigned' => statusUnassigned,
      'assigned' => statusAssigned,
      'in_progress' || 'inprogress' => statusInProgress,
      'paused' => statusPaused,
      'completed' => statusCompleted,
      'cancelled' => statusCancelled,
      'rejected' => statusRejected,
      'overdue' => statusOverdue,
      _ => statusAssigned, // Default fallback
    };
  }

  /// Get priority color by string key (backward compatibility)
  Color getPriorityColor(String priority) {
    return switch (priority.toLowerCase()) {
      'low' => workOrderLow,
      'medium' => workOrderMedium,
      'high' => workOrderHigh,
      'urgent' => workOrderUrgent,
      _ => workOrderMedium, // Default fallback
    };
  }

  /// Get shadow color by string key (backward compatibility)
  Color getShadowColor(String type) {
    return switch (type.toLowerCase()) {
      'card' => shadowCard,
      'elevated' => shadowElevated,
      'floating' => shadowFloating,
      _ => shadowCard, // Default fallback
    };
  }

  /// Get action color by string key (backward compatibility)
  Color getActionColor(String action) {
    return switch (action.toLowerCase()) {
      'start' => actionStart,
      'pause' => actionPause,
      'resume' => actionResume,
      'complete' => actionComplete,
      'cancel' => actionCancel,
      'reject' => actionReject,
      _ => actionStart, // Default fallback
    };
  }

  /// Get sync status color by string key (backward compatibility)
  Color getSyncStatusColor(String status) {
    return switch (status.toLowerCase()) {
      'offline' => syncOffline,
      'syncing' => syncSyncing,
      'synced' => syncSynced,
      'failed' => syncFailed,
      'pending' => syncPending,
      _ => syncOffline, // Default fallback
    };
  }

  /// Get stock color by string key (backward compatibility)
  Color getStockColor(String level) {
    return switch (level.toLowerCase()) {
      'high' => stockHigh,
      'medium' => stockMedium,
      'low' => stockLow,
      'out' => stockOut,
      _ => stockMedium, // Default fallback
    };
  }

  /// Convenience method to get stock color by quantity levels
  Color getStockColorByQuantity(
    int quantity,
    int minQuantity,
    int maxQuantity,
  ) {
    if (quantity == 0) return stockOut;
    if (quantity <= minQuantity) return stockLow;
    if (quantity < maxQuantity * 0.5) return stockMedium;
    return stockHigh;
  }

  /// Safely get status color with null check
  Color safeStatusColor(String? status) {
    if (status == null || status.isEmpty) return statusAssigned;
    return getStatusColor(status);
  }

  /// Safely get priority color with null check
  Color safePriorityColor(String? priority) {
    if (priority == null || priority.isEmpty) return workOrderMedium;
    return getPriorityColor(priority);
  }
}
