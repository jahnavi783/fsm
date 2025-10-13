abstract class AppConstants {
  // API Configuration
  static const String baseUrl = "https://vast-heron-poetic.ngrok-free.app/api";
  
  // Storage Keys
  static const String refreshToken = "refresh_token";
  static const String accessToken = "access_token";
  static const String userDataKey = "user_data";
  
  // Network Configuration
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Cache Configuration
  static const Duration cacheMaxAge = Duration(hours: 24);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  
  // Location Configuration
  static const double locationAccuracyThreshold = 50.0; // meters
  static const Duration locationTimeout = Duration(seconds: 30);
}