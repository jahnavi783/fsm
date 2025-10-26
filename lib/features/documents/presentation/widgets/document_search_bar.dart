import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

class DocumentSearchBar extends StatefulWidget {
  final String? initialQuery;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchSubmitted;
  final VoidCallback? onClearSearch;
  final bool isLoading;

  const DocumentSearchBar({
    super.key,
    this.initialQuery,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.onClearSearch,
    this.isLoading = false,
  });

  @override
  State<DocumentSearchBar> createState() => _DocumentSearchBarState();
}

class _DocumentSearchBarState extends State<DocumentSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DocumentSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialQuery != oldWidget.initialQuery) {
      _controller.text = widget.initialQuery ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: AppDimensions.marginHorizontalMedium +
          AppDimensions.marginVerticalSmall,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surface,
            AppColors.surfaceVariant.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: _focusNode.hasFocus
              ? AppColors.primary.withValues(alpha: 0.5)
              : AppColors.outline.withValues(alpha: 0.2),
          width: _focusNode.hasFocus ? 2.w : 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: _focusNode.hasFocus
                ? AppColors.primary.withValues(alpha: 0.1)
                : AppColors.shadow.withValues(alpha: 0.08),
            blurRadius: _focusNode.hasFocus ? 12 : 6,
            offset: const Offset(0, 2),
          ),
          if (_focusNode.hasFocus)
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 24,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onSearchChanged,
        onSubmitted: (_) => widget.onSearchSubmitted?.call(),
        decoration: InputDecoration(
          hintText: 'Search documents...',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textTertiary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.all(AppDimensions.marginSmall),
            child: widget.isLoading
                ? Container(
                    width: AppDimensions.iconSmall,
                    height: AppDimensions.iconSmall,
                    padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradientWithOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5.w,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradientWithOpacity(
                        _focusNode.hasFocus ? 0.15 : 0.05,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: _focusNode.hasFocus
                          ? AppColors.primary
                          : AppColors.textTertiary,
                      size: AppDimensions.iconSmall,
                    ),
                  ),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? Container(
                  margin: EdgeInsets.all(AppDimensions.marginSmall),
                  child: IconButton(
                    onPressed: () {
                      _controller.clear();
                      widget.onClearSearch?.call();
                    },
                    icon: Container(
                      padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.error.withValues(alpha: 0.1),
                            AppColors.error.withValues(alpha: 0.05),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.clear_rounded,
                        color: AppColors.error.withValues(alpha: 0.8),
                        size: AppDimensions.iconSmall,
                      ),
                    ),
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: AppDimensions.paddingAllMedium,
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 16.sp,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
