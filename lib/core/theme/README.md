# FSM App Theme System

This directory contains the comprehensive theme system for the Field Service Management (FSM) Flutter application. The theme system provides centralized styling, responsive design, and consistent visual elements throughout the app.

## Architecture Overview

### Core Files

1. **`theme.dart`** - Central barrel file that exports all theme components
2. **`app_colors.dart`** - All color definitions and color helper methods
3. **`app_dimensions.dart`** - Responsive dimensions using ScreenUtil
4. **`app_text_styles.dart`** - Typography styles with ScreenUtil integration
5. **`app_theme.dart`** - Complete Material 3 theme configurations
6. **`theme_constants.dart`** - Additional theme constants (animations, shadows, etc.)

### Extensions

- **`extensions/fsm_theme_extension.dart`** - Custom theme extensions for FSM-specific styling

### Components

- **`components/`** - Reusable themed widgets like gradient buttons and app bars

## Usage

### Basic Import

```dart
import 'package:fsm/core/theme/theme.dart';
```

This single import gives you access to:
- `AppColors` - All color constants and methods
- `AppDimensions` - Responsive sizing
- `AppTextStyles` - Typography
- `AppTheme` - Complete themes
- `ThemeConstants` - Additional constants
- `FSMThemeExtension` - Custom extensions

### Using Colors

```dart
// Basic colors
Container(
  color: AppColors.primary,
  child: Text(
    'Hello',
    style: TextStyle(color: AppColors.onPrimary),
  ),
)

// Status colors
Container(
  color: AppColors.getStatusColor('in_progress'),
  child: Text('In Progress'),
)

// Priority colors
Icon(
  Icons.priority_high,
  color: AppColors.getPriorityColor('urgent'),
)
```

### Using Dimensions

```dart
// Responsive padding and margins
Padding(
  padding: EdgeInsets.all(AppDimensions.paddingMedium), // 16.w
  child: Container(
    height: AppDimensions.buttonHeight, // 48.h
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall), // 8.r
    ),
  ),
)

// Responsive spacing
Column(
  children: [
    Widget1(),
    SizedBox(height: AppDimensions.spaceMedium), // 16.h
    Widget2(),
  ],
)
```

### Using Text Styles

```dart
// Standard Material 3 text styles
Text(
  'Headline',
  style: AppTextStyles.headlineMedium,
)

// Custom app-specific styles
Text(
  'Primary Text',
  style: AppTextStyles.primaryText,
)

// Status-specific styles
Text(
  'Completed',
  style: AppTextStyles.getStatusStyle('completed'),
)
```

### Using Theme Extensions

```dart
// Access FSM theme extension
Widget build(BuildContext context) {
  final fsmTheme = context.fsmTheme;
  
  return Container(
    color: fsmTheme.workOrderCardBackground,
    decoration: BoxDecoration(
      gradient: fsmTheme.cardGradient,
      border: Border.all(color: fsmTheme.workOrderCardBorder),
    ),
    child: Text(
      'Status',
      style: TextStyle(
        color: fsmTheme.getStatusColor('in_progress'),
      ),
    ),
  );
}
```

### Using Theme Constants

```dart
// Animations
AnimatedContainer(
  duration: ThemeConstants.mediumAnimation,
  curve: ThemeConstants.defaultCurve,
  // ...
)

// Shadows
Container(
  decoration: BoxDecoration(
    boxShadow: ThemeConstants.cardShadow,
  ),
)

// Gradients
Container(
  decoration: BoxDecoration(
    gradient: ThemeConstants.getStatusGradient('completed'),
  ),
)
```

## Theme Structure

### Color System

The color system follows Material Design 3 guidelines with FSM-specific additions:

- **Brand Colors**: Primary (`#116587`) and Secondary (`#00A74F`)
- **System Colors**: Error, warning, success, info
- **Status Colors**: For work order states (assigned, in_progress, completed, etc.)
- **Priority Colors**: For priority levels (low, medium, high, urgent)
- **Semantic Colors**: Text colors, backgrounds, surfaces

### Typography Scale

All text styles use the Inter font family and ScreenUtil for responsive sizing:

- **Display**: Large headings (32-57sp)
- **Headline**: Section headings (18-32sp)
- **Title**: Card titles and labels (12-22sp)
- **Body**: Body text (12-16sp)
- **Label**: Button text and captions (10-14sp)

### Responsive Dimensions

All dimensions are responsive using ScreenUtil:

- **Base Design Size**: 375×812 (iPhone 11 Pro)
- **Padding/Margins**: 4w to 32w
- **Radii**: 4r to 24r
- **Icons**: 16sp to 48sp
- **Heights**: 48h to 80h

### Dark Theme Support

The theme system provides comprehensive dark theme support:

- Automatic color scheme switching
- Dark-optimized colors for better readability
- Consistent component theming across light/dark modes

## Best Practices

### 1. Always Use Responsive Units

❌ **Don't:**
```dart
padding: EdgeInsets.all(16),
fontSize: 14,
```

✅ **Do:**
```dart
padding: EdgeInsets.all(AppDimensions.paddingMedium),
fontSize: 14.sp, // or AppTextStyles.bodyMedium
```

### 2. Use Semantic Colors

❌ **Don't:**
```dart
color: Color(0xFF116587),
```

✅ **Do:**
```dart
color: AppColors.primary,
// or for status/priority:
color: AppColors.getStatusColor('completed'),
```

### 3. Leverage Theme Extensions

❌ **Don't:**
```dart
color: Theme.of(context).primaryColor,
```

✅ **Do:**
```dart
color: context.fsmTheme.getStatusColor('in_progress'),
```

### 4. Use Predefined Text Styles

❌ **Don't:**
```dart
TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
```

✅ **Do:**
```dart
AppTextStyles.titleMedium
```

## Adding New Theme Elements

### Adding New Colors

1. Add the color constant to `app_colors.dart`
2. Add dark theme variant if needed
3. Update helper methods if applicable

### Adding New Dimensions

1. Add responsive dimension to `app_dimensions.dart`
2. Use ScreenUtil units (.w, .h, .r, .sp)

### Adding New Text Styles

1. Add style to `app_text_styles.dart`
2. Use ScreenUtil for font size
3. Follow Material 3 typography scale

### Adding Theme Extensions

1. Update `FSMThemeExtension` in `extensions/fsm_theme_extension.dart`
2. Add both light and dark variants
3. Update the `copyWith` and `lerp` methods

## Migration Guide

If you're updating existing code to use the new theme system:

1. Replace all hardcoded colors with `AppColors` constants
2. Replace all hardcoded dimensions with `AppDimensions` values
3. Replace custom text styles with `AppTextStyles`
4. Use `context.fsmTheme` for FSM-specific theme access
5. Ensure all sizes use ScreenUtil responsive units

## Environment-Specific Theming

The theme system automatically adapts to different environments:

- **Development**: May include debug-specific styling
- **Staging**: Uses production colors with staging indicators
- **Production**: Full production theme

Theme selection is handled automatically based on the current `AppConfig.environment`.