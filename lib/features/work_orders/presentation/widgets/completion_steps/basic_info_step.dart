import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// Step 1: Basic Information
/// Collects customer name and work log
class BasicInfoStep extends StatelessWidget {
  final TextEditingController customerNameController;
  final TextEditingController workLogController;
  final GlobalKey<FormState> formKey;

  const BasicInfoStep({
    super.key,
    required this.customerNameController,
    required this.workLogController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
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
                      '1',
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
                        'Basic Information',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Customer details and work summary',
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
            controller: customerNameController,
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

          // Work Log Field (Required)
          Text(
            'Work Log *',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          RSizedBox(height: DesignTokens.space2),
          TextFormField(
            controller: workLogController,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please describe the work performed';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Describe the work performed, issues resolved, etc...',
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
                  'Both fields are required to proceed to the next step',
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
}
