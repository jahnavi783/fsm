import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
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
    final fsmTheme = context.fsmTheme;

    return Column(
      children: [
        Container(
          margin: widget.margin ??
              EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingSmall,
              ),
          padding: widget.padding ??
              EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingSmall,
              ),
          decoration: BoxDecoration(
            color: fsmTheme.searchBarBackground,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppColors.primary
                  : AppColors.cardBorder,
              width: _focusNode.hasFocus ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              // Search icon
              Icon(
                Icons.search,
                color: AppColors.grey600,
                size: 24.sp,
              ),
              SizedBox(width: AppDimensions.paddingSmall),

              // Text field
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText ?? 'Search...',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textTertiary,
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
                SizedBox(width: AppDimensions.paddingSmall),
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],

              // Clear button
              if (_hasText && !widget.isLoading) ...[
                SizedBox(width: AppDimensions.paddingSmall),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.grey600,
                    size: 20.sp,
                  ),
                  onPressed: _clearSearch,
                  constraints: BoxConstraints(
                    minWidth: 32.w,
                    minHeight: 32.h,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],

              // Voice search button
              if (widget.showVoiceSearch) ...[
                SizedBox(width: AppDimensions.paddingSmall),
                IconButton(
                  icon: Icon(
                    Icons.mic_none,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                  onPressed: widget.onVoiceSearch,
                  constraints: BoxConstraints(
                    minWidth: AppDimensions.touchTargetMin,
                    minHeight: AppDimensions.touchTargetMin,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],

              // Filter button with badge
              if (widget.showFilterButton) ...[
                SizedBox(width: AppDimensions.paddingSmall),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: widget.activeFilterCount != null &&
                                widget.activeFilterCount! > 0
                            ? AppColors.primary
                            : AppColors.grey600,
                        size: 24.sp,
                      ),
                      onPressed: widget.onFilterTap,
                      constraints: BoxConstraints(
                        minWidth: AppDimensions.touchTargetMin,
                        minHeight: AppDimensions.touchTargetMin,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    if (widget.activeFilterCount != null &&
                        widget.activeFilterCount! > 0)
                      Positioned(
                        top: -2.h,
                        right: -2.w,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 18.w,
                            minHeight: 18.h,
                          ),
                          child: Center(
                            child: Text(
                              '${widget.activeFilterCount}',
                              style: TextStyle(
                                color: AppColors.onPrimary,
                                fontSize: 10.sp,
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.radiusMedium),
          bottomRight: Radius.circular(AppDimensions.radiusMedium),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: AppDimensions.shadowBlurMedium,
            offset: AppDimensions.shadowOffsetMedium,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium,
              vertical: AppDimensions.paddingSmall,
            ),
            child: Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textTertiary,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium,
                      vertical: AppDimensions.paddingSmall,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 20.sp,
                          color: AppColors.grey500,
                        ),
                        SizedBox(width: AppDimensions.paddingMedium),
                        Expanded(
                          child: Text(
                            search,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.north_west,
                          size: 16.sp,
                          color: AppColors.grey400,
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
