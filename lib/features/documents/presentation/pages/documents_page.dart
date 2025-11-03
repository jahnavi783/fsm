import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../core/widgets/navigation/fsm_drawer.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../domain/entities/document_entity.dart';
import '../blocs/documents/documents_bloc.dart';
import '../blocs/documents/documents_event.dart';
import '../blocs/documents/documents_state.dart';
import '../widgets/document_card_tile.dart';
import '../widgets/document_list_item.dart';
import '../widgets/document_shimmer.dart';
import '../widgets/download_progress_indicator.dart';

@RoutePage()
class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DocumentsBloc>()
        ..add(const LoadDocuments())
        ..add(const LoadCategories()),
      child: const DocumentsView(),
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

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          appBar: FSMAppBar.gradient(
            titleWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary.withValues(alpha: 0.2),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusSmall),
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
              FSMAppBarAction.search(
                onPressed: () {
                  // TODO: Implement global search navigation when available
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Global search coming soon')),
                  );
                },
              ),
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
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusLarge),
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

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/documents',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onSync: () => _handleSync(context),
            onScanQR: () => _handleScanQR(context),
            onCheckIn: () => _handleCheckIn(context),
            onLogout: () => _handleLogout(context),
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
                      AppColors.primary.withValues(alpha: 0.02),
                      AppColors.surface,
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
                      FSMSearchBar(
                        hintText: 'Search documents...',
                        initialValue: state.searchQuery,
                        isLoading: state.isSearching,
                        onChanged: (query) {
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
                        showFilterButton: true,
                        activeFilterCount: _getActiveFilterCount(state),
                      ),

                      // Category Filters
                      if (state.categories.isNotEmpty)
                        FSMFilterChipGroup<String>(
                          options: ['All', ...state.categories]
                              .map((category) => FilterChipData(
                                    value: category,
                                    label: category,
                                    leadingIcon: _getCategoryIcon(category),
                                  ))
                              .toList(),
                          selectedValues: state.selectedCategory != null
                              ? [state.selectedCategory!]
                              : ['All'],
                          onSelectionChanged: (selected) {
                            final category =
                                selected.isNotEmpty && selected.first != 'All'
                                    ? selected.first
                                    : null;
                            context
                                .read<DocumentsBloc>()
                                .add(FilterByCategory(category));
                          },
                          multiSelect: false,
                          showClearAll: false,
                        ),

                      // Download progress indicator
                      if (state.isDownloading &&
                          state.downloadingDocumentId != null)
                        DownloadProgressIndicator(
                          fileName: _getDownloadingFileName(state),
                        ),

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
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusSmall),
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
                                  color:
                                      AppColors.warning.withValues(alpha: 0.2),
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
                                    color: AppColors.warning
                                        .withValues(alpha: 0.9),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDocumentsList(BuildContext context, DocumentsState state) {
    if (state.isLoading && state.documents.isEmpty) {
      return const DocumentShimmer();
    }

    if (!state.isLoading && state.documents.isEmpty && !state.hasError) {
      return _buildEmptyState(context, state);
    }

    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(DesignTokens.space4.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DesignTokens.isMobile ? 2 : 3,
        crossAxisSpacing: DesignTokens.space3.w,
        mainAxisSpacing: DesignTokens.space3.h,
        childAspectRatio: 0.75,
      ),
      itemCount: state.documents.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.documents.length) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
            ),
          );
        }

        final document = state.documents[index];
        final isDownloading = state.isDownloading &&
            state.downloadingDocumentId == document.id.toString();

        return DocumentCardTile(
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
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            SizedBox(height: 16.h),
            Text(
              state.isSearchMode
                  ? 'No documents found for "${state.searchQuery}"'
                  : 'No documents available',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
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
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  // NAVIGATION & DRAWER ACTION HELPERS
  // ═══════════════════════════════════════════════════════════════════════

  /// Navigate to drawer section using Auto Route extensions
  void _navigateToSection(BuildContext context, String section) {
    final router = context.router;
    final drawerSection = _mapStringToDrawerSection(section);

    if (drawerSection != null) {
      router.navigateToDrawerSection(drawerSection);
    }
  }

  /// Map section string to DrawerSection enum
  DrawerSection? _mapStringToDrawerSection(String section) {
    switch (section.toLowerCase()) {
      case 'dashboard':
        return DrawerSection.dashboard;
      case 'work_orders':
      case 'workorders':
        return DrawerSection.workOrders;
      case 'calendar':
        return DrawerSection.calendar;
      case 'documents':
        return DrawerSection.documents;
      case 'parts':
        return DrawerSection.parts;
      case 'profile':
        return DrawerSection.profile;
      case 'settings':
        return DrawerSection.settings;
      case 'chat':
        return DrawerSection.chat;
      default:
        return null;
    }
  }

  /// Handle sync action
  void _handleSync(BuildContext context) {
    // Trigger documents refresh
    context.read<DocumentsBloc>().add(
          LoadDocuments(
            isRefresh: true,
            type: context.read<DocumentsBloc>().state.selectedType,
            category: context.read<DocumentsBloc>().state.selectedCategory,
            searchQuery: context.read<DocumentsBloc>().state.searchQuery,
          ),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing documents...')),
    );
  }

  /// Handle QR code scanning
  void _handleScanQR(BuildContext context) {
    // TODO: Implement QR scanning functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('QR Scanner feature coming soon!')),
    );
  }

  /// Handle location check-in
  void _handleCheckIn(BuildContext context) {
    // TODO: Implement location check-in functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in feature coming soon!')),
    );
  }

  /// Handle user logout
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _openDocument(BuildContext context, DocumentEntity document) {
    // Navigate to document viewer using type-safe route
    context.router.push(DocumentViewerRoute(documentId: document.id));
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

  int _getActiveFilterCount(DocumentsState state) {
    int count = 0;
    if (state.selectedCategory != null) count++;
    if (state.selectedType != null) count++;
    if (state.searchQuery?.isNotEmpty == true) count++;
    return count;
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'all':
        return Icons.folder_outlined;
      case 'manuals':
        return Icons.book_outlined;
      case 'specifications':
        return Icons.description_outlined;
      case 'procedures':
        return Icons.list_alt_outlined;
      case 'diagrams':
        return Icons.schema_outlined;
      case 'certificates':
        return Icons.verified_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  String _getDownloadingFileName(DocumentsState state) {
    final documentId = state.downloadingDocumentId;
    if (documentId != null && documentId.isNotEmpty) {
      final document = state.documents.firstWhere(
        (doc) => doc.id == documentId,
        orElse: () => DocumentEntity(
          id: '',
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
