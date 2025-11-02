import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';

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
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
        border: Border.all(
          color: _focusNode.hasFocus
              ? theme.colorScheme.primary.withValues(alpha: 0.5)
              : theme.colorScheme.outline.withValues(alpha: 0.2),
          width: _focusNode.hasFocus ? 2.w : 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: _focusNode.hasFocus
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : theme.colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: _focusNode.hasFocus ? 12 : 6,
            offset: const Offset(0, 2),
          ),
          if (_focusNode.hasFocus)
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.05),
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
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          prefixIcon: Container(
            margin: REdgeInsets.all(DesignTokens.space2),
            child: widget.isLoading
                ? SizedBox(
                    width: DesignTokens.iconSm.w,
                    height: DesignTokens.iconSm.w,
                    child: Padding(
                      padding: REdgeInsets.all(DesignTokens.space1),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: REdgeInsets.all(DesignTokens.space1),
                    decoration: BoxDecoration(
                      color: _focusNode.hasFocus
                          ? theme.colorScheme.primary.withValues(alpha: 0.15)
                          : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: _focusNode.hasFocus
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      size: DesignTokens.iconSm.sp,
                    ),
                  ),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? Container(
                  margin: REdgeInsets.all(DesignTokens.space2),
                  child: IconButton(
                    onPressed: () {
                      _controller.clear();
                      widget.onClearSearch?.call();
                    },
                    icon: Container(
                      padding: REdgeInsets.all(DesignTokens.space1),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.clear_rounded,
                        color: theme.colorScheme.error.withValues(alpha: 0.8),
                        size: DesignTokens.iconSm.sp,
                      ),
                    ),
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: REdgeInsets.all(DesignTokens.space4),
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
