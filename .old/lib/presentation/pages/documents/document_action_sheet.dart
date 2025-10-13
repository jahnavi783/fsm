import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/core/services/enums.dart';
import 'package:fsm_flutter/data/entity/document_entity.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_bloc.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_event.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_preview_page.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_state.dart';

class DocumentActionSheet extends StatefulWidget {
  final Function(DocumentEntity)? onDocumentSelected;
  final String? initialSearchQuery;
  final DocumentCategory? initialCategory;

  const DocumentActionSheet({
    super.key,
    this.onDocumentSelected,
    this.initialSearchQuery,
    this.initialCategory,
  });

  @override
  State<DocumentActionSheet> createState() => _DocumentActionSheetState();
}

class _DocumentActionSheetState extends State<DocumentActionSheet> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounceTimer;
  late DocumentBloc _documentBloc;

  @override
  void initState() {
    super.initState();
    _documentBloc = DocumentBloc();
    _searchController.text = widget.initialSearchQuery ?? '';

    // Initialize with filters if provided
    if (widget.initialCategory != null) {
      _documentBloc
          .add(DocumentsCategoryFilterRequested(widget.initialCategory));
    } else if (widget.initialSearchQuery?.isNotEmpty == true) {
      _documentBloc.add(DocumentsSearchRequested(widget.initialSearchQuery!));
    } else {
      _documentBloc.add(const DocumentsRequested());
    }

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    _documentBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _documentBloc.add(const DocumentsLoadMore());
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
      _documentBloc.add(DocumentsSearchRequested(query));
    });
  }

  void _onCategorySelected(DocumentCategory? category) {
    _documentBloc.add(DocumentsCategoryFilterRequested(category));
  }

  String _getCategoryDisplayName(DocumentCategory category) {
    switch (category) {
      case DocumentCategory.manual:
        return 'Manual';
      case DocumentCategory.sop:
        return 'SOP';
      case DocumentCategory.repair_guide:
        return 'Repair Guide';
      case DocumentCategory.other:
        return 'Other';
    }
  }

  Widget _buildCategoryChips(DocumentState state) {
    final selectedCategory = state.selectedCategory;
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          // All categories chip
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: FilterChip(
              label: const Text('All'),
              selected: selectedCategory == null,
              onSelected: (selected) {
                if (selected) {
                  _onCategorySelected(null);
                }
              },
              selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
              checkmarkColor: Theme.of(context).primaryColor,
            ),
          ),
          // Category chips
          ...DocumentCategory.values.map((category) {
            print(
                'Building chip for category: $category & selected: $selectedCategory boolean: ${selectedCategory == category}');
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: FilterChip(
                label: Text(_getCategoryDisplayName(category)),
                selected: selectedCategory == category,
                onSelected: (selected) {
                  if (selected) {
                    _onCategorySelected(category);
                  }
                },
                selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                checkmarkColor: Theme.of(context).primaryColor,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildDocumentItem(DocumentEntity document) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: ListTile(
        leading: _buildThumbnail(document),
        title: Text(
          document.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (document.description.isNotEmpty) ...[
              SizedBox(height: 4.h),
              Text(
                document.description,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            SizedBox(height: 4.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    document.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  _formatFileSize(document.fileSize),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DocumentPreviewPage(document: document),
          ));
        },
      ),
    );
  }

  Widget _buildThumbnail(DocumentEntity document) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: _isImageFile(document.fileType)
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: _isImageFile(document.fileType)
            ? _buildImageThumbnail(document)
            : _buildIconThumbnail(document.fileUrl),
      ),
    );
  }

  Widget _buildImageThumbnail(DocumentEntity document) {
    return Image.network(
      document.fileUrl,
      width: 56.w,
      height: 56.h,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildIconThumbnail(document.fileType);
      },
    );
  }

  Widget _buildIconThumbnail(String fileUrl) {
    String fileType = fileUrl.split('.').last;
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        _getFileIcon(fileType),
        color: Theme.of(context).primaryColor,
        size: 28.sp,
      ),
    );
  }

  bool _isImageFile(String fileType) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'];
    return imageExtensions.contains(fileType.toLowerCase());
  }

  IconData _getFileIcon(String fileType) {
    switch (fileType.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.video_file;
      default:
        return Icons.insert_drive_file;
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)}GB';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _documentBloc,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search documents...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _searchController.clear();
                            _onSearchChanged('');
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
              ),
            ),

            // Category chips
            BlocBuilder<DocumentBloc, DocumentState>(
              builder: (context, state) {
                return _buildCategoryChips(state);
              },
            ),

            // Documents list
            Expanded(
              child: BlocBuilder<DocumentBloc, DocumentState>(
                builder: (context, state) {
                  switch (state.status) {
                    case DocumentStatus.initial:
                    case DocumentStatus.loading:
                      if (state.documents.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      break;
                    case DocumentStatus.failure:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64.sp,
                              color: Colors.red,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Failed to load documents',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(height: 8.h),
                            GradientElevatedButton(
                              onPressed: () =>
                                  _documentBloc.add(const DocumentsRequested()),
                              child: const Text(
                                'Retry',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    case DocumentStatus.success:
                      break;
                  }

                  if (state.documents.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open,
                            size: 64.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No documents found',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      _documentBloc.add(const DocumentsRefreshRequested());
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.only(bottom: 16.h),
                      itemCount: state.hasReachedMax
                          ? state.documents.length
                          : state.documents.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.documents.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        }
                        return _buildDocumentItem(state.documents[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
