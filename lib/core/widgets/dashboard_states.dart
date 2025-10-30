import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback? onRetry;
  final String? retryButtonText;

  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.onRetry,
    this.retryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 300.h,
          maxHeight: 400.h,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 800),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                color.withValues(alpha: 0.08),
                                color.withValues(alpha: 0.15),
                              ],
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: color.withValues(alpha: 0.2),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: 0.1),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            icon,
                            size: 40.sp,
                            color: color,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A1A),
                    letterSpacing: -0.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  constraints: BoxConstraints(maxWidth: 250.w),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                      height: 1.3,
                      letterSpacing: 0.1,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (onRetry != null) ...[
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: Icon(Icons.refresh_rounded, size: 16.sp),
                    label: Text(
                      retryButtonText ?? 'Refresh',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      elevation: 6,
                      shadowColor: color.withValues(alpha: 0.3),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  final String message;
  final bool isOffline;
  final VoidCallback? onRetry;

  const ErrorState({
    super.key,
    required this.message,
    this.isOffline = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 300.h,
          maxHeight: 400.h,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: isOffline
                        ? Colors.orange.withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isOffline
                          ? Colors.orange.withValues(alpha: 0.2)
                          : Colors.red.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    isOffline ? Icons.wifi_off : Icons.error_outline,
                    size: 40.sp,
                    color: isOffline ? Colors.orange : Colors.red,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  isOffline ? 'You\'re Offline' : 'Something Went Wrong',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A1A),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  constraints: BoxConstraints(maxWidth: 250.w),
                  child: Text(
                    isOffline
                        ? 'Check your internet connection and try again.'
                        : message,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (onRetry != null) ...[
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: Icon(Icons.refresh_rounded, size: 16.sp),
                    label: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isOffline ? Colors.orange : Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 6,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  final String title;
  final String subtitle;

  const LoadingState({
    super.key,
    this.title = 'Loading Work Orders',
    this.subtitle = 'Please wait while we fetch your work orders...',
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 300.h,
          maxHeight: 400.h,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: Opacity(
                        opacity: value,
                        child: Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFF116587).withValues(alpha: 0.08),
                                const Color(0xFF116587).withValues(alpha: 0.15),
                              ],
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF116587).withValues(alpha: 0.2),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF116587).withValues(alpha: 0.15),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: 32.w,
                            height: 32.w,
                            child: const CircularProgressIndicator(
                              color: Color(0xFF116587),
                              strokeWidth: 3,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A1A),
                    letterSpacing: -0.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  constraints: BoxConstraints(maxWidth: 250.w),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                      height: 1.3,
                      letterSpacing: 0.1,
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
      ),
    );
  }
}

class SyncingState extends StatelessWidget {
  const SyncingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingState(
      title: 'Syncing Work Orders',
      subtitle: 'Please wait while we sync your latest work orders...',
    );
  }
}
