// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DocumentsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DocumentsEvent()';
  }
}

/// @nodoc
class $DocumentsEventCopyWith<$Res> {
  $DocumentsEventCopyWith(DocumentsEvent _, $Res Function(DocumentsEvent) __);
}

/// Adds pattern-matching-related methods to [DocumentsEvent].
extension DocumentsEventPatterns on DocumentsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDocuments value)? loadDocuments,
    TResult Function(SearchDocuments value)? searchDocuments,
    TResult Function(LoadMoreDocuments value)? loadMoreDocuments,
    TResult Function(FilterByType value)? filterByType,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(DownloadDocument value)? downloadDocument,
    TResult Function(DeleteDownloadedDocument value)? deleteDownloadedDocument,
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(RetryLastAction value)? retryLastAction,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments() when loadDocuments != null:
        return loadDocuments(_that);
      case SearchDocuments() when searchDocuments != null:
        return searchDocuments(_that);
      case LoadMoreDocuments() when loadMoreDocuments != null:
        return loadMoreDocuments(_that);
      case FilterByType() when filterByType != null:
        return filterByType(_that);
      case FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case DownloadDocument() when downloadDocument != null:
        return downloadDocument(_that);
      case DeleteDownloadedDocument() when deleteDownloadedDocument != null:
        return deleteDownloadedDocument(_that);
      case LoadCategories() when loadCategories != null:
        return loadCategories(_that);
      case ClearSearch() when clearSearch != null:
        return clearSearch(_that);
      case RetryLastAction() when retryLastAction != null:
        return retryLastAction(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDocuments value) loadDocuments,
    required TResult Function(SearchDocuments value) searchDocuments,
    required TResult Function(LoadMoreDocuments value) loadMoreDocuments,
    required TResult Function(FilterByType value) filterByType,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(DownloadDocument value) downloadDocument,
    required TResult Function(DeleteDownloadedDocument value)
        deleteDownloadedDocument,
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(RetryLastAction value) retryLastAction,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments():
        return loadDocuments(_that);
      case SearchDocuments():
        return searchDocuments(_that);
      case LoadMoreDocuments():
        return loadMoreDocuments(_that);
      case FilterByType():
        return filterByType(_that);
      case FilterByCategory():
        return filterByCategory(_that);
      case DownloadDocument():
        return downloadDocument(_that);
      case DeleteDownloadedDocument():
        return deleteDownloadedDocument(_that);
      case LoadCategories():
        return loadCategories(_that);
      case ClearSearch():
        return clearSearch(_that);
      case RetryLastAction():
        return retryLastAction(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDocuments value)? loadDocuments,
    TResult? Function(SearchDocuments value)? searchDocuments,
    TResult? Function(LoadMoreDocuments value)? loadMoreDocuments,
    TResult? Function(FilterByType value)? filterByType,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(DownloadDocument value)? downloadDocument,
    TResult? Function(DeleteDownloadedDocument value)? deleteDownloadedDocument,
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(RetryLastAction value)? retryLastAction,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments() when loadDocuments != null:
        return loadDocuments(_that);
      case SearchDocuments() when searchDocuments != null:
        return searchDocuments(_that);
      case LoadMoreDocuments() when loadMoreDocuments != null:
        return loadMoreDocuments(_that);
      case FilterByType() when filterByType != null:
        return filterByType(_that);
      case FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case DownloadDocument() when downloadDocument != null:
        return downloadDocument(_that);
      case DeleteDownloadedDocument() when deleteDownloadedDocument != null:
        return deleteDownloadedDocument(_that);
      case LoadCategories() when loadCategories != null:
        return loadCategories(_that);
      case ClearSearch() when clearSearch != null:
        return clearSearch(_that);
      case RetryLastAction() when retryLastAction != null:
        return retryLastAction(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, DocumentType? type, String? category,
            String? searchQuery, bool isRefresh)?
        loadDocuments,
    TResult Function(String query, DocumentType? type, String? category,
            int page, int limit)?
        searchDocuments,
    TResult Function()? loadMoreDocuments,
    TResult Function(DocumentType? type)? filterByType,
    TResult Function(String? category)? filterByCategory,
    TResult Function(DocumentEntity document)? downloadDocument,
    TResult Function(int documentId)? deleteDownloadedDocument,
    TResult Function()? loadCategories,
    TResult Function()? clearSearch,
    TResult Function()? retryLastAction,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments() when loadDocuments != null:
        return loadDocuments(_that.page, _that.limit, _that.type,
            _that.category, _that.searchQuery, _that.isRefresh);
      case SearchDocuments() when searchDocuments != null:
        return searchDocuments(
            _that.query, _that.type, _that.category, _that.page, _that.limit);
      case LoadMoreDocuments() when loadMoreDocuments != null:
        return loadMoreDocuments();
      case FilterByType() when filterByType != null:
        return filterByType(_that.type);
      case FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that.category);
      case DownloadDocument() when downloadDocument != null:
        return downloadDocument(_that.document);
      case DeleteDownloadedDocument() when deleteDownloadedDocument != null:
        return deleteDownloadedDocument(_that.documentId);
      case LoadCategories() when loadCategories != null:
        return loadCategories();
      case ClearSearch() when clearSearch != null:
        return clearSearch();
      case RetryLastAction() when retryLastAction != null:
        return retryLastAction();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, DocumentType? type,
            String? category, String? searchQuery, bool isRefresh)
        loadDocuments,
    required TResult Function(String query, DocumentType? type,
            String? category, int page, int limit)
        searchDocuments,
    required TResult Function() loadMoreDocuments,
    required TResult Function(DocumentType? type) filterByType,
    required TResult Function(String? category) filterByCategory,
    required TResult Function(DocumentEntity document) downloadDocument,
    required TResult Function(int documentId) deleteDownloadedDocument,
    required TResult Function() loadCategories,
    required TResult Function() clearSearch,
    required TResult Function() retryLastAction,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments():
        return loadDocuments(_that.page, _that.limit, _that.type,
            _that.category, _that.searchQuery, _that.isRefresh);
      case SearchDocuments():
        return searchDocuments(
            _that.query, _that.type, _that.category, _that.page, _that.limit);
      case LoadMoreDocuments():
        return loadMoreDocuments();
      case FilterByType():
        return filterByType(_that.type);
      case FilterByCategory():
        return filterByCategory(_that.category);
      case DownloadDocument():
        return downloadDocument(_that.document);
      case DeleteDownloadedDocument():
        return deleteDownloadedDocument(_that.documentId);
      case LoadCategories():
        return loadCategories();
      case ClearSearch():
        return clearSearch();
      case RetryLastAction():
        return retryLastAction();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, DocumentType? type, String? category,
            String? searchQuery, bool isRefresh)?
        loadDocuments,
    TResult? Function(String query, DocumentType? type, String? category,
            int page, int limit)?
        searchDocuments,
    TResult? Function()? loadMoreDocuments,
    TResult? Function(DocumentType? type)? filterByType,
    TResult? Function(String? category)? filterByCategory,
    TResult? Function(DocumentEntity document)? downloadDocument,
    TResult? Function(int documentId)? deleteDownloadedDocument,
    TResult? Function()? loadCategories,
    TResult? Function()? clearSearch,
    TResult? Function()? retryLastAction,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDocuments() when loadDocuments != null:
        return loadDocuments(_that.page, _that.limit, _that.type,
            _that.category, _that.searchQuery, _that.isRefresh);
      case SearchDocuments() when searchDocuments != null:
        return searchDocuments(
            _that.query, _that.type, _that.category, _that.page, _that.limit);
      case LoadMoreDocuments() when loadMoreDocuments != null:
        return loadMoreDocuments();
      case FilterByType() when filterByType != null:
        return filterByType(_that.type);
      case FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that.category);
      case DownloadDocument() when downloadDocument != null:
        return downloadDocument(_that.document);
      case DeleteDownloadedDocument() when deleteDownloadedDocument != null:
        return deleteDownloadedDocument(_that.documentId);
      case LoadCategories() when loadCategories != null:
        return loadCategories();
      case ClearSearch() when clearSearch != null:
        return clearSearch();
      case RetryLastAction() when retryLastAction != null:
        return retryLastAction();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadDocuments implements DocumentsEvent {
  const LoadDocuments(
      {this.page = 1,
      this.limit = 20,
      this.type,
      this.category,
      this.searchQuery,
      this.isRefresh = false});

  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;
  final DocumentType? type;
  final String? category;
  final String? searchQuery;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadDocumentsCopyWith<LoadDocuments> get copyWith =>
      _$LoadDocumentsCopyWithImpl<LoadDocuments>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadDocuments &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, limit, type, category, searchQuery, isRefresh);

  @override
  String toString() {
    return 'DocumentsEvent.loadDocuments(page: $page, limit: $limit, type: $type, category: $category, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class $LoadDocumentsCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $LoadDocumentsCopyWith(
          LoadDocuments value, $Res Function(LoadDocuments) _then) =
      _$LoadDocumentsCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int limit,
      DocumentType? type,
      String? category,
      String? searchQuery,
      bool isRefresh});
}

/// @nodoc
class _$LoadDocumentsCopyWithImpl<$Res>
    implements $LoadDocumentsCopyWith<$Res> {
  _$LoadDocumentsCopyWithImpl(this._self, this._then);

  final LoadDocuments _self;
  final $Res Function(LoadDocuments) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? type = freezed,
    Object? category = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(LoadDocuments(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefresh: null == isRefresh
          ? _self.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SearchDocuments implements DocumentsEvent {
  const SearchDocuments(
      {required this.query,
      this.type,
      this.category,
      this.page = 1,
      this.limit = 20});

  final String query;
  final DocumentType? type;
  final String? category;
  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchDocumentsCopyWith<SearchDocuments> get copyWith =>
      _$SearchDocumentsCopyWithImpl<SearchDocuments>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchDocuments &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, type, category, page, limit);

  @override
  String toString() {
    return 'DocumentsEvent.searchDocuments(query: $query, type: $type, category: $category, page: $page, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $SearchDocumentsCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $SearchDocumentsCopyWith(
          SearchDocuments value, $Res Function(SearchDocuments) _then) =
      _$SearchDocumentsCopyWithImpl;
  @useResult
  $Res call(
      {String query,
      DocumentType? type,
      String? category,
      int page,
      int limit});
}

/// @nodoc
class _$SearchDocumentsCopyWithImpl<$Res>
    implements $SearchDocumentsCopyWith<$Res> {
  _$SearchDocumentsCopyWithImpl(this._self, this._then);

  final SearchDocuments _self;
  final $Res Function(SearchDocuments) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? type = freezed,
    Object? category = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(SearchDocuments(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadMoreDocuments implements DocumentsEvent {
  const LoadMoreDocuments();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadMoreDocuments);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DocumentsEvent.loadMoreDocuments()';
  }
}

/// @nodoc

class FilterByType implements DocumentsEvent {
  const FilterByType(this.type);

  final DocumentType? type;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterByTypeCopyWith<FilterByType> get copyWith =>
      _$FilterByTypeCopyWithImpl<FilterByType>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterByType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'DocumentsEvent.filterByType(type: $type)';
  }
}

/// @nodoc
abstract mixin class $FilterByTypeCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $FilterByTypeCopyWith(
          FilterByType value, $Res Function(FilterByType) _then) =
      _$FilterByTypeCopyWithImpl;
  @useResult
  $Res call({DocumentType? type});
}

/// @nodoc
class _$FilterByTypeCopyWithImpl<$Res> implements $FilterByTypeCopyWith<$Res> {
  _$FilterByTypeCopyWithImpl(this._self, this._then);

  final FilterByType _self;
  final $Res Function(FilterByType) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
  }) {
    return _then(FilterByType(
      freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
    ));
  }
}

/// @nodoc

class FilterByCategory implements DocumentsEvent {
  const FilterByCategory(this.category);

  final String? category;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterByCategoryCopyWith<FilterByCategory> get copyWith =>
      _$FilterByCategoryCopyWithImpl<FilterByCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterByCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'DocumentsEvent.filterByCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class $FilterByCategoryCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $FilterByCategoryCopyWith(
          FilterByCategory value, $Res Function(FilterByCategory) _then) =
      _$FilterByCategoryCopyWithImpl;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class _$FilterByCategoryCopyWithImpl<$Res>
    implements $FilterByCategoryCopyWith<$Res> {
  _$FilterByCategoryCopyWithImpl(this._self, this._then);

  final FilterByCategory _self;
  final $Res Function(FilterByCategory) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
  }) {
    return _then(FilterByCategory(
      freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class DownloadDocument implements DocumentsEvent {
  const DownloadDocument(this.document);

  final DocumentEntity document;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadDocumentCopyWith<DownloadDocument> get copyWith =>
      _$DownloadDocumentCopyWithImpl<DownloadDocument>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadDocument &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(runtimeType, document);

  @override
  String toString() {
    return 'DocumentsEvent.downloadDocument(document: $document)';
  }
}

/// @nodoc
abstract mixin class $DownloadDocumentCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $DownloadDocumentCopyWith(
          DownloadDocument value, $Res Function(DownloadDocument) _then) =
      _$DownloadDocumentCopyWithImpl;
  @useResult
  $Res call({DocumentEntity document});

  $DocumentEntityCopyWith<$Res> get document;
}

/// @nodoc
class _$DownloadDocumentCopyWithImpl<$Res>
    implements $DownloadDocumentCopyWith<$Res> {
  _$DownloadDocumentCopyWithImpl(this._self, this._then);

  final DownloadDocument _self;
  final $Res Function(DownloadDocument) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? document = null,
  }) {
    return _then(DownloadDocument(
      null == document
          ? _self.document
          : document // ignore: cast_nullable_to_non_nullable
              as DocumentEntity,
    ));
  }

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentEntityCopyWith<$Res> get document {
    return $DocumentEntityCopyWith<$Res>(_self.document, (value) {
      return _then(_self.copyWith(document: value));
    });
  }
}

/// @nodoc

class DeleteDownloadedDocument implements DocumentsEvent {
  const DeleteDownloadedDocument(this.documentId);

  final int documentId;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteDownloadedDocumentCopyWith<DeleteDownloadedDocument> get copyWith =>
      _$DeleteDownloadedDocumentCopyWithImpl<DeleteDownloadedDocument>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteDownloadedDocument &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentId);

  @override
  String toString() {
    return 'DocumentsEvent.deleteDownloadedDocument(documentId: $documentId)';
  }
}

/// @nodoc
abstract mixin class $DeleteDownloadedDocumentCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory $DeleteDownloadedDocumentCopyWith(DeleteDownloadedDocument value,
          $Res Function(DeleteDownloadedDocument) _then) =
      _$DeleteDownloadedDocumentCopyWithImpl;
  @useResult
  $Res call({int documentId});
}

/// @nodoc
class _$DeleteDownloadedDocumentCopyWithImpl<$Res>
    implements $DeleteDownloadedDocumentCopyWith<$Res> {
  _$DeleteDownloadedDocumentCopyWithImpl(this._self, this._then);

  final DeleteDownloadedDocument _self;
  final $Res Function(DeleteDownloadedDocument) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
  }) {
    return _then(DeleteDownloadedDocument(
      null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadCategories implements DocumentsEvent {
  const LoadCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DocumentsEvent.loadCategories()';
  }
}

/// @nodoc

class ClearSearch implements DocumentsEvent {
  const ClearSearch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DocumentsEvent.clearSearch()';
  }
}

/// @nodoc

class RetryLastAction implements DocumentsEvent {
  const RetryLastAction();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RetryLastAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DocumentsEvent.retryLastAction()';
  }
}

// dart format on
