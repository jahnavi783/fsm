import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/templates/fsm_list_page_template.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../domain/entities/document_entity.dart';
import '../blocs/documents/documents_bloc.dart';
import '../blocs/documents/documents_event.dart';
import '../blocs/documents/documents_state.dart';
import '../widgets/document_card_tile.dart';

@RoutePage()
class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final ScrollController _scrollController = ScrollController();
  late final DocumentsBloc _documentsBloc;
  String _searchQuery = '';
  List<String> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Initialize DocumentsBloc and load documents initially
    _documentsBloc = getIt<DocumentsBloc>()
      ..add(const DocumentsEvent.loadDocuments(page: 1))
      ..add(const DocumentsEvent.loadCategories());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _documentsBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _documentsBloc.add(
        const DocumentsEvent.loadMoreDocuments(),
      );
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (query.isNotEmpty) {
      _documentsBloc.add(
        DocumentsEvent.searchDocuments(
          query: query,
          category: _selectedCategories.isNotEmpty
              ? _selectedCategories.first
              : null,
        ),
      );
    } else {
      _documentsBloc.add(
        DocumentsEvent.loadDocuments(
          category: _selectedCategories.isNotEmpty
              ? _selectedCategories.first
              : null,
        ),
      );
    }
  }

  void _onFilterChanged(List<String> selectedFilters) {
    setState(() {
      _selectedCategories = selectedFilters;
    });

    if (_searchQuery.isNotEmpty) {
      _documentsBloc.add(
        DocumentsEvent.searchDocuments(
          query: _searchQuery,
          category:
              selectedFilters.isNotEmpty ? selectedFilters.first : null,
        ),
      );
    } else {
      _documentsBloc.add(
        DocumentsEvent.loadDocuments(
          category:
              selectedFilters.isNotEmpty ? selectedFilters.first : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _documentsBloc,
      child: BlocBuilder<DocumentsBloc, DocumentsState>(
        builder: (context, state) {
          return FSMDocumentsPageTemplate(
            // Search and filters
            searchValue: _searchQuery,
            onSearchChanged: _onSearchChanged,
            onSearchSubmitted: (query) => _onSearchChanged(query),
            selectedFilters: _selectedCategories,
            onFilterChanged: _onFilterChanged,
            // Content
            listContent: _buildListContent(state),
            isLoading: state.isLoading,
            isEmpty: state.filteredDocuments.isEmpty && !state.isLoading,
            hasError: state.hasError,
            errorMessage: state.errorMessage,
            onRetry: () => _documentsBloc.add(
                  const DocumentsEvent.loadDocuments(page: 1, isRefresh: true),
                ),
            // Actions
            onRefresh: () async {
              _documentsBloc.add(
                DocumentsEvent.loadDocuments(
                  page: 1,
                  isRefresh: true,
                  searchQuery:
                      _searchQuery.isNotEmpty ? _searchQuery : null,
                  category: _selectedCategories.isNotEmpty
                      ? _selectedCategories.first
                      : null,
                ),
              );
            },
            appBarActions: [
              if (state.isDownloading)
                Padding(
                  padding: REdgeInsets.all(DesignTokens.space4),
                  child: RSizedBox(
                    width: DesignTokens.iconSm,
                    height: DesignTokens.iconSm,
                    child: CircularProgressIndicator(strokeWidth: 2.w),
                  ),
                ),
            ],
            // FAB for document upload
            floatingActionButton: FloatingActionButton(
              onPressed: _onUploadDocument,
              backgroundColor: context.fsmTheme.fabBackground,
              child: Icon(
                Icons.upload_file_rounded,
                size: DesignTokens.iconMd.sp,
              ),
            ),
          );
        },
      ),
    );
  }

  void _onUploadDocument() {
    // TODO: Implement document upload functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Document upload coming soon',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildListContent(DocumentsState state) {
    return ListView.builder(
            controller: _scrollController,
            padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
            itemCount:
                state.filteredDocuments.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.filteredDocuments.length) {
                return Padding(
                  padding: REdgeInsets.all(DesignTokens.space4),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final document = state.filteredDocuments[index];
              return Padding(
                padding: REdgeInsets.only(bottom: DesignTokens.space3),
                child: DocumentCardTile(
                  document: document,
                  onTap: () => _openDocument(context, document),
                  onDownload: () => _downloadDocument(context, document),
                  onDelete: () => _deleteDocument(context, document),
                  isDownloading: state.isDownloading &&
                      state.downloadingDocumentId == document.id,
                ),
              );
            },
          );
  }

  void _openDocument(BuildContext context, DocumentEntity document) {
    context.router.push(DocumentViewerRoute(documentId: document.id));
  }

  void _downloadDocument(BuildContext context, DocumentEntity document) {
    _documentsBloc.add(DocumentsEvent.downloadDocument(document));
  }

  void _deleteDocument(BuildContext context, DocumentEntity document) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Document'),
        content: Text('Are you sure you want to delete "${document.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add delete event here if needed
              // context.read<DocumentsBloc>().add(DocumentsEvent.deleteDocument(document));
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
