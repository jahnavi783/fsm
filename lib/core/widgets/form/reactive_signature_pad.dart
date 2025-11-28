// import 'dart:io';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fsm/core/theme/design_tokens.dart';
// import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
//
// /// Reactive signature pad integrated with ReactiveForms.
// /// Works with syncfusion_flutter_signaturepad
// class ReactiveSignaturePad extends StatefulWidget {
//   final String formControlName;
//   final String? label;
//   final bool required;
//   final double height;
//   final Color? backgroundColor;
//   final Color? strokeColor;
//   final double strokeWidth;
//
//   const ReactiveSignaturePad({
//     super.key,
//     required this.formControlName,
//     this.label,
//     this.required = false,
//     this.height = 200,
//     this.backgroundColor,
//     this.strokeColor,
//     this.strokeWidth = 2.0,
//   });
//
//   @override
//   State<ReactiveSignaturePad> createState() => _ReactiveSignaturePadState();
// }
//
// class _ReactiveSignaturePadState extends State<ReactiveSignaturePad> {
//   final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
//   bool _hasDrawn = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return ReactiveFormField<File?, File?>(
//       formControlName: widget.formControlName,
//       builder: (field) {
//         final hasError = field.errorText != null && field.control.touched;
//         final bgColor = widget.backgroundColor ?? theme.colorScheme.surface;
//         final strokeColor = widget.strokeColor ?? theme.colorScheme.onSurface;
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Label
//             if (widget.label != null) ...[
//               Text(
//                 widget.label!,
//                 style: theme.textTheme.labelLarge?.copyWith(
//                   fontSize: DesignTokens.fontSize14.sp,
//                   fontWeight: DesignTokens.fontWeightSemiBold,
//                 ),
//               ),
//               RSizedBox(height: DesignTokens.space3),
//             ],
//
//             // Signature pad container
//             Container(
//               height: widget.height.h,
//               decoration: BoxDecoration(
//                 color: bgColor,
//                 borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
//                 border: Border.all(
//                   color: hasError
//                       ? theme.colorScheme.error
//                       : theme.colorScheme.outline,
//                   width: DesignTokens.borderWidthThin,
//                 ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
//                 child: SfSignaturePad(
//                   key: _signaturePadKey,
//                   backgroundColor: bgColor,
//                   strokeColor: strokeColor,
//                   minimumStrokeWidth: widget.strokeWidth,
//                   maximumStrokeWidth: widget.strokeWidth + 1,
//                   onDrawStart: () {
//                     if (!_hasDrawn) {
//                       setState(() {
//                         _hasDrawn = true;
//                       });
//                     }
//                     return false;
//                   },
//                 ),
//               ),
//             ),
//
//             RSizedBox(height: DesignTokens.space3),
//
//             // Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (_hasDrawn) ...[
//                   TextButton.icon(
//                     onPressed: () => _clearSignature(field),
//                     icon: Icon(Icons.clear, size: DesignTokens.iconXs.sp),
//                     label: const Text('Clear'),
//                     style: TextButton.styleFrom(
//                       foregroundColor: theme.colorScheme.error,
//                     ),
//                   ),
//                   RSizedBox(width: DesignTokens.space2),
//                 ],
//                 FilledButton.icon(
//                   onPressed: _hasDrawn ? () => _saveSignature(field) : null,
//                   icon: const Icon(Icons.check),
//                   label: const Text('Save Signature'),
//                 ),
//               ],
//             ),
//
//             // Success message
//             if (field.value != null) ...[
//               RSizedBox(height: DesignTokens.space3),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     color: context.fsmTheme.success,
//                     size: 20.sp,
//                   ),
//                   RSizedBox(width: DesignTokens.space2),
//                   Text(
//                     'Signature saved successfully',
//                     style: TextStyle(
//                       color: context.fsmTheme.success,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//
//             // Error message
//             if (hasError)
//               Padding(
//                 padding: EdgeInsets.only(top: 8.h),
//                 child: Text(
//                   field.errorText!,
//                   style: TextStyle(
//                     color: theme.colorScheme.error,
//                     fontSize: 12.sp,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> _saveSignature(
//       ReactiveFormFieldState<File?, File?> field) async {
//     try {
//       // Capture signature as image
//       final image =
//           await _signaturePadKey.currentState?.toImage(pixelRatio: 3.0);
//       if (image == null) {
//         _showError('Failed to capture signature');
//         return;
//       }
//
//       // Convert to PNG bytes
//       final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       if (byteData == null) {
//         _showError('Failed to process signature');
//         return;
//       }
//
//       // Save to app documents directory (permanent storage)
//       final dir = await getApplicationDocumentsDirectory();
//       final signaturesDir = Directory('${dir.path}/signatures');
//
//       // Create signatures directory if it doesn't exist
//       if (!await signaturesDir.exists()) {
//         await signaturesDir.create(recursive: true);
//       }
//
//       final file = File(
//           '${signaturesDir.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png');
//       await file.writeAsBytes(byteData.buffer.asUint8List());
//
//       // Update form control
//       field.control.updateValue(file);
//       field.control.markAsTouched();
//       field.control.markAsDirty();
//       field.didChange(file);
//
//       // Show success message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Signature saved successfully'),
//             backgroundColor: context.fsmTheme.success,
//             duration: const Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       _showError('Error saving signature: $e');
//     }
//   }
//
//   void _clearSignature(ReactiveFormFieldState<File?, File?> field) {
//     // Clear the signature pad
//     _signaturePadKey.currentState?.clear();
//
//     // Reset form control
//     field.control.updateValue(null);
//     field.didChange(null);
//
//     // Reset state
//     setState(() {
//       _hasDrawn = false;
//     });
//   }
//
//   void _showError(String message) {
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           backgroundColor: Colors.red,
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     }
//   }
// }

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// Reactive signature pad integrated with ReactiveForms.
/// Works with syncfusion_flutter_signaturepad
class ReactiveSignaturePad extends StatefulWidget {
  final String formControlName;
  final String? label;
  final bool required;
  final double height;
  final Color? backgroundColor;
  final Color? strokeColor;
  final double strokeWidth;

  const ReactiveSignaturePad({
    super.key,
    required this.formControlName,
    this.label,
    this.required = false,
    this.height = 200,
    this.backgroundColor,
    this.strokeColor,
    this.strokeWidth = 2.0,
  });

  @override
  State<ReactiveSignaturePad> createState() => _ReactiveSignaturePadState();
}

class _ReactiveSignaturePadState extends State<ReactiveSignaturePad> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  bool _hasDrawn = false;
  bool _isSaving = false;
  bool _isLoading = false;
  File? _loadedSignatureFile;
  Uint8List? _loadedSignatureBytes;

  @override
  void initState() {
    super.initState();
    // No immediate load here; loading happens from the builder when field value is present.
  }

  Future<void> _loadExistingSignature(File? existingFile) async {
    if (existingFile == null || !await existingFile.exists()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Read the image bytes and keep them for display
      final bytes = await existingFile.readAsBytes();

      if (mounted) {
        setState(() {
          _loadedSignatureBytes = bytes;
          _hasDrawn = true;
          _isLoading = false;
          _loadedSignatureFile = existingFile;
        });
      }
    } catch (e, stackTrace) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveFormField<File?, File?>(
      formControlName: widget.formControlName,
      builder: (field) {
        // When the form field has a file and we haven't loaded it yet, load bytes
        if (field.value != null &&
            _loadedSignatureFile != field.value &&
            !_isLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _loadExistingSignature(field.value as File?);
          });
        }

        final hasError = field.errorText != null && field.control.touched;
        final bgColor = widget.backgroundColor ?? theme.colorScheme.surface;
        final strokeColor = widget.strokeColor ?? theme.colorScheme.onSurface;
        final isSaved = field.value != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: DesignTokens.fontSize14.sp,
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
              RSizedBox(height: DesignTokens.space3),
            ],

            // Signature pad container
            Container(
              height: widget.height.h,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                border: Border.all(
                  color: hasError
                      ? theme.colorScheme.error
                      : theme.colorScheme.outline,
                  width: DesignTokens.borderWidthThin,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // If we loaded bytes, show the image beneath the signature pad
                  if (_loadedSignatureBytes != null)
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(DesignTokens.radiusSm.r),
                      child: Image.memory(
                        _loadedSignatureBytes!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  // Signature pad on top. If there's a loaded image, make pad background transparent.
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    child: SfSignaturePad(
                      key: _signaturePadKey,
                      backgroundColor: _loadedSignatureBytes != null
                          ? Colors.transparent
                          : bgColor,
                      strokeColor: strokeColor,
                      minimumStrokeWidth: widget.strokeWidth,
                      maximumStrokeWidth: widget.strokeWidth + 1,
                      onDrawStart: () {
                        if (!_hasDrawn && mounted) {
                          setState(() {
                            _hasDrawn = true;
                          });
                        }
                        return false;
                      },
                    ),
                  ),
                  // Loading overlay
                  if (_isLoading)
                    Container(
                      color: bgColor.withOpacity(0.7),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),

            RSizedBox(height: DesignTokens.space3),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Clear button - show only if drawn or saved
                if (_hasDrawn || isSaved) ...[
                  TextButton.icon(
                    onPressed: _isSaving || _isLoading
                        ? null
                        : () => _clearSignature(field),
                    icon: Icon(Icons.clear, size: DesignTokens.iconXs.sp),
                    label: const Text('Clear'),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                  ),
                  RSizedBox(width: DesignTokens.space2),
                ],
                // Save button - enabled when drawn and not already saved
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    foregroundColor:
                        isSaved ? context.fsmTheme.success : Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: DesignTokens.space3.h,
                      horizontal: DesignTokens.space4.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(DesignTokens.radiusSm.r),
                    ),
                  ),
                  onPressed:
                      (_hasDrawn && !_isSaving && !_isLoading && !isSaved)
                          ? () => _saveSignature(field)
                          : null,
                  icon: _isSaving
                      ? SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: DesignTokens.iconSm.sp,
                        ),
                  label: Text(
                    _isSaving ? 'Saving...' : 'Save Signature',
                  ),
                )
              ],
            ),

            // Success message
            if (isSaved) ...[
              RSizedBox(height: DesignTokens.space3),
              Container(
                padding: EdgeInsets.all(DesignTokens.space3.w),
                decoration: BoxDecoration(
                  color: context.fsmTheme.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                  border: Border.all(
                    color: context.fsmTheme.success.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: context.fsmTheme.success,
                      size: 20.sp,
                    ),
                    RSizedBox(width: DesignTokens.space2),
                    Expanded(
                      child: Text(
                        'Signature saved successfully',
                        style: TextStyle(
                          color: context.fsmTheme.success,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Error message
            if (hasError)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: 12.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _saveSignature(
      ReactiveFormFieldState<File?, File?> field) async {
    if (!_hasDrawn) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final signaturePadState = _signaturePadKey.currentState;
      if (signaturePadState == null) {
        throw Exception('Signature pad state is null');
      }

      final image = await signaturePadState.toImage(pixelRatio: 3.0);

      if (image == null) {
        throw Exception('Failed to capture signature image');
      }

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception('Failed to convert image to bytes');
      }

      final dir = await getApplicationDocumentsDirectory();
      final signaturesDir = Directory('${dir.path}/signatures');

      if (!await signaturesDir.exists()) {
        await signaturesDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${signaturesDir.path}/signature_$timestamp.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      // Update form control with the file
      field.control.updateValue(file);
      field.control.markAsTouched();
      field.control.markAsDirty();
      field.didChange(file);

      if (mounted) {
        setState(() async {
          _isSaving = false;
          _loadedSignatureFile = file;
          _loadedSignatureBytes = await file.readAsBytes();
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Signature saved successfully'),
            backgroundColor: context.fsmTheme.success,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e, stackTrace) {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });

        _showError('Error saving signature: $e');
      }
    }
  }

  void _clearSignature(ReactiveFormFieldState<File?, File?> field) {
    _signaturePadKey.currentState?.clear();

    field.control.updateValue(null);
    field.control.markAsTouched();
    field.didChange(null);

    if (mounted) {
      setState(() {
        _hasDrawn = false;
        _loadedSignatureFile = null;
        _loadedSignatureBytes = null;
      });
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
