import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/widgets/inputs/quantity_selector.dart';
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

  /// Calculates total cost from unit price and quantity
  String _calculateTotal(double unitPrice, String quantityText) {
    final quantity = int.tryParse(quantityText) ?? 1;
    final total = unitPrice * quantity;
    return total.toStringAsFixed(2);
  }

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
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
                  minimumSize:
                      Size(DesignTokens.iconLg.w, DesignTokens.iconLg.h),
                ),
              ),
            ],
          ),
          RSizedBox(height: DesignTokens.space2),

          // Price info and stock indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${part.unitPrice.toStringAsFixed(2)}/unit',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: REdgeInsets.symmetric(
                  horizontal: DesignTokens.space2,
                  vertical: DesignTokens.space1,
                ),
                decoration: BoxDecoration(
                  color: fsmTheme
                      .getStockColorByQuantity(
                        part.quantityAvailable,
                        10, // minQuantity
                        50, // maxQuantity
                      )
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusFull.r),
                ),
                child: Text(
                  'Stock: ${part.quantityAvailable}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: fsmTheme.getStockColorByQuantity(
                      part.quantityAvailable,
                      10, // minQuantity
                      50, // maxQuantity
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          RSizedBox(height: DesignTokens.space3),

          // Quantity selector and total cost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantitySelector(
                initialQuantity: int.tryParse(partInput.quantityController.text) ?? 1,
                availableStock: part.quantityAvailable,
                onQuantityChanged: (newQuantity) {
                  partInput.quantityController.text = newQuantity.toString();
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  RSizedBox(height: DesignTokens.space1),
                  Text(
                    '\$${_calculateTotal(part.unitPrice, partInput.quantityController.text)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.primary,
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
