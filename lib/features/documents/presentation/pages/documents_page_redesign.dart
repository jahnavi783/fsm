import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../domain/entities/document_entity.dart';
import '../blocs/documents/documents_bloc.dart';
import '../blocs/documents/documents_event.dart';
import '../blocs/documents/documents_state.dart';
import '../widgets/document_filter_chips.dart';
import '../widgets/document_grid_card.dart';
import '../widgets/document_search_bar.dart';
import '../widgets/document_shimmer.dart';

@RoutePage()
class DocumentsPageRedesign extends StatelessWidget {
  const DocumentsPageRedesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DocumentsBloc>()
        ..add(const LoadDocuments())
        ..add(const LoadCategories()),
      child: const DocumentsViewRedesign(),
    );
  }
}

class DocumentsViewRedesign extends StatefulWidget {
  const DocumentsViewRedesign({super.key});

  @override
  State<DocumentsViewRedesign> createState() => _DocumentsViewRedesignState();
}

class _DocumentsViewRedesignState extends State<DocumentsViewRedesign> {
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
    final fsmTheme = context.fsmTheme;

    return Scaffold(
      appBar: FSMAppBar.gradient(
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppDimensions.paddingXSmall),
              decoration: BoxDecoration(
                color: AppColors.onPrimary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              ),
              child: Icon(
                Icons.folder_rounded,
                color: AppColors.onPrimary,
                size: AppDimensions.iconSmall,
              ),
            ),
            SizedBox(width: AppDimensions.spaceSmall.w),
            const Text('Documents'),
          ],
        ),
        actions: [
          BlocBuilder<DocumentsBloc, DocumentsState>(
            builder: (context, state) {
              if (state.downloadedDocumentsCount > 0) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: AppDimensions.paddingMedium.w),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSmall,
                        vertical: AppDimensions.paddingXSmall,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.success.withValues(alpha: 0.9),
                            AppColors.success.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusLarge),
                        border: Border.all(
                          color: AppColors.onPrimary.withValues(alpha: 0.3),
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.success.withValues(alpha: 0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.download_done_rounded,
                            color: AppColors.onPrimary,
                            size: 14.sp,
                          ),
                          SizedBox(width: AppDimensions.spaceXSmall.w),
                          Text(
                            '${state.downloadedDocumentsCount}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.onPrimary,
                              fontWeight: FontWeight.w700,
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
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  fsmTheme.cardGradient.colors.first.withValues(alpha: 0.03),
                  fsmTheme.workOrderCardBackground,
                ],
              ),
            ),
            child: RefreshIndicator(
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
                  Container(
                    padding: AppDimensions.paddingAllMedium,
                    child: DocumentSearchBar(
                      initialQuery: state.searchQuery,
                      isLoading: state.isSearching,
                      onSearchChanged: (query) {
                        if (query.isNotEmpty) {
                          context.read<DocumentsBloc>().add(
                                SearchDocuments(
                                  query: query,
                                  type: state.selectedType,
                                  category: state.selectedCategory,
                                ),
                              );
                        } else {
                          context
                              .read<DocumentsBloc>()
                              .add(const ClearSearch());
                        }
                      },
                      onSearchSubmitted: () {
                        // Search is already triggered on change
                      },
                      onClearSearch: () {
                        context.read<DocumentsBloc>().add(const ClearSearch());
                      },
                    ),
                  ),

                  // Filter chips
                  DocumentFilterChips(
                    documentCounts: _getDocumentCounts(state.documents),
                    selectedType: state.selectedType,
                    onTypeSelected: (type) {
                      if (type != null) {
                        context.read<DocumentsBloc>().add(FilterByType(type));
                      } else {
                        context.read<DocumentsBloc>().add(const ClearSearch());
                      }
                    },
                  ),

                  SizedBox(height: AppDimensions.spaceSmall.h),

                  // Offline indicator
                  if (state.isOffline)
                    Container(
                      width: double.infinity,
                      margin: AppDimensions.marginHorizontalMedium,
                      padding: AppDimensions.paddingAllSmall,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.warning.withValues(alpha: 0.15),
                            AppColors.warning.withValues(alpha: 0.05),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusSmall),
                        border: Border.all(
                          color: AppColors.warning.withValues(alpha: 0.3),
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.all(AppDimensions.paddingXSmall),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusXSmall),
                            ),
                            child: Icon(
                              Icons.cloud_off_rounded,
                              color: AppColors.warning,
                              size: AppDimensions.iconSmall,
                            ),
                          ),
                          SizedBox(width: AppDimensions.spaceSmall.w),
                          Expanded(
                            child: Text(
                              'Offline - Showing cached documents',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.warning.withValues(alpha: 0.9),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Documents grid
                  Expanded(
                    child: _buildDocumentsGrid(context, state),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDocumentsGrid(BuildContext context, DocumentsState state) {
    if (state.isLoading && state.documents.isEmpty) {
      return const DocumentShimmer();
    }

    if (!state.isLoading && state.documents.isEmpty && !state.hasError) {
      return _buildEmptyState(context, state);
    }

    return Padding(
      padding: AppDimensions.paddingHorizontalMedium,
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: AppDimensions.spaceSmall.h,
          crossAxisSpacing: AppDimensions.spaceSmall.w,
        ),
        itemCount: state.documents.length + (state.isLoadingMore ? 2 : 0),
        itemBuilder: (context, index) {
          if (index >= state.documents.length) {
            // Loading shimmer for grid items
            return AspectRatio(
              aspectRatio: 3 / 4,
              child: Card(
                elevation: AppDimensions.elevationXSmall,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusMedium),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            );
          }

          final document = state.documents[index];
          final isDownloading = state.isDownloading &&
              state.downloadingDocumentId == document.id.toString();

          return DocumentGridCard(
            document: document,
            isDownloading: isDownloading,
            isDownloaded: document.isDownloaded ?? false,
            onTap: () => _openDocument(context, document),
            onDownload: () => _downloadDocument(context, document),
            onDelete: () => _deleteDocument(context, document),
          );
        },
      ),
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
            Container(
              padding: EdgeInsets.all(AppDimensions.paddingLarge),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
              ),
              child: Icon(
                state.isSearchMode
                    ? Icons.search_off_rounded
                    : Icons.folder_open_rounded,
                size: 48.sp,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
            SizedBox(height: AppDimensions.spaceLarge.h),
            Text(
              state.isSearchMode
                  ? 'No documents found'
                  : 'No documents available',
              style: AppTextStyles.titleMedium.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.spaceSmall.h),
            Text(
              state.isSearchMode
                  ? 'Try adjusting your search terms or filters'
                  : 'Documents will appear here when available',
              style: AppTextStyles.bodyMedium.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Map<DocumentType?, int> _getDocumentCounts(List<DocumentEntity> documents) {
    final counts = <DocumentType?, int>{};

    // Count all documents
    counts[null] = documents.length;

    // Count by type
    for (final type in DocumentType.values) {
      counts[type] = documents.where((doc) => doc.type == type).length;
    }

    return counts;
  }

  void _openDocument(BuildContext context, DocumentEntity document) {
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
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}
