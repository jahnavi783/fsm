import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/fsm_card.dart';
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
    return FSMCard(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
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
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Part #: ${part.partNumber}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                InventoryIndicator(
                  quantity: part.quantityAvailable,
                  minQuantity: 10, // Default minimum threshold
                  maxQuantity: 100, // Default maximum threshold
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Part Number: ${part.partNumber}',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Text(
                    part.category,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor(part.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                        color: _getStatusColor(part.status).withOpacity(0.3)),
                  ),
                  child: Text(
                    _getStatusText(part.status),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: _getStatusColor(part.status),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${part.unitPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            if (part.isLowStock) ...[
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: part.isOutOfStock ? Colors.red[50] : Colors.orange[50],
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: part.isOutOfStock
                        ? Colors.red[200]!
                        : Colors.orange[200]!,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      part.isOutOfStock ? Icons.error : Icons.warning,
                      size: 16.sp,
                      color: part.isOutOfStock
                          ? Colors.red[700]
                          : Colors.orange[700],
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        part.isOutOfStock
                            ? 'Out of stock - Reorder needed'
                            : 'Low stock - Consider reordering',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: part.isOutOfStock
                              ? Colors.red[700]
                              : Colors.orange[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (onUpdateInventory != null)
                      TextButton(
                        onPressed: onUpdateInventory,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 12.sp,
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

  Color _getStatusColor(PartStatus status) {
    switch (status) {
      case PartStatus.active:
        return Colors.green;
      case PartStatus.inactive:
        return Colors.grey;
      case PartStatus.discontinued:
        return Colors.red;
      case PartStatus.backordered:
        return Colors.orange;
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
