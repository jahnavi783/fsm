import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/utils/responsive_helper.dart';
import 'package:fsm/core/widgets/enhanced_loading_indicator.dart';
import 'package:fsm/core/widgets/optimized_image.dart';

/// Optimized splash screen with responsive design and branding
class OptimizedSplashScreen extends StatefulWidget {
  final String? message;
  final VoidCallback? onTimeout;
  final Duration timeout;

  const OptimizedSplashScreen({
    super.key,
    this.message,
    this.onTimeout,
    this.timeout = const Duration(seconds: 3),
  });

  @override
  State<OptimizedSplashScreen> createState() => _OptimizedSplashScreenState();
}

class _OptimizedSplashScreenState extends State<OptimizedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: DesignTokens.durationSlow,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    // Start animations
    _animationController.forward();

    // Set timeout
    Future.delayed(widget.timeout, () {
      if (mounted) {
        widget.onTimeout?.call();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: ResponsiveBuilder(
        builder: (context, deviceType) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: _buildGradientBackground(theme),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  _buildLogo(),
                  RSizedBox(
                      height: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: DesignTokens.space8.h,
                    tablet: DesignTokens.space10.h,
                    desktop: DesignTokens.space12.h,
                  )),
                  _buildAppName(),
                  const Spacer(flex: 2),
                  _buildLoadingSection(),
                  RSizedBox(
                      height: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: DesignTokens.space12.h,
                    tablet: DesignTokens.space14.h,
                    desktop: DesignTokens.space16.h,
                  )),
                  _buildBrandingFooter(),
                  DesignTokens.verticalSpaceLarge,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _buildGradientBackground(ThemeData theme) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          theme.colorScheme.surface,
          theme.colorScheme.surfaceContainerLow,
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: ResponsiveBuilder(
              builder: (context, deviceType) {
                final logoSize = ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: Size(120.w, 48.h),
                  tablet: Size(150.w, 60.h),
                  desktop: Size(180.w, 72.h),
                );

                return BrandLogo(
                  type: LogoType.fsm,
                  width: logoSize.width,
                  height: logoSize.height,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppName() {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            'Field Service Management',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: ResponsiveHelper.getResponsiveValue(
                context,
                mobile: DesignTokens.fontSize18.sp,
                tablet: DesignTokens.fontSize20.sp,
                desktop: DesignTokens.fontSize22.sp,
              ),
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: theme.colorScheme.onSurface,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Widget _buildLoadingSection() {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              EnhancedLoadingIndicator(
                style: LoadingStyle.dots,
                size: ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: DesignTokens.iconMd.w,
                  tablet: DesignTokens.iconLg.w,
                  desktop: DesignTokens.iconXl.w,
                ),
                color: theme.colorScheme.primary,
              ),
              if (widget.message != null) ...[
                DesignTokens.verticalSpaceMedium,
                Text(
                  widget.message!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: ResponsiveHelper.getResponsiveValue(
                      context,
                      mobile: DesignTokens.fontSize14.sp,
                      tablet: DesignTokens.fontSize15.sp,
                      desktop: DesignTokens.fontSize16.sp,
                    ),
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildBrandingFooter() {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              Text(
                'Powered by',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: DesignTokens.fontSize12.sp,
                    tablet: DesignTokens.fontSize13.sp,
                    desktop: DesignTokens.fontSize14.sp,
                  ),
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              DesignTokens.verticalSpaceSmall,
              BrandLogo(
                type: LogoType.csg,
                width: ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: 80.w,
                  tablet: 90.w,
                  desktop: 100.w,
                ),
                height: ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: 24.h,
                  tablet: 27.h,
                  desktop: 30.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
