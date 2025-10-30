import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/form/reactive_signature_control.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// Reusable reactive signature pad widget
/// Wraps Syncfusion SfSignaturePad with ReactiveFormField
class ReactiveSignaturePad extends StatefulWidget {
  final String formControlName;
  final String? label;
  final bool required;
  final double height;
  final Color? backgroundColor;
  final Color strokeColor;
  final double strokeWidth;

  const ReactiveSignaturePad({
    super.key,
    required this.formControlName,
    this.label,
    this.required = false,
    this.height = 200,
    this.backgroundColor,
    this.strokeColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  @override
  State<ReactiveSignaturePad> createState() => _ReactiveSignaturePadState();
}

class _ReactiveSignaturePadState extends State<ReactiveSignaturePad> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  bool _hasSignature = false;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<File?, File?>(
      formControlName: widget.formControlName,
      builder: (ReactiveFormFieldState<File?, File?> field) {
        final hasError = field.errorText != null && field.control.touched;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            if (widget.label != null) ...[
              Row(
                children: [
                  Text(
                    widget.label!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (widget.required) ...[
                    SizedBox(width: 4.w),
                    Text(
                      '*',
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 12.h),
            ],

            // Signature pad container
            Container(
              height: widget.height.h,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? AppColors.surface,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: hasError ? AppColors.error : AppColors.outline,
                  width: hasError ? 2 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: widget.backgroundColor ?? AppColors.surface,
                  strokeColor: widget.strokeColor,
                  minimumStrokeWidth: widget.strokeWidth,
                  maximumStrokeWidth: widget.strokeWidth + 1,
                  onDrawStart: () {
                    if (!_hasSignature) {
                      setState(() {
                        _hasSignature = true;
                      });
                    }
                    return true;
                  },
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_hasSignature)
                  TextButton.icon(
                    onPressed: () => _clearSignature(field),
                    icon: Icon(Icons.clear, size: 18.sp),
                    label: Text(
                      'Clear',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                    ),
                  ),
                if (_hasSignature) SizedBox(width: 8.w),
                ElevatedButton.icon(
                  onPressed: _hasSignature ? () => _saveSignature(field) : null,
                  icon: Icon(Icons.check, size: 18.sp),
                  label: Text(
                    'Save Signature',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.grey300,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ],
            ),

            // Signature preview or status
            if (field.value != null) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.success.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'Signature captured',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.success,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _clearSignature(field),
                      child: Text(
                        'Change',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Error message
            if (hasError) ...[
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 16.sp,
                    color: AppColors.error,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      field.errorText!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _saveSignature(
      ReactiveFormFieldState<File?, File?> field) async {
    try {
      final signatureImage = await _signaturePadKey.currentState?.toImage(
        pixelRatio: 3.0,
      );

      if (signatureImage == null) {
        _showError('Failed to capture signature');
        return;
      }

      final control = field.control as ReactiveSignatureControl;
      await control.setSignatureFromImage(signatureImage);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Signature saved successfully'),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      _showError('Failed to save signature: $e');
    }
  }

  void _clearSignature(ReactiveFormFieldState<File?, File?> field) {
    _signaturePadKey.currentState?.clear();
    final control = field.control as ReactiveSignatureControl;
    control.clearSignature();
    setState(() {
      _hasSignature = false;
    });
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
