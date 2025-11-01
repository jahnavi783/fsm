import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import '../models/part_used_input.dart';

/// Card widget displaying a part used in work order completion
class PartUsedCard extends StatelessWidget {
  final PartUsedInput partInput;
  final int index;
  final VoidCallback onRemove;

  const PartUsedCard({
    super.key,
    required this.partInput,
    required this.index,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final part = partInput.part;

    return Container(
      margin: REdgeInsets.only(bottom: DesignTokens.space3),
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: DesignTokens.buttonHeightMd.w,
                height: DesignTokens.buttonHeightMd.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
                child: Icon(
                  Icons.inventory_2,
                  color: theme.colorScheme.primary,
                  size: DesignTokens.iconSm.sp,
                ),
              ),
              RSizedBox(width: DesignTokens.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      part.partName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Part #: ${part.partNumber}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: Icon(Icons.delete, color: theme.colorScheme.error),
                style: IconButton.styleFrom(
                  padding: REdgeInsets.all(DesignTokens.space2),
                  minimumSize: Size(DesignTokens.iconLg.w, DesignTokens.iconLg.h),
                ),
              ),
            ],
          ),
          RSizedBox(height: DesignTokens.space3),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quantity Used',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    RSizedBox(height: DesignTokens.space1),
                    TextFormField(
                      controller: partInput.quantityController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Required';
                        }
                        final qty = int.tryParse(value);
                        if (qty == null || qty <= 0) {
                          return 'Invalid quantity';
                        }
                        if (qty > part.quantityAvailable) {
                          return 'Only ${part.quantityAvailable} available';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                        ),
                        contentPadding: REdgeInsets.symmetric(
                          horizontal: DesignTokens.space3,
                          vertical: DesignTokens.space3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RSizedBox(width: DesignTokens.space4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  RSizedBox(height: DesignTokens.space1),
                  Text(
                    '${part.quantityAvailable}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: part.isInStock ? fsmTheme.success : theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
