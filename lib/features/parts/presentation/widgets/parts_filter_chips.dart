import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

import '../../domain/entities/part_entity.dart';

class PartsFilterChips extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final PartStatus? selectedStatus;
  final ValueChanged<String?>? onCategoryChanged;
  final ValueChanged<PartStatus?>? onStatusChanged;
  final VoidCallback? onClearFilters;

  const PartsFilterChips({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.selectedStatus,
    this.onCategoryChanged,
    this.onStatusChanged,
    this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasFilters = selectedCategory != null || selectedStatus != null;

    return Container(
      height: DesignTokens.buttonHeightLg.h,
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Category filters
                  if (categories.isNotEmpty) ...[
                    _buildFilterChip(
                      context: context,
                      label: 'All Categories',
                      isSelected: selectedCategory == null,
                      onTap: () => onCategoryChanged?.call(null),
                    ),
                    RSizedBox(width: DesignTokens.space2),
                    ...categories.map((category) => Padding(
                          padding: REdgeInsets.only(right: DesignTokens.space2),
                          child: _buildFilterChip(
                            context: context,
                            label: category,
                            isSelected: selectedCategory == category,
                            onTap: () => onCategoryChanged?.call(category),
                          ),
                        )),
                  ],

                  // Divider
                  if (categories.isNotEmpty) ...[
                    Container(
                      height: DesignTokens.space8.h,
                      width: 1.w,
                      color: theme.colorScheme.outline.withValues(alpha: 0.3),
                      margin: REdgeInsets.symmetric(
                          horizontal: DesignTokens.space2),
                    ),
                  ],

                  // Status filters
                  _buildFilterChip(
                    context: context,
                    label: 'All Status',
                    isSelected: selectedStatus == null,
                    onTap: () => onStatusChanged?.call(null),
                  ),
                  RSizedBox(width: DesignTokens.space2),
                  ...PartStatus.values.map((status) => Padding(
                        padding: REdgeInsets.only(right: DesignTokens.space2),
                        child: _buildFilterChip(
                          context: context,
                          label: _getStatusLabel(status),
                          isSelected: selectedStatus == status,
                          onTap: () => onStatusChanged?.call(status),
                          color: _getStatusColor(context, status),
                        ),
                      )),
                ],
              ),
            ),
          ),

          // Clear filters button
          if (hasFilters) ...[
            RSizedBox(width: DesignTokens.space2),
            IconButton(
              onPressed: onClearFilters,
              icon: Icon(
                Icons.clear_all,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              tooltip: 'Clear all filters',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? color,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space3,
          vertical: DesignTokens.space1 + 2,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? theme.colorScheme.primary)
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(DesignTokens.radiusFull.r),
          border: Border.all(
            color: isSelected
                ? (color ?? theme.colorScheme.primary)
                : theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(PartStatus status) {
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
}
