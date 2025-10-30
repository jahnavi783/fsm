// Helper classes for location service operations

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
