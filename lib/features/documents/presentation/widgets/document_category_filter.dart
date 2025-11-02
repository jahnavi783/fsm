import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
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
      padding: REdgeInsets.symmetric(vertical: DesignTokens.space4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.08),
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
            padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
            child: Row(
              children: [
                Container(
                  width: DesignTokens.space1 - 1,
                  height: DesignTokens.space4 + 2,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r / 2),
                  ),
                ),
                RSizedBox(width: DesignTokens.space2),
                Text(
                  'Document Types',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          RSizedBox(height: DesignTokens.space4),

          // Document Type Filter Chips
          SizedBox(
            height: DesignTokens.buttonHeightMd.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
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
      padding: REdgeInsets.only(right: DesignTokens.space2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space4,
              vertical: DesignTokens.space2,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : theme.colorScheme.outline.withValues(alpha: 0.3),
                width: 1.w,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: theme.colorScheme.shadow.withValues(alpha: 0.1),
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
                  size: DesignTokens.iconSm.sp,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                RSizedBox(width: DesignTokens.space1),
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface,
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
