#!/bin/bash
echo "Building FSM App for Development..."

# Check if building for Android specifically
if [[ "$1" == "android" ]]; then
    flutter build apk --flavor dev --dart-define=FLUTTER_FLAVOR=dev
else
    # Cross-platform build (iOS, etc.)
    flutter build --dart-define=FLUTTER_FLAVOR=dev
fi