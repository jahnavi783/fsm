import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/widgets/cards/fsm_card.dart';

import '../../domain/entities/part_entity.dart';
import 'inventory_indicator.dart';

class PartCard extends StatelessWidget {
  final PartEntity part;
  final VoidCallback? onTap;
  final VoidCallback? onUpdateInventory;

  const PartCard({
    super.key,
    required this.part,
    this.onTap,
    this.onUpdateInventory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return FSMCard(
      margin: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4, vertical: DesignTokens.space2),
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.all(DesignTokens.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        part.partName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RSizedBox(height: DesignTokens.space1),
                      Text(
                        'Part #: ${part.partNumber}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                RSizedBox(width: DesignTokens.space3),
                InventoryIndicator(
                  quantity: part.quantityAvailable,
                  minQuantity: 10, // Default minimum threshold
                  maxQuantity: 100, // Default maximum threshold
                ),
              ],
            ),
            RSizedBox(height: DesignTokens.space3),
            Text(
              'Part Number: ${part.partNumber}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RSizedBox(height: DesignTokens.space3),
            Row(
              children: [
                Container(
                  padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space2,
                      vertical: DesignTokens.space1),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    part.category,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                RSizedBox(width: DesignTokens.space2),
                Container(
                  padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space2,
                      vertical: DesignTokens.space1),
                  decoration: BoxDecoration(
                    color: _getStatusColor(context, part.status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                    border: Border.all(
                        color: _getStatusColor(context, part.status)
                            .withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    _getStatusText(part.status),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: _getStatusColor(context, part.status),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${part.unitPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            if (part.isLowStock) ...[
              RSizedBox(height: DesignTokens.space3),
              Container(
                width: double.infinity,
                padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space3,
                    vertical: DesignTokens.space2),
                decoration: BoxDecoration(
                  color: part.isOutOfStock
                      ? theme.colorScheme.errorContainer.withValues(alpha: 0.3)
                      : fsmTheme.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                  border: Border.all(
                    color: part.isOutOfStock
                        ? theme.colorScheme.error.withValues(alpha: 0.3)
                        : fsmTheme.warning.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      part.isOutOfStock ? Icons.error : Icons.warning,
                      size: DesignTokens.iconSm.sp,
                      color: part.isOutOfStock
                          ? theme.colorScheme.error
                          : fsmTheme.warning,
                    ),
                    RSizedBox(width: DesignTokens.space2),
                    Expanded(
                      child: Text(
                        part.isOutOfStock
                            ? 'Out of stock - Reorder needed'
                            : 'Low stock - Consider reordering',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: part.isOutOfStock
                              ? theme.colorScheme.error
                              : fsmTheme.warning,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (onUpdateInventory != null)
                      TextButton(
                        onPressed: onUpdateInventory,
                        style: TextButton.styleFrom(
                          padding: REdgeInsets.symmetric(
                              horizontal: DesignTokens.space2,
                              vertical: DesignTokens.space1),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Update',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context, PartStatus status) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    switch (status) {
      case PartStatus.active:
        return fsmTheme.success;
      case PartStatus.inactive:
        return theme.colorScheme.surfaceContainerHighest;
      case PartStatus.discontinued:
        return theme.colorScheme.error;
      case PartStatus.backordered:
        return fsmTheme.warning;
    }
  }

  String _getStatusText(PartStatus status) {
    switch (status) {
      case PartStatus.active:
        return 'Active';
      case PartStatus.inactive:
        return 'Inactive';
      case PartStatus.discontinued:
        return 'Discontinued';
      case PartStatus.backordered:
        return 'Backordered';
    }
  }
}
