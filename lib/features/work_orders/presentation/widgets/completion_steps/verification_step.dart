import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:fsm/core/theme/app_colors.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step header
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Customer signature and final notes',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Customer Signature Section (Required)
        Row(
          children: [
            Icon(
              Icons.draw_outlined,
              size: 20.sp,
              color: theme.colorScheme.onSurface,
            ),
            SizedBox(width: 8.w),
            Text(
              'Customer Signature *',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),

        SizedBox(height: 8.h),

        // Signature Pad Container
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: widget.hasSignature
                ? AppColors.success.withValues(alpha: 0.05)
                : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: widget.hasSignature
                  ? AppColors.success
                  : AppColors.outline.withValues(alpha: 0.3),
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
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
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

              SizedBox(height: 12.h),

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
                          size: 18.sp,
                          color: AppColors.success,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Customer signature captured successfully',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 18.sp,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Draw signature above',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),

                  // Clear button
                  if (widget.hasSignature)
                    TextButton.icon(
                      onPressed: widget.onClearSignature,
                      icon: Icon(Icons.refresh, size: 18.sp),
                      label: const Text('Redo'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Completion Notes Section (Optional)
        Text(
          'Completion Notes (Optional)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),

        SizedBox(height: 8.h),

        TextFormField(
          controller: widget.completionNotesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any additional notes...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.outline.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.all(16.w),
          ),
        ),

        SizedBox(height: 16.h),

        // Helper text
        Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 16.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Customer signature is required to complete the work order',
                style: TextStyle(
                  fontSize: 12.sp,
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
