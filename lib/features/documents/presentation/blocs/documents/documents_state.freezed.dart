// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentsState {
  List<DocumentEntity> get documents => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  DocumentType? get selectedType => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get downloadingDocumentId => throw _privateConstructorUsedError;
  DocumentsEvent? get lastFailedEvent => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentsStateCopyWith<DocumentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentsStateCopyWith<$Res> {
  factory $DocumentsStateCopyWith(
          DocumentsState value, $Res Function(DocumentsState) then) =
      _$DocumentsStateCopyWithImpl<$Res, DocumentsState>;
  @useResult
  $Res call(
      {List<DocumentEntity> documents,
      List<String> categories,
      bool isLoading,
      bool isLoadingMore,
      bool isSearching,
      bool isDownloading,
      bool hasReachedMax,
      int currentPage,
      DocumentType? selectedType,
      String? selectedCategory,
      String? searchQuery,
      String? errorMessage,
      String? downloadingDocumentId,
      DocumentsEvent? lastFailedEvent,
      bool isOffline});

  $DocumentsEventCopyWith<$Res>? get lastFailedEvent;
}

/// @nodoc
class _$DocumentsStateCopyWithImpl<$Res, $Val extends DocumentsState>
    implements $DocumentsStateCopyWith<$Res> {
  _$DocumentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? categories = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isSearching = null,
    Object? isDownloading = null,
    Object? hasReachedMax = null,
    Object? currentPage = null,
    Object? selectedType = freezed,
    Object? selectedCategory = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? downloadingDocumentId = freezed,
    Object? lastFailedEvent = freezed,
    Object? isOffline = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentEntity>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadingDocumentId: freezed == downloadingDocumentId
          ? _value.downloadingDocumentId
          : downloadingDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedEvent: freezed == lastFailedEvent
          ? _value.lastFailedEvent
          : lastFailedEvent // ignore: cast_nullable_to_non_nullable
              as DocumentsEvent?,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentsEventCopyWith<$Res>? get lastFailedEvent {
    if (_value.lastFailedEvent == null) {
      return null;
    }

    return $DocumentsEventCopyWith<$Res>(_value.lastFailedEvent!, (value) {
      return _then(_value.copyWith(lastFailedEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocumentsStateImplCopyWith<$Res>
    implements $DocumentsStateCopyWith<$Res> {
  factory _$$DocumentsStateImplCopyWith(_$DocumentsStateImpl value,
          $Res Function(_$DocumentsStateImpl) then) =
      __$$DocumentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DocumentEntity> documents,
      List<String> categories,
      bool isLoading,
      bool isLoadingMore,
      bool isSearching,
      bool isDownloading,
      bool hasReachedMax,
      int currentPage,
      DocumentType? selectedType,
      String? selectedCategory,
      String? searchQuery,
      String? errorMessage,
      String? downloadingDocumentId,
      DocumentsEvent? lastFailedEvent,
      bool isOffline});

  @override
  $DocumentsEventCopyWith<$Res>? get lastFailedEvent;
}

/// @nodoc
class __$$DocumentsStateImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsStateImpl>
    implements _$$DocumentsStateImplCopyWith<$Res> {
  __$$DocumentsStateImplCopyWithImpl(
      _$DocumentsStateImpl _value, $Res Function(_$DocumentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? categories = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isSearching = null,
    Object? isDownloading = null,
    Object? hasReachedMax = null,
    Object? currentPage = null,
    Object? selectedType = freezed,
    Object? selectedCategory = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? downloadingDocumentId = freezed,
    Object? lastFailedEvent = freezed,
    Object? isOffline = null,
  }) {
    return _then(_$DocumentsStateImpl(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentEntity>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadingDocumentId: freezed == downloadingDocumentId
          ? _value.downloadingDocumentId
          : downloadingDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedEvent: freezed == lastFailedEvent
          ? _value.lastFailedEvent
          : lastFailedEvent // ignore: cast_nullable_to_non_nullable
              as DocumentsEvent?,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DocumentsStateImpl extends _DocumentsState {
  const _$DocumentsStateImpl(
      {final List<DocumentEntity> documents = const [],
      final List<String> categories = const [],
      this.isLoading = false,
      this.isLoadingMore = false,
      this.isSearching = false,
      this.isDownloading = false,
      this.hasReachedMax = false,
      this.currentPage = 1,
      this.selectedType,
      this.selectedCategory,
      this.searchQuery,
      this.errorMessage,
      this.downloadingDocumentId,
      this.lastFailedEvent,
      this.isOffline = false})
      : _documents = documents,
        _categories = categories,
        super._();

  final List<DocumentEntity> _documents;
  @override
  @JsonKey()
  List<DocumentEntity> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isDownloading;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final DocumentType? selectedType;
  @override
  final String? selectedCategory;
  @override
  final String? searchQuery;
  @override
  final String? errorMessage;
  @override
  final String? downloadingDocumentId;
  @override
  final DocumentsEvent? lastFailedEvent;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'DocumentsState(documents: $documents, categories: $categories, isLoading: $isLoading, isLoadingMore: $isLoadingMore, isSearching: $isSearching, isDownloading: $isDownloading, hasReachedMax: $hasReachedMax, currentPage: $currentPage, selectedType: $selectedType, selectedCategory: $selectedCategory, searchQuery: $searchQuery, errorMessage: $errorMessage, downloadingDocumentId: $downloadingDocumentId, lastFailedEvent: $lastFailedEvent, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.downloadingDocumentId, downloadingDocumentId) ||
                other.downloadingDocumentId == downloadingDocumentId) &&
            (identical(other.lastFailedEvent, lastFailedEvent) ||
                other.lastFailedEvent == lastFailedEvent) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_categories),
      isLoading,
      isLoadingMore,
      isSearching,
      isDownloading,
      hasReachedMax,
      currentPage,
      selectedType,
      selectedCategory,
      searchQuery,
      errorMessage,
      downloadingDocumentId,
      lastFailedEvent,
      isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsStateImplCopyWith<_$DocumentsStateImpl> get copyWith =>
      __$$DocumentsStateImplCopyWithImpl<_$DocumentsStateImpl>(
          this, _$identity);
}

abstract class _DocumentsState extends DocumentsState {
  const factory _DocumentsState(
      {final List<DocumentEntity> documents,
      final List<String> categories,
      final bool isLoading,
      final bool isLoadingMore,
      final bool isSearching,
      final bool isDownloading,
      final bool hasReachedMax,
      final int currentPage,
      final DocumentType? selectedType,
      final String? selectedCategory,
      final String? searchQuery,
      final String? errorMessage,
      final String? downloadingDocumentId,
      final DocumentsEvent? lastFailedEvent,
      final bool isOffline}) = _$DocumentsStateImpl;
  const _DocumentsState._() : super._();

  @override
  List<DocumentEntity> get documents;
  @override
  List<String> get categories;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isSearching;
  @override
  bool get isDownloading;
  @override
  bool get hasReachedMax;
  @override
  int get currentPage;
  @override
  DocumentType? get selectedType;
  @override
  String? get selectedCategory;
  @override
  String? get searchQuery;
  @override
  String? get errorMessage;
  @override
  String? get downloadingDocumentId;
  @override
  DocumentsEvent? get lastFailedEvent;
  @override
  bool get isOffline;
  @override
  @JsonKey(ignore: true)
  _$$DocumentsStateImplCopyWith<_$DocumentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
