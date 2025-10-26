import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import '../../domain/entities/document_entity.dart';

class DocumentCategoryFilter extends StatelessWidget {
  final List<String> categories;
  final DocumentType? selectedType;
  final String? selectedCategory;
  final ValueChanged<DocumentType?>? onTypeChanged;
  final ValueChanged<String?>? onCategoryChanged;

  const DocumentCategoryFilter({
    super.key,
    required this.categories,
    this.selectedType,
    this.selectedCategory,
    this.onTypeChanged,
    this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: AppDimensions.paddingVerticalMedium,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Document Type Filter Header
          Padding(
            padding: AppDimensions.paddingHorizontalMedium,
            child: Row(
              children: [
                Container(
                  width: 3.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: AppDimensions.spaceSmall.w),
                Text(
                  'Document Types',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.spaceMedium),

          // Document Type Filter Chips
          SizedBox(
            height: 44.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: AppDimensions.paddingHorizontalMedium,
              itemCount: DocumentType.values.length + 1, // +1 for "All" option
              itemBuilder: (context, index) {
                if (index == 0) {
                  // "All" option
                  return _buildTypeChip(
                    context,
                    'All',
                    selectedType == null,
                    () => onTypeChanged?.call(null),
                    Icons.apps_rounded,
                  );
                }

                final type = DocumentType.values[index - 1];
                return _buildTypeChip(
                  context,
                  type.displayName,
                  selectedType == type,
                  () => onTypeChanged?.call(type),
                  _getTypeIcon(type),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: AppDimensions.spaceSmall.w),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          child: AnimatedContainer(
            duration: AppDimensions.animationFast,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium,
              vertical: AppDimensions.paddingSmall,
            ),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? AppColors.primaryGradient
                  : LinearGradient(
                      colors: [
                        AppColors.surface,
                        AppColors.surfaceVariant.withValues(alpha: 0.5),
                      ],
                    ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : AppColors.outline.withValues(alpha: 0.3),
                width: 1.w,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: AppColors.shadow.withValues(alpha: 0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 16.sp,
                  color: isSelected
                      ? AppColors.onPrimary
                      : AppColors.textSecondary,
                ),
                SizedBox(width: AppDimensions.spaceXSmall.w),
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.textPrimary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return Icons.menu_book_rounded;
      case DocumentType.procedure:
        return Icons.list_alt_rounded;
      case DocumentType.schematic:
        return Icons.schema_rounded;
      case DocumentType.specification:
        return Icons.description_rounded;
      case DocumentType.safety:
        return Icons.security_rounded;
      case DocumentType.training:
        return Icons.school_rounded;
      case DocumentType.report:
        return Icons.assessment_rounded;
      case DocumentType.certificate:
        return Icons.verified_rounded;
      case DocumentType.warranty:
        return Icons.shield_rounded;
      case DocumentType.other:
        return Icons.insert_drive_file_rounded;
    }
  }
}
