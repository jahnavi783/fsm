import 'package:equatable/equatable.dart';
import 'package:fsm_flutter/core/services/enums.dart';
import 'package:fsm_flutter/data/entity/document_entity.dart';

enum DocumentStatus { initial, loading, success, failure }

class DocumentState extends Equatable {
  const DocumentState({
    this.status = DocumentStatus.initial,
    this.documents = const <DocumentEntity>[],
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.total = 0,
    this.keyword = '',
    this.selectedCategory,
    this.selectedModel,
    this.error,
  });

  final DocumentStatus status;
  final List<DocumentEntity> documents;
  final bool hasReachedMax;
  final int currentPage;
  final int total;
  final String keyword;
  final DocumentCategory? selectedCategory;
  final String? selectedModel;
  final String? error;

  DocumentState copyWith({
    DocumentStatus? status,
    List<DocumentEntity>? documents,
    bool? hasReachedMax,
    int? currentPage,
    int? total,
    String? keyword,
    DocumentCategory? selectedCategory,
    String? selectedModel,
    String? error,
  }) {
    return DocumentState(
      status: status ?? this.status,
      documents: documents ?? this.documents,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      total: total ?? this.total,
      keyword: keyword ?? this.keyword,
      selectedCategory: selectedCategory,
      selectedModel: selectedModel,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        documents,
        hasReachedMax,
        currentPage,
        total,
        keyword,
        selectedCategory,
        selectedModel,
        error,
      ];
}
