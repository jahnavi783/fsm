import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// FSMSearchBar - Unified search component for the FSM app
///
/// Provides consistent search UX with:
/// - Text input with search/clear icons
/// - Optional voice search
/// - Filter chip integration
/// - Recent searches display
/// - Loading state
/// - Responsive keyboard handling
///
/// Common use cases:
/// - Work order search
/// - Document search
/// - Parts catalog search
/// - General app-wide search
class FSMSearchBar extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onVoiceSearch;
  final VoidCallback? onFilterTap;
  final bool showVoiceSearch;
  final bool showFilterButton;
  final bool isLoading;
  final bool autofocus;
  final int? activeFilterCount;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<String>? recentSearches;
  final ValueChanged<String>? onRecentSearchTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const FSMSearchBar({
    super.key,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.onVoiceSearch,
    this.onFilterTap,
    this.showVoiceSearch = false,
    this.showFilterButton = false,
    this.isLoading = false,
    this.autofocus = false,
    this.activeFilterCount,
    this.controller,
    this.focusNode,
    this.recentSearches,
    this.onRecentSearchTap,
    this.margin,
    this.padding,
  });

  @override
  State<FSMSearchBar> createState() => _FSMSearchBarState();
}

class _FSMSearchBarState extends State<FSMSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasText = false;
  bool _showRecentSearches = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = widget.focusNode ?? FocusNode();

    _hasText = _controller.text.isNotEmpty;

    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
    widget.onChanged?.call(_controller.text);
  }

  void _onFocusChanged() {
    setState(() {
      _showRecentSearches = _focusNode.hasFocus &&
          !_hasText &&
          widget.recentSearches != null &&
          widget.recentSearches!.isNotEmpty;
    });
  }

  void _clearSearch() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Column(
      children: [
        Container(
          margin: widget.margin ??
              REdgeInsets.symmetric(
                horizontal: DesignTokens.space4,
                vertical: DesignTokens.space2,
              ),
          padding: widget.padding ??
              REdgeInsets.symmetric(
                horizontal: DesignTokens.space4,
                vertical: DesignTokens.space2,
              ),
          decoration: BoxDecoration(
            color: fsmTheme.searchBarBackground,
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outlineVariant,
              width: _focusNode.hasFocus ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              // Search icon
              Icon(
                Icons.search,
                color: theme.colorScheme.onSurfaceVariant,
                size: DesignTokens.iconMd.sp,
              ),
              RSizedBox(width: DesignTokens.space2),

              // Text field
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  style: TextStyle(
                    fontSize: DesignTokens.fontSize16.sp,
                    color: theme.colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText ?? 'Search...',
                    hintStyle: TextStyle(
                      fontSize: DesignTokens.fontSize16.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onSubmitted: widget.onSubmitted,
                  textInputAction: TextInputAction.search,
                ),
              ),

              // Loading indicator
              if (widget.isLoading) ...[
                RSizedBox(width: DesignTokens.space2),
                SizedBox(
                  width: DesignTokens.iconSm.w,
                  height: DesignTokens.iconSm.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],

              // Clear button
              if (_hasText && !widget.isLoading) ...[
                RSizedBox(width: DesignTokens.space2),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: DesignTokens.iconSm.sp,
                  ),
                  onPressed: _clearSearch,
                  constraints: BoxConstraints(
                    minWidth: DesignTokens.buttonHeightSm,
                    minHeight: DesignTokens.buttonHeightSm,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],

              // Voice search button
              if (widget.showVoiceSearch) ...[
                RSizedBox(width: DesignTokens.space2),
                IconButton(
                  icon: Icon(
                    Icons.mic_none,
                    color: theme.colorScheme.primary,
                    size: DesignTokens.iconMd.sp,
                  ),
                  onPressed: widget.onVoiceSearch,
                  constraints: BoxConstraints(
                    minWidth: DesignTokens.buttonHeightMd,
                    minHeight: DesignTokens.buttonHeightMd,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],

              // Filter button with badge
              if (widget.showFilterButton) ...[
                RSizedBox(width: DesignTokens.space2),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: widget.activeFilterCount != null &&
                                widget.activeFilterCount! > 0
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                        size: DesignTokens.iconMd.sp,
                      ),
                      onPressed: widget.onFilterTap,
                      constraints: BoxConstraints(
                        minWidth: DesignTokens.buttonHeightMd,
                        minHeight: DesignTokens.buttonHeightMd,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    if (widget.activeFilterCount != null &&
                        widget.activeFilterCount! > 0)
                      Positioned(
                        top: -2.h,
                        right: -2.w,
                        child: Container(
                          padding: REdgeInsets.all(DesignTokens.space1),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: (DesignTokens.space4 + DesignTokens.space1).w,
                            minHeight: (DesignTokens.space4 + DesignTokens.space1).h,
                          ),
                          child: Center(
                            child: Text(
                              '${widget.activeFilterCount}',
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: DesignTokens.fontSize10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),

        // Recent searches
        if (_showRecentSearches)
          _buildRecentSearches(),
      ],
    );
  }

  Widget _buildRecentSearches() {
    final theme = Theme.of(context);

    return Container(
      margin: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      padding: REdgeInsets.symmetric(vertical: DesignTokens.space2),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(DesignTokens.radiusMd.r),
          bottomRight: Radius.circular(DesignTokens.radiusMd.r),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space4,
              vertical: DesignTokens.space2,
            ),
            child: Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: DesignTokens.fontSize12.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          ...widget.recentSearches!.take(5).map(
                (search) => InkWell(
                  onTap: () {
                    _controller.text = search;
                    widget.onRecentSearchTap?.call(search);
                    _focusNode.unfocus();
                  },
                  child: Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space4,
                      vertical: DesignTokens.space2,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: DesignTokens.iconSm.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        RSizedBox(width: DesignTokens.space4),
                        Expanded(
                          child: Text(
                            search,
                            style: TextStyle(
                              fontSize: DesignTokens.fontSize14.sp,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.north_west,
                          size: DesignTokens.iconXs.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
