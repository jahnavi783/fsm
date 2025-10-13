// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentsEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentsEventCopyWith<$Res> {
  factory $DocumentsEventCopyWith(
          DocumentsEvent value, $Res Function(DocumentsEvent) then) =
      _$DocumentsEventCopyWithImpl<$Res, DocumentsEvent>;
}

/// @nodoc
class _$DocumentsEventCopyWithImpl<$Res, $Val extends DocumentsEvent>
    implements $DocumentsEventCopyWith<$Res> {
  _$DocumentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadDocumentsImplCopyWith<$Res> {
  factory _$$LoadDocumentsImplCopyWith(
          _$LoadDocumentsImpl value, $Res Function(_$LoadDocumentsImpl) then) =
      __$$LoadDocumentsImplCopyWithImpl<$Res>;
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
class __$$LoadDocumentsImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$LoadDocumentsImpl>
    implements _$$LoadDocumentsImplCopyWith<$Res> {
  __$$LoadDocumentsImplCopyWithImpl(
      _$LoadDocumentsImpl _value, $Res Function(_$LoadDocumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? type = freezed,
    Object? category = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadDocumentsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadDocumentsImpl implements LoadDocuments {
  const _$LoadDocumentsImpl(
      {this.page = 1,
      this.limit = 20,
      this.type,
      this.category,
      this.searchQuery,
      this.isRefresh = false});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final DocumentType? type;
  @override
  final String? category;
  @override
  final String? searchQuery;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'DocumentsEvent.loadDocuments(page: $page, limit: $limit, type: $type, category: $category, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDocumentsImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDocumentsImplCopyWith<_$LoadDocumentsImpl> get copyWith =>
      __$$LoadDocumentsImplCopyWithImpl<_$LoadDocumentsImpl>(this, _$identity);

  @override
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
    return loadDocuments(page, limit, type, category, searchQuery, isRefresh);
  }

  @override
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
    return loadDocuments?.call(
        page, limit, type, category, searchQuery, isRefresh);
  }

  @override
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
    if (loadDocuments != null) {
      return loadDocuments(page, limit, type, category, searchQuery, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadDocuments(this);
  }

  @override
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
    return loadDocuments?.call(this);
  }

  @override
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
    if (loadDocuments != null) {
      return loadDocuments(this);
    }
    return orElse();
  }
}

abstract class LoadDocuments implements DocumentsEvent {
  const factory LoadDocuments(
      {final int page,
      final int limit,
      final DocumentType? type,
      final String? category,
      final String? searchQuery,
      final bool isRefresh}) = _$LoadDocumentsImpl;

  int get page;
  int get limit;
  DocumentType? get type;
  String? get category;
  String? get searchQuery;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadDocumentsImplCopyWith<_$LoadDocumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchDocumentsImplCopyWith<$Res> {
  factory _$$SearchDocumentsImplCopyWith(_$SearchDocumentsImpl value,
          $Res Function(_$SearchDocumentsImpl) then) =
      __$$SearchDocumentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query,
      DocumentType? type,
      String? category,
      int page,
      int limit});
}

/// @nodoc
class __$$SearchDocumentsImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$SearchDocumentsImpl>
    implements _$$SearchDocumentsImplCopyWith<$Res> {
  __$$SearchDocumentsImplCopyWithImpl(
      _$SearchDocumentsImpl _value, $Res Function(_$SearchDocumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? type = freezed,
    Object? category = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$SearchDocumentsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchDocumentsImpl implements SearchDocuments {
  const _$SearchDocumentsImpl(
      {required this.query,
      this.type,
      this.category,
      this.page = 1,
      this.limit = 20});

  @override
  final String query;
  @override
  final DocumentType? type;
  @override
  final String? category;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'DocumentsEvent.searchDocuments(query: $query, type: $type, category: $category, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDocumentsImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDocumentsImplCopyWith<_$SearchDocumentsImpl> get copyWith =>
      __$$SearchDocumentsImplCopyWithImpl<_$SearchDocumentsImpl>(
          this, _$identity);

  @override
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
    return searchDocuments(query, type, category, page, limit);
  }

  @override
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
    return searchDocuments?.call(query, type, category, page, limit);
  }

  @override
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
    if (searchDocuments != null) {
      return searchDocuments(query, type, category, page, limit);
    }
    return orElse();
  }

  @override
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
    return searchDocuments(this);
  }

  @override
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
    return searchDocuments?.call(this);
  }

  @override
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
    if (searchDocuments != null) {
      return searchDocuments(this);
    }
    return orElse();
  }
}

abstract class SearchDocuments implements DocumentsEvent {
  const factory SearchDocuments(
      {required final String query,
      final DocumentType? type,
      final String? category,
      final int page,
      final int limit}) = _$SearchDocumentsImpl;

  String get query;
  DocumentType? get type;
  String? get category;
  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$SearchDocumentsImplCopyWith<_$SearchDocumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreDocumentsImplCopyWith<$Res> {
  factory _$$LoadMoreDocumentsImplCopyWith(_$LoadMoreDocumentsImpl value,
          $Res Function(_$LoadMoreDocumentsImpl) then) =
      __$$LoadMoreDocumentsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreDocumentsImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$LoadMoreDocumentsImpl>
    implements _$$LoadMoreDocumentsImplCopyWith<$Res> {
  __$$LoadMoreDocumentsImplCopyWithImpl(_$LoadMoreDocumentsImpl _value,
      $Res Function(_$LoadMoreDocumentsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreDocumentsImpl implements LoadMoreDocuments {
  const _$LoadMoreDocumentsImpl();

  @override
  String toString() {
    return 'DocumentsEvent.loadMoreDocuments()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreDocumentsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadMoreDocuments();
  }

  @override
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
    return loadMoreDocuments?.call();
  }

  @override
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
    if (loadMoreDocuments != null) {
      return loadMoreDocuments();
    }
    return orElse();
  }

  @override
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
    return loadMoreDocuments(this);
  }

  @override
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
    return loadMoreDocuments?.call(this);
  }

  @override
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
    if (loadMoreDocuments != null) {
      return loadMoreDocuments(this);
    }
    return orElse();
  }
}

abstract class LoadMoreDocuments implements DocumentsEvent {
  const factory LoadMoreDocuments() = _$LoadMoreDocumentsImpl;
}

/// @nodoc
abstract class _$$FilterByTypeImplCopyWith<$Res> {
  factory _$$FilterByTypeImplCopyWith(
          _$FilterByTypeImpl value, $Res Function(_$FilterByTypeImpl) then) =
      __$$FilterByTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DocumentType? type});
}

/// @nodoc
class __$$FilterByTypeImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$FilterByTypeImpl>
    implements _$$FilterByTypeImplCopyWith<$Res> {
  __$$FilterByTypeImplCopyWithImpl(
      _$FilterByTypeImpl _value, $Res Function(_$FilterByTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$FilterByTypeImpl(
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
    ));
  }
}

/// @nodoc

class _$FilterByTypeImpl implements FilterByType {
  const _$FilterByTypeImpl(this.type);

  @override
  final DocumentType? type;

  @override
  String toString() {
    return 'DocumentsEvent.filterByType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByTypeImplCopyWith<_$FilterByTypeImpl> get copyWith =>
      __$$FilterByTypeImplCopyWithImpl<_$FilterByTypeImpl>(this, _$identity);

  @override
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
    return filterByType(type);
  }

  @override
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
    return filterByType?.call(type);
  }

  @override
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
    if (filterByType != null) {
      return filterByType(type);
    }
    return orElse();
  }

  @override
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
    return filterByType(this);
  }

  @override
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
    return filterByType?.call(this);
  }

  @override
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
    if (filterByType != null) {
      return filterByType(this);
    }
    return orElse();
  }
}

abstract class FilterByType implements DocumentsEvent {
  const factory FilterByType(final DocumentType? type) = _$FilterByTypeImpl;

  DocumentType? get type;
  @JsonKey(ignore: true)
  _$$FilterByTypeImplCopyWith<_$FilterByTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByCategoryImplCopyWith<$Res> {
  factory _$$FilterByCategoryImplCopyWith(_$FilterByCategoryImpl value,
          $Res Function(_$FilterByCategoryImpl) then) =
      __$$FilterByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class __$$FilterByCategoryImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$FilterByCategoryImpl>
    implements _$$FilterByCategoryImplCopyWith<$Res> {
  __$$FilterByCategoryImplCopyWithImpl(_$FilterByCategoryImpl _value,
      $Res Function(_$FilterByCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_$FilterByCategoryImpl(
      freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterByCategoryImpl implements FilterByCategory {
  const _$FilterByCategoryImpl(this.category);

  @override
  final String? category;

  @override
  String toString() {
    return 'DocumentsEvent.filterByCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      __$$FilterByCategoryImplCopyWithImpl<_$FilterByCategoryImpl>(
          this, _$identity);

  @override
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
    return filterByCategory(category);
  }

  @override
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
    return filterByCategory?.call(category);
  }

  @override
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
    if (filterByCategory != null) {
      return filterByCategory(category);
    }
    return orElse();
  }

  @override
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
    return filterByCategory(this);
  }

  @override
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
    return filterByCategory?.call(this);
  }

  @override
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
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class FilterByCategory implements DocumentsEvent {
  const factory FilterByCategory(final String? category) =
      _$FilterByCategoryImpl;

  String? get category;
  @JsonKey(ignore: true)
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadDocumentImplCopyWith<$Res> {
  factory _$$DownloadDocumentImplCopyWith(_$DownloadDocumentImpl value,
          $Res Function(_$DownloadDocumentImpl) then) =
      __$$DownloadDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DocumentEntity document});

  $DocumentEntityCopyWith<$Res> get document;
}

/// @nodoc
class __$$DownloadDocumentImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$DownloadDocumentImpl>
    implements _$$DownloadDocumentImplCopyWith<$Res> {
  __$$DownloadDocumentImplCopyWithImpl(_$DownloadDocumentImpl _value,
      $Res Function(_$DownloadDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_$DownloadDocumentImpl(
      null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as DocumentEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentEntityCopyWith<$Res> get document {
    return $DocumentEntityCopyWith<$Res>(_value.document, (value) {
      return _then(_value.copyWith(document: value));
    });
  }
}

/// @nodoc

class _$DownloadDocumentImpl implements DownloadDocument {
  const _$DownloadDocumentImpl(this.document);

  @override
  final DocumentEntity document;

  @override
  String toString() {
    return 'DocumentsEvent.downloadDocument(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadDocumentImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(runtimeType, document);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadDocumentImplCopyWith<_$DownloadDocumentImpl> get copyWith =>
      __$$DownloadDocumentImplCopyWithImpl<_$DownloadDocumentImpl>(
          this, _$identity);

  @override
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
    return downloadDocument(document);
  }

  @override
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
    return downloadDocument?.call(document);
  }

  @override
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
    if (downloadDocument != null) {
      return downloadDocument(document);
    }
    return orElse();
  }

  @override
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
    return downloadDocument(this);
  }

  @override
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
    return downloadDocument?.call(this);
  }

  @override
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
    if (downloadDocument != null) {
      return downloadDocument(this);
    }
    return orElse();
  }
}

abstract class DownloadDocument implements DocumentsEvent {
  const factory DownloadDocument(final DocumentEntity document) =
      _$DownloadDocumentImpl;

  DocumentEntity get document;
  @JsonKey(ignore: true)
  _$$DownloadDocumentImplCopyWith<_$DownloadDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDownloadedDocumentImplCopyWith<$Res> {
  factory _$$DeleteDownloadedDocumentImplCopyWith(
          _$DeleteDownloadedDocumentImpl value,
          $Res Function(_$DeleteDownloadedDocumentImpl) then) =
      __$$DeleteDownloadedDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int documentId});
}

/// @nodoc
class __$$DeleteDownloadedDocumentImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$DeleteDownloadedDocumentImpl>
    implements _$$DeleteDownloadedDocumentImplCopyWith<$Res> {
  __$$DeleteDownloadedDocumentImplCopyWithImpl(
      _$DeleteDownloadedDocumentImpl _value,
      $Res Function(_$DeleteDownloadedDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
  }) {
    return _then(_$DeleteDownloadedDocumentImpl(
      null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteDownloadedDocumentImpl implements DeleteDownloadedDocument {
  const _$DeleteDownloadedDocumentImpl(this.documentId);

  @override
  final int documentId;

  @override
  String toString() {
    return 'DocumentsEvent.deleteDownloadedDocument(documentId: $documentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDownloadedDocumentImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDownloadedDocumentImplCopyWith<_$DeleteDownloadedDocumentImpl>
      get copyWith => __$$DeleteDownloadedDocumentImplCopyWithImpl<
          _$DeleteDownloadedDocumentImpl>(this, _$identity);

  @override
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
    return deleteDownloadedDocument(documentId);
  }

  @override
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
    return deleteDownloadedDocument?.call(documentId);
  }

  @override
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
    if (deleteDownloadedDocument != null) {
      return deleteDownloadedDocument(documentId);
    }
    return orElse();
  }

  @override
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
    return deleteDownloadedDocument(this);
  }

  @override
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
    return deleteDownloadedDocument?.call(this);
  }

  @override
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
    if (deleteDownloadedDocument != null) {
      return deleteDownloadedDocument(this);
    }
    return orElse();
  }
}

abstract class DeleteDownloadedDocument implements DocumentsEvent {
  const factory DeleteDownloadedDocument(final int documentId) =
      _$DeleteDownloadedDocumentImpl;

  int get documentId;
  @JsonKey(ignore: true)
  _$$DeleteDownloadedDocumentImplCopyWith<_$DeleteDownloadedDocumentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCategoriesImplCopyWith<$Res> {
  factory _$$LoadCategoriesImplCopyWith(_$LoadCategoriesImpl value,
          $Res Function(_$LoadCategoriesImpl) then) =
      __$$LoadCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCategoriesImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$LoadCategoriesImpl>
    implements _$$LoadCategoriesImplCopyWith<$Res> {
  __$$LoadCategoriesImplCopyWithImpl(
      _$LoadCategoriesImpl _value, $Res Function(_$LoadCategoriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadCategoriesImpl implements LoadCategories {
  const _$LoadCategoriesImpl();

  @override
  String toString() {
    return 'DocumentsEvent.loadCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadCategories();
  }

  @override
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
    return loadCategories?.call();
  }

  @override
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
    if (loadCategories != null) {
      return loadCategories();
    }
    return orElse();
  }

  @override
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
    return loadCategories(this);
  }

  @override
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
    return loadCategories?.call(this);
  }

  @override
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
    if (loadCategories != null) {
      return loadCategories(this);
    }
    return orElse();
  }
}

abstract class LoadCategories implements DocumentsEvent {
  const factory LoadCategories() = _$LoadCategoriesImpl;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'DocumentsEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return clearSearch();
  }

  @override
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
    return clearSearch?.call();
  }

  @override
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
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
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
    return clearSearch(this);
  }

  @override
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
    return clearSearch?.call(this);
  }

  @override
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
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class ClearSearch implements DocumentsEvent {
  const factory ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$RetryLastActionImplCopyWith<$Res> {
  factory _$$RetryLastActionImplCopyWith(_$RetryLastActionImpl value,
          $Res Function(_$RetryLastActionImpl) then) =
      __$$RetryLastActionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetryLastActionImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$RetryLastActionImpl>
    implements _$$RetryLastActionImplCopyWith<$Res> {
  __$$RetryLastActionImplCopyWithImpl(
      _$RetryLastActionImpl _value, $Res Function(_$RetryLastActionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RetryLastActionImpl implements RetryLastAction {
  const _$RetryLastActionImpl();

  @override
  String toString() {
    return 'DocumentsEvent.retryLastAction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetryLastActionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return retryLastAction();
  }

  @override
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
    return retryLastAction?.call();
  }

  @override
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
    if (retryLastAction != null) {
      return retryLastAction();
    }
    return orElse();
  }

  @override
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
    return retryLastAction(this);
  }

  @override
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
    return retryLastAction?.call(this);
  }

  @override
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
    if (retryLastAction != null) {
      return retryLastAction(this);
    }
    return orElse();
  }
}

abstract class RetryLastAction implements DocumentsEvent {
  const factory RetryLastAction() = _$RetryLastActionImpl;
}
