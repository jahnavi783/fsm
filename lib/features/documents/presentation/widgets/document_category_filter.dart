import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Document Type Filter
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Document Type',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: DocumentType.values.length + 1, // +1 for "All" option
              itemBuilder: (context, index) {
                if (index == 0) {
                  // "All" option
                  return _buildTypeChip(
                    context,
                    'All',
                    selectedType == null,
                    () => onTypeChanged?.call(null),
                  );
                }
                
                final type = DocumentType.values[index - 1];
                return _buildTypeChip(
                  context,
                  type.displayName,
                  selectedType == type,
                  () => onTypeChanged?.call(type),
                );
              },
            ),
          ),
          
          SizedBox(height: 16.h),
          
          // Category Filter
          if (categories.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Category',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: categories.length + 1, // +1 for "All" option
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "All" option
                    return _buildCategoryChip(
                      context,
                      'All',
                      selectedCategory == null,
                      () => onCategoryChanged?.call(null),
                    );
                  }
                  
                  final category = categories[index - 1];
                  return _buildCategoryChip(
                    context,
                    category,
                    selectedCategory == category,
                    () => onCategoryChanged?.call(category),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypeChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: FilterChip(
        label: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: theme.colorScheme.surface,
        selectedColor: theme.colorScheme.primary,
        checkmarkColor: theme.colorScheme.onPrimary,
        side: BorderSide(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.outline.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      ),
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: FilterChip(
        label: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected
                ? theme.colorScheme.onSecondary
                : theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: theme.colorScheme.surface,
        selectedColor: theme.colorScheme.secondary,
        checkmarkColor: theme.colorScheme.onSecondary,
        side: BorderSide(
          color: isSelected
              ? theme.colorScheme.secondary
              : theme.colorScheme.outline.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      ),
    );
  }
}