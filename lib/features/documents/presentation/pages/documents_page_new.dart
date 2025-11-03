import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/widgets/templates/fsm_list_page_template.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../domain/entities/document_entity.dart';
import '../blocs/documents/documents_bloc.dart';
import '../blocs/documents/documents_event.dart';
import '../blocs/documents/documents_state.dart';
import '../widgets/document_card_tile.dart';
import '../widgets/download_progress_indicator.dart';

@RoutePage()
class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  List<String> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load documents initially
    context.read<DocumentsBloc>().add(
          const DocumentsEvent.loadDocuments(page: 1),
        );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<DocumentsBloc>().add(
            const DocumentsEvent.loadMoreDocuments(),
          );
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (query.isNotEmpty) {
      context.read<DocumentsBloc>().add(
            DocumentsEvent.searchDocuments(
              query: query,
              category: _selectedCategories.isNotEmpty
                  ? _selectedCategories.first
                  : null,
            ),
          );
    } else {
      context.read<DocumentsBloc>().add(
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
      context.read<DocumentsBloc>().add(
            DocumentsEvent.searchDocuments(
              query: _searchQuery,
              category:
                  selectedFilters.isNotEmpty ? selectedFilters.first : null,
            ),
          );
    } else {
      context.read<DocumentsBloc>().add(
            DocumentsEvent.loadDocuments(
              category:
                  selectedFilters.isNotEmpty ? selectedFilters.first : null,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DocumentsBloc>(),
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
            onRetry: () => context.read<DocumentsBloc>().add(
                  const DocumentsEvent.loadDocuments(page: 1, isRefresh: true),
                ),
            // Actions
            onRefresh: () async {
              context.read<DocumentsBloc>().add(
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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListContent(DocumentsState state) {
    return Column(
      children: [
        // Download progress indicator
        if (state.isDownloading && state.downloadingDocumentId != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DownloadProgressIndicator(
              fileName: _getDownloadingFileName(state),
              progress:
                  0.5, // This should come from the actual download progress
            ),
          ),

        // Documents List
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount:
                state.filteredDocuments.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.filteredDocuments.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final document = state.filteredDocuments[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
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
          ),
        ),
      ],
    );
  }

  void _openDocument(BuildContext context, DocumentEntity document) {
    context.router.push(DocumentViewerRoute(documentId: document.id));
  }

  void _downloadDocument(BuildContext context, DocumentEntity document) {
    context
        .read<DocumentsBloc>()
        .add(DocumentsEvent.downloadDocument(document));
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

  String _getDownloadingFileName(DocumentsState state) {
    if (state.downloadingDocumentId == null) return '';

    final document = state.documents.firstWhere(
      (doc) => doc.id == state.downloadingDocumentId,
      orElse: () => DocumentEntity(
        id: '',
        title: 'Unknown Document',
        description: '',
        type: DocumentType.manual,
        fileUrl: '',
        fileName: '',
        fileSize: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        tags: const [],
        categories: const [],
      ),
    );

    return document.fileName;
  }
}
