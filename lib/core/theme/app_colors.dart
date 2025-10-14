import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors (from old theme)
  static const Color brandPrimary = Color(0xFF116587);
  static const Color brandSecondary = Color(0xFF00A74F);

  // Light Theme Colors
  static const Color primary = brandPrimary;
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFB8E6FF);
  static const Color onPrimaryContainer = Color(0xFF001E2B);

  static const Color secondary = brandSecondary;
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF7FFFC7);
  static const Color onSecondaryContainer = Color(0xFF002114);

  static const Color tertiary = Color(0xFF6750A4);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFEADDFF);
  static const Color onTertiaryContainer = Color(0xFF21005D);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  // Updated background and surface colors to match Figma design
  static const Color background = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF454545);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF454545);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color onSurfaceVariant = Color(0xFF8E8E8E);

  // Updated outline colors to match Figma design
  static const Color outline = Color(0xFFD9D9D9);
  static const Color outlineVariant = Color(0xFFE2D6D6);
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color inverseSurface = Color(0xFF2F3033);
  static const Color inverseOnSurface = Color(0xFFF1F0F4);
  static const Color inversePrimary = Color(0xFF6DD3FF);

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFF6DD3FF);
  static const Color onPrimaryDark = Color(0xFF003547);
  static const Color primaryContainerDark = Color(0xFF004D65);
  static const Color onPrimaryContainerDark = Color(0xFFB8E6FF);

  static const Color secondaryDark = Color(0xFF63DFAB);
  static const Color onSecondaryDark = Color(0xFF003826);
  static const Color secondaryContainerDark = Color(0xFF005138);
  static const Color onSecondaryContainerDark = Color(0xFF7FFFC7);

  static const Color tertiaryDark = Color(0xFFD0BCFF);
  static const Color onTertiaryDark = Color(0xFF381E72);
  static const Color tertiaryContainerDark = Color(0xFF4F378B);
  static const Color onTertiaryContainerDark = Color(0xFFEADDFF);

  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

  static const Color backgroundDark = Color(0xFF111316);
  static const Color onBackgroundDark = Color(0xFFE2E2E6);
  static const Color surfaceDark = Color(0xFF111316);
  static const Color onSurfaceDark = Color(0xFFE2E2E6);
  static const Color surfaceVariantDark = Color(0xFF41484D);
  static const Color onSurfaceVariantDark = Color(0xFFC1C7CE);

  static const Color outlineDark = Color(0xFF8B9198);
  static const Color outlineVariantDark = Color(0xFF41484D);
  static const Color shadowDark = Color(0xFF000000);
  static const Color scrimDark = Color(0xFF000000);
  static const Color inverseSurfaceDark = Color(0xFFE2E2E6);
  static const Color inverseOnSurfaceDark = Color(0xFF2F3033);
  static const Color inversePrimaryDark = Color(0xFF116587);

  // Gradient Colors (from old theme)
  static const Color gradientStart = brandPrimary;
  static const Color gradientEnd = brandSecondary;

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Work Order Status Colors
  static const Color statusAssigned = Color(0xFF2196F3);
  static const Color statusInProgress = Color(0xFFFF9800);
  static const Color statusPaused = Color(0xFF9C27B0);
  static const Color statusCompleted = Color(0xFF4CAF50);
  static const Color statusCancelled = Color(0xFFF44336);
  static const Color statusRejected = Color(0xFF795548);

  // Priority Colors - Updated to match Figma design
  static const Color priorityLow = Color(0xFFFFBB00); // Yellow from Figma
  static const Color priorityMedium = Color(0xFF497FE4); // Blue from Figma
  static const Color priorityHigh = Color(0xFFA01313); // Red from Figma
  static const Color priorityUrgent =
      Color(0xFFA01313); // Same as high priority

  // Utility Colors
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Text Colors - Updated to match Figma design
  static const Color textPrimary = Color(0xFF454545);
  static const Color textSecondary = Color(0xFF999494);
  static const Color textTertiary = Color(0xFF8E8E8E);
  static const Color textQuaternary = Color(0xFF6C6C6C);
  static const Color grey = Color(0xFF9E9E9E);

  // Additional UI Colors from Figma
  static const Color searchBackground = Color(0xFFF5F5F5);
  static const Color cardBorder = Color(0xFFD9D9D9);
  static const Color inputBorder = Color(0xFFE2D6D6);
  static const Color disabledBackground = Color(0xFFD9D9D9);

  // Button Colors from Figma
  static const Color buttonPrimary = brandPrimary;
  static const Color buttonSecondary = brandSecondary;
  static const Color buttonDisabled = Color(0xFFD9D9D9);

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static const LinearGradient primaryGradientHorizontal = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [gradientStart, gradientEnd],
  );

  static LinearGradient primaryGradientWithOpacity(double opacity) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        gradientStart.withValues(alpha: opacity),
        gradientEnd.withValues(alpha: opacity),
      ],
    );
  }

  // Helper methods for status colors
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'assigned':
        return statusAssigned;
      case 'in_progress':
      case 'inprogress':
        return statusInProgress;
      case 'paused':
        return statusPaused;
      case 'completed':
        return statusCompleted;
      case 'cancelled':
        return statusCancelled;
      case 'rejected':
        return statusRejected;
      default:
        return grey;
    }
  }

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return priorityLow;
      case 'medium':
        return priorityMedium;
      case 'high':
        return priorityHigh;
      case 'urgent':
        return priorityUrgent;
      default:
        return grey;
    }
  }
}
