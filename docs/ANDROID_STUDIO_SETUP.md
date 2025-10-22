# Android Studio Configuration for FSM Flutter App

This guide explains how to configure Android Studio to work with the FSM app's industry-standard Flutter flavor setup.

## 🎯 Overview

The FSM app uses a **single `main.dart`** entry point with **flavor-based environment configuration**. Android Studio has been configured with predefined run configurations for each environment.

## 🏃‍♂️ Pre-configured Run Configurations

### Available Configurations

1. **FSM Development** - Debug mode with `dev` flavor
2. **FSM Staging** - Debug mode with `staging` flavor  
3. **FSM Production** - Profile mode with `prod` flavor
4. **FSM Production Release** - Release mode with `prod` flavor
5. **Flutter Tests** - Run tests with `dev` environment

### How to Use

1. **Open the project** in Android Studio
2. **Select run configuration** from the dropdown next to the run button
3. **Choose your desired environment**:
   - `FSM Development` for local development
   - `FSM Staging` for testing staging APIs
   - `FSM Production` for production testing
4. **Click Run** (▶️) or Debug (🐛)

## 🔧 Manual Configuration (If Needed)

If the run configurations don't appear automatically, follow these steps:

### Step 1: Create New Flutter Configuration

1. Go to **Run** → **Edit Configurations**
2. Click **+** → **Flutter**
3. Configure as follows:

#### Development Configuration
- **Name**: `FSM Development`
- **Dart entry point**: `lib/main.dart`
- **Build flavor**: `dev`
- **Additional arguments**: `--flavor dev --dart-define=FLUTTER_FLAVOR=dev`

#### Staging Configuration  
- **Name**: `FSM Staging`
- **Dart entry point**: `lib/main.dart`
- **Build flavor**: `staging`
- **Additional arguments**: `--flavor staging --dart-define=FLUTTER_FLAVOR=staging`

#### Production Configuration
- **Name**: `FSM Production`
- **Dart entry point**: `lib/main.dart` 
- **Build flavor**: `prod`
- **Additional arguments**: `--flavor prod --dart-define=FLUTTER_FLAVOR=prod`

#### Production Release Configuration
- **Name**: `FSM Production Release`
- **Dart entry point**: `lib/main.dart`
- **Build flavor**: `prod` 
- **Additional arguments**: `--dart-define=FLUTTER_FLAVOR=prod --release`

### Step 2: Configure Flutter SDK

1. Go to **File** → **Settings** (Windows/Linux) or **Android Studio** → **Preferences** (macOS)
2. Navigate to **Languages & Frameworks** → **Flutter**
3. Set **Flutter SDK path** to your Flutter installation directory
4. Ensure **Dart SDK path** is automatically detected

### Step 3: Configure Build Variants (Android)

1. Open **Build** → **Select Build Variant**
2. Choose the appropriate variant:
   - `devDebug` for development
   - `stagingDebug` for staging
   - `prodRelease` for production

## 🚀 Build Commands

### Via Android Studio Terminal

You can also use these commands in the Android Studio terminal:

```bash
# Development
flutter run --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Staging
flutter run --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Production
flutter run --flavor prod --dart-define=FLUTTER_FLAVOR=prod
```

### Build APKs

```bash
# Development APK
flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Staging APK  
flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Production APK
flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
```

## 🧪 Testing Configuration

### Running Tests

1. Select **Flutter Tests** run configuration
2. Click **Run** to execute all tests with development environment
3. Or use terminal: `flutter test --dart-define=FLUTTER_FLAVOR=dev`

### Widget Testing

Widget tests automatically use the development environment configuration.

## 🔍 Debugging

### Debug Mode Features

- **Hot Reload** (Ctrl+\\) - Available in debug mode
- **Hot Restart** (Ctrl+Shift+\\) - Available in debug mode  
- **Flutter Inspector** - View widget tree and properties
- **Flutter Outline** - Navigate widget structure
- **Breakpoints** - Set breakpoints in Dart code

### Environment-Specific Debugging

Each run configuration automatically:
- Loads the correct environment settings
- Connects to appropriate API endpoints
- Uses environment-specific app names and bundle IDs
- Applies correct logging levels

## 📱 Device Management

### Running on Different Devices

1. **Connect device** or start emulator
2. **Select device** from device dropdown
3. **Choose run configuration** for desired environment
4. **Click Run**

### Multiple Devices

You can run different flavors simultaneously on different devices:
- Development on Emulator
- Staging on Physical Device
- Production on Different Emulator

## 🛠️ Advanced Configuration

### Custom Dart Defines

To add additional dart defines:

1. **Edit run configuration**
2. **Add to Additional arguments**: `--dart-define=KEY=VALUE`
3. **Apply and run**

### Environment Variables

Set environment variables in run configuration:
1. **Edit configuration**
2. **Environment variables** section
3. **Add**: `FLUTTER_FLAVOR=dev` (if needed)

### Gradle Build Variants

For Android builds, ensure these variants are available:
- `devDebug` / `devRelease`
- `stagingDebug` / `stagingRelease`
- `prodDebug` / `prodRelease`

## 🚨 Troubleshooting

### Common Issues

#### 1. **Flavor not found error**
**Solution**: Ensure Android flavors are properly configured in `android/app/build.gradle.kts`

#### 2. **Dart defines not working**
**Solution**: Verify `--dart-define=FLUTTER_FLAVOR=xxx` is in Additional arguments

#### 3. **Wrong environment loaded**
**Solution**: Check the run configuration and ensure correct dart defines

#### 4. **Build failures**  
**Solution**: Clean and rebuild:
```bash
flutter clean
flutter pub get
flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev
```

### Verification Steps

1. **Check current environment** in app logs
2. **Verify API endpoints** match expected environment
3. **Confirm app name** matches flavor (FSM Dev, FSM Staging, FSM)

## 📋 Quick Reference

| Environment | Run Configuration | Command |
|------------|------------------|---------|
| Development | FSM Development | `flutter run --flavor dev --dart-define=FLUTTER_FLAVOR=dev` |
| Staging | FSM Staging | `flutter run --flavor staging --dart-define=FLUTTER_FLAVOR=staging` |
| Production | FSM Production | `flutter run --flavor prod --dart-define=FLUTTER_FLAVOR=prod` |

## 🎉 Benefits

### ✅ **Developer Experience**
- **One-click environment switching** via run configurations
- **No manual environment selection** - automated via flavors
- **Integrated debugging** for each environment
- **Hot reload support** across all environments

### ✅ **Team Collaboration**
- **Shared run configurations** via version control
- **Consistent environment setup** across team members
- **No manual configuration** required for new developers
- **Standardized build process** for all team members

This configuration ensures that Android Studio works seamlessly with the FSM app's industry-standard Flutter flavor implementation!