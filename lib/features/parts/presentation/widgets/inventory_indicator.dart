import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

class InventoryIndicator extends StatelessWidget {
  final int quantity;
  final int minQuantity;
  final int maxQuantity;
  final bool showLabel;
  final double? size;

  const InventoryIndicator({
    super.key,
    required this.quantity,
    required this.minQuantity,
    required this.maxQuantity,
    this.showLabel = true,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stockLevel = quantity / maxQuantity;
    final isLowStock = quantity <= minQuantity;
    final isOutOfStock = quantity == 0;

    final indicatorSize = size ?? DesignTokens.buttonHeightLg.w;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: indicatorSize,
          height: indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _getStockColor(context, isOutOfStock, isLowStock),
              width: 3.w,
            ),
          ),
          child: Stack(
            children: [
              // Background circle
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
              ),
              // Progress indicator
              if (quantity > 0)
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: stockLevel.clamp(0.0, 1.0),
                    strokeWidth: 4.w,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getStockColor(context, isOutOfStock, isLowStock),
                    ),
                  ),
                ),
              // Quantity text
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      quantity.toString(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getStockColor(context, isOutOfStock, isLowStock),
                      ),
                    ),
                    if (indicatorSize >= DesignTokens.buttonHeightLg.w)
                      Text(
                        'qty',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showLabel) ...[
          RSizedBox(height: DesignTokens.space1),
          Text(
            _getStockStatusText(isOutOfStock, isLowStock),
            style: theme.textTheme.labelSmall?.copyWith(
              color: _getStockColor(context, isOutOfStock, isLowStock),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Color _getStockColor(BuildContext context, bool isOutOfStock, bool isLowStock) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    if (isOutOfStock) return theme.colorScheme.error;
    if (isLowStock) return fsmTheme.warning;
    return fsmTheme.success;
  }

  String _getStockStatusText(bool isOutOfStock, bool isLowStock) {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    return 'In Stock';
  }
}

class InventoryLevelBar extends StatelessWidget {
  final int quantity;
  final int minQuantity;
  final int maxQuantity;
  final double height;
  final bool showLabels;

  const InventoryLevelBar({
    super.key,
    required this.quantity,
    required this.minQuantity,
    required this.maxQuantity,
    this.height = 8.0,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final stockLevel = quantity / maxQuantity;
    final isLowStock = quantity <= minQuantity;
    final isOutOfStock = quantity == 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabels) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stock Level',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              Text(
                '$quantity / $maxQuantity',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _getStockColor(context, isOutOfStock, isLowStock),
                ),
              ),
            ],
          ),
          RSizedBox(height: DesignTokens.space1),
        ],
        Container(
          height: height.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height.r / 2),
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          ),
          child: Stack(
            children: [
              // Progress bar
              FractionallySizedBox(
                widthFactor: stockLevel.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height.r / 2),
                    color: _getStockColor(context, isOutOfStock, isLowStock),
                  ),
                ),
              ),
              // Minimum stock indicator line
              if (minQuantity > 0 && maxQuantity > 0)
                Positioned(
                  left: (minQuantity / maxQuantity * 100).w,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 2.w,
                    color: fsmTheme.warning.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
        if (showLabels) ...[
          RSizedBox(height: DesignTokens.space1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Min: $minQuantity',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(
                _getStockStatusText(isOutOfStock, isLowStock),
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _getStockColor(context, isOutOfStock, isLowStock),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Color _getStockColor(BuildContext context, bool isOutOfStock, bool isLowStock) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    if (isOutOfStock) return theme.colorScheme.error;
    if (isLowStock) return fsmTheme.warning;
    return fsmTheme.success;
  }

  String _getStockStatusText(bool isOutOfStock, bool isLowStock) {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    return 'Normal';
  }
}