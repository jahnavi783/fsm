import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// FSMFilterChipGroup - Multi-select/single-select filter chips component
///
/// Provides a horizontal scrollable list of filter chips with:
/// - Single-select mode (radio-like behavior)
/// - Multi-select mode (checkbox-like behavior)
/// - Selected state styling with filled background
/// - Clear all action button
/// - Active filter count display
/// - Chip variants: default, selected, disabled
///
/// Use cases:
/// - Document category filters
/// - Part type filters
/// - Work order status filters
/// - Any filterable list with multiple options
class FSMFilterChipGroup<T> extends StatefulWidget {
  /// List of filter options with value and label
  final List<FilterChipData<T>> options;

  /// Currently selected values
  final List<T> selectedValues;

  /// Callback when selection changes
  final ValueChanged<List<T>> onSelectionChanged;

  /// Whether to allow multiple selections (default: true)
  final bool multiSelect;

  /// Whether to show clear all button (default: true)
  final bool showClearAll;

  /// Whether to show active filter count (default: true)
  final bool showFilterCount;

  /// Custom label for clear all button
  final String clearAllLabel;

  /// Height of the chip group container
  final double? height;

  /// Padding around the chip group
  final EdgeInsetsGeometry? padding;

  /// Spacing between chips
  final double spacing;

  /// Custom chip background color
  final Color? chipBackgroundColor;

  /// Custom selected chip color
  final Color? selectedChipColor;

  const FSMFilterChipGroup({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
    this.multiSelect = true,
    this.showClearAll = true,
    this.showFilterCount = true,
    this.clearAllLabel = 'Clear All',
    this.height,
    this.padding,
    this.spacing = 8.0,
    this.chipBackgroundColor,
    this.selectedChipColor,
  });

  @override
  State<FSMFilterChipGroup<T>> createState() => _FSMFilterChipGroupState<T>();
}

class _FSMFilterChipGroupState<T> extends State<FSMFilterChipGroup<T>> {
  late List<T> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  @override
  void didUpdateWidget(FSMFilterChipGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValues != widget.selectedValues) {
      _selectedValues = List.from(widget.selectedValues);
    }
  }

  void _handleChipTap(T value) {
    setState(() {
      if (widget.multiSelect) {
        // Multi-select mode: toggle selection
        if (_selectedValues.contains(value)) {
          _selectedValues.remove(value);
        } else {
          _selectedValues.add(value);
        }
      } else {
        // Single-select mode: replace selection
        if (_selectedValues.contains(value)) {
          _selectedValues.clear();
        } else {
          _selectedValues = [value];
        }
      }
    });
    widget.onSelectionChanged(_selectedValues);
  }

  void _handleClearAll() {
    setState(() {
      _selectedValues.clear();
    });
    widget.onSelectionChanged(_selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final effectiveHeight = widget.height ?? 48.h;
    final effectivePadding = widget.padding ??
        EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        );

    return Container(
      height: effectiveHeight,
      padding: effectivePadding,
      child: Row(
        children: [
          // Active filter count badge
          if (widget.showFilterCount && _selectedValues.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              ),
              child: Text(
                '${_selectedValues.length}',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],

          // Scrollable chip list
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.options.length,
              separatorBuilder: (context, index) => SizedBox(width: widget.spacing.w),
              itemBuilder: (context, index) {
                final option = widget.options[index];
                final isSelected = _selectedValues.contains(option.value);
                final isDisabled = option.isDisabled;

                return _FilterChip(
                  label: option.label,
                  isSelected: isSelected,
                  isDisabled: isDisabled,
                  leadingIcon: option.leadingIcon,
                  backgroundColor: widget.chipBackgroundColor ?? fsmTheme.chipBackground,
                  selectedColor: widget.selectedChipColor ?? AppColors.primary,
                  onTap: isDisabled ? null : () => _handleChipTap(option.value),
                );
              },
            ),
          ),

          // Clear all button
          if (widget.showClearAll && _selectedValues.isNotEmpty) ...[
            SizedBox(width: 8.w),
            TextButton(
              onPressed: _handleClearAll,
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                minimumSize: Size(AppDimensions.touchTargetMin, 32.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                widget.clearAllLabel,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Individual filter chip widget
class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDisabled;
  final IconData? leadingIcon;
  final Color backgroundColor;
  final Color selectedColor;
  final VoidCallback? onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.isDisabled,
    this.leadingIcon,
    required this.backgroundColor,
    required this.selectedColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveBackgroundColor = isDisabled
        ? AppColors.grey200
        : isSelected
            ? selectedColor
            : backgroundColor;

    final effectiveTextColor = isDisabled
        ? AppColors.disabledText
        : isSelected
            ? AppColors.onPrimary
            : AppColors.textPrimary;

    return Material(
      color: effectiveBackgroundColor,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: Container(
          constraints: BoxConstraints(
            minHeight: AppDimensions.chipHeight,
            minWidth: AppDimensions.touchTargetMin,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.chipPadding,
            vertical: 6.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  size: AppDimensions.iconSmall,
                  color: effectiveTextColor,
                ),
                SizedBox(width: 6.w),
              ],
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: effectiveTextColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data class for filter chip options
class FilterChipData<T> {
  /// The value associated with this chip
  final T value;

  /// Display label for the chip
  final String label;

  /// Optional leading icon
  final IconData? leadingIcon;

  /// Whether this chip is disabled
  final bool isDisabled;

  const FilterChipData({
    required this.value,
    required this.label,
    this.leadingIcon,
    this.isDisabled = false,
  });
}
