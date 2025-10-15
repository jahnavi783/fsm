import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

/// Enhanced loading indicator with different styles and responsive design
class EnhancedLoadingIndicator extends StatelessWidget {
  final LoadingStyle style;
  final String? message;
  final Color? color;
  final double? size;

  const EnhancedLoadingIndicator({
    super.key,
    this.style = LoadingStyle.circular,
    this.message,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.primaryColor;
    final effectiveSize = size ?? 24.w;

    Widget loadingWidget;

    switch (style) {
      case LoadingStyle.circular:
        loadingWidget = SizedBox(
          width: effectiveSize,
          height: effectiveSize,
          child: CircularProgressIndicator(
            color: effectiveColor,
            strokeWidth: 2.w,
          ),
        );
        break;
      case LoadingStyle.linear:
        loadingWidget = SizedBox(
          width: 200.w,
          child: LinearProgressIndicator(
            color: effectiveColor,
            backgroundColor: effectiveColor.withOpacity(0.2),
          ),
        );
        break;
      case LoadingStyle.dots:
        loadingWidget = _DotsLoadingIndicator(
          color: effectiveColor,
          size: effectiveSize,
        );
        break;
      case LoadingStyle.pulse:
        loadingWidget = _PulseLoadingIndicator(
          color: effectiveColor,
          size: effectiveSize,
        );
        break;
    }

    if (message != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loadingWidget,
          SizedBox(height: 16.h),
          Text(
            message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
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
class _DotsLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const _DotsLoadingIndicator({
    required this.color,
    required this.size,
  });

  @override
  State<_DotsLoadingIndicator> createState() => _DotsLoadingIndicatorState();
}

class _DotsLoadingIndicatorState extends State<_DotsLoadingIndicator>
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
    return SizedBox(
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
class _PulseLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const _PulseLoadingIndicator({
    required this.color,
    required this.size,
  });

  @override
  State<_PulseLoadingIndicator> createState() => _PulseLoadingIndicatorState();
}

class _PulseLoadingIndicatorState extends State<_PulseLoadingIndicator>
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
            color: widget.color.withOpacity(_animation.value),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

/// Shimmer loading for content placeholders
class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

enum LoadingStyle {
  circular,
  linear,
  dots,
  pulse,
}
