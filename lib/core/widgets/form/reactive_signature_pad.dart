// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:fsm/core/theme/design_tokens.dart';
// // import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// // import 'package:fsm/core/widgets/form/reactive_signature_control.dart';
// // import 'package:reactive_forms/reactive_forms.dart';
// // import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
// //
// // /// Reusable reactive signature pad widget
// // /// Wraps Syncfusion SfSignaturePad with ReactiveFormField
// // class ReactiveSignaturePad extends StatefulWidget {
// //   final String formControlName;
// //   final String? label;
// //   final bool required;
// //   final double height;
// //   final Color? backgroundColor;
// //   final Color? strokeColor;
// //   final double strokeWidth;
// //
// //   const ReactiveSignaturePad({
// //     super.key,
// //     required this.formControlName,
// //     this.label,
// //     this.required = false,
// //     this.height = 200,
// //     this.backgroundColor,
// //     this.strokeColor,
// //     this.strokeWidth = 2.0,
// //   });
// //
// //   @override
// //   State<ReactiveSignaturePad> createState() => _ReactiveSignaturePadState();
// // }
// //
// // class _ReactiveSignaturePadState extends State<ReactiveSignaturePad> {
// //   final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
// //   bool _hasSignature = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //
// //     return ReactiveFormField<File?, File?>(
// //       formControlName: widget.formControlName,
// //       builder: (ReactiveFormFieldState<File?, File?> field) {
// //         final hasError = field.errorText != null && field.control.touched;
// //         final effectiveBackgroundColor =
// //             widget.backgroundColor ?? theme.colorScheme.surface;
// //         final effectiveStrokeColor =
// //             widget.strokeColor ?? theme.colorScheme.onSurface;
// //
// //         return Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Label
// //             if (widget.label != null) ...[
// //               Row(
// //                 children: [
// //                   Text(
// //                     widget.label!,
// //                     style: theme.textTheme.labelLarge?.copyWith(
// //                       fontSize: DesignTokens.fontSize14.sp,
// //                       fontWeight: DesignTokens.fontWeightSemiBold,
// //                     ),
// //                   ),
// //                   if (widget.required) ...[
// //                     RSizedBox(width: DesignTokens.space1),
// //                     Text(
// //                       '*',
// //                       style: theme.textTheme.labelLarge?.copyWith(
// //                         color: theme.colorScheme.error,
// //                         fontSize: DesignTokens.fontSize14.sp,
// //                       ),
// //                     ),
// //                   ],
// //                 ],
// //               ),
// //               RSizedBox(height: DesignTokens.space3),
// //             ],
// //
// //             // Signature pad container
// //             Container(
// //               height: widget.height.h,
// //               decoration: BoxDecoration(
// //                 color: effectiveBackgroundColor,
// //                 borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
// //                 border: Border.all(
// //                   color: hasError
// //                       ? theme.colorScheme.error
// //                       : theme.colorScheme.outline,
// //                   width: hasError
// //                       ? DesignTokens.borderWidthMedium
// //                       : DesignTokens.borderWidthThin,
// //                 ),
// //               ),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
// //                 child: SfSignaturePad(
// //                   key: _signaturePadKey,
// //                   backgroundColor: effectiveBackgroundColor,
// //                   strokeColor: effectiveStrokeColor,
// //                   minimumStrokeWidth: widget.strokeWidth,
// //                   maximumStrokeWidth: widget.strokeWidth + 1,
// //                   onDrawStart: () {
// //                     if (!_hasSignature) {
// //                       setState(() {
// //                         _hasSignature = true;
// //                       });
// //                     }
// //                     return true;
// //                   },
// //                 ),
// //               ),
// //             ),
// //
// //             RSizedBox(height: DesignTokens.space3),
// //
// //             // Action buttons
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                 if (_hasSignature)
// //                   TextButton.icon(
// //                     onPressed: () => _clearSignature(field),
// //                     icon: Icon(Icons.clear, size: DesignTokens.iconXs.sp),
// //                     label: Text(
// //                       'Clear',
// //                       style: TextStyle(fontSize: DesignTokens.fontSize14.sp),
// //                     ),
// //                     style: TextButton.styleFrom(
// //                       foregroundColor: theme.colorScheme.error,
// //                     ),
// //                   ),
// //                 if (_hasSignature) RSizedBox(width: DesignTokens.space2),
// //                 FilledButton.icon(
// //                   onPressed: _hasSignature ? () => _saveSignature(field) : null,
// //                   icon: Icon(Icons.check, size: DesignTokens.iconXs.sp),
// //                   label: Text(
// //                     'Save Signature',
// //                     style: TextStyle(fontSize: DesignTokens.fontSize14.sp),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //
// //             // Signature preview or status
// //             if (field.value != null) ...[
// //               RSizedBox(height: DesignTokens.space3),
// //               Container(
// //                 padding: REdgeInsets.all(DesignTokens.space3),
// //                 decoration: BoxDecoration(
// //                   color: context.fsmTheme.success.withValues(alpha: 0.1),
// //                   borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
// //                   border: Border.all(
// //                     color: context.fsmTheme.success.withValues(alpha: 0.3),
// //                     width: DesignTokens.borderWidthThin,
// //                   ),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Icon(
// //                       Icons.check_circle,
// //                       color: context.fsmTheme.success,
// //                       size: DesignTokens.iconSm.sp,
// //                     ),
// //                     RSizedBox(width: DesignTokens.space2),
// //                     Expanded(
// //                       child: Text(
// //                         'Signature captured',
// //                         style: theme.textTheme.bodyMedium?.copyWith(
// //                           fontSize: DesignTokens.fontSize14.sp,
// //                           color: context.fsmTheme.success,
// //                           fontWeight: DesignTokens.fontWeightMedium,
// //                         ),
// //                       ),
// //                     ),
// //                     TextButton(
// //                       onPressed: () => _clearSignature(field),
// //                       child: Text(
// //                         'Change',
// //                         style: TextStyle(fontSize: DesignTokens.fontSize12.sp),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //
// //             // Error message
// //             if (hasError) ...[
// //               RSizedBox(height: DesignTokens.space2),
// //               Row(
// //                 children: [
// //                   Icon(
// //                     Icons.error_outline,
// //                     size: DesignTokens.iconSm.sp,
// //                     color: theme.colorScheme.error,
// //                   ),
// //                   RSizedBox(width: DesignTokens.space1),
// //                   Expanded(
// //                     child: Text(
// //                       field.errorText!,
// //                       style: theme.textTheme.bodySmall?.copyWith(
// //                         fontSize: DesignTokens.fontSize12.sp,
// //                         color: theme.colorScheme.error,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   Future<void> _saveSignature(
// //       ReactiveFormFieldState<File?, File?> field) async {
// //     try {
// //       final signatureImage = await _signaturePadKey.currentState?.toImage(
// //         pixelRatio: 3.0,
// //       );
// //
// //       if (signatureImage == null) {
// //         _showError('Failed to capture signature');
// //         return;
// //       }
// //
// //       final control = field.control as ReactiveSignatureControl;
// //       await control.setSignatureFromImage(signatureImage);
// //
// //       if (mounted) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: const Text('Signature saved successfully'),
// //             backgroundColor: context.fsmTheme.success,
// //             duration: const Duration(seconds: 2),
// //           ),
// //         );
// //       }
// //     } catch (e) {
// //       _showError('Failed to save signature: $e');
// //     }
// //   }
// //
// //   void _clearSignature(ReactiveFormFieldState<File?, File?> field) {
// //     _signaturePadKey.currentState?.clear();
// //     final control = field.control as ReactiveSignatureControl;
// //     control.clearSignature();
// //     setState(() {
// //       _hasSignature = false;
// //     });
// //   }
// //
// //   void _showError(String message) {
// //     if (mounted) {
// //       final theme = Theme.of(context);
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(message),
// //           backgroundColor: theme.colorScheme.error,
// //           duration: const Duration(seconds: 3),
// //         ),
// //       );
// //     }
// //   }
// // }
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
//   bool _hasSignature = false;
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
//             // --- Label
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
//             // --- Signature pad
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
//                 ),
//               ),
//             ),
//
//             RSizedBox(height: DesignTokens.space3),
//
//             // --- Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton.icon(
//                   onPressed: () => _clearSignature(field),
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear'),
//                   style: TextButton.styleFrom(
//                     foregroundColor: theme.colorScheme.error,
//                   ),
//                 ),
//                 RSizedBox(width: DesignTokens.space2),
//                 FilledButton.icon(
//                   onPressed: () => _saveSignature(field),
//                   icon: const Icon(Icons.check),
//                   label: const Text('Save Signature'),
//                 ),
//               ],
//             ),
//
//             // --- Success message
//             if (field.value != null) ...[
//               RSizedBox(height: DesignTokens.space3),
//               Row(
//                 children: [
//                   Icon(Icons.check_circle,
//                       color: context.fsmTheme.success, size: 20.sp),
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
//             if (hasError)
//               Padding(
//                 padding: EdgeInsets.only(top: 8.h),
//                 child: Text(
//                   field.errorText!,
//                   style: TextStyle(color: theme.colorScheme.error),
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
//       final image =
//           await _signaturePadKey.currentState?.toImage(pixelRatio: 3.0);
//       if (image == null) {
//         _showError('Failed to capture signature');
//         return;
//       }
//
//       final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       if (byteData == null) {
//         _showError('Failed to process signature');
//         return;
//       }
//
//       final dir = await getTemporaryDirectory();
//       final file = File(
//           '${dir.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png');
//       await file.writeAsBytes(byteData.buffer.asUint8List());
//
//       field.didChange(file);
//       field.control.markAsTouched();
//       field.control.updateValue(file);
//
//       setState(() => _hasSignature = true);
//
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Signature saved successfully'),
//             backgroundColor: context.fsmTheme.success,
//           ),
//         );
//       }
//     } catch (e) {
//       _showError('Error saving signature: $e');
//     }
//   }
//
//   void _clearSignature(ReactiveFormFieldState<File?, File?> field) {
//     _signaturePadKey.currentState?.clear();
//     field.didChange(null);
//     field.control.updateValue(null);
//     setState(() => _hasSignature = false);
//   }
//
//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.red),
//     );
//   }
// }
//
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
// /// Works with syncfusion_flutter_signaturepad ^31.1.23
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
//   bool _hasSignature = false;
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
//             // --- Signature pad
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
//                   // ✅ Fixed: onDrawStart callback now returns bool
//                   onDrawStart: () {
//                     if (!_hasSignature) {
//                       setState(() => _hasSignature = true);
//                     }
//                     return true;
//                   },
//                 ),
//               ),
//             ),
//
//             RSizedBox(height: DesignTokens.space3),
//
//             // --- Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (_hasSignature)
//                   TextButton.icon(
//                     onPressed: () => _clearSignature(field),
//                     // icon: const Icon(Icons.clear),
//                     icon: Icon(Icons.clear, size: DesignTokens.iconXs.sp),
//                     label: const Text('Clear'),
//                     style: TextButton.styleFrom(
//                       foregroundColor: theme.colorScheme.error,
//                     ),
//                   ),
//                 // RSizedBox(width: DesignTokens.space2),
//                 if (_hasSignature) RSizedBox(width: DesignTokens.space2),
//                 FilledButton.icon(
//                   onPressed: _hasSignature ? () => _saveSignature(field) : null,
//                   icon: const Icon(Icons.check),
//                   label: const Text(
//                     'Save Signature',
//                   ),
//                 ),
//               ],
//             ),
//
//             // --- Success message
//             if (field.value != null) ...[
//               RSizedBox(height: DesignTokens.space3),
//               Row(
//                 children: [
//                   Icon(Icons.check_circle,
//                       color: context.fsmTheme.success, size: 20.sp),
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
//             if (hasError)
//               Padding(
//                 padding: EdgeInsets.only(top: 8.h),
//                 child: Text(
//                   field.errorText!,
//                   style: TextStyle(color: theme.colorScheme.error),
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
//       final image =
//           await _signaturePadKey.currentState?.toImage(pixelRatio: 3.0);
//       if (image == null) {
//         _showError('Failed to capture signature');
//         return;
//       }
//
//       final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       if (byteData == null) {
//         _showError('Failed to process signature');
//         return;
//       }
//
//       final dir = await getTemporaryDirectory();
//       final file = File(
//           '${dir.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png');
//       await file.writeAsBytes(byteData.buffer.asUint8List());
//
//       // Properly update control
//       field.control.updateValue(file);
//       field.control.markAsDirty();
//       field.control.markAsTouched();
//       field.didChange(file);
//
//       setState(() => _hasSignature = true);
//
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
//     _signaturePadKey.currentState?.clear();
//     field.control.updateValue(null);
//     field.didChange(null);
//     setState(() => _hasSignature = false);
//   }
//
//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.red),
//     );
//   }
// }

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveFormField<File?, File?>(
      formControlName: widget.formControlName,
      builder: (field) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: bgColor,
                  strokeColor: strokeColor,
                  minimumStrokeWidth: widget.strokeWidth,
                  maximumStrokeWidth: widget.strokeWidth + 1,
                  onDrawStart: () {
                    // Track that user has started drawing
                    if (!_hasDrawn && mounted) {
                      setState(() {
                        _hasDrawn = true;
                      });
                    }
                    return false; // Allow drawing to proceed
                  },
                ),
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
                    onPressed: _isSaving ? null : () => _clearSignature(field),
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
                    backgroundColor: isSaved
                        ? context.fsmTheme.success.withValues(alpha: 0.1)
                        : Theme.of(context).colorScheme.primary,
                    // disabledBackgroundColor: isSaved
                    //     ? context.fsmTheme.success.withValues(alpha: 0.1)
                    //     : Theme.of(context).colorScheme.primary,
                    side: isSaved
                        ? BorderSide(
                            color:
                                context.fsmTheme.success.withValues(alpha: 0.3),
                            width: DesignTokens.borderWidthThin,
                          )
                        : BorderSide.none,
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
                  onPressed: (_hasDrawn && !_isSaving && !isSaved)
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
                          color:
                              isSaved ? context.fsmTheme.success : Colors.white,
                          size: DesignTokens.iconSm.sp,
                        ),
                  label: Text(
                    _isSaving
                        ? 'Saving...'
                        : isSaved
                            ? 'Successfully saved'
                            : 'Save Signature',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: DesignTokens.fontSize14.sp,
                          color:
                              isSaved ? context.fsmTheme.success : Colors.white,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
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
      // Capture signature as image with high resolution
      final signaturePadState = _signaturePadKey.currentState;
      if (signaturePadState == null) {
        throw Exception('Signature pad state is null');
      }

      final image = await signaturePadState.toImage(pixelRatio: 3.0);

      if (image == null) {
        throw Exception('Failed to capture signature image');
      }

      // Convert to PNG bytes
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception('Failed to convert image to bytes');
      }

      // Save to app documents directory (permanent storage)
      final dir = await getApplicationDocumentsDirectory();
      final signaturesDir = Directory('${dir.path}/signatures');

      // Create signatures directory if it doesn't exist
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
        setState(() {
          _isSaving = false;
        });

        // Show success snackbar
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
    debugPrint('🗑️ Clear button pressed');

    // Clear the signature pad
    _signaturePadKey.currentState?.clear();

    // Reset form control
    field.control.updateValue(null);
    field.control.markAsTouched();
    field.didChange(null);

    // Reset state
    if (mounted) {
      setState(() {
        _hasDrawn = false;
      });
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
