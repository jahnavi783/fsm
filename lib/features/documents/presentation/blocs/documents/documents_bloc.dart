import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/download_document_usecase.dart';
import '../../../domain/usecases/get_document_categories_usecase.dart';
import '../../../domain/usecases/get_documents_usecase.dart';
import '../../../domain/usecases/search_documents_usecase.dart';
import '../../../domain/repositories/i_document_repository.dart';
import 'documents_event.dart';
import 'documents_state.dart';

@injectable
class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  final GetDocumentsUseCase _getDocumentsUseCase;
  final SearchDocumentsUseCase _searchDocumentsUseCase;
  final DownloadDocumentUseCase _downloadDocumentUseCase;
  final GetDocumentCategoriesUseCase _getDocumentCategoriesUseCase;
  final IDocumentRepository _documentRepository;

  Timer? _searchDebounceTimer;
  static const Duration _searchDebounceDelay = Duration(milliseconds: 300);

  DocumentsBloc(
    this._getDocumentsUseCase,
    this._searchDocumentsUseCase,
    this._downloadDocumentUseCase,
    this._getDocumentCategoriesUseCase,
    this._documentRepository,
  ) : super(const DocumentsState()) {
    on<LoadDocuments>(_onLoadDocuments);
    on<SearchDocuments>(_onSearchDocuments, transformer: _debounceTransformer());
    on<LoadMoreDocuments>(_onLoadMoreDocuments);
    on<FilterByType>(_onFilterByType);
    on<FilterByCategory>(_onFilterByCategory);
    on<DownloadDocument>(_onDownloadDocument);
    on<DeleteDownloadedDocument>(_onDeleteDownloadedDocument);
    on<LoadCategories>(_onLoadCategories);
    on<ClearSearch>(_onClearSearch);
    on<RetryLastAction>(_onRetryLastAction);
  }

  @override
  Future<void> close() {
    _searchDebounceTimer?.cancel();
    return super.close();
  }

  // Debounce transformer for search events
  EventTransformer<SearchDocuments> _debounceTransformer() {
    return (events, mapper) {
      return events
          .debounceTime(_searchDebounceDelay)
          .asyncExpand(mapper);
    };
  }

  Future<void> _onLoadDocuments(
    LoadDocuments event,
    Emitter<DocumentsState> emit,
  ) async {
    if (event.isRefresh) {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
        currentPage: 1,
        hasReachedMax: false,
      ));
    } else if (event.page == 1) {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
        documents: [],
        currentPage: 1,
        hasReachedMax: false,
      ));
    }

    final result = await _getDocumentsUseCase(
      page: event.page,
      limit: event.limit,
      type: event.type,
      category: event.category,
      searchQuery: event.searchQuery,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.userFriendlyMessage,
          lastFailedEvent: event,
          isOffline: failure is NetworkFailure || failure is CacheFailure,
        ));
      },
      (documents) {
        final updatedDocuments = event.isRefresh || event.page == 1
            ? documents
            : [...state.documents, ...documents];

        emit(state.copyWith(
          isLoading: false,
          documents: updatedDocuments,
          currentPage: event.page,
          hasReachedMax: documents.length < event.limit,
          errorMessage: null,
          selectedType: event.type,
          selectedCategory: event.category,
          searchQuery: event.searchQuery,
          isOffline: false,
        ));
      },
    );
  }

  Future<void> _onSearchDocuments(
    SearchDocuments event,
    Emitter<DocumentsState> emit,
  ) async {
    emit(state.copyWith(
      isSearching: true,
      errorMessage: null,
      documents: [],
      currentPage: 1,
      hasReachedMax: false,
    ));

    final result = await _searchDocumentsUseCase(
      query: event.query,
      type: event.type,
      category: event.category,
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isSearching: false,
          errorMessage: failure.userFriendlyMessage,
          lastFailedEvent: event,
          isOffline: failure is NetworkFailure || failure is CacheFailure,
        ));
      },
      (documents) {
        emit(state.copyWith(
          isSearching: false,
          documents: documents,
          currentPage: event.page,
          hasReachedMax: documents.length < event.limit,
          errorMessage: null,
          searchQuery: event.query,
          selectedType: event.type,
          selectedCategory: event.category,
          isOffline: false,
        ));
      },
    );
  }

  Future<void> _onLoadMoreDocuments(
    LoadMoreDocuments event,
    Emitter<DocumentsState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    
    if (state.isSearchMode) {
      add(SearchDocuments(
        query: state.searchQuery!,
        type: state.selectedType,
        category: state.selectedCategory,
        page: nextPage,
      ));
    } else {
      add(LoadDocuments(
        page: nextPage,
        type: state.selectedType,
        category: state.selectedCategory,
        searchQuery: state.searchQuery,
      ));
    }

    emit(state.copyWith(isLoadingMore: false));
  }

  Future<void> _onFilterByType(
    FilterByType event,
    Emitter<DocumentsState> emit,
  ) async {
    add(LoadDocuments(
      type: event.type,
      category: state.selectedCategory,
      searchQuery: state.searchQuery,
    ));
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<DocumentsState> emit,
  ) async {
    add(LoadDocuments(
      type: state.selectedType,
      category: event.category,
      searchQuery: state.searchQuery,
    ));
  }

  Future<void> _onDownloadDocument(
    DownloadDocument event,
    Emitter<DocumentsState> emit,
  ) async {
    emit(state.copyWith(
      isDownloading: true,
      downloadingDocumentId: event.document.id,
      errorMessage: null,
    ));

    final result = await _downloadDocumentUseCase(document: event.document);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isDownloading: false,
          downloadingDocumentId: null,
          errorMessage: 'Failed to download document: ${failure.userFriendlyMessage}',
        ));
      },
      (localPath) {
        // Update the document in the list with download status
        final updatedDocuments = state.documents.map((doc) {
          if (doc.id == event.document.id) {
            return doc.copyWith(
              isDownloaded: true,
              localPath: localPath,
            );
          }
          return doc;
        }).toList();

        emit(state.copyWith(
          isDownloading: false,
          downloadingDocumentId: null,
          documents: updatedDocuments,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onDeleteDownloadedDocument(
    DeleteDownloadedDocument event,
    Emitter<DocumentsState> emit,
  ) async {
    final result = await _documentRepository.deleteDownloadedDocument(event.documentId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: 'Failed to delete document: ${failure.userFriendlyMessage}',
        ));
      },
      (_) {
        // Update the document in the list to remove download status
        final updatedDocuments = state.documents.map((doc) {
          if (doc.id == event.documentId) {
            return doc.copyWith(
              isDownloaded: false,
              localPath: null,
            );
          }
          return doc;
        }).toList();

        emit(state.copyWith(
          documents: updatedDocuments,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<DocumentsState> emit,
  ) async {
    final result = await _getDocumentCategoriesUseCase();

    result.fold(
      (failure) {
        // Don't emit error for categories, just use empty list
      },
      (categories) {
        emit(state.copyWith(categories: categories));
      },
    );
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<DocumentsState> emit,
  ) async {
    add(const LoadDocuments(searchQuery: null));
  }

  Future<void> _onRetryLastAction(
    RetryLastAction event,
    Emitter<DocumentsState> emit,
  ) async {
    final lastEvent = state.lastFailedEvent;
    if (lastEvent != null) {
      add(lastEvent);
    }
  }
}