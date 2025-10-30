import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../domain/entities/document_entity.dart';

/// Document Filter Chips - Redesigned filter interface for documents
///
/// Features:
/// - Horizontal scrollable filter chips
/// - Document type filtering with color-coded chips
/// - Active/inactive states with smooth animations
/// - Count badges showing number of documents per type
/// - Responsive design with proper spacing
class DocumentFilterChips extends StatelessWidget {
  const DocumentFilterChips({
    super.key,
    required this.documentCounts,
    this.selectedType,
    this.onTypeSelected,
    this.showCounts = true,
  });

  final Map<DocumentType?, int> documentCounts;
  final DocumentType? selectedType;
  final ValueChanged<DocumentType?>? onTypeSelected;
  final bool showCounts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // "All" filter chip
          _buildFilterChip(
            context: context,
            theme: theme,
            fsmTheme: fsmTheme,
            label: 'All',
            count: _getTotalCount(),
            isSelected: selectedType == null,
            color: AppColors.primary,
            onTap: () => onTypeSelected?.call(null),
          ),

          SizedBox(width: AppDimensions.spaceSmall.w),

          // Document type filter chips
          ...DocumentType.values.map((type) {
            final count = documentCounts[type] ?? 0;
            if (count == 0 && !showCounts) return const SizedBox.shrink();

            return Padding(
              padding: EdgeInsets.only(right: AppDimensions.spaceSmall.w),
              child: _buildFilterChip(
                context: context,
                theme: theme,
                fsmTheme: fsmTheme,
                label: _getTypeLabel(type),
                count: count,
                isSelected: selectedType == type,
                color: _getTypeColor(type),
                onTap: () => onTypeSelected?.call(type),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required BuildContext context,
    required ThemeData theme,
    required FSMThemeExtension fsmTheme,
    required String label,
    required int count,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: AppDimensions.animationFast,
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected ? Colors.white : color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
            if (showCounts && count > 0) ...[
              SizedBox(width: AppDimensions.spaceXSmall.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.3)
                      : color.withValues(alpha: 0.15),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusXSmall),
                ),
                child: Text(
                  count.toString(),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected ? Colors.white : color,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: color.withValues(alpha: 0.08),
        selectedColor: color,
        checkmarkColor: Colors.transparent,
        side: BorderSide(
          color: isSelected ? color : color.withValues(alpha: 0.3),
          width: 1.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall,
          vertical: 4.h,
        ),
      ),
    );
  }

  int _getTotalCount() {
    return documentCounts.values.fold(0, (sum, count) => sum + count);
  }

  String _getTypeLabel(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return 'Manuals';
      case DocumentType.procedure:
        return 'Procedures';
      case DocumentType.schematic:
        return 'Schematics';
      case DocumentType.specification:
        return 'Specs';
      case DocumentType.safety:
        return 'Safety';
      case DocumentType.training:
        return 'Training';
      case DocumentType.report:
        return 'Reports';
      case DocumentType.certificate:
        return 'Certificates';
      case DocumentType.warranty:
        return 'Warranties';
      case DocumentType.other:
        return 'Other';
    }
  }

  Color _getTypeColor(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return const Color(0xFF2E7D32); // Green
      case DocumentType.procedure:
        return const Color(0xFF1565C0); // Dark Blue
      case DocumentType.schematic:
        return const Color(0xFF1976D2); // Blue
      case DocumentType.specification:
        return const Color(0xFFED6C02); // Orange
      case DocumentType.safety:
        return const Color(0xFFD32F2F); // Red
      case DocumentType.training:
        return const Color(0xFF7B1FA2); // Purple
      case DocumentType.report:
        return const Color(0xFF9C27B0); // Purple
      case DocumentType.certificate:
        return const Color(0xFFAF9500); // Yellow/Gold
      case DocumentType.warranty:
        return const Color(0xFF388E3C); // Green
      case DocumentType.other:
        return const Color(0xFF616161); // Gray
    }
  }
}
