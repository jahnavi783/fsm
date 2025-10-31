import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// FSMLoadingIndicator - Consolidated loading state display widget
///
/// Provides consistent loading UI across the app with:
/// - Animated circular progress indicator with gradient background
/// - Title and message text
/// - Different loading styles (circular, dots, pulse)
/// - Sliver and standard variants
///
/// Use cases:
/// - Loading data from API
/// - Syncing data
/// - Processing operations
/// - Any blocking loading state
class FSMLoadingIndicator extends StatelessWidget {
  final String title;
  final String subtitle;
  final FSMLoadingStyle style;
  final Color? color;
  final bool showAnimation;
  final EdgeInsetsGeometry? padding;

  const FSMLoadingIndicator({
    super.key,
    this.title = 'Loading',
    this.subtitle = 'Please wait while we load your data...',
    this.style = FSMLoadingStyle.circular,
    this.color,
    this.showAnimation = true,
    this.padding,
  });

  /// Loading work orders variant - color will use theme primary
  const FSMLoadingIndicator.workOrders({
    super.key,
    this.title = 'Loading Work Orders',
    this.subtitle = 'Please wait while we fetch your work orders...',
  })  : style = FSMLoadingStyle.circular,
        color = null, // Will use theme primary
        showAnimation = true,
        padding = null;

  /// Syncing variant - color will use theme secondary
  const FSMLoadingIndicator.syncing({
    super.key,
    this.title = 'Syncing Data',
    this.subtitle = 'Please wait while we sync your latest data...',
  })  : style = FSMLoadingStyle.circular,
        color = null, // Will use theme secondary
        showAnimation = true,
        padding = null;

  /// Processing variant
  const FSMLoadingIndicator.processing({
    super.key,
    this.title = 'Processing',
    this.subtitle = 'Your request is being processed...',
  })  : style = FSMLoadingStyle.dots,
        color = null, // Will use theme primary
        showAnimation = true,
        padding = null;

  /// Uploading variant
  const FSMLoadingIndicator.uploading({
    super.key,
    this.title = 'Uploading',
    this.subtitle = 'Uploading your files...',
  })  : style = FSMLoadingStyle.pulse,
        color = null, // Will use theme secondary
        showAnimation = true,
        padding = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;
    final effectiveColor = color ?? theme.colorScheme.primary;
    final effectivePadding = padding ?? spacing.paddingLg;

    return Container(
      constraints: BoxConstraints(
        minHeight: 300.h,
        maxHeight: 400.h,
      ),
      padding: effectivePadding,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated loading indicator
              if (showAnimation)
                TweenAnimationBuilder<double>(
                  duration: DesignTokens.durationSlow,
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: Opacity(
                        opacity: value,
                        child: _buildLoadingWidget(effectiveColor),
                      ),
                    );
                  },
                )
              else
                _buildLoadingWidget(effectiveColor),

              DesignTokens.verticalSpaceLarge,

              // Title
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              DesignTokens.verticalSpaceSmall,

              // Subtitle
              Container(
                constraints: BoxConstraints(maxWidth: 280.w),
                child: Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(Color effectiveColor) {
    switch (style) {
      case FSMLoadingStyle.circular:
        return Container(
          padding: REdgeInsets.all(DesignTokens.space5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                effectiveColor.withValues(alpha: 0.08),
                effectiveColor.withValues(alpha: 0.15),
              ],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: effectiveColor.withValues(alpha: 0.2),
              width: DesignTokens.borderWidthMedium,
            ),
            boxShadow: [
              BoxShadow(
                color: effectiveColor.withValues(alpha: 0.15),
                blurRadius: DesignTokens.space4,
                offset: Offset(0, DesignTokens.space2),
              ),
            ],
          ),
          child: RSizedBox(
            width: DesignTokens.iconLg.w,
            height: DesignTokens.iconLg.w,
            child: CircularProgressIndicator(
              color: effectiveColor,
              strokeWidth: DesignTokens.borderWidthThick,
            ),
          ),
        );
      case FSMLoadingStyle.dots:
        return _FSMDotsLoadingIndicator(
          color: effectiveColor,
          size: 48.sp,
        );
      case FSMLoadingStyle.pulse:
        return _FSMPulseLoadingIndicator(
          color: effectiveColor,
          size: 64.sp,
        );
    }
  }
}

/// FSMLoadingIndicatorSliver - Sliver variant for use in CustomScrollView
class FSMLoadingIndicatorSliver extends StatelessWidget {
  final String title;
  final String subtitle;
  final FSMLoadingStyle style;
  final Color? color;
  final bool showAnimation;

  const FSMLoadingIndicatorSliver({
    super.key,
    this.title = 'Loading',
    this.subtitle = 'Please wait while we load your data...',
    this.style = FSMLoadingStyle.circular,
    this.color,
    this.showAnimation = true,
  });

  /// Loading work orders variant
  const FSMLoadingIndicatorSliver.workOrders({
    super.key,
    String? title,
    String? subtitle,
  })  : title = title ?? 'Loading Work Orders',
        subtitle = subtitle ?? 'Please wait while we fetch your work orders...',
        style = FSMLoadingStyle.circular,
        color = null, // Will use theme primary
        showAnimation = true;

  /// Syncing variant
  const FSMLoadingIndicatorSliver.syncing({
    super.key,
    String? title,
    String? subtitle,
  })  : title = title ?? 'Syncing Data',
        subtitle = subtitle ?? 'Please wait while we sync your latest data...',
        style = FSMLoadingStyle.circular,
        color = null, // Will use theme secondary
        showAnimation = true;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FSMLoadingIndicator(
        title: title,
        subtitle: subtitle,
        style: style,
        color: color,
        showAnimation: showAnimation,
      ),
    );
  }
}

/// Compact loading indicator for inline use (buttons, cards, etc.)
class FSMLoadingIndicatorCompact extends StatelessWidget {
  final Color? color;
  final double? size;
  final String? message;

  const FSMLoadingIndicatorCompact({
    super.key,
    this.color,
    this.size,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;
    final effectiveSize = size ?? DesignTokens.iconMd.w;

    Widget loadingWidget = RSizedBox(
      width: effectiveSize,
      height: effectiveSize,
      child: CircularProgressIndicator(
        color: effectiveColor,
        strokeWidth: DesignTokens.borderWidthMedium.w,
      ),
    );

    if (message != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loadingWidget,
          DesignTokens.verticalSpaceSmall,
          Text(
            message!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return loadingWidget;
  }
}

/// Dots loading animation
class _FSMDotsLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const _FSMDotsLoadingIndicator({
    required this.color,
    required this.size,
  });

  @override
  State<_FSMDotsLoadingIndicator> createState() =>
      _FSMDotsLoadingIndicatorState();
}

class _FSMDotsLoadingIndicatorState extends State<_FSMDotsLoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: widget.size * 3,
      height: widget.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final delay = index * 0.2;
              final progress = (_controller.value - delay).clamp(0.0, 1.0);
              final scale = 0.5 + (0.5 * (1 - (progress - 0.5).abs() * 2));

              return Transform.scale(
                scale: scale,
                child: Container(
                  width: widget.size * 0.3,
                  height: widget.size * 0.3,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Pulse loading animation
class _FSMPulseLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const _FSMPulseLoadingIndicator({
    required this.color,
    required this.size,
  });

  @override
  State<_FSMPulseLoadingIndicator> createState() =>
      _FSMPulseLoadingIndicatorState();
}

class _FSMPulseLoadingIndicatorState extends State<_FSMPulseLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: _animation.value),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

/// Loading style enum
enum FSMLoadingStyle {
  circular,
  dots,
  pulse,
}
