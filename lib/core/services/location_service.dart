import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../constants/app_constants.dart';
import '../error/exceptions.dart';

@injectable
class LocationService {
  final Location _location = Location();

  Future<LocationData> getCurrentLocation() async {
    try {
      // Check if location service is enabled
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          throw LocationException('Location services are disabled');
        }
      }

      // Check location permissions
      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw PermissionException('Location permission denied', 'location');
        }
      }

      // Get current location with timeout
      final locationData = await _location.getLocation().timeout(
        AppConstants.locationTimeout,
        onTimeout: () {
          throw LocationException('Location request timed out');
        },
      );

      // Validate location accuracy
      if (locationData.accuracy != null &&
          locationData.accuracy! > AppConstants.locationAccuracyThreshold) {
        throw LocationException(
          'Location accuracy is poor (${locationData.accuracy}m). '
          'Please try again in an area with better GPS signal.',
        );
      }

      return locationData;
    } catch (e) {
      if (e is LocationException || e is PermissionException) {
        rethrow;
      }
      throw LocationException('Failed to get current location: ${e.toString()}');
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    return await _location.serviceEnabled();
  }

  Future<PermissionStatus> getLocationPermissionStatus() async {
    return await _location.hasPermission();
  }

  Future<bool> requestLocationService() async {
    return await _location.requestService();
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await _location.requestPermission();
  }

  Stream<LocationData> getLocationStream() {
    return _location.onLocationChanged;
  }
}