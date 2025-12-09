import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/templates/fsm_list_page_template.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/inputs/filter_chip_data.dart';
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
  final TextEditingController _searchController = TextEditingController();
  late final DocumentsBloc _documentsBloc;
  String _searchQuery = '';
  List<String> _selectedCategories = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _scrollController.addListener(_onScroll);

    // Initialize DocumentsBloc and load documents initially
    _documentsBloc = getIt<DocumentsBloc>()
      ..add(const DocumentsEvent.loadDocuments(page: 1))
      ..add(const DocumentsEvent.loadCategories());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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
    final q = query.toLowerCase().trim();
    setState(() {
      _searchQuery = query;
    });
    final categoryToSend = query.isEmpty
        ? _selectedCategories.isNotEmpty
            ? _selectedCategories.first
            : null
        : null;

    if (query.isNotEmpty) {
      _documentsBloc.add(
        DocumentsEvent.searchDocuments(query: query, category: categoryToSend),
      );
    } else {
      _documentsBloc.add(
        DocumentsEvent.loadDocuments(
          category:
              _selectedCategories.isNotEmpty ? _selectedCategories.first : null,
        ),
      );
    }
  }

  void _startVoiceSearch() async {
    bool available = await _speech.initialize();

    if (!available) {
      debugPrint("speech not available");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Voice recognition not available'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isListening = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎙 Listening...'),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );

    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          // FIXED: Update both the state variable AND the controller
          final recognizedText = result.recognizedWords;
          setState(() {
            _searchQuery = recognizedText;
          });

          // Update the search controller so the UI shows the text
          _searchController.text = recognizedText;

          // Trigger the search
          _onSearchChanged(recognizedText);

          // Stop listening after final result
          _stopVoiceSearch();
        } else {
          // Optional: Show interim results in real-time
          setState(() {
            _searchQuery = result.recognizedWords;
          });
          _searchController.text = result.recognizedWords;
        }
      },
      listenFor: const Duration(seconds: 10), // Increased timeout
      pauseFor: const Duration(seconds: 3),
    );
  }

  void _stopVoiceSearch() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _handleVoiceSearch() {
    if (_isListening) {
      _stopVoiceSearch();
    } else {
      _startVoiceSearch();
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
          category: selectedFilters.isNotEmpty ? selectedFilters.first : null,
        ),
      );
    } else {
      _documentsBloc.add(
        DocumentsEvent.loadDocuments(
          category: selectedFilters.isNotEmpty ? selectedFilters.first : null,
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
          return FSMListPageTemplate<String>(
            // Custom gradient app bar
            appBar: FSMAppBar.gradient(
              title: 'Documents',
              actions: [
                if (state.isDownloading)
                  Padding(
                    padding: REdgeInsets.all(DesignTokens.space4),
                    child: RSizedBox(
                      width: DesignTokens.iconSm,
                      height: DesignTokens.iconSm,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Search and filters
            showSearch: true,
            searchHint: 'Search documents...',
            searchValue: _searchQuery,
            onSearchChanged: _onSearchChanged,
            onSearchSubmitted: (query) => _onSearchChanged(query),
            showVoiceSearch: true,
            onVoiceSearchTap: _handleVoiceSearch,

            showFilters: state.categories.isNotEmpty,
            filterOptions: state.categories.isNotEmpty
                ? state.categories
                    .map((category) => FilterChipData<String>(
                          value: category,
                          label: category,
                        ))
                    .toList()
                : null,
            selectedFilters: _selectedCategories,
            onFilterChanged: _onFilterChanged,
            multiSelectFilters: true,
            // Content
            listContent: _buildListContent(state),
            isLoading: state.isLoading,
            isEmpty: state.filteredDocuments.isEmpty && !state.isLoading,
            hasError: state.hasError,
            errorMessage: state.errorMessage,
            onRetry: () => _documentsBloc.add(
              const DocumentsEvent.loadDocuments(page: 1, isRefresh: true),
            ),
            emptyTitle: 'No Documents Found',
            emptyDescription: 'Try adjusting your search or filter criteria.',
            // Actions
            onRefresh: () async {
              _documentsBloc.add(
                DocumentsEvent.loadDocuments(
                  page: 1,
                  isRefresh: true,
                  searchQuery: _searchQuery.isNotEmpty ? _searchQuery : null,
                  category: _selectedCategories.isNotEmpty
                      ? _selectedCategories.first
                      : null,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildListContent(DocumentsState state) {
    return ListView.builder(
      controller: _scrollController,
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      itemCount: state.filteredDocuments.length + (state.isLoadingMore ? 1 : 0),
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
