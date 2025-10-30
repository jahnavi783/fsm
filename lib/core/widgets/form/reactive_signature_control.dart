import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Custom FormControl for handling signature capture
/// Stores signature as File after conversion from ui.Image
class ReactiveSignatureControl extends FormControl<File?> {
  ReactiveSignatureControl({
    super.value,
    super.validators,
    super.asyncValidators,
    super.asyncValidatorsDebounceTime,
    super.disabled,
    super.touched,
  });

  /// Set signature from ui.Image (captured from signature pad)
  Future<void> setSignatureFromImage(ui.Image image) async {
    try {
      final file = await _convertImageToFile(image);
      value = file;
      markAsTouched();
    } catch (e) {
      throw Exception('Failed to save signature: $e');
    }
  }

  /// Clear the signature
  void clearSignature() {
    value = null;
    markAsTouched();
  }

  /// Check if signature exists
  bool get hasSignature => value != null;

  /// Convert ui.Image to File
  static Future<File> _convertImageToFile(ui.Image image) async {
    try {
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        throw Exception('Failed to convert signature to image data');
      }

      final buffer = byteData.buffer.asUint8List();
      if (buffer.isEmpty) {
        throw Exception('Signature image is empty');
      }

      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${tempDir.path}/signature_$timestamp.png');
      await file.writeAsBytes(buffer);

      if (!await file.exists() || await file.length() == 0) {
        throw Exception('Failed to save signature file');
      }

      return file;
    } catch (e) {
      throw Exception('Error converting signature to file: $e');
    }
  }
}

/// Validator for required signature
class RequiredSignatureValidator extends Validator<dynamic> {
  const RequiredSignatureValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null) {
      return {'requiredSignature': true};
    }
    return null;
  }
}

/// Helper for creating signature validators
class SignatureValidators {
  static Map<String, dynamic>? requiredSignature(
      AbstractControl<dynamic> control) {
    final value = control.value;
    if (value == null) {
      return {'requiredSignature': true};
    }
    return null;
  }
}
