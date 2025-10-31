import 'package:flutter/material.dart';

/// Semantic text wrapper that automatically uses theme typography.
///
/// Use `variant` to pick a Material 3 text style without passing styles
/// throughout the widget tree. This follows the zero-configuration pattern
/// where typography is configured once in `ThemeData.textTheme`.
class FsmText extends StatelessWidget {
  const FsmText(
    this.text, {
    super.key,
    this.variant = FsmTextVariant.body,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.softWrap,
  });

  final String text;
  final FsmTextVariant variant;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final TextStyle? baseStyle = switch (variant) {
      FsmTextVariant.displayLarge => theme.textTheme.displayLarge,
      FsmTextVariant.displayMedium => theme.textTheme.displayMedium,
      FsmTextVariant.displaySmall => theme.textTheme.displaySmall,
      FsmTextVariant.headlineLarge => theme.textTheme.headlineLarge,
      FsmTextVariant.headlineMedium => theme.textTheme.headlineMedium,
      FsmTextVariant.headlineSmall => theme.textTheme.headlineSmall,
      FsmTextVariant.titleLarge => theme.textTheme.titleLarge,
      FsmTextVariant.titleMedium => theme.textTheme.titleMedium,
      FsmTextVariant.titleSmall => theme.textTheme.titleSmall,
      FsmTextVariant.bodyLarge => theme.textTheme.bodyLarge,
      FsmTextVariant.body => theme.textTheme.bodyMedium,
      FsmTextVariant.bodySmall => theme.textTheme.bodySmall,
      FsmTextVariant.labelLarge => theme.textTheme.labelLarge,
      FsmTextVariant.labelMedium => theme.textTheme.labelMedium,
      FsmTextVariant.labelSmall => theme.textTheme.labelSmall,
    };

    return Text(
      text,
      style: baseStyle?.copyWith(color: color),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}

/// Text variants following Material 3 typography
enum FsmTextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  body, // maps to bodyMedium
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// Convenience constructors for common variants
extension FsmTextConstructors on FsmText {
  static FsmText hero(String text, {Key? key, Color? color}) => FsmText(
    text,
    key: key,
    variant: FsmTextVariant.displayLarge,
    color: color,
  );

  static FsmText header(String text, {Key? key, Color? color}) => FsmText(
    text,
    key: key,
    variant: FsmTextVariant.headlineLarge,
    color: color,
  );

  static FsmText title(String text, {Key? key, Color? color}) => FsmText(
    text,
    key: key,
    variant: FsmTextVariant.headlineMedium,
    color: color,
  );

  static FsmText bodyText(
    String text, {
    Key? key,
    Color? color,
    int? maxLines,
  }) => FsmText(
    text,
    key: key,
    variant: FsmTextVariant.body,
    color: color,
    maxLines: maxLines,
  );

  static FsmText caption(String text, {Key? key, Color? color}) =>
      FsmText(text, key: key, variant: FsmTextVariant.bodySmall, color: color);

  static FsmText label(String text, {Key? key, Color? color}) => FsmText(
    text,
    key: key,
    variant: FsmTextVariant.labelMedium,
    color: color,
  );
}
