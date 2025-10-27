import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
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
    final fsmTheme = context.fsmTheme;
    final mediaQuery = MediaQuery.of(context);

    final effectiveMaxHeight = maxHeight ??
        mediaQuery.size.height - mediaQuery.padding.top - 40.h;
    final effectiveMinHeight = minHeight ?? 200.h;

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
                topLeft: Radius.circular(AppDimensions.radiusLarge),
                topRight: Radius.circular(AppDimensions.radiusLarge),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: AppDimensions.shadowBlurLarge,
                  spreadRadius: AppDimensions.shadowSpreadLarge,
                  offset: Offset(0, -4.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                if (showDragHandle) _buildDragHandle(),

                // Header
                if (title != null || showCloseButton)
                  _buildHeader(context, title, showCloseButton, onClose),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: contentPadding ?? AppDimensions.paddingAllMedium,
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

  Widget _buildDragHandle() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
      width: AppDimensions.bottomSheetHandleWidth,
      height: AppDimensions.bottomSheetHandleHeight,
      decoration: BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXSmall),
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
      height: AppDimensions.bottomSheetHeaderHeight,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
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
                  fontSize: 18.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          if (showCloseButton)
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.grey600,
                size: 24.sp,
              ),
              onPressed: () {
                onClose?.call();
                Navigator.of(context).pop();
              },
              constraints: BoxConstraints(
                minWidth: AppDimensions.touchTargetMin,
                minHeight: AppDimensions.touchTargetMin,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, List<Widget> actions) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.divider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions
            .map(
              (action) => Padding(
                padding: EdgeInsets.only(left: AppDimensions.paddingSmall),
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
          SizedBox(height: AppDimensions.paddingLarge),
          Divider(
            height: 1.h,
            thickness: 1,
            color: AppColors.divider,
          ),
          SizedBox(height: AppDimensions.paddingMedium),
        ],
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppDimensions.paddingSmall),
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
        ? AppColors.error
        : (iconColor ?? AppColors.primary);
    final effectiveTextColor =
        isDestructive ? AppColors.error : AppColors.textPrimary;

    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingMedium,
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: effectiveIconColor,
                  size: 24.sp,
                ),
                SizedBox(width: AppDimensions.paddingMedium),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: effectiveTextColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 2.h),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: AppDimensions.paddingSmall),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
