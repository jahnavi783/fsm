import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final hasFilters = selectedCategory != null || selectedStatus != null;

    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      label: 'All Categories',
                      isSelected: selectedCategory == null,
                      onTap: () => onCategoryChanged?.call(null),
                    ),
                    SizedBox(width: 8.w),
                    ...categories.map((category) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: _buildFilterChip(
                        label: category,
                        isSelected: selectedCategory == category,
                        onTap: () => onCategoryChanged?.call(category),
                      ),
                    )),
                  ],
                  
                  // Divider
                  if (categories.isNotEmpty) ...[
                    Container(
                      height: 30.h,
                      width: 1.w,
                      color: Colors.grey[300],
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                  ],
                  
                  // Status filters
                  _buildFilterChip(
                    label: 'All Status',
                    isSelected: selectedStatus == null,
                    onTap: () => onStatusChanged?.call(null),
                  ),
                  SizedBox(width: 8.w),
                  ...PartStatus.values.map((status) => Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: _buildFilterChip(
                      label: _getStatusLabel(status),
                      isSelected: selectedStatus == status,
                      onTap: () => onStatusChanged?.call(status),
                      color: _getStatusColor(status),
                    ),
                  )),
                ],
              ),
            ),
          ),
          
          // Clear filters button
          if (hasFilters) ...[
            SizedBox(width: 8.w),
            IconButton(
              onPressed: onClearFilters,
              icon: Icon(
                Icons.clear_all,
                size: 20.sp,
                color: Colors.grey[600],
              ),
              tooltip: 'Clear all filters',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected 
              ? (color ?? Theme.of(context).primaryColor)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected 
                ? (color ?? Theme.of(context).primaryColor)
                : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isSelected 
                ? Colors.white
                : Colors.grey[700],
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
}