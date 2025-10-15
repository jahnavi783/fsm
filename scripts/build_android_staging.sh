#!/bin/bash
echo "Building FSM App for Staging (Android APK)..."
flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging