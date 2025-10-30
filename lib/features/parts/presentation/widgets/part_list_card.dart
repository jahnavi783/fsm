import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/part_entity.dart';

/// PartListCard - List card for parts display
///
/// Features (Redesign 2025):
/// - Left-aligned thumbnail (80x80dp)
/// - Part number (bold, 16sp) + description (14sp, max 2 lines)
/// - Stock status with color-coded icon
/// - Location information
/// - Action buttons: Reserve, Details (bottom-right)
/// - 16dp horizontal margins, 8dp vertical gap
/// - 8r corners, elevation 2
///
/// Usage:
/// ```dart
/// PartListCard(
///   part: part,
///   location: 'Warehouse A - Shelf B3',
///   onTap: () => navigateToDetails(part),
///   onReserve: () => reservePart(part),
/// )
/// ```
class PartListCard extends StatelessWidget {
  /// The part to display
  final PartEntity part;

  /// Storage location
  final String? location;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Callback for Reserve button
  final VoidCallback? onReserve;

  /// Callback for Details button
  final VoidCallback? onDetails;

  const PartListCard({
    super.key,
    required this.part,
    this.location,
    this.onTap,
    this.onReserve,
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingXSmall,
      ),
      child: Material(
        color: AppColors.surface,
        elevation: AppDimensions.elevationXSmall,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: InkWell(
          onTap: onTap ?? onDetails,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail (80x80dp)
                _buildThumbnail(),

                SizedBox(width: AppDimensions.paddingMedium),

                // Part Info
                Expanded(
                  child: _buildPartInfo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        color: _getStockStatusColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        border: Border.all(
          color: _getStockStatusColor().withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getCategoryIcon(),
            size: 32.sp,
            color: _getStockStatusColor(),
          ),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              color: _getStockStatusColor().withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXSmall),
            ),
            child: Text(
              part.quantityAvailable.toString(),
              style: AppTextStyles.labelSmall.copyWith(
                color: _getStockStatusColor(),
                fontWeight: FontWeight.w700,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Part Number
        Text(
          part.partNumber,
          style: AppTextStyles.titleSmall.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            fontSize: 16.sp,
          ),
        ),

        SizedBox(height: 4.h),

        // Part Name/Description
        Text(
          part.partName,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 8.h),

        // Stock Status + Location
        Row(
          children: [
            // Stock Status
            Icon(
              _getStockStatusIcon(),
              size: 16.sp,
              color: _getStockStatusColor(),
            ),
            SizedBox(width: 4.w),
            Text(
              part.stockStatusText,
              style: AppTextStyles.labelSmall.copyWith(
                color: _getStockStatusColor(),
                fontWeight: FontWeight.w600,
              ),
            ),

            if (location != null) ...[
              SizedBox(width: 12.w),
              Icon(
                Icons.location_on_outlined,
                size: 14.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  location!,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),

        SizedBox(height: 8.h),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Details Button
            if (onDetails != null)
              SizedBox(
                height: 32.h,
                child: ElevatedButton(
                  onPressed: onDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusXSmall),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_outline, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  IconData _getStockStatusIcon() {
    if (part.isOutOfStock) {
      return Icons.cancel;
    } else if (part.isLowStock) {
      return Icons.warning_amber;
    } else {
      return Icons.check_circle;
    }
  }

  Color _getStockStatusColor() {
    if (part.isOutOfStock) {
      return AppColors.error;
    } else if (part.isLowStock) {
      return AppColors.warning;
    } else {
      return AppColors.success;
    }
  }

  IconData _getCategoryIcon() {
    switch (part.category.toLowerCase()) {
      case 'electrical':
        return Icons.electrical_services;
      case 'hydraulic':
        return Icons.water_drop_outlined;
      case 'mechanical':
        return Icons.settings;
      case 'tools':
        return Icons.build;
      default:
        return Icons.inventory_2;
    }
  }
}

/// Empty state for parts list
class EmptyPartsList extends StatelessWidget {
  final String message;
  final VoidCallback? onRefresh;

  const EmptyPartsList({
    super.key,
    this.message = 'No parts found',
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64.sp,
            color: AppColors.textSecondary.withValues(alpha: 0.5),
          ),
          SizedBox(height: AppDimensions.paddingMedium),
          Text(
            message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRefresh != null) ...[
            SizedBox(height: AppDimensions.paddingMedium),
            TextButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
