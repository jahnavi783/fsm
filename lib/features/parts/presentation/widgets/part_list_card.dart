import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
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
    final theme = Theme.of(context);

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space1,
      ),
      child: Material(
        color: theme.colorScheme.surface,
        elevation: 2,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        child: InkWell(
          onTap: onTap ?? onDetails,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          child: Padding(
            padding: REdgeInsets.all(DesignTokens.space2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail (80x80dp)
                _buildThumbnail(context),

                RSizedBox(width: DesignTokens.space4),

                // Part Info
                Expanded(
                  child: _buildPartInfo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    final theme = Theme.of(context);
    final stockColor = _getStockStatusColor(context);

    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        color: stockColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: stockColor.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getCategoryIcon(),
            size: DesignTokens.iconLg.sp,
            color: stockColor,
          ),
          RSizedBox(height: DesignTokens.space1),
          Container(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space2,
              vertical: DesignTokens.space1 / 2,
            ),
            decoration: BoxDecoration(
              color: stockColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
            ),
            child: Text(
              part.quantityAvailable.toString(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: stockColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartInfo(BuildContext context) {
    final theme = Theme.of(context);
    final stockColor = _getStockStatusColor(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Part Number
        Text(
          part.partNumber,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),

        RSizedBox(height: DesignTokens.space1),

        // Part Name/Description
        Text(
          part.partName,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        RSizedBox(height: DesignTokens.space2),

        // Stock Status + Location
        Row(
          children: [
            // Stock Status
            Icon(
              _getStockStatusIcon(),
              size: DesignTokens.iconSm.sp,
              color: stockColor,
            ),
            RSizedBox(width: DesignTokens.space1),
            Text(
              part.stockStatusText,
              style: theme.textTheme.labelSmall?.copyWith(
                color: stockColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            if (location != null) ...[
              RSizedBox(width: DesignTokens.space3),
              Icon(
                Icons.location_on_outlined,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              RSizedBox(width: DesignTokens.space1 / 2),
              Expanded(
                child: Text(
                  location!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),

        RSizedBox(height: DesignTokens.space2),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Details Button
            if (onDetails != null)
              SizedBox(
                height: DesignTokens.buttonHeightSm.h,
                child: ElevatedButton(
                  onPressed: onDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    padding: REdgeInsets.symmetric(
                        horizontal: DesignTokens.space3,
                        vertical: DesignTokens.space1),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(DesignTokens.radiusSm.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_outline, size: DesignTokens.iconSm.sp),
                      RSizedBox(width: DesignTokens.space1),
                      Text(
                        'Details',
                        style: theme.textTheme.labelSmall?.copyWith(
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

  Color _getStockStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    if (part.isOutOfStock) {
      return theme.colorScheme.error;
    } else if (part.isLowStock) {
      return fsmTheme.warning;
    } else {
      return fsmTheme.success;
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
