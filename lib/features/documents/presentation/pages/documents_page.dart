import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/document_entity.dart';
import '../blocs/documents/documents_bloc.dart';
import '../blocs/documents/documents_event.dart';
import '../blocs/documents/documents_state.dart';
import '../widgets/document_category_filter.dart';
import '../widgets/document_list_item.dart';
import '../widgets/document_search_bar.dart';
import '../widgets/document_shimmer.dart';
import '../widgets/download_progress_indicator.dart';

@RoutePage()
class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentsBloc>(
      future: getIt.getAsync<DocumentsBloc>(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Documents')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  const Text('Failed to load documents'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          );
        }

        final documentsBloc = snapshot.data!;

        return BlocProvider.value(
          value: documentsBloc
            ..add(const LoadDocuments())
            ..add(const LoadCategories()),
          child: const DocumentsView(),
        );
      },
    );
  }
}

class DocumentsView extends StatefulWidget {
  const DocumentsView({super.key});

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<DocumentsBloc>().add(const LoadMoreDocuments());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        actions: [
          BlocBuilder<DocumentsBloc, DocumentsState>(
            builder: (context, state) {
              if (state.downloadedDocumentsCount > 0) {
                return Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.download_done,
                            color: Colors.green,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${state.downloadedDocumentsCount}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocConsumer<DocumentsBloc, DocumentsState>(
        listener: (context, state) {
          if (state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: theme.colorScheme.error,
                action: state.lastFailedEvent != null
                    ? SnackBarAction(
                        label: 'Retry',
                        textColor: theme.colorScheme.onError,
                        onPressed: () {
                          context
                              .read<DocumentsBloc>()
                              .add(const RetryLastAction());
                        },
                      )
                    : null,
              ),
            );
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DocumentsBloc>().add(
                    LoadDocuments(
                      isRefresh: true,
                      type: state.selectedType,
                      category: state.selectedCategory,
                      searchQuery: state.searchQuery,
                    ),
                  );
            },
            child: Column(
              children: [
                // Search bar
                DocumentSearchBar(
                  initialQuery: state.searchQuery,
                  isLoading: state.isSearching,
                  onSearchChanged: (query) {
                    // Trigger search immediately - debouncing is handled by BLoC
                    if (query.isNotEmpty) {
                      context.read<DocumentsBloc>().add(
                            SearchDocuments(
                              query: query,
                              type: state.selectedType,
                              category: state.selectedCategory,
                            ),
                          );
                    } else {
                      // Clear search if query is empty
                      context.read<DocumentsBloc>().add(const ClearSearch());
                    }
                  },
                  onSearchSubmitted: () {
                    // Search is already triggered on change, no need for additional action
                  },
                  onClearSearch: () {
                    context.read<DocumentsBloc>().add(const ClearSearch());
                  },
                ),

                // Filters
                DocumentCategoryFilter(
                  categories: state.categories,
                  selectedType: state.selectedType,
                  selectedCategory: state.selectedCategory,
                  onTypeChanged: (type) {
                    context.read<DocumentsBloc>().add(FilterByType(type));
                  },
                  onCategoryChanged: (category) {
                    context
                        .read<DocumentsBloc>()
                        .add(FilterByCategory(category));
                  },
                ),

                // Download progress indicator
                if (state.isDownloading && state.downloadingDocumentId != null)
                  DownloadProgressIndicator(
                    fileName: _getDownloadingFileName(state),
                  ),

                // Offline indicator
                if (state.isOffline)
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    color: Colors.orange.withOpacity(0.1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud_off,
                          color: Colors.orange,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Offline mode - showing cached documents',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.orange,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Documents list
                Expanded(
                  child: _buildDocumentsList(context, state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDocumentsList(BuildContext context, DocumentsState state) {
    if (state.isLoading && state.documents.isEmpty) {
      return const DocumentShimmer();
    }

    if (!state.isLoading && state.documents.isEmpty && !state.hasError) {
      return _buildEmptyState(context, state);
    }

    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(bottom: 16.h),
      itemCount: state.documents.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.documents.length) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final document = state.documents[index];
        final isDownloading = state.isDownloading &&
            state.downloadingDocumentId == document.id.toString();

        return DocumentListItem(
          document: document,
          isDownloading: isDownloading,
          onTap: () => _openDocument(context, document),
          onDownload: () => _downloadDocument(context, document),
          onDelete: () => _deleteDocument(context, document),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, DocumentsState state) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              state.isSearchMode ? Icons.search_off : Icons.description,
              size: 64.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.3),
            ),
            SizedBox(height: 16.h),
            Text(
              state.isSearchMode
                  ? 'No documents found for "${state.searchQuery}"'
                  : 'No documents available',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              state.isSearchMode
                  ? 'Try adjusting your search terms or filters'
                  : 'Documents will appear here when available',
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

  void _openDocument(BuildContext context, DocumentEntity document) {
    // Navigate to document viewer
    context.router.pushNamed('/document/${document.id}');
  }

  void _downloadDocument(BuildContext context, DocumentEntity document) {
    context.read<DocumentsBloc>().add(DownloadDocument(document));
  }

  void _deleteDocument(BuildContext context, DocumentEntity document) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Downloaded Document'),
        content: Text(
          'Are you sure you want to delete the downloaded copy of "${document.title}"? You can download it again later.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<DocumentsBloc>().add(
                    DeleteDownloadedDocument(document.id),
                  );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _getDownloadingFileName(DocumentsState state) {
    final documentId = int.tryParse(state.downloadingDocumentId ?? '');
    if (documentId != null) {
      final document = state.documents.firstWhere(
        (doc) => doc.id == documentId,
        orElse: () => DocumentEntity(
          id: 0,
          title: 'Unknown Document',
          description: '',
          type: DocumentType.other,
          fileUrl: '',
          fileName: 'document',
          fileSize: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          tags: const [],
          categories: const [],
        ),
      );
      return document.fileName;
    }
    return 'Document';
  }
}
