import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// FSMBottomSheet - Consistent bottom sheet pattern for the FSM app
///
/// Provides standardized bottom sheet UI with:
/// - Drag handle
/// - Header with title and close button
/// - Scrollable content area
/// - Optional footer with action buttons
/// - Haptic feedback on drag
///
/// Use [FSMBottomSheet.show] to display a bottom sheet with consistent styling.
class FSMBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final bool showCloseButton;
  final bool showDragHandle;
  final bool isDismissible;
  final bool enableDrag;
  final double? maxHeight;
  final double? minHeight;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onClose;

  const FSMBottomSheet({
    super.key,
    this.title,
    required this.content,
    this.actions,
    this.showCloseButton = true,
    this.showDragHandle = true,
    this.isDismissible = true,
    this.enableDrag = true,
    this.maxHeight,
    this.minHeight,
    this.contentPadding,
    this.onClose,
  });

  /// Show a bottom sheet with consistent styling
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    List<Widget>? actions,
    bool showCloseButton = true,
    bool showDragHandle = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    double? maxHeight,
    double? minHeight,
    EdgeInsetsGeometry? contentPadding,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => FSMBottomSheet(
        title: title,
        content: content,
        actions: actions,
        showCloseButton: showCloseButton,
        showDragHandle: showDragHandle,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        maxHeight: maxHeight,
        minHeight: minHeight,
        contentPadding: contentPadding,
        onClose: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final mediaQuery = MediaQuery.of(context);

    final effectiveMaxHeight = maxHeight ??
        mediaQuery.size.height - mediaQuery.padding.top - DesignTokens.space8.h;
    final effectiveMinHeight = minHeight ?? (DesignTokens.space12 * 4).h;

    return GestureDetector(
      onTap: isDismissible ? () => Navigator.of(context).pop() : null,
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {}, // Prevent taps from closing the sheet
          child: Container(
            constraints: BoxConstraints(
              maxHeight: effectiveMaxHeight,
              minHeight: effectiveMinHeight,
            ),
            decoration: BoxDecoration(
              color: fsmTheme.bottomSheetBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusLg.r),
                topRight: Radius.circular(DesignTokens.radiusLg.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.1),
                  blurRadius: 16,
                  spreadRadius: 2,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                if (showDragHandle) _buildDragHandle(context),

                // Header
                if (title != null || showCloseButton)
                  _buildHeader(context, title, showCloseButton, onClose),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: contentPadding ?? REdgeInsets.all(DesignTokens.space4),
                    child: content,
                  ),
                ),

                // Footer with actions
                if (actions != null && actions!.isNotEmpty)
                  _buildFooter(context, actions!),

                // Bottom safe area padding
                SizedBox(height: mediaQuery.padding.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: REdgeInsets.only(top: DesignTokens.space3, bottom: DesignTokens.space2),
      width: DesignTokens.space8.w,
      height: DesignTokens.space1.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    String? title,
    bool showCloseButton,
    VoidCallback? onClose,
  ) {
    final theme = Theme.of(context);

    return Container(
      height: DesignTokens.buttonHeightLg.h,
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (title != null)
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: DesignTokens.fontSize18.sp,
                ),
              ),
            ),
          if (showCloseButton)
            IconButton(
              icon: Icon(
                Icons.close,
                color: theme.colorScheme.onSurfaceVariant,
                size: DesignTokens.iconMd.sp,
              ),
              onPressed: () {
                onClose?.call();
                Navigator.of(context).pop();
              },
              constraints: BoxConstraints(
                minWidth: DesignTokens.buttonHeightMd,
                minHeight: DesignTokens.buttonHeightMd,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, List<Widget> actions) {
    final theme = Theme.of(context);
    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions
            .map(
              (action) => Padding(
                padding: REdgeInsets.only(left: DesignTokens.space2),
                child: action,
              ),
            )
            .toList(),
      ),
    );
  }
}

/// FSMBottomSheetSection - Section divider for bottom sheet content
class FSMBottomSheetSection extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  const FSMBottomSheetSection({
    super.key,
    required this.title,
    required this.child,
    this.padding,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider && title.isNotEmpty) ...[
          RSizedBox(height: DesignTokens.space6),
          Divider(
            height: 1,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
          ),
          RSizedBox(height: DesignTokens.space4),
        ],
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: DesignTokens.fontSize14.sp,
            ),
          ),
          RSizedBox(height: DesignTokens.space2),
        ],
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ],
    );
  }
}

/// FSMBottomSheetOption - List item option for bottom sheet menus
class FSMBottomSheetOption extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool isDestructive;

  const FSMBottomSheetOption({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveIconColor = isDestructive
        ? theme.colorScheme.error
        : (iconColor ?? theme.colorScheme.primary);
    final effectiveTextColor = isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.onSurface;

    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space4,
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: effectiveIconColor,
                  size: DesignTokens.iconMd.sp,
                ),
                RSizedBox(width: DesignTokens.space4),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: effectiveTextColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      RSizedBox(height: DesignTokens.space1),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                RSizedBox(width: DesignTokens.space2),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
