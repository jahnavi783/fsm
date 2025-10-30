import 'package:location/location.dart' as loc;

import 'location_types.dart';

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
