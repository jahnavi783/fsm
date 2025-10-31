import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

class PartsSearchBar extends StatefulWidget {
  final String? initialQuery;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final String hintText;
  final bool enabled;

  const PartsSearchBar({
    super.key,
    this.initialQuery,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.hintText = 'Search parts by name, number, or description...',
    this.enabled = true,
  });

  @override
  State<PartsSearchBar> createState() => _PartsSearchBarState();
}

class _PartsSearchBarState extends State<PartsSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PartsSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialQuery != oldWidget.initialQuery) {
      _controller.text = widget.initialQuery ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4, vertical: DesignTokens.space2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
            color: Colors.grey[600],
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                    widget.onClear?.call();
                  },
                  icon: Icon(
                    Icons.clear,
                    size: 20.sp,
                    color: Colors.grey[600],
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space3,
          ),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black87,
        ),
      ),
    );
  }
}
