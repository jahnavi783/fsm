import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/document_entity.dart';
import 'documents_event.dart';

part 'documents_state.freezed.dart';

@freezed
class DocumentsState with _$DocumentsState {
  const DocumentsState._();
  
  const factory DocumentsState({
    @Default([]) List<DocumentEntity> documents,
    @Default([]) List<String> categories,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isSearching,
    @Default(false) bool isDownloading,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
    DocumentType? selectedType,
    String? selectedCategory,
    String? searchQuery,
    String? errorMessage,
    String? downloadingDocumentId,
    DocumentsEvent? lastFailedEvent,
    @Default(false) bool isOffline,
  }) = _DocumentsState;

  bool get hasDocuments => documents.isNotEmpty;
  bool get hasError => errorMessage != null;
  bool get canLoadMore => !hasReachedMax && !isLoadingMore && !isLoading;
  bool get isSearchMode => searchQuery != null && searchQuery!.isNotEmpty;
  
  List<DocumentEntity> get filteredDocuments {
    var filtered = documents;
    
    if (selectedType != null) {
      filtered = filtered.where((doc) => doc.type == selectedType).toList();
    }
    
    if (selectedCategory != null) {
      filtered = filtered.where((doc) => 
        doc.categories.contains(selectedCategory) ||
        doc.categories.any((cat) => cat.toLowerCase() == selectedCategory!.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }
  
  int get downloadedDocumentsCount => 
      documents.where((doc) => doc.isAvailableOffline).length;
}