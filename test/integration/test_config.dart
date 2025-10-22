/// Integration test configuration
abstract class TestConfig {
  // Server Configuration
  static const String baseUrl = 'https://malamute-honest-oddly.ngrok-free.app/api';

  // Timeout Configuration
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Test Data - Seeded Work Orders
  static const int testWorkOrderId1 = 1; // WO-202510-1000-WO01 (In Progress)
  static const int testWorkOrderId2 = 2; // WO-202510-1000-WO02 (Paused)

  // Test Data - Service Requests
  static const int testServiceRequestId = 1; // SR-202510-1000

  // Enable detailed logging for debugging
  static const bool enableLogging = true;
}
