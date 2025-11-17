import 'dart:io';

import 'package:fsm/core/widgets/form/reactive_file_control.dart';
import 'package:fsm/core/widgets/form/reactive_signature_control.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Form group builders for work order actions
/// Provides centralized form structure with validation
class WorkOrderForms {
  /// Custom validator for minimum quantity (validates string representation of numbers)
  static Map<String, dynamic>? _minQuantityValidator(
      AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null || value.toString().isEmpty) {
      return null; // Let required validator handle empty values
    }

    final intValue = int.tryParse(value.toString());
    if (intValue == null) {
      return null; // Let number validator handle invalid numbers
    }

    if (intValue < 1) {
      return {'minQuantity': 'Quantity must be at least 1'};
    }

    return null;
  }

  /// Build form for starting a work order
  /// Fields: notes (optional), files (optional)
  static FormGroup buildStartForm() {
    return FormGroup({
      'notes': FormControl<String>(
        value: '',
        validators: [],
      ),
      // 'files': ReactiveFileControl(
      //   value: [],
      //   validators: [],
      // ),
      'files': FormControl<List<File>>(value: []),
    });
  }

  /// Build form for pausing a work order
  /// Fields: reason (required), files (optional)
  static FormGroup buildPauseForm() {
    return FormGroup({
      'reason': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(10),
        ],
      ),
      // 'files': ReactiveFileControl(
      //   value: [],
      //   validators: [],
      // ),
      'files': FormControl<List<File>>(value: []),
    });
  }

  /// Build form for resuming a work order
  /// Fields: notes (optional), files (optional)
  static FormGroup buildResumeForm() {
    return FormGroup({
      'notes': FormControl<String>(
        value: '',
        validators: [],
      ),
      // 'files': ReactiveFileControl(
      //   value: [],
      //   validators: [],
      // ),
      'files': FormControl<List<File>>(value: []),
    });
  }

  /// Build form for rejecting a work order
  /// Fields: reason (required)
  static FormGroup buildRejectForm() {
    return FormGroup({
      'reason': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(20),
        ],
      ),
      'files': FormControl<List<File>>(value: []),
    });
  }

  /// Build form for completing a work order - Step 1: Work Log + Parts
  /// Fields: workLog (required), parts (FormArray - optional but if added, quantity required)
  static FormGroup buildCompleteFormStep1() {
    return FormGroup({
      'workLog': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(20),
        ],
      ),
      'parts': FormArray<Map<String, dynamic>>(
        [],
        validators: [],
      ),
    });
  }

  /// Build form for completing a work order - Step 2: Images
  /// Fields: files (optional)
  static FormGroup buildCompleteFormStep2() {
    return FormGroup({
      'files': ReactiveFileControl(
        value: [],
        validators: [],
      ),
    });
  }

  /// Build form for completing a work order - Step 3: Customer Info + Signature
  /// Fields: customerName (required), signature (required), completionNotes (optional)
  static FormGroup buildCompleteFormStep3() {
    return FormGroup({
      'customerName': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(2),
        ],
      ),
      'signature': ReactiveSignatureControl(
        value: null,
        validators: [
          Validators.required,
        ],
      ),
      'completionNotes': FormControl<String>(
        value: '',
        validators: [],
      ),
    });
  }

  /// Create a part entry for the parts FormArray
  static FormGroup createPartEntry({
    required String partNumber,
    required String partName,
    int quantity = 1,
  }) {
    return FormGroup({
      'partNumber': FormControl<String>(
        value: partNumber,
        validators: [Validators.required],
      ),
      'partName': FormControl<String>(
        value: partName,
        validators: [Validators.required],
      ),
      'quantity': FormControl<String>(
        value: quantity.toString(),
        validators: [
          Validators.required,
          Validators.number(allowNegatives: false),
          // _minQuantityValidator,
        ],
      ),
    });
  }

  /// Get form data from start form
  static Map<String, dynamic> getStartFormData(FormGroup form) {
    return {
      'notes': form.control('notes').value?.toString().trim(),
      'files': (form.control('files').value as List<File>?) ?? [],
    };
  }

  /// Get form data from pause form
  static Map<String, dynamic> getPauseFormData(FormGroup form) {
    return {
      'reason': form.control('reason').value?.toString().trim() ?? '',
      'files': (form.control('files').value as List<File>?) ?? [],
    };
  }

  /// Get form data from resume form
  static Map<String, dynamic> getResumeFormData(FormGroup form) {
    return {
      'notes': form.control('notes').value?.toString().trim(),
      'files': (form.control('files').value as List<File>?) ?? [],
    };
  }

  /// Get form data from reject form
  static Map<String, dynamic> getRejectFormData(FormGroup form) {
    return {
      'reason': form.control('reason').value?.toString().trim() ?? '',
    };
  }

  /// Get combined form data from all complete form steps
  static Map<String, dynamic> getCompleteFormData(
    FormGroup step1,
    FormGroup step2,
    FormGroup step3,
  ) {
    final partsArray =
        step1.control('parts') as FormArray<Map<String, dynamic>>;
    final parts = partsArray.controls.map((control) {
      final group = control as FormGroup;
      return {
        'partNumber': group.control('partNumber').value,
        'partName': group.control('partName').value,
        'quantity':
            int.tryParse(group.control('quantity').value?.toString() ?? '0') ??
                0,
      };
    }).toList();

    return {
      'workLog': step1.control('workLog').value?.toString().trim() ?? '',
      'parts': parts,
      'files': (step2.control('files').value as List<File>?) ?? [],
      'customerName':
          step3.control('customerName').value?.toString().trim() ?? '',
      'signature': step3.control('signature').value as File?,
      'completionNotes':
          step3.control('completionNotes').value?.toString().trim(),
    };
  }
}
