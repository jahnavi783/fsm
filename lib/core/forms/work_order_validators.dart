import 'package:reactive_forms/reactive_forms.dart';

/// Custom validators for work order forms
class WorkOrderValidators {
  /// Validator for part quantity (must be positive integer)
  static Map<String, dynamic>? partQuantity(AbstractControl<dynamic> control) {
    final value = control.value;

    if (value == null) {
      return {'required': true};
    }

    if (value is String) {
      final intValue = int.tryParse(value);
      if (intValue == null) {
        return {'invalidNumber': true};
      }
      if (intValue <= 0) {
        return {
          'minQuantity': {'min': 1, 'actual': intValue}
        };
      }
    } else if (value is int) {
      if (value <= 0) {
        return {
          'minQuantity': {'min': 1, 'actual': value}
        };
      }
    }

    return null;
  }

  /// Validator for work log minimum length
  static Map<String, dynamic>? Function(AbstractControl<dynamic>)
      workLogMinLength(int minLength) {
    return (AbstractControl<dynamic> control) {
      final value = control.value;

      if (value == null || value.toString().trim().isEmpty) {
        return {'required': true};
      }

      if (value.toString().trim().length < minLength) {
        return {
          'minLength': {
            'requiredLength': minLength,
            'actualLength': value.toString().trim().length,
          }
        };
      }

      return null;
    };
  }

  /// Validator for reason field (required and not just whitespace)
  static Map<String, dynamic>? requiredReason(
      AbstractControl<dynamic> control) {
    final value = control.value;

    if (value == null || value.toString().trim().isEmpty) {
      return {'requiredReason': true};
    }

    return null;
  }

  /// Validator for customer name (required, min 2 characters)
  static Map<String, dynamic>? customerName(AbstractControl<dynamic> control) {
    final value = control.value;

    if (value == null || value.toString().trim().isEmpty) {
      return {'required': true};
    }

    if (value.toString().trim().length < 2) {
      return {
        'minLength': {
          'requiredLength': 2,
          'actualLength': value.toString().trim().length,
        }
      };
    }

    return null;
  }

  /// Validator for notes (optional but if provided, min length)
  static Map<String, dynamic>? Function(AbstractControl<dynamic>) optionalNotes(
      {int minLength = 5}) {
    return (AbstractControl<dynamic> control) {
      final value = control.value;

      // If empty, it's valid (optional)
      if (value == null || value.toString().trim().isEmpty) {
        return null;
      }

      // If provided, must meet minimum length
      if (value.toString().trim().length < minLength) {
        return {
          'minLength': {
            'requiredLength': minLength,
            'actualLength': value.toString().trim().length,
          }
        };
      }

      return null;
    };
  }
}

/// Helper for quick validator access
class WorkOrderValidatorHelpers {
  /// Required files validator
  static Map<String, dynamic>? requiredFiles(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null || (value is List && value.isEmpty)) {
      return {'requiredFiles': true};
    }
    return null;
  }

  /// Required signature validator
  static Map<String, dynamic>? requiredSignature(
      AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null) {
      return {'requiredSignature': true};
    }
    return null;
  }
}

/// Validation error messages for work order forms
class WorkOrderValidationMessages {
  static const Map<String, String> messages = {
    'required': 'This field is required',
    'requiredReason': 'Please provide a reason',
    'requiredFiles': 'At least one file is required',
    'requiredSignature': 'Customer signature is required',
    'minLength': 'Minimum length not met',
    'invalidNumber': 'Please enter a valid number',
    'minQuantity': 'Quantity must be at least 1',
    'maxFiles': 'Too many files selected',
  };

  /// Get error message for a validation error
  static String getErrorMessage(
      String errorKey, Map<String, dynamic>? errorData) {
    switch (errorKey) {
      case 'minLength':
        final required = errorData?['requiredLength'] ?? 0;
        final actual = errorData?['actualLength'] ?? 0;
        return 'Minimum $required characters required (current: $actual)';
      case 'minQuantity':
        return 'Quantity must be at least ${errorData?['min'] ?? 1}';
      case 'maxFiles':
        final allowed = errorData?['allowedCount'] ?? 0;
        return 'Maximum $allowed files allowed';
      default:
        return messages[errorKey] ?? 'Invalid input';
    }
  }
}
