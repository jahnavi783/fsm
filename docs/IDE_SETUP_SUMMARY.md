# Android Studio & IntelliJ IDEA Integration

## Run Configurations Created ✅

The following run configurations have been created for Android Studio:

### Available Run Configurations:
- **FSM Development** - Debug mode with dev flavor
- **FSM Staging** - Debug mode with staging flavor 
- **FSM Production** - Profile mode with prod flavor
- **FSM Production Release** - Release mode with prod flavor
- **Flutter Tests** - Test runner with dev environment

## Quick Setup Instructions

### 1. Open Project
1. Open Android Studio
2. File → Open → Select FSM project folder
3. Wait for Flutter SDK detection and project sync

### 2. Verify Setup
1. Check that run configurations appear in the dropdown
2. Select "FSM Development" configuration
3. Click Run (▶️) button
4. App should launch with development environment

### 3. Switch Environments
Simply select different run configuration from dropdown:
- Development → `FSM Development`  
- Staging → `FSM Staging`
- Production → `FSM Production`

## Configuration Files Created

### Run Configurations (`.idea/runConfigurations/`)
- `FSM_Development.xml`
- `FSM_Staging.xml` 
- `FSM_Production.xml`
- `FSM_Production_Release.xml`
- `Flutter_Tests.xml`

### Project Settings
- `flutter_build_config.xml` - Build configuration management
- `modules/fsm.iml` - Flutter module configuration

## Command Reference

### Direct Flutter Commands
```bash
# Development
flutter run --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Staging  
flutter run --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Production
flutter run --flavor prod --dart-define=FLUTTER_FLAVOR=prod
```

### Build Commands
```bash
# Build APKs
flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev
flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging  
flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
```

## Benefits

### ✅ One-Click Environment Switching
- No manual configuration needed
- Automatic flavor detection
- Environment-specific settings applied

### ✅ Team Collaboration  
- Shared configurations via Git
- Consistent setup across developers
- No individual setup required

### ✅ Integrated Development
- Full debugging support
- Hot reload for all environments
- Flutter Inspector integration
- Built-in testing support

## Troubleshooting

### Run Configurations Not Showing
1. Restart Android Studio
2. File → Invalidate Caches and Restart
3. Re-import project if needed

### Build Errors
1. Check Flutter SDK path in Settings
2. Ensure all flavors are defined in `android/app/build.gradle.kts`
3. Run `flutter clean && flutter pub get`

Your Android Studio is now fully configured for the FSM Flutter app with industry-standard flavor support! 🎉