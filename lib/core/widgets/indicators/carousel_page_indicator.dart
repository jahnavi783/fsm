import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// Reusable page indicator dots for carousels and PageViews
///
/// Displays a row of dots indicating the current page position,
/// with animated transitions between pages.
class CarouselPageIndicator extends StatelessWidget {
  const CarouselPageIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  }) : assert(itemCount > 0, 'itemCount must be greater than 0'),
       assert(currentIndex >= 0 && currentIndex < itemCount,
           'currentIndex must be between 0 and itemCount-1');

  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) => _buildDot(
          context,
          theme,
          isActive: index == currentIndex,
        ),
      ),
    );
  }

  Widget _buildDot(
    BuildContext context,
    ThemeData theme, {
    required bool isActive,
  }) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: isActive ? 8.r : 6.r,
        height: isActive ? 8.r : 6.r,
        decoration: BoxDecoration(
          color: isActive
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHighest,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
