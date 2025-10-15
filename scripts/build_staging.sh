#!/bin/bash
echo "Building FSM App for Staging..."

# Check if building for Android specifically
if [[ "$1" == "android" ]]; then
    flutter build apk --flavor staging --dart-define=FLUTTER_FLAVOR=staging
else
    # Cross-platform build (iOS, etc.)
    flutter build --dart-define=FLUTTER_FLAVOR=staging
fi