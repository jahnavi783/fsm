import 'package:injectable/injectable.dart';
import 'package:location/location.dart' as loc;

import '../constants/app_constants.dart';
import '../error/exceptions.dart';
import '../../features/permission/domain/entities/permission_entity.dart';
import '../../features/permission/domain/repositories/i_permission_repository.dart';

/// Unified Location Service with enhanced functionality and backward compatibility
@injectable
class LocationService {
  final loc.Location _location = loc.Location();
  final IPermissionRepository _permissionRepository;

  LocationService(this._permissionRepository);

  /// Get current location with enhanced error handling (backward compatible)
  Future<loc.LocationData> getCurrentLocation() async {
    final result = await getCurrentLocationEnhanced();

    if (result.isSuccess && result.location != null) {
      // Convert back to LocationData for backward compatibility
      return loc.LocationData.fromMap({
        'latitude': result.location!.latitude,
        'longitude': result.location!.longitude,
        'accuracy': result.location!.accuracy,
        'altitude': result.location!.altitude,
        'heading': result.location!.bearing,
        'speed': result.location!.speed,
        'time': result.location!.timestamp.millisecondsSinceEpoch.toDouble(),
      });
    } else {
      throw LocationException(
          result.error?.message ?? 'Failed to get location');
    }
  }

  /// Enhanced get current location with comprehensive error handling
  Future<LocationResult> getCurrentLocationEnhanced({
    LocationAccuracy accuracy = LocationAccuracy.high,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    try {
      // Step 1: Check location service status
      final serviceResult = await _checkLocationService();
      if (!serviceResult.isSuccess) {
        return LocationResult.error(
          error: LocationError.serviceDisabled(serviceResult.message),
        );
      }

      // Step 2: Check and request permissions
      final permissionResult = await _checkLocationPermissions();
      if (!permissionResult.isSuccess) {
        return LocationResult.error(
          error: LocationError.permissionDenied(permissionResult.message),
        );
      }

      // Step 3: Configure location settings
      await _configureLocationSettings(accuracy);

      // Step 4: Get location with timeout and validation
      final locationData = await _location.getLocation().timeout(
        timeout,
        onTimeout: () {
          throw LocationException(
            'Location request timed out after ${timeout.inSeconds} seconds. '
            'Please ensure you have a clear view of the sky and try again.',
          );
        },
      );

      // Step 5: Validate location data
      final validationResult = _validateLocationData(locationData);
      if (!validationResult.isSuccess) {
        return LocationResult.error(
          error: LocationError.inaccurate(validationResult.message),
        );
      }

      // Step 6: Convert to our domain model
      final location = LocationInfo.fromLocationData(locationData);

      return LocationResult.success(location: location);
    } catch (e) {
      return LocationResult.error(
        error: _handleLocationException(e),
      );
    }
  }

  /// Get location stream for continuous tracking (enhanced)
  Stream<LocationResult> getLocationStreamEnhanced({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10, // meters
    int intervalDuration = 5000, // milliseconds
  }) async* {
    try {
      // Initial permission and service checks
      final serviceCheck = await _checkLocationService();
      if (!serviceCheck.isSuccess) {
        yield LocationResult.error(
          error: LocationError.serviceDisabled(serviceCheck.message),
        );
        return;
      }

      final permissionCheck = await _checkLocationPermissions();
      if (!permissionCheck.isSuccess) {
        yield LocationResult.error(
          error: LocationError.permissionDenied(permissionCheck.message),
        );
        return;
      }

      // Configure settings
      await _configureLocationSettings(accuracy);

      // Start listening to location changes
      await for (final locationData in _location.onLocationChanged) {
        final validationResult = _validateLocationData(locationData);

        if (validationResult.isSuccess) {
          final location = LocationInfo.fromLocationData(locationData);
          yield LocationResult.success(location: location);
        } else {
          yield LocationResult.error(
            error: LocationError.inaccurate(validationResult.message),
          );
        }
      }
    } catch (e) {
      yield LocationResult.error(
        error: _handleLocationException(e),
      );
    }
  }

  // Backward compatible methods
  Future<bool> isLocationServiceEnabled() async {
    return await isLocationServiceAvailable();
  }

  Future<loc.PermissionStatus> getLocationPermissionStatus() async {
    return await _location.hasPermission();
  }

  Future<bool> requestLocationService() async {
    return await _location.requestService();
  }

  Future<loc.PermissionStatus> requestLocationPermission() async {
    return await _location.requestPermission();
  }

  Stream<loc.LocationData> getLocationStream() {
    return _location.onLocationChanged;
  }

  // Enhanced methods

  /// Check if location service is currently available
  Future<bool> isLocationServiceAvailable() async {
    try {
      final serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) return false;

      final permissionResult =
          await _permissionRepository.checkPermissionStatus(
        AppPermission.locationWhenInUse,
      );

      return permissionResult.fold(
        (failure) => false,
        (status) => status.isGranted,
      );
    } catch (e) {
      return false;
    }
  }

  /// Get last known location (cached)
  Future<LocationResult> getLastKnownLocation() async {
    try {
      // This would typically come from a cache or database
      // For now, we'll try to get current location with a short timeout
      return await getCurrentLocationEnhanced(
        timeout: const Duration(seconds: 5),
      );
    } catch (e) {
      return LocationResult.error(
        error: LocationError.general('No cached location available'),
      );
    }
  }

  // Private helper methods

  /// Check if location services are enabled
  Future<ServiceCheckResult> _checkLocationService() async {
    try {
      final serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        final requestResult = await _location.requestService();
        if (!requestResult) {
          return const ServiceCheckResult.failure(
            'Location services are disabled. Please enable them in device settings.',
          );
        }
      }
      return const ServiceCheckResult.success();
    } catch (e) {
      return ServiceCheckResult.failure(
        'Failed to check location service: ${e.toString()}',
      );
    }
  }

  /// Check and request location permissions
  Future<ServiceCheckResult> _checkLocationPermissions() async {
    try {
      // Check current permission status
      final statusResult = await _permissionRepository.checkPermissionStatus(
        AppPermission.locationWhenInUse,
      );

      return statusResult.fold(
        (failure) => ServiceCheckResult.failure(
          'Failed to check location permission: ${failure.message}',
        ),
        (status) async {
          if (status.isGranted) {
            return const ServiceCheckResult.success();
          }

          if (status.isPermanentlyDenied || status.isRestricted) {
            return const ServiceCheckResult.failure(
              'Location permission is permanently denied. Please grant it in app settings.',
            );
          }

          // Request permission
          final requestResult = await _permissionRepository.requestPermission(
            AppPermission.locationWhenInUse,
          );

          return requestResult.fold(
            (failure) => ServiceCheckResult.failure(
              'Failed to request location permission: ${failure.message}',
            ),
            (result) {
              if (result.status.isGranted) {
                return const ServiceCheckResult.success();
              } else {
                return const ServiceCheckResult.failure(
                  'Location permission denied. This app needs location access to function properly.',
                );
              }
            },
          );
        },
      );
    } catch (e) {
      return ServiceCheckResult.failure(
        'Failed to handle location permissions: ${e.toString()}',
      );
    }
  }

  /// Configure location settings based on accuracy requirements
  Future<void> _configureLocationSettings(LocationAccuracy accuracy) async {
    await _location.changeSettings(
      accuracy: _mapToLocationAccuracy(accuracy),
      interval: 5000, // 5 seconds
      distanceFilter: accuracy == LocationAccuracy.high ? 5.0 : 10.0,
    );
  }

  /// Validate location data quality
  ValidationResult _validateLocationData(loc.LocationData locationData) {
    // Check if location data is valid
    if (locationData.latitude == null || locationData.longitude == null) {
      return const ValidationResult.failure(
        'Invalid location data received. Please try again.',
      );
    }

    // Check accuracy if available
    if (locationData.accuracy != null) {
      final accuracy = locationData.accuracy!;

      if (accuracy > AppConstants.locationAccuracyThreshold) {
        return ValidationResult.failure(
          'Location accuracy is poor (${accuracy.toStringAsFixed(1)}m). '
          'Please move to an area with better GPS signal and try again.',
        );
      }
    }

    // Check if location is reasonable (not null island, etc.)
    final lat = locationData.latitude!;
    final lng = locationData.longitude!;

    if (lat.abs() < 0.01 && lng.abs() < 0.01) {
      return const ValidationResult.failure(
        'Invalid GPS coordinates detected. Please ensure GPS is properly enabled.',
      );
    }

    return const ValidationResult.success();
  }

  /// Map our accuracy enum to location package accuracy
  loc.LocationAccuracy _mapToLocationAccuracy(LocationAccuracy accuracy) {
    switch (accuracy) {
      case LocationAccuracy.lowest:
        return loc.LocationAccuracy.powerSave;
      case LocationAccuracy.low:
        return loc.LocationAccuracy.low;
      case LocationAccuracy.medium:
        return loc.LocationAccuracy.balanced;
      case LocationAccuracy.high:
        return loc.LocationAccuracy.high;
      case LocationAccuracy.best:
        return loc.LocationAccuracy.navigation;
    }
  }

  /// Handle location exceptions and convert to user-friendly errors
  LocationError _handleLocationException(dynamic exception) {
    if (exception is LocationException) {
      return LocationError.general(exception.message);
    } else if (exception is PermissionException) {
      return LocationError.permissionDenied(exception.message);
    } else if (exception.toString().contains('timeout')) {
      return LocationError.timeout(
        'Location request timed out. Please ensure you have a clear view of the sky.',
      );
    } else {
      return LocationError.general(
        'Failed to get location: ${exception.toString()}',
      );
    }
  }
}

// Enhanced location models and types

/// Enhanced location accuracy levels
enum LocationAccuracy {
  lowest, // ~500m - for background tracking
  low, // ~100m - for general location
  medium, // ~50m - for most use cases
  high, // ~10m - for precise location
  best, // ~1m - for navigation/mapping
}

/// Location information domain model
class LocationInfo {
  final double latitude;
  final double longitude;
  final double? accuracy;
  final double? altitude;
  final double? bearing;
  final double? speed;
  final DateTime timestamp;
  final String? address;

  const LocationInfo({
    required this.latitude,
    required this.longitude,
    this.accuracy,
    this.altitude,
    this.bearing,
    this.speed,
    required this.timestamp,
    this.address,
  });

  factory LocationInfo.fromLocationData(loc.LocationData data) {
    return LocationInfo(
      latitude: data.latitude!,
      longitude: data.longitude!,
      accuracy: data.accuracy,
      altitude: data.altitude,
      bearing: data.heading,
      speed: data.speed,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        data.time?.toInt() ?? DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'altitude': altitude,
      'bearing': bearing,
      'speed': speed,
      'timestamp': timestamp.toIso8601String(),
      'address': address,
    };
  }

  @override
  String toString() {
    return 'LocationInfo(lat: $latitude, lng: $longitude, accuracy: ${accuracy?.toStringAsFixed(1)}m)';
  }
}

/// Result wrapper for location operations
class LocationResult {
  final LocationInfo? location;
  final LocationError? error;
  final bool isSuccess;

  const LocationResult._({
    this.location,
    this.error,
    required this.isSuccess,
  });

  const LocationResult.success({required LocationInfo location})
      : this._(location: location, isSuccess: true);

  const LocationResult.error({required LocationError error})
      : this._(error: error, isSuccess: false);
}

/// Location-specific error types
class LocationError {
  final LocationErrorType type;
  final String message;

  const LocationError._({
    required this.type,
    required this.message,
  });

  const LocationError.serviceDisabled(String message)
      : this._(type: LocationErrorType.serviceDisabled, message: message);

  const LocationError.permissionDenied(String message)
      : this._(type: LocationErrorType.permissionDenied, message: message);

  const LocationError.timeout(String message)
      : this._(type: LocationErrorType.timeout, message: message);

  const LocationError.inaccurate(String message)
      : this._(type: LocationErrorType.inaccurate, message: message);

  const LocationError.general(String message)
      : this._(type: LocationErrorType.general, message: message);

  @override
  String toString() => message;
}

enum LocationErrorType {
  serviceDisabled,
  permissionDenied,
  timeout,
  inaccurate,
  general,
}

/// Service check result helper
class ServiceCheckResult {
  final bool isSuccess;
  final String message;

  const ServiceCheckResult.success([this.message = '']) : isSuccess = true;
  const ServiceCheckResult.failure(this.message) : isSuccess = false;
}

/// Validation result helper
class ValidationResult {
  final bool isSuccess;
  final String message;

  const ValidationResult.success([this.message = '']) : isSuccess = true;
  const ValidationResult.failure(this.message) : isSuccess = false;
}
