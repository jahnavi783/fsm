# Industry-Standard Flutter Flavors Implementation

This guide explains how the FSM app implements **industry-standard Flutter flavors** with a single main entry point.

## 🏗️ Architecture Overview

### Single Entry Point Pattern
```
main.dart (single entry point)
├── Environment.initialize() 
├── Flavor detection via --dart-define=FLUTTER_FLAVOR
├── AppConfig.setEnvironment()
└── App initialization
```

### Environment Detection Flow
1. **Build time**: `--dart-define=FLUTTER_FLAVOR=dev`
2. **Runtime**: `String.fromEnvironment('FLUTTER_FLAVOR')`  
3. **Configuration**: Map to appropriate `AppEnvironment`
4. **Injection**: Use environment name for DI configuration

## 📱 Platform Configuration

### Android Flavors (`android/app/build.gradle.kts`)

```kotlin
flavorDimensions += "environment"

productFlavors {
    create("dev") {
        dimension = "environment"
        applicationIdSuffix = ".dev"
        versionNameSuffix = "-dev"
        resValue("string", "app_name", "FSM Dev")
    }
    
    create("staging") {
        dimension = "environment" 
        applicationIdSuffix = ".staging"
        versionNameSuffix = "-staging"
        resValue("string", "app_name", "FSM Staging")
    }
    
    create("prod") {
        dimension = "environment"
        resValue("string", "app_name", "FSM")
    }
}
```

### iOS Configurations

- `ios/Flutter/Dev.xcconfig` - Development configuration
- `ios/Flutter/Staging.xcconfig` - Staging configuration  
- `ios/Flutter/Prod.xcconfig` - Production configuration

Each file contains:
- Bundle identifier (`PRODUCT_BUNDLE_IDENTIFIER`)
- App name (`PRODUCT_NAME`)
- Flavor definition (`FLUTTER_FLAVOR`)

## 🔧 Command Reference

### Development Commands
```bash
# Run
flutter run --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Build APK
flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev

# Build iOS
flutter build ios --flavor dev --dart-define=FLUTTER_FLAVOR=dev
```

### Staging Commands  
```bash
# Run
flutter run --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Build APK
flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging

# Build iOS
flutter build ios --flavor staging --dart-define=FLUTTER_FLAVOR=staging
```

### Production Commands
```bash
# Run
flutter run --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release

# Build APK  
flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release

# Build iOS
flutter build ios --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
```

## 🎯 Benefits of This Approach

### ✅ Industry Standards
- Single entry point (recommended by Flutter team)
- Compile-time configuration resolution  
- Proper use of `--dart-define` for build variants
- Clean separation of concerns

### ✅ Developer Experience
- No code duplication across entry points
- Type-safe environment detection
- IDE integration with launch configurations
- Simplified CI/CD pipeline setup

### ✅ Maintainability  
- Single source of truth for app initialization
- Easy to add new environments
- Consistent build process across platforms
- Better error handling and debugging

## 🚀 CI/CD Integration

### GitHub Actions Example
```yaml
- name: Build Dev APK
  run: flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev
  
- name: Build Staging APK  
  run: flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging
  
- name: Build Production APK
  run: flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
```

### Fastlane Integration
```ruby
lane :build_dev do
  flutter(
    flavor: "dev",
    dart_define: "FLUTTER_FLAVOR=dev"
  )
end

lane :build_prod do
  flutter(
    flavor: "prod", 
    dart_define: "FLUTTER_FLAVOR=prod",
    release: true
  )
end
```

## 🔍 Environment Detection Code

```dart
class Environment {
  static void initialize() {
    const flavor = String.fromEnvironment('FLUTTER_FLAVOR', defaultValue: 'dev');
    
    switch (flavor.toLowerCase()) {
      case 'prod':
        _current = ProductionEnvironment();
        break;
      case 'staging':
        _current = StagingEnvironment();  
        break;
      case 'dev':
      default:
        _current = DevEnvironment();
        break;
    }
  }
}
```

This implementation follows **Flutter's official recommendations** and **industry best practices** for production-ready apps.