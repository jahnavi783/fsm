import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/fsm_bottom_sheet.dart';
import '../../domain/entities/document_entity.dart';
import 'document_list_item.dart';
import 'document_search_bar.dart';
import 'document_shimmer.dart';

/// Reusable bottom sheet for document selection
/// This widget provides a search interface and list of documents
/// Can be used in any feature that needs document selection
class DocumentActionSheet extends StatefulWidget {
  final Function(DocumentEntity)? onDocumentSelected;
  final String? initialSearchQuery;
  final DocumentType? initialType;
  final List<DocumentEntity> documents;
  final bool isLoading;
  final VoidCallback? onLoadMore;
  final Function(String)? onSearch;
  final Function(DocumentType?)? onTypeFilter;
  final bool hasReachedMax;

  const DocumentActionSheet({
    super.key,
    this.onDocumentSelected,
    this.initialSearchQuery,
    this.initialType,
    required this.documents,
    this.isLoading = false,
    this.onLoadMore,
    this.onSearch,
    this.onTypeFilter,
    this.hasReachedMax = false,
  });

  /// Helper method to show the action sheet
  static Future<DocumentEntity?> show({
    required BuildContext context,
    String? initialSearchQuery,
    DocumentType? initialType,
    required List<DocumentEntity> documents,
    bool isLoading = false,
    VoidCallback? onLoadMore,
    Function(String)? onSearch,
    Function(DocumentType?)? onTypeFilter,
    bool hasReachedMax = false,
  }) async {
    return FSMBottomSheet.show<DocumentEntity>(
      context: context,
      title: 'Select Document',
      showCloseButton: true,
      content: DocumentActionSheet(
        initialSearchQuery: initialSearchQuery,
        initialType: initialType,
        documents: documents,
        isLoading: isLoading,
        onLoadMore: onLoadMore,
        onSearch: onSearch,
        onTypeFilter: onTypeFilter,
        hasReachedMax: hasReachedMax,
        onDocumentSelected: (document) {
          Navigator.of(context).pop(document);
        },
      ),
    );
  }

  @override
  State<DocumentActionSheet> createState() => _DocumentActionSheetState();
}

class _DocumentActionSheetState extends State<DocumentActionSheet> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounceTimer;
  DocumentType? _selectedType;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialSearchQuery ?? '';
    _selectedType = widget.initialType;
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !widget.hasReachedMax && !widget.isLoading) {
      widget.onLoadMore?.call();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch?.call(query);
    });
  }

  void _onTypeSelected(DocumentType? type) {
    setState(() {
      _selectedType = type;
    });
    widget.onTypeFilter?.call(type);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          // Search bar
          DocumentSearchBar(
            initialQuery: widget.initialSearchQuery,
            isLoading: widget.isLoading,
            onSearchChanged: _onSearchChanged,
            onClearSearch: () {
              _searchController.clear();
              _onSearchChanged('');
            },
          ),

          // Type filter chips
          SizedBox(
            height: 50.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              children: [
                _buildFilterChip(
                  context,
                  'All',
                  _selectedType == null,
                  () => _onTypeSelected(null),
                ),
                ...DocumentType.values.map((type) {
                  return _buildFilterChip(
                    context,
                    type.displayName,
                    _selectedType == type,
                    () => _onTypeSelected(type),
                  );
                }),
              ],
            ),
          ),

          // Documents list
          Expanded(
            child: widget.isLoading && widget.documents.isEmpty
                ? const DocumentShimmer()
                : widget.documents.isEmpty
                    ? _buildEmptyState(context)
                    : ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.only(bottom: 16.h),
                        itemCount: widget.documents.length +
                            (widget.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index >= widget.documents.length) {
                            return Padding(
                              padding: EdgeInsets.all(16.w),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final document = widget.documents[index];
                          return DocumentListItem(
                            document: document,
                            onTap: () =>
                                widget.onDocumentSelected?.call(document),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: FilterChip(
        label: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: theme.colorScheme.surface,
        selectedColor: theme.colorScheme.primary,
        checkmarkColor: theme.colorScheme.onPrimary,
        side: BorderSide(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.outline.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.3),
            ),
            SizedBox(height: 16.h),
            Text(
              'No documents found',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try adjusting your search or filters',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
