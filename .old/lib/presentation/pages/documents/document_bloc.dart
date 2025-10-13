import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_event.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final RestClient _client = serviceLocator<RestClient>();
  static const int _limit = 20;

  DocumentBloc() : super(const DocumentState()) {
    on<DocumentsRequested>(_onDocumentsRequested);
    on<DocumentsRefreshRequested>(_onDocumentsRefreshRequested);
    on<DocumentsSearchRequested>(_onDocumentsSearchRequested);
    on<DocumentsCategoryFilterRequested>(_onDocumentsCategoryFilterRequested);
    on<DocumentsModelFilterRequested>(_onDocumentsModelFilterRequested);
    on<DocumentsLoadMore>(_onDocumentsLoadMore);
  }

  Future<void> _onDocumentsRequested(
    DocumentsRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(status: DocumentStatus.loading));
    try {
      final response = await _client.getDocuments(
        page: 1,
        limit: _limit,
        keyword: state.keyword.isEmpty ? null : state.keyword,
        category: state.selectedCategory,
        model: state.selectedModel,
      );

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: response.documents,
        hasReachedMax: response.documents.length < _limit,
        currentPage: 1,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onDocumentsRefreshRequested(
    DocumentsRefreshRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(
      status: DocumentStatus.loading,
      documents: [],
      hasReachedMax: false,
      currentPage: 1,
    ));
    add(const DocumentsRequested());
  }

  Future<void> _onDocumentsSearchRequested(
    DocumentsSearchRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(
      keyword: event.keyword,
      documents: [],
      hasReachedMax: false,
      currentPage: 1,
      status: DocumentStatus.loading,
    ));

    try {
      final response = await _client.getDocuments(
        page: 1,
        limit: _limit,
        keyword: event.keyword.isEmpty ? null : event.keyword,
        category: state.selectedCategory,
        model: state.selectedModel,
      );

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: response.documents,
        hasReachedMax: response.documents.length < _limit,
        currentPage: 1,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onDocumentsCategoryFilterRequested(
    DocumentsCategoryFilterRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(
      selectedCategory: event.category,
      documents: [],
      hasReachedMax: false,
      currentPage: 1,
      status: DocumentStatus.loading,
    ));

    try {
      final response = await _client.getDocuments(
        page: 1,
        limit: _limit,
        keyword: state.keyword.isEmpty ? null : state.keyword,
        category: event.category,
        model: state.selectedModel,
      );

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: response.documents,
        selectedCategory: event.category,
        hasReachedMax: response.documents.length < _limit,
        currentPage: 1,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onDocumentsModelFilterRequested(
    DocumentsModelFilterRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(
      selectedModel: event.model,
      documents: [],
      hasReachedMax: false,
      currentPage: 1,
      status: DocumentStatus.loading,
    ));

    try {
      final response = await _client.getDocuments(
        page: 1,
        limit: _limit,
        keyword: state.keyword.isEmpty ? null : state.keyword,
        category: state.selectedCategory,
        model: event.model,
      );

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: response.documents,
        hasReachedMax: response.documents.length < _limit,
        currentPage: 1,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onDocumentsLoadMore(
    DocumentsLoadMore event,
    Emitter<DocumentState> emit,
  ) async {
    if (state.hasReachedMax || state.status == DocumentStatus.loading) return;

    final nextPage = state.currentPage + 1;

    try {
      final response = await _client.getDocuments(
        page: nextPage,
        limit: _limit,
        keyword: state.keyword.isEmpty ? null : state.keyword,
        category: state.selectedCategory,
        model: state.selectedModel,
      );

      final newDocuments = [...state.documents, ...response.documents];

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: newDocuments,
        hasReachedMax: response.documents.length < _limit,
        currentPage: nextPage,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }
}
