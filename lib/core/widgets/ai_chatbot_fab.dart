import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

/// AIChatbotFAB - Floating Action Button for AI Chatbot (2025 Redesign)
///
/// Features:
/// - Extended FAB with AI icon and label
/// - Green accent color (#66BB6A)
/// - Expand/collapse on scroll behavior
/// - Smooth animation between states
/// - Elevation and shadow for depth
///
/// Usage:
/// ```dart
/// // In a scrollable page
/// final scrollController = ScrollController();
///
/// Scaffold(
///   floatingActionButton: AIChatbotFAB(
///     onTap: () => context.router.push(ChatbotRoute()),
///     scrollController: scrollController,
///   ),
/// )
///
/// // Or with manual control
/// AIChatbotFAB(
///   onTap: () => context.router.push(ChatbotRoute()),
///   isExtended: isScrolledToTop,
/// )
/// ```
class AIChatbotFAB extends StatefulWidget {
  /// Callback when FAB is tapped
  final VoidCallback onTap;

  /// Optional scroll controller to auto-collapse on scroll
  final ScrollController? scrollController;

  /// Manual control of extended state (if scrollController is not provided)
  final bool? isExtended;

  /// Custom label text (defaults to "AI Assistant")
  final String? label;

  /// Custom icon (defaults to smart_toy - robot icon)
  final IconData? icon;

  const AIChatbotFAB({
    super.key,
    required this.onTap,
    this.scrollController,
    this.isExtended,
    this.label,
    this.icon,
  });

  @override
  State<AIChatbotFAB> createState() => _AIChatbotFABState();
}

class _AIChatbotFABState extends State<AIChatbotFAB> {
  bool _isExtended = true;
  static const _scrollThreshold = 100.0; // Pixels to scroll before collapsing

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController == null) return;

    final offset = widget.scrollController!.offset;

    if (offset > _scrollThreshold && _isExtended) {
      setState(() => _isExtended = false);
    } else if (offset <= _scrollThreshold && !_isExtended) {
      setState(() => _isExtended = true);
    }
  }

  bool get _effectiveIsExtended {
    // Manual control takes precedence over scroll-based control
    if (widget.isExtended != null) {
      return widget.isExtended!;
    }
    return _isExtended;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = widget.label ?? 'AI Assistant';
    final effectiveIcon = widget.icon ?? Icons.smart_toy; // Robot icon

    return AnimatedContainer(
      duration: AppDimensions.animationMedium,
      curve: Curves.easeInOut,
      child: FloatingActionButton.extended(
        onPressed: widget.onTap,
        backgroundColor: AppColors.secondary, // Green accent
        foregroundColor: AppColors.white,
        elevation: AppDimensions.elevationMedium,
        highlightElevation: AppDimensions.elevationLarge,
        isExtended: _effectiveIsExtended,
        icon: Icon(
          effectiveIcon,
          size: AppDimensions.iconMedium,
        ),
        label: AnimatedSwitcher(
          duration: AppDimensions.animationFast,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: child,
              ),
            );
          },
          child: _effectiveIsExtended
              ? Text(
                  effectiveLabel,
                  key: const ValueKey('extended'),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('collapsed')),
        ),
        tooltip: effectiveLabel,
      ),
    );
  }
}

/// Compact variant - Always collapsed circular FAB
///
/// Use this when you don't want expand/collapse behavior
class CompactAIChatbotFAB extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;
  final String? tooltip;

  const CompactAIChatbotFAB({
    super.key,
    required this.onTap,
    this.icon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIcon = icon ?? Icons.smart_toy;
    final effectiveTooltip = tooltip ?? 'AI Assistant';

    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: AppColors.secondary, // Green accent
      foregroundColor: AppColors.white,
      elevation: AppDimensions.elevationMedium,
      highlightElevation: AppDimensions.elevationLarge,
      tooltip: effectiveTooltip,
      child: Icon(
        effectiveIcon,
        size: AppDimensions.iconMedium,
      ),
    );
  }
}

/// Custom FAB with badge (for showing unread messages count)
class AIChatbotFABWithBadge extends StatelessWidget {
  final VoidCallback onTap;
  final int unreadCount;
  final ScrollController? scrollController;
  final bool? isExtended;

  const AIChatbotFABWithBadge({
    super.key,
    required this.onTap,
    required this.unreadCount,
    this.scrollController,
    this.isExtended,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AIChatbotFAB(
          onTap: onTap,
          scrollController: scrollController,
          isExtended: isExtended,
        ),
        if (unreadCount > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: unreadCount > 9 ? 6.w : 8.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.white,
                  width: 2.w,
                ),
              ),
              constraints: BoxConstraints(
                minWidth: 20.w,
                minHeight: 20.h,
              ),
              child: Center(
                child: Text(
                  unreadCount > 99 ? '99+' : unreadCount.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
