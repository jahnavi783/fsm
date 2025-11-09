import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
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
  bool _hasSignature = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveFormField<File?, File?>(
      formControlName: widget.formControlName,
      builder: (ReactiveFormFieldState<File?, File?> field) {
        final hasError = field.errorText != null && field.control.touched;
        final effectiveBackgroundColor =
            widget.backgroundColor ?? theme.colorScheme.surface;
        final effectiveStrokeColor =
            widget.strokeColor ?? theme.colorScheme.onSurface;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            if (widget.label != null) ...[
              Row(
                children: [
                  Text(
                    widget.label!,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: DesignTokens.fontSize14.sp,
                      fontWeight: DesignTokens.fontWeightSemiBold,
                    ),
                  ),
                  if (widget.required) ...[
                    RSizedBox(width: DesignTokens.space1),
                    Text(
                      '*',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.error,
                        fontSize: DesignTokens.fontSize14.sp,
                      ),
                    ),
                  ],
                ],
              ),
              RSizedBox(height: DesignTokens.space3),
            ],

            // Signature pad container
            Container(
              height: widget.height.h,
              decoration: BoxDecoration(
                color: effectiveBackgroundColor,
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                border: Border.all(
                  color: hasError
                      ? theme.colorScheme.error
                      : theme.colorScheme.outline,
                  width: hasError
                      ? DesignTokens.borderWidthMedium
                      : DesignTokens.borderWidthThin,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: effectiveBackgroundColor,
                  strokeColor: effectiveStrokeColor,
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

            RSizedBox(height: DesignTokens.space3),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_hasSignature)
                  TextButton.icon(
                    onPressed: () => _clearSignature(field),
                    icon: Icon(Icons.clear, size: DesignTokens.iconXs.sp),
                    label: Text(
                      'Clear',
                      style: TextStyle(fontSize: DesignTokens.fontSize14.sp),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                  ),
                if (_hasSignature) RSizedBox(width: DesignTokens.space2),
                FilledButton.icon(
                  onPressed: _hasSignature ? () => _saveSignature(field) : null,
                  icon: Icon(Icons.check, size: DesignTokens.iconXs.sp),
                  label: Text(
                    'Save Signature',
                    style: TextStyle(fontSize: DesignTokens.fontSize14.sp),
                  ),
                ),
              ],
            ),

            // Signature preview or status
            if (field.value != null) ...[
              RSizedBox(height: DesignTokens.space3),
              Container(
                padding: REdgeInsets.all(DesignTokens.space3),
                decoration: BoxDecoration(
                  color: context.fsmTheme.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                  border: Border.all(
                    color: context.fsmTheme.success.withValues(alpha: 0.3),
                    width: DesignTokens.borderWidthThin,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: context.fsmTheme.success,
                      size: DesignTokens.iconSm.sp,
                    ),
                    RSizedBox(width: DesignTokens.space2),
                    Expanded(
                      child: Text(
                        'Signature captured',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: DesignTokens.fontSize14.sp,
                          color: context.fsmTheme.success,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _clearSignature(field),
                      child: Text(
                        'Change',
                        style: TextStyle(fontSize: DesignTokens.fontSize12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Error message
            if (hasError) ...[
              RSizedBox(height: DesignTokens.space2),
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: DesignTokens.iconSm.sp,
                    color: theme.colorScheme.error,
                  ),
                  RSizedBox(width: DesignTokens.space1),
                  Expanded(
                    child: Text(
                      field.errorText!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: DesignTokens.fontSize12.sp,
                        color: theme.colorScheme.error,
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
            backgroundColor: context.fsmTheme.success,
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
      final theme = Theme.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: theme.colorScheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
