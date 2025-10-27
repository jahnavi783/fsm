import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

/// A single metadata item with icon and text
class MetadataItem {
  const MetadataItem({
    required this.icon,
    required this.text,
    this.color,
    this.iconSize,
  });

  /// Icon to display
  final IconData icon;

  /// Text to display
  final String text;

  /// Custom color for icon and text (defaults to textSecondary)
  final Color? color;

  /// Custom icon size (defaults to iconSmall)
  final double? iconSize;
}

/// Displays a row of icon + text pairs with auto-spacing and overflow handling
///
/// Used for displaying metadata in work order cards, document cards, etc.
/// Examples:
/// - Location + Time + Status
/// - Size + Type + Date
/// - Count + Category + Owner
///
/// Features:
/// - Auto-spacing between items
/// - Overflow handling with ellipsis
/// - Consistent icon and text styling
/// - Custom colors per item
class MetadataRow extends StatelessWidget {
  const MetadataRow({
    super.key,
    required this.items,
    this.spacing,
    this.runSpacing,
    this.crossAxisAlignment = WrapCrossAlignment.center,
    this.maxLines = 1,
  });

  /// List of metadata items to display
  final List<MetadataItem> items;

  /// Spacing between items (horizontal)
  final double? spacing;

  /// Spacing between rows if items wrap
  final double? runSpacing;

  /// Cross axis alignment for wrapped items
  final WrapCrossAlignment crossAxisAlignment;

  /// Maximum lines for text overflow
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: spacing ?? AppDimensions.paddingMedium,
      runSpacing: runSpacing ?? AppDimensions.paddingXSmall,
      crossAxisAlignment: crossAxisAlignment,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMetadataItem(item),
            if (!isLast)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Container(
                  width: 1.w,
                  height: 12.h,
                  color: AppColors.divider,
                ),
              ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMetadataItem(MetadataItem item) {
    final color = item.color ?? AppColors.textSecondary;
    final iconSize = item.iconSize ?? AppDimensions.iconSmall;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          item.icon,
          size: iconSize,
          color: color,
        ),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            item.text,
            style: AppTextStyles.bodySmall.copyWith(
              color: color,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Variant constructors for common metadata row types
extension MetadataRowVariants on MetadataRow {
  /// Work order metadata row: Location + Time + Status
  static Widget workOrder({
    String? location,
    String? time,
    String? status,
  }) {
    final items = <MetadataItem>[];

    if (location != null) {
      items.add(MetadataItem(
        icon: Icons.location_on_outlined,
        text: location,
      ));
    }

    if (time != null) {
      items.add(MetadataItem(
        icon: Icons.access_time_outlined,
        text: time,
      ));
    }

    if (status != null) {
      items.add(MetadataItem(
        icon: Icons.info_outline,
        text: status,
        color: AppColors.getStatusColor(status),
      ));
    }

    return MetadataRow(items: items);
  }

  /// Document metadata row: Size + Type + Date
  static Widget document({
    String? size,
    String? type,
    String? date,
  }) {
    final items = <MetadataItem>[];

    if (size != null) {
      items.add(MetadataItem(
        icon: Icons.folder_outlined,
        text: size,
      ));
    }

    if (type != null) {
      items.add(MetadataItem(
        icon: Icons.description_outlined,
        text: type,
      ));
    }

    if (date != null) {
      items.add(MetadataItem(
        icon: Icons.access_time_outlined,
        text: date,
      ));
    }

    return MetadataRow(items: items);
  }

  /// Part metadata row: Stock + Location + Category
  static Widget part({
    String? stock,
    String? location,
    String? category,
    Color? stockColor,
  }) {
    final items = <MetadataItem>[];

    if (stock != null) {
      items.add(MetadataItem(
        icon: Icons.inventory_2_outlined,
        text: stock,
        color: stockColor,
      ));
    }

    if (location != null) {
      items.add(MetadataItem(
        icon: Icons.location_on_outlined,
        text: location,
      ));
    }

    if (category != null) {
      items.add(MetadataItem(
        icon: Icons.category_outlined,
        text: category,
      ));
    }

    return MetadataRow(items: items);
  }

  /// Generic metadata row with custom items
  static Widget custom({
    required List<MetadataItem> items,
    double? spacing,
    double? runSpacing,
    int maxLines = 1,
  }) {
    return MetadataRow(
      items: items,
      spacing: spacing,
      runSpacing: runSpacing,
      maxLines: maxLines,
    );
  }
}
