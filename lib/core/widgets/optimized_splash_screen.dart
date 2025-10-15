import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/responsive_helper.dart';
import 'enhanced_loading_indicator.dart';
import 'optimized_image.dart';

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
      duration: const Duration(milliseconds: 1500),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveBuilder(
        builder: (context, deviceType) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: _buildGradientBackground(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  _buildLogo(),
                  SizedBox(
                      height: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: 32.h,
                    tablet: 40.h,
                    desktop: 48.h,
                  )),
                  _buildAppName(),
                  const Spacer(flex: 2),
                  _buildLoadingSection(),
                  SizedBox(
                      height: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: 48.h,
                    tablet: 56.h,
                    desktop: 64.h,
                  )),
                  _buildBrandingFooter(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF8F9FA),
          Color(0xFFE9ECEF),
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            'Field Service Management',
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveValue(
                context,
                mobile: 18.sp,
                tablet: 20.sp,
                desktop: 22.sp,
              ),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF495057),
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Widget _buildLoadingSection() {
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
                  mobile: 24.w,
                  tablet: 28.w,
                  desktop: 32.w,
                ),
                color: Theme.of(context).primaryColor,
              ),
              if (widget.message != null) ...[
                SizedBox(height: 16.h),
                Text(
                  widget.message!,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.getResponsiveValue(
                      context,
                      mobile: 14.sp,
                      tablet: 15.sp,
                      desktop: 16.sp,
                    ),
                    color: const Color(0xFF6C757D),
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              Text(
                'Powered by',
                style: TextStyle(
                  fontSize: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: 12.sp,
                    tablet: 13.sp,
                    desktop: 14.sp,
                  ),
                  color: const Color(0xFF868E96),
                ),
              ),
              SizedBox(height: 8.h),
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
