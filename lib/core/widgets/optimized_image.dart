import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/widgets/states/fsm_loading_indicator.dart';

/// Optimized image widget with caching, error handling, and responsive sizing
class OptimizedImage extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final bool enableMemoryCache;
  final bool enableDiskCache;
  final Duration? fadeInDuration;

  const OptimizedImage({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.enableMemoryCache = true,
    this.enableDiskCache = true,
    this.fadeInDuration,
  }) : assert(imageUrl != null || assetPath != null,
            'Either imageUrl or assetPath must be provided');

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (assetPath != null) {
      // Asset image
      imageWidget = Image.asset(
        assetPath!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget(context);
        },
      );
    } else if (imageUrl != null) {
      // Network image with caching
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: width?.toInt(),
        memCacheHeight: height?.toInt(),
        placeholder: (context, url) => _buildPlaceholder(context),
        errorWidget: (context, url, error) => _buildErrorWidget(context),
        fadeInDuration: fadeInDuration ?? DesignTokens.durationNormal,
        useOldImageOnUrlChange: true,
        cacheManager:
            enableDiskCache ? null : null, // Use default cache manager
      );
    } else {
      imageWidget = _buildErrorWidget(context);
    }

    // Apply border radius if specified
    if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholder != null) return placeholder!;

    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      color: theme.colorScheme.surfaceContainerHighest,
      child: const Center(
        child: FSMLoadingIndicatorCompact(),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (errorWidget != null) return errorWidget!;

    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: DesignTokens.iconLg.sp,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          DesignTokens.verticalSpaceXs,
          Text(
            'Image not available',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Avatar widget with optimized image loading
class OptimizedAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double radius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedAvatar({
    super.key,
    this.imageUrl,
    this.assetPath,
    required this.radius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      child: ClipOval(
        child: OptimizedImage(
          imageUrl: imageUrl,
          assetPath: assetPath,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: placeholder ??
              Icon(
                Icons.person,
                size: radius,
                color: theme.colorScheme.onSurfaceVariant,
              ),
          errorWidget: errorWidget ??
              Icon(
                Icons.person,
                size: radius,
                color: theme.colorScheme.onSurfaceVariant,
              ),
        ),
      ),
    );
  }
}

/// Logo widget with branding assets
class BrandLogo extends StatelessWidget {
  final LogoType type;
  final double? width;
  final double? height;
  final Color? color;

  const BrandLogo({
    super.key,
    required this.type,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    String assetPath;

    switch (type) {
      case LogoType.fsm:
        assetPath = 'assets/images/fsm_logo.png';
        break;
      case LogoType.csg:
        assetPath = 'assets/images/csg-logo.png';
        break;
    }

    return OptimizedImage(
      assetPath: assetPath,
      width: width ?? 120.w,
      height: height ?? 40.h,
      fit: BoxFit.contain,
    );
  }
}

enum LogoType {
  fsm,
  csg,
}
