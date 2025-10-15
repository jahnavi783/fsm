# Golden Tests

Golden tests are visual regression tests that capture screenshots of widgets and pages to ensure UI consistency across changes.

## Overview

This directory contains golden tests for the FSM Mobile App, organized by component type:

- `widgets/` - Tests for individual UI components
- `pages/` - Tests for complete pages
- `golden_test_config.dart` - Shared configuration and utilities

## Test Structure

### Widget Tests
- **Auth Widgets**: Login form, buttons, loading indicators
- **Work Order Widgets**: Cards, status chips, shimmer effects
- **Core Widgets**: Custom buttons, connectivity indicators, sync status

### Page Tests
- **Auth Pages**: Login page, splash screen with different states
- **Dashboard Page**: Work order dashboard with various data states

## Device Coverage

Tests run on multiple device sizes:
- Phone (standard Android phone)
- iPhone 11
- Tablet Portrait
- Tablet Landscape

## Running Golden Tests

### Generate New Golden Files
```bash
flutter test --update-goldens
```

### Run Golden Tests
```bash
flutter test test/golden/
```

### Run Specific Golden Test
```bash
flutter test test/golden/widgets/auth_widgets_golden_test.dart
```

## Golden File Management

Golden files are stored in `test/golden/goldens/` and should be committed to version control. When UI changes are made:

1. Review the visual changes
2. Update golden files if changes are intentional
3. Commit the updated golden files

## Test Scenarios

Each test covers multiple scenarios:
- **Different States**: Loading, success, error, empty
- **Various Props**: Different button types, status values, data sets
- **Device Sizes**: Responsive design verification
- **Theme Variations**: Light/dark themes (when applicable)

## Best Practices

1. **Descriptive Names**: Use clear scenario names that describe what's being tested
2. **Comprehensive Coverage**: Test all major UI states and variations
3. **Device Testing**: Ensure responsive design works across device sizes
4. **Regular Updates**: Keep golden files updated with UI changes
5. **Review Changes**: Always review golden file changes before committing

## Troubleshooting

### Golden Test Failures
- Check if UI changes are intentional
- Update goldens with `--update-goldens` if changes are correct
- Verify font loading and asset availability

### Platform Differences
- Golden tests may produce slightly different results on different platforms
- Use consistent CI environment for golden test validation
- Consider platform-specific golden files if necessary

## Configuration

The `GoldenTestConfig` class provides:
- Device configurations for testing
- Theme and wrapper setup
- Font loading utilities
- Consistent test environment setup