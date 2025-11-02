import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
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
      height: DesignTokens.buttonHeightMd.h,
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
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
            color: theme.colorScheme.primary,
            onTap: () => onTypeSelected?.call(null),
          ),

          RSizedBox(width: DesignTokens.space2),

          // Document type filter chips
          ...DocumentType.values.map((type) {
            final count = documentCounts[type] ?? 0;
            if (count == 0 && !showCounts) return const SizedBox.shrink();

            return Padding(
              padding: REdgeInsets.only(right: DesignTokens.space2),
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
      duration: const Duration(milliseconds: 200),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isSelected ? theme.colorScheme.onPrimary : color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            if (showCounts && count > 0) ...[
              RSizedBox(width: DesignTokens.space1),
              Container(
                padding: REdgeInsets.symmetric(
                  horizontal: DesignTokens.space1 + 2,
                  vertical: DesignTokens.space1 / 2,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.onPrimary.withValues(alpha: 0.3)
                      : color.withValues(alpha: 0.15),
                  borderRadius:
                      BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
                child: Text(
                  count.toString(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isSelected ? theme.colorScheme.onPrimary : color,
                    fontWeight: FontWeight.w700,
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
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space2,
          vertical: DesignTokens.space1,
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
