import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'work_and_parts_step.dart';

/// Step 3: Review and Submit
/// Collects location, customer name, signature and shows review of all data
class ReviewAndSubmitStep extends StatefulWidget {
  final TextEditingController customerNameController;
  final TextEditingController workLogController;
  final TextEditingController completionNotesController;
  final GlobalKey<SfSignaturePadState> signaturePadKey;
  final bool hasSignature;
  final VoidCallback onSignatureDrawn;
  final VoidCallback onClearSignature;
  final LocationEntity? currentLocation;
  final List<PartUsedInput> partsUsed;
  final List<XFile> imageFiles;
  final GlobalKey<FormState> formKey;

  const ReviewAndSubmitStep({
    super.key,
    required this.customerNameController,
    required this.workLogController,
    required this.completionNotesController,
    required this.signaturePadKey,
    required this.hasSignature,
    required this.onSignatureDrawn,
    required this.onClearSignature,
    required this.currentLocation,
    required this.partsUsed,
    required this.imageFiles,
    required this.formKey,
  });

  @override
  State<ReviewAndSubmitStep> createState() => _ReviewAndSubmitStepState();
}

class _ReviewAndSubmitStepState extends State<ReviewAndSubmitStep> {
  bool _showReview = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step header
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
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
                        'Final Details',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Location, customer, and signature',
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

          SizedBox(height: 20.h),

          // Location Status (Read-only)
          Text(
            'Location *',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: widget.currentLocation != null
                  ? AppColors.success.withOpacity(0.1)
                  : AppColors.warning.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: widget.currentLocation != null
                    ? AppColors.success.withOpacity(0.3)
                    : AppColors.warning.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  widget.currentLocation != null
                      ? Icons.location_on
                      : Icons.location_searching,
                  size: 24.sp,
                  color: widget.currentLocation != null
                      ? AppColors.success
                      : AppColors.warning,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.currentLocation != null
                            ? 'Location Captured'
                            : 'Capturing Location...',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: widget.currentLocation != null
                              ? AppColors.success
                              : AppColors.warning,
                        ),
                      ),
                      if (widget.currentLocation != null)
                        Text(
                          '${widget.currentLocation!.latitude.toStringAsFixed(6)}, ${widget.currentLocation!.longitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.currentLocation == null)
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.warning,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // Customer Name Field (Required)
          Text(
            'Customer Name *',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: widget.customerNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter customer name';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter customer name...',
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColors.outline.withOpacity(0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.error,
                ),
              ),
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),

          SizedBox(height: 20.h),

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
                  ? AppColors.success.withOpacity(0.05)
                  : theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: widget.hasSignature
                    ? AppColors.success
                    : AppColors.outline.withOpacity(0.3),
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
                      color: AppColors.outline.withOpacity(0.2),
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
                        widget.onSignatureDrawn();
                        return true;
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
                            'Signature captured',
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
                            color: theme.colorScheme.onSurface.withOpacity(0.5),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Draw signature above',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: theme.colorScheme.onSurface.withOpacity(0.5),
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

          SizedBox(height: 20.h),

          // Completion Notes Section (Optional)
          Text(
            'Additional Notes (Optional)',
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
                  color: AppColors.outline.withOpacity(0.3),
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

          SizedBox(height: 24.h),

          // Review Toggle Button
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                _showReview = !_showReview;
              });
            },
            icon: Icon(
              _showReview ? Icons.visibility_off : Icons.visibility,
              size: 18.sp,
            ),
            label: Text(
              _showReview ? 'Hide Summary' : 'Review Summary',
              style: TextStyle(fontSize: 14.sp),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              side: BorderSide(color: AppColors.primary),
              foregroundColor: AppColors.primary,
            ),
          ),

          // Review Summary
          if (_showReview) ...[
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.summarize,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Completion Summary',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Work Log
                  _buildReviewItem(
                    'Work Log',
                    widget.workLogController.text.trim().isEmpty
                        ? 'Not provided'
                        : widget.workLogController.text.trim(),
                    widget.workLogController.text.trim().isNotEmpty,
                  ),

                  SizedBox(height: 12.h),

                  // Parts Used
                  _buildReviewItem(
                    'Parts Used',
                    widget.partsUsed.isEmpty
                        ? 'No parts added'
                        : '${widget.partsUsed.length} part(s)',
                    widget.partsUsed.isNotEmpty,
                  ),

                  if (widget.partsUsed.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    ...widget.partsUsed.map((part) => Padding(
                          padding: EdgeInsets.only(left: 16.w, bottom: 4.h),
                          child: Text(
                            '• ${part.part.partName} (Qty: ${part.quantityController.text})',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        )),
                  ],

                  SizedBox(height: 12.h),

                  // Images
                  _buildReviewItem(
                    'Images',
                    widget.imageFiles.isEmpty
                        ? 'No images added'
                        : '${widget.imageFiles.length} image(s)',
                    widget.imageFiles.isNotEmpty,
                  ),

                  SizedBox(height: 12.h),

                  // Customer Name
                  _buildReviewItem(
                    'Customer Name',
                    widget.customerNameController.text.trim().isEmpty
                        ? 'Not provided'
                        : widget.customerNameController.text.trim(),
                    widget.customerNameController.text.trim().isNotEmpty,
                  ),

                  SizedBox(height: 12.h),

                  // Signature
                  _buildReviewItem(
                    'Signature',
                    widget.hasSignature ? 'Captured' : 'Not captured',
                    widget.hasSignature,
                  ),

                  if (widget.completionNotesController.text.trim().isNotEmpty) ...[
                    SizedBox(height: 12.h),
                    _buildReviewItem(
                      'Additional Notes',
                      widget.completionNotesController.text.trim(),
                      true,
                    ),
                  ],
                ],
              ),
            ),
          ],

          SizedBox(height: 16.h),

          // Helper text
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.5),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Location, customer name, and signature are required to submit',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String label, String value, bool isProvided) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isProvided ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16.sp,
          color: isProvided ? AppColors.success : Colors.grey,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[700],
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
