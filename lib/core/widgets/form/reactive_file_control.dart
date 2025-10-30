import 'dart:io';
import 'package:reactive_forms/reactive_forms.dart';

/// Custom FormControl for handling file lists (images, documents)
/// Supports validation for required files and max file count
class ReactiveFileControl extends FormControl<List<File>> {
  ReactiveFileControl({
    List<File>? value,
    super.validators,
    super.asyncValidators,
    super.asyncValidatorsDebounceTime,
    super.disabled,
    super.touched,
  }) : super(value: value ?? []);

  /// Add a file to the list
  void addFile(File file) {
    final currentFiles = value ?? [];
    value = [...currentFiles, file];
    markAsTouched();
  }

  /// Remove a file at the specified index
  void removeFile(int index) {
    final currentFiles = value ?? [];
    if (index >= 0 && index < currentFiles.length) {
      final newFiles = List<File>.from(currentFiles);
      newFiles.removeAt(index);
      value = newFiles;
      markAsTouched();
    }
  }

  /// Clear all files
  void clearFiles() {
    value = [];
    markAsTouched();
  }

  /// Get the number of files
  int get fileCount => value?.length ?? 0;

  /// Check if files exist
  bool get hasFiles => (value?.isNotEmpty ?? false);
}

/// Validator for required files
class RequiredFilesValidator extends Validator<dynamic> {
  const RequiredFilesValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null || (value is List && value.isEmpty)) {
      return {'requiredFiles': true};
    }
    return null;
  }
}

/// Validator for minimum file count
class MinFilesValidator extends Validator<dynamic> {
  final int minCount;

  const MinFilesValidator(this.minCount);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value is List && value.length < minCount) {
      return {
        'minFiles': {
          'requiredCount': minCount,
          'actualCount': value.length,
        }
      };
    }
    return null;
  }
}

/// Validator for maximum file count
class MaxFilesValidator extends Validator<dynamic> {
  final int maxCount;

  const MaxFilesValidator(this.maxCount);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value is List && value.length > maxCount) {
      return {
        'maxFiles': {
          'allowedCount': maxCount,
          'actualCount': value.length,
        }
      };
    }
    return null;
  }
}
