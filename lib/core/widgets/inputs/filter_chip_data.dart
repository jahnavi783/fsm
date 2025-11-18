import 'package:flutter/material.dart';

/// Data class for filter chip options
class FilterChipData<T> {
  /// The value associated with this chip
  final T value;

  /// Display label for the chip
  final String label;

  /// Optional leading icon
  final IconData? leadingIcon;

  /// Whether this chip is disabled
  final bool isDisabled;

  const FilterChipData({
    required this.value,
    required this.label,
    this.leadingIcon,
    this.isDisabled = false,
  });
}
