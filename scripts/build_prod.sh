#!/bin/bash
echo "Building FSM App for Production..."
flutter build apk --flavor prod --target lib/main_prod.dart --release