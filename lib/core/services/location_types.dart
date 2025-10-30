// Location service enums and types

/// Enhanced location accuracy levels
enum LocationAccuracy {
  lowest, // ~500m - for background tracking
  low, // ~100m - for general location
  medium, // ~50m - for most use cases
  high, // ~10m - for precise location
  best, // ~1m - for navigation/mapping
}

/// Location-specific error types
enum LocationErrorType {
  serviceDisabled,
  permissionDenied,
  timeout,
  inaccurate,
  general,
}
