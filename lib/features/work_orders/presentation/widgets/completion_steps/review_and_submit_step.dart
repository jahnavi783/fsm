import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'models/part_used_input.dart';

/// Step 3: Review and Submit
/// Collects customer name, signature and shows review of all data
class ReviewAndSubmitStep extends StatefulWidget {
  final TextEditingController customerNameController;
  final TextEditingController workLogController;
  final TextEditingController completionNotesController;
  final GlobalKey<SfSignaturePadState> signaturePadKey;
  final bool hasSignature;
  final VoidCallback onSignatureDrawn;
  final VoidCallback onClearSignature;
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
    required this.partsUsed,
    required this.imageFiles,
    required this.formKey,
  });

  @override
  State<ReviewAndSubmitStep> createState() => _ReviewAndSubmitStepState();
}

class _ReviewAndSubmitStepState extends State<ReviewAndSubmitStep> {
  bool _showReview = false;

  void _handleToggleReview() {
    setState(() {
      _showReview = !_showReview;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step header
          Container(
            padding: REdgeInsets.all(DesignTokens.space4),
            decoration: BoxDecoration(
              color: fsmTheme.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            child: Row(
              children: [
                Container(
                  width: DesignTokens.iconLg.w,
                  height: DesignTokens.iconLg.w,
                  decoration: BoxDecoration(
                    color: fsmTheme.success,
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
                        'Review & Submit',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Customer details and signature',
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

          RSizedBox(height: DesignTokens.space5),

          // Customer Name Field (Required)
          Text(
            'Customer Name *',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          RSizedBox(height: DesignTokens.space2),
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                ),
              ),
              contentPadding: REdgeInsets.all(DesignTokens.space4),
            ),
          ),

          RSizedBox(height: DesignTokens.space5),

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
                  : theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.3),
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
                        widget.onSignatureDrawn();
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
                            'Signature captured',
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
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.5),
                          ),
                          RSizedBox(width: DesignTokens.space2),
                          Text(
                            'Draw signature above',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.5),
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

          RSizedBox(height: DesignTokens.space5),

          // Completion Notes Section (Optional)
          Text(
            'Additional Notes (Optional)',
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

          RSizedBox(height: DesignTokens.space6),

          // Review Toggle Button
          OutlinedButton.icon(
            onPressed: _handleToggleReview,
            icon: Icon(
              _showReview ? Icons.visibility_off : Icons.visibility,
              size: DesignTokens.iconSm.sp,
            ),
            label: Text(
              _showReview ? 'Hide Summary' : 'Review Summary',
            ),
            style: OutlinedButton.styleFrom(
              padding: REdgeInsets.symmetric(
                horizontal: DesignTokens.space5,
                vertical: DesignTokens.space3,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              ),
              side: BorderSide(color: theme.colorScheme.primary),
              foregroundColor: theme.colorScheme.primary,
            ),
          ),

          // Review Summary
          if (_showReview) ...[
            RSizedBox(height: DesignTokens.space4),
            Container(
              padding: REdgeInsets.all(DesignTokens.space4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.summarize,
                        color: theme.colorScheme.primary,
                        size: DesignTokens.iconSm.sp,
                      ),
                      RSizedBox(width: DesignTokens.space2),
                      Text(
                        'Completion Summary',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  RSizedBox(height: DesignTokens.space4),

                  // Work Log
                  _buildReviewItem(
                    context,
                    'Work Log',
                    widget.workLogController.text.trim().isEmpty
                        ? 'Not provided'
                        : widget.workLogController.text.trim(),
                    widget.workLogController.text.trim().isNotEmpty,
                  ),

                  RSizedBox(height: DesignTokens.space3),

                  // Parts Used
                  _buildReviewItem(
                    context,
                    'Parts Used',
                    widget.partsUsed.isEmpty
                        ? 'No parts added'
                        : '${widget.partsUsed.length} part(s)',
                    widget.partsUsed.isNotEmpty,
                  ),

                  if (widget.partsUsed.isNotEmpty) ...[
                    RSizedBox(height: DesignTokens.space2),
                    ...widget.partsUsed.map((part) => Padding(
                          padding: REdgeInsets.only(
                            left: DesignTokens.space4,
                            bottom: DesignTokens.space1,
                          ),
                          child: Text(
                            '• ${part.part.partName} (Qty: ${part.quantityController.text})',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.7),
                            ),
                          ),
                        )),
                  ],

                  RSizedBox(height: DesignTokens.space3),

                  // Images
                  _buildReviewItem(
                    context,
                    'Images',
                    widget.imageFiles.isEmpty
                        ? 'No images added'
                        : '${widget.imageFiles.length} image(s)',
                    widget.imageFiles.isNotEmpty,
                  ),

                  RSizedBox(height: DesignTokens.space3),

                  // Customer Name
                  _buildReviewItem(
                    context,
                    'Customer Name',
                    widget.customerNameController.text.trim().isEmpty
                        ? 'Not provided'
                        : widget.customerNameController.text.trim(),
                    widget.customerNameController.text.trim().isNotEmpty,
                  ),

                  RSizedBox(height: DesignTokens.space3),

                  // Signature
                  _buildReviewItem(
                    context,
                    'Signature',
                    widget.hasSignature ? 'Captured' : 'Not captured',
                    widget.hasSignature,
                  ),

                  if (widget.completionNotesController.text
                      .trim()
                      .isNotEmpty) ...[
                    RSizedBox(height: DesignTokens.space3),
                    _buildReviewItem(
                      context,
                      'Additional Notes',
                      widget.completionNotesController.text.trim(),
                      true,
                    ),
                  ],
                ],
              ),
            ),
          ],

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
                  'Customer name and signature are required to submit',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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

  Widget _buildReviewItem(
    BuildContext context,
    String label,
    String value,
    bool isProvided,
  ) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isProvided ? Icons.check_circle : Icons.radio_button_unchecked,
          size: DesignTokens.iconSm.sp,
          color: isProvided
              ? fsmTheme.success
              : theme.colorScheme.onSurface.withValues(alpha: 0.4),
        ),
        RSizedBox(width: DesignTokens.space2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
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
