import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// Step 3: Verification
/// Collects customer signature and completion notes
class VerificationStep extends StatefulWidget {
  final TextEditingController completionNotesController;
  final GlobalKey<SfSignaturePadState> signaturePadKey;
  final bool hasSignature;
  final VoidCallback onSignatureDrawn;
  final VoidCallback onClearSignature;

  const VerificationStep({
    super.key,
    required this.completionNotesController,
    required this.signaturePadKey,
    required this.hasSignature,
    required this.onSignatureDrawn,
    required this.onClearSignature,
  });

  @override
  State<VerificationStep> createState() => _VerificationStepState();
}

class _VerificationStepState extends State<VerificationStep> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step header
        Container(
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          ),
          child: Row(
            children: [
              Container(
                width: DesignTokens.iconLg.w,
                height: DesignTokens.iconLg.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              RSizedBox(width: DesignTokens.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Customer signature and final notes',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        RSizedBox(height: DesignTokens.space6),

        // Customer Signature Section (Required)
        Row(
          children: [
            Icon(
              Icons.draw_outlined,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onSurface,
            ),
            RSizedBox(width: DesignTokens.space2),
            Text(
              'Customer Signature *',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),

        RSizedBox(height: DesignTokens.space2),

        // Signature Pad Container
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: widget.hasSignature
                ? fsmTheme.success.withValues(alpha: 0.05)
                : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            border: Border.all(
              color: widget.hasSignature
                  ? fsmTheme.success
                  : theme.colorScheme.outline.withValues(alpha: 0.3),
              width: widget.hasSignature ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              // Signature Pad
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                  child: SfSignaturePad(
                    key: widget.signaturePadKey,
                    backgroundColor: Colors.white,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 1.5,
                    maximumStrokeWidth: 3.5,
                    onDrawStart: () {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        widget.onSignatureDrawn();
                      });
                      return false; // Allow drawing to start
                    },
                  ),
                ),
              ),

              RSizedBox(height: DesignTokens.space3),

              // Status and Clear Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Status indicator
                  if (widget.hasSignature)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: DesignTokens.iconSm.sp,
                          color: fsmTheme.success,
                        ),
                        RSizedBox(width: DesignTokens.space2),
                        Text(
                          'Customer signature captured successfully',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: fsmTheme.success,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: DesignTokens.iconSm.sp,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        RSizedBox(width: DesignTokens.space2),
                        Text(
                          'Draw signature above',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),

                  // Clear button
                  if (widget.hasSignature)
                    TextButton.icon(
                      onPressed: widget.onClearSignature,
                      icon: Icon(Icons.refresh, size: DesignTokens.iconSm.sp),
                      label: const Text('Redo'),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        RSizedBox(height: DesignTokens.space6),

        // Completion Notes Section (Optional)
        Text(
          'Completion Notes (Optional)',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),

        RSizedBox(height: DesignTokens.space2),

        TextFormField(
          controller: widget.completionNotesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any additional notes...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: REdgeInsets.all(DesignTokens.space4),
          ),
        ),

        RSizedBox(height: DesignTokens.space4),

        // Helper text
        Row(
          children: [
            Icon(
              Icons.info_outline,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            RSizedBox(width: DesignTokens.space2),
            Expanded(
              child: Text(
                'Customer signature is required to complete the work order',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
