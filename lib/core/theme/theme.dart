/// Central export file for all theme-related components
/// This file provides a single import point for all theming needs throughout the FSM app
///
/// Usage: import 'package:fsm/core/theme/theme.dart';
/// This gives you access to:
/// - AppColors: All color constants and helper methods
/// - AppDimensions: Responsive sizing and spacing values
/// - AppTextStyles: Typography styles with ScreenUtil integration
/// - AppTheme: Complete light and dark theme configurations
/// - ThemeConstants: Additional theme constants (animations, shadows, etc.)
/// - Theme Components: Reusable themed widgets

// Core Theme System
export 'app_colors.dart';
export 'app_dimensions.dart';
export 'app_text_styles.dart';
export 'app_theme.dart';
export 'theme_constants.dart';

// Theme Extensions
export 'extensions/fsm_theme_extension.dart';

// Theme Components (Custom Widgets)
export 'components/gradient_app_bar.dart';
export 'components/gradient_elevated_button.dart';