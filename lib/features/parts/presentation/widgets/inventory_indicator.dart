import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final stockLevel = quantity / maxQuantity;
    final isLowStock = quantity <= minQuantity;
    final isOutOfStock = quantity == 0;
    
    final indicatorSize = size ?? 60.w;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: indicatorSize,
          height: indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _getStockColor(isOutOfStock, isLowStock),
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
                  color: Colors.grey[100],
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
                      _getStockColor(isOutOfStock, isLowStock),
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
                      style: TextStyle(
                        fontSize: (indicatorSize * 0.25).sp,
                        fontWeight: FontWeight.bold,
                        color: _getStockColor(isOutOfStock, isLowStock),
                      ),
                    ),
                    if (indicatorSize >= 60.w)
                      Text(
                        'qty',
                        style: TextStyle(
                          fontSize: (indicatorSize * 0.15).sp,
                          color: Colors.grey[600],
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
          SizedBox(height: 4.h),
          Text(
            _getStockStatusText(isOutOfStock, isLowStock),
            style: TextStyle(
              fontSize: 11.sp,
              color: _getStockColor(isOutOfStock, isLowStock),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Color _getStockColor(bool isOutOfStock, bool isLowStock) {
    if (isOutOfStock) return Colors.red;
    if (isLowStock) return Colors.orange;
    return Colors.green;
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
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '$quantity / $maxQuantity',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: _getStockColor(isOutOfStock, isLowStock),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
        ],
        Container(
          height: height.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height.r / 2),
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              // Progress bar
              FractionallySizedBox(
                widthFactor: stockLevel.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height.r / 2),
                    color: _getStockColor(isOutOfStock, isLowStock),
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
                    color: Colors.orange[700],
                  ),
                ),
            ],
          ),
        ),
        if (showLabels) ...[
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Min: $minQuantity',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                _getStockStatusText(isOutOfStock, isLowStock),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: _getStockColor(isOutOfStock, isLowStock),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Color _getStockColor(bool isOutOfStock, bool isLowStock) {
    if (isOutOfStock) return Colors.red;
    if (isLowStock) return Colors.orange;
    return Colors.green;
  }

  String _getStockStatusText(bool isOutOfStock, bool isLowStock) {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    return 'Normal';
  }
}