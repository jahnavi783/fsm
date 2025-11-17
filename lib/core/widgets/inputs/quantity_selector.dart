import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/design_tokens.dart';

/// A quantity selector widget with increment/decrement buttons and manual input.
///
/// Features:
/// - Increment/decrement buttons with proper icons
/// - Manual text input with numeric keyboard
/// - Strict stock validation (prevents exceeding available stock)
/// - Visual feedback for disabled states and errors
/// - Uses DesignTokens for consistent sizing and spacing
///
/// Example:
/// ```dart
/// QuantitySelector(
///   initialQuantity: 1,
///   availableStock: 50,
///   onQuantityChanged: (newQty) => print('Quantity: $newQty'),
/// )
/// ```
class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    required this.initialQuantity,
    required this.availableStock,
    required this.onQuantityChanged,
    this.minQuantity = 1,
    this.maxQuantity = 999,
    this.enabled = true,
  });

  /// Initial quantity value
  final int initialQuantity;

  /// Available stock (maximum allowed quantity)
  final int availableStock;

  /// Callback when quantity changes
  final ValueChanged<int> onQuantityChanged;

  /// Minimum allowed quantity (default: 1)
  final int minQuantity;

  /// Maximum allowed quantity (default: 999)
  final int maxQuantity;

  /// Whether the selector is enabled
  final bool enabled;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late TextEditingController _controller;
  late int _currentQuantity;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _currentQuantity = widget.initialQuantity.clamp(
      widget.minQuantity,
      _getEffectiveMax(),
    );
    _controller = TextEditingController(text: _currentQuantity.toString());
  }

  @override
  void didUpdateWidget(QuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialQuantity != widget.initialQuantity) {
      _currentQuantity = widget.initialQuantity.clamp(
        widget.minQuantity,
        _getEffectiveMax(),
      );
      _controller.text = _currentQuantity.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _getEffectiveMax() {
    return widget.availableStock.clamp(widget.minQuantity, widget.maxQuantity);
  }

  bool get _canIncrement {
    return widget.enabled &&
        _currentQuantity < _getEffectiveMax() &&
        _currentQuantity < widget.maxQuantity;
  }

  bool get _canDecrement {
    return widget.enabled && _currentQuantity > widget.minQuantity;
  }

  void _increment() {
    if (_canIncrement) {
      setState(() {
        _currentQuantity++;
        _controller.text = _currentQuantity.toString();
        _hasError = false;
        _errorMessage = null;
      });
      widget.onQuantityChanged(_currentQuantity);
    }
  }

  void _decrement() {
    if (_canDecrement) {
      setState(() {
        _currentQuantity--;
        _controller.text = _currentQuantity.toString();
        _hasError = false;
        _errorMessage = null;
      });
      widget.onQuantityChanged(_currentQuantity);
    }
  }

  void _handleManualInput(String value) {
    if (value.isEmpty) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Quantity required';
      });
      return;
    }

    final inputQuantity = int.tryParse(value);
    if (inputQuantity == null) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Invalid number';
      });
      return;
    }

    // Validate against constraints
    if (inputQuantity < widget.minQuantity) {
      setState(() {
        _currentQuantity = widget.minQuantity;
        _controller.text = widget.minQuantity.toString();
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
        _hasError = true;
        _errorMessage = 'Minimum ${widget.minQuantity} required';
      });
      widget.onQuantityChanged(_currentQuantity);
      return;
    }

    if (inputQuantity > widget.availableStock) {
      setState(() {
        _currentQuantity = widget.availableStock;
        _controller.text = widget.availableStock.toString();
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
        _hasError = true;
        _errorMessage = 'Only ${widget.availableStock} available';
      });
      widget.onQuantityChanged(_currentQuantity);
      return;
    }

    if (inputQuantity > widget.maxQuantity) {
      setState(() {
        _currentQuantity = widget.maxQuantity;
        _controller.text = widget.maxQuantity.toString();
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
        _hasError = true;
        _errorMessage = 'Maximum ${widget.maxQuantity} allowed';
      });
      widget.onQuantityChanged(_currentQuantity);
      return;
    }

    // Valid input
    setState(() {
      _currentQuantity = inputQuantity;
      _hasError = false;
      _errorMessage = null;
    });
    widget.onQuantityChanged(_currentQuantity);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrement button
            IconButton(
              icon: Icon(Icons.remove, size: DesignTokens.iconSm.sp),
              onPressed: _canDecrement ? _decrement : null,
              tooltip: 'Decrease quantity',
              style: IconButton.styleFrom(
                minimumSize: Size(DesignTokens.buttonHeightSm, DesignTokens.buttonHeightSm),
                padding: EdgeInsets.zero,
              ),
            ),
            RSizedBox(width: DesignTokens.space2),

            // Quantity input field
            SizedBox(
              width: 64.w,
              height: DesignTokens.buttonHeightSm.h,
              child: TextField(
                controller: _controller,
                enabled: widget.enabled,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  contentPadding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space2,
                    vertical: DesignTokens.space1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    borderSide: BorderSide(
                      color: _hasError
                          ? colorScheme.error
                          : colorScheme.outline,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    borderSide: BorderSide(
                      color: _hasError
                          ? colorScheme.error
                          : colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    borderSide: BorderSide(
                      color: _hasError
                          ? colorScheme.error
                          : colorScheme.primary,
                      width: 2.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    borderSide: BorderSide(color: colorScheme.error),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                onChanged: _handleManualInput,
                onSubmitted: _handleManualInput,
              ),
            ),
            RSizedBox(width: DesignTokens.space2),

            // Increment button
            IconButton(
              icon: Icon(Icons.add, size: DesignTokens.iconSm.sp),
              onPressed: _canIncrement ? _increment : null,
              tooltip: 'Increase quantity',
              style: IconButton.styleFrom(
                minimumSize: Size(DesignTokens.buttonHeightSm, DesignTokens.buttonHeightSm),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),

        // Error message
        if (_hasError && _errorMessage != null) ...[
          RSizedBox(height: DesignTokens.space1),
          Text(
            _errorMessage!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}
