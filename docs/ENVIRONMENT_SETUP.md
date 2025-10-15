# Flutter Flavors & Environment Configuration

This document explains the **industry-standard** approach for managing environments in the FSM Flutter app using a single `main.dart` entry point with proper flavors.

## Overview

The FSM app implements **Flutter flavors** following industry best practices:
- ✅ Single `main.dart` entry point
- ✅ Compile-time environment resolution via `--dart-define`
- ✅ Proper Android `productFlavors` configuration
- ✅ iOS build configurations with different bundle IDs
- ✅ Environment-specific app names and icons
- ✅ Type-safe environment detection

## Running the App

### Method 1: Using Build Scripts (Recommended)

```bash
# Development Environment
./scripts/run_dev.sh

# Staging Environment  
./scripts/run_staging.sh

# Production Environment
./scripts/run_prod.sh
```

### Method 2: Flutter Commands with Flavors

```bash
# Development
flutter run --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Staging
flutter run --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Production
flutter run --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
```

### Method 3: IDE Launch Configurations

#### **VS Code**
Use the pre-configured launch options in VS Code:
- `FSM Development` - Debug mode with dev flavor
- `FSM Staging` - Debug mode with staging flavor  
- `FSM Production` - Profile mode with prod flavor
- `FSM Production Release` - Release mode for production testing

#### **Android Studio / IntelliJ IDEA**
Pre-configured run configurations available:
- `FSM Development` - Debug with dev flavor
- `FSM Staging` - Debug with staging flavor
- `FSM Production` - Profile with prod flavor  
- `FSM Production Release` - Release with prod flavor
- `Flutter Tests` - Test runner with dev environment

**Setup**: Open project in Android Studio → Select configuration from dropdown → Click Run

## Building the App

### Using Build Scripts

```bash
# Development build
./scripts/build_dev.sh

# Staging build
./scripts/build_staging.sh

# Production build
./scripts/build_prod.sh
```

### Using Flutter Commands

```bash
# Development APK
flutter build apk --dart-define=ENVIRONMENT=dev

# Staging APK
flutter build apk --dart-define=ENVIRONMENT=staging

# Production APK
flutter build apk --dart-define=ENVIRONMENT=prod --release
```

## Environment Resolution Priority

The `EnvironmentResolver` checks for environment configuration in the following order:

1. **Compile-time environment variable** (`--dart-define=ENVIRONMENT=xxx`)
2. **Runtime environment variable** (`ENVIRONMENT=xxx`)
3. **Flavor-based environment** (`--dart-define=FLAVOR=xxx`)
4. **Default to development** (if none specified)

## Available Environments

| Environment | Description | Base URL | Debug Mode |
|------------|-------------|----------|------------|
| `dev` | Development | `http://192.168.1.2:3011/api` | ✅ |
| `staging` | Staging | `https://staging-api.fsm-app.com/api` | ❌ |
| `prod` | Production | `https://api.fsm-app.com/api` | ❌ |

## Architecture Benefits

### Before (Multiple Main Files)
- ❌ Multiple entry points to maintain
- ❌ Code duplication across main files
- ❌ Harder to add new environments
- ❌ Build scripts needed to target specific files

### After (Single Main File)
- ✅ Single entry point with dynamic configuration
- ✅ Environment resolution at runtime
- ✅ Easy to add new environments
- ✅ Cleaner build configuration
- ✅ Better maintainability

## Legacy Support

The old main files (`main_dev.dart`, `main_staging.dart`, `main_prod.dart`) are still present but marked as deprecated. They will continue to work but should be migrated to use the new approach.

## IDE Configuration

### VS Code

Create launch configurations in `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "FSM Dev",
      "request": "launch",
      "type": "dart",
      "toolArgs": ["--dart-define=ENVIRONMENT=dev"]
    },
    {
      "name": "FSM Staging", 
      "request": "launch",
      "type": "dart",
      "toolArgs": ["--dart-define=ENVIRONMENT=staging"]
    },
    {
      "name": "FSM Production",
      "request": "launch", 
      "type": "dart",
      "toolArgs": ["--dart-define=ENVIRONMENT=prod"]
    }
  ]
}
```

### Android Studio / IntelliJ

1. Go to Run → Edit Configurations
2. Create new Flutter configuration
3. Add `--dart-define=ENVIRONMENT=dev` to Additional Arguments

## Migration Guide

If you're currently using the old approach, simply switch to using:

```bash
# Old way
flutter run --target lib/main_dev.dart

# New way  
flutter run --dart-define=ENVIRONMENT=dev
```

The environment-specific configurations remain the same - only the entry point has been consolidated.