#!/bin/bash
echo "Building FSM App for Production (Android APK)..."
flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release