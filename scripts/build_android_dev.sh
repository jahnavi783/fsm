#!/bin/bash
echo "Building FSM App for Development (Android APK)..."
flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev