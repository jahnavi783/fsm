#!/bin/bash
echo "Building FSM App Production..."

# Check if building for Android specifically
if [[ "$1" == "android" ]]; then
    flutter build apk --flavor prod --dart-define=FLUTTER_FLAVOR=prod --release
else
    # Cross-platform build (iOS, etc.)
    flutter build --dart-define=FLUTTER_FLAVOR=prod --release
fi