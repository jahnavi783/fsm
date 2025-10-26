import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/document_entity.dart';

part 'documents_event.freezed.dart';

@freezed
class DocumentsEvent with _$DocumentsEvent {
  const factory DocumentsEvent.loadDocuments({
    @Default(1) int page,
    @Default(20) int limit,
    DocumentType? type,
    String? category,
    String? searchQuery,
    @Default(false) bool isRefresh,
  }) = LoadDocuments;

  const factory DocumentsEvent.searchDocuments({
    required String query,
    DocumentType? type,
    String? category,
    @Default(1) int page,
    @Default(20) int limit,
  }) = SearchDocuments;

  const factory DocumentsEvent.loadMoreDocuments() = LoadMoreDocuments;

  const factory DocumentsEvent.filterByType(DocumentType? type) = FilterByType;

  const factory DocumentsEvent.filterByCategory(String? category) = FilterByCategory;

  const factory DocumentsEvent.downloadDocument(DocumentEntity document) = DownloadDocument;

  const factory DocumentsEvent.deleteDownloadedDocument(String documentId) = DeleteDownloadedDocument;

  const factory DocumentsEvent.loadCategories() = LoadCategories;

  const factory DocumentsEvent.clearSearch() = ClearSearch;

  const factory DocumentsEvent.retryLastAction() = RetryLastAction;
}