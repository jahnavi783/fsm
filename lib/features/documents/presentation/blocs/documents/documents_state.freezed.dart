// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentsState {
  List<DocumentEntity> get documents;
  List<String> get categories;
  bool get isLoading;
  bool get isLoadingMore;
  bool get isSearching;
  bool get isDownloading;
  bool get hasReachedMax;
  int get currentPage;
  DocumentType? get selectedType;
  String? get selectedCategory;
  String? get searchQuery;
  String? get errorMessage;
  String? get downloadingDocumentId;
  DocumentsEvent? get lastFailedEvent;
  bool get isOffline;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentsStateCopyWith<DocumentsState> get copyWith =>
      _$DocumentsStateCopyWithImpl<DocumentsState>(
          this as DocumentsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentsState &&
            const DeepCollectionEquality().equals(other.documents, documents) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
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
      const DeepCollectionEquality().hash(documents),
      const DeepCollectionEquality().hash(categories),
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

  @override
  String toString() {
    return 'DocumentsState(documents: $documents, categories: $categories, isLoading: $isLoading, isLoadingMore: $isLoadingMore, isSearching: $isSearching, isDownloading: $isDownloading, hasReachedMax: $hasReachedMax, currentPage: $currentPage, selectedType: $selectedType, selectedCategory: $selectedCategory, searchQuery: $searchQuery, errorMessage: $errorMessage, downloadingDocumentId: $downloadingDocumentId, lastFailedEvent: $lastFailedEvent, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class $DocumentsStateCopyWith<$Res> {
  factory $DocumentsStateCopyWith(
          DocumentsState value, $Res Function(DocumentsState) _then) =
      _$DocumentsStateCopyWithImpl;
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
class _$DocumentsStateCopyWithImpl<$Res>
    implements $DocumentsStateCopyWith<$Res> {
  _$DocumentsStateCopyWithImpl(this._self, this._then);

  final DocumentsState _self;
  final $Res Function(DocumentsState) _then;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      documents: null == documents
          ? _self.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentEntity>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _self.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedType: freezed == selectedType
          ? _self.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadingDocumentId: freezed == downloadingDocumentId
          ? _self.downloadingDocumentId
          : downloadingDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedEvent: freezed == lastFailedEvent
          ? _self.lastFailedEvent
          : lastFailedEvent // ignore: cast_nullable_to_non_nullable
              as DocumentsEvent?,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentsEventCopyWith<$Res>? get lastFailedEvent {
    if (_self.lastFailedEvent == null) {
      return null;
    }

    return $DocumentsEventCopyWith<$Res>(_self.lastFailedEvent!, (value) {
      return _then(_self.copyWith(lastFailedEvent: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DocumentsState].
extension DocumentsStatePatterns on DocumentsState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DocumentsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentsState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_DocumentsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentsState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DocumentsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentsState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<DocumentEntity> documents,
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
            bool isOffline)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentsState() when $default != null:
        return $default(
            _that.documents,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.isSearching,
            _that.isDownloading,
            _that.hasReachedMax,
            _that.currentPage,
            _that.selectedType,
            _that.selectedCategory,
            _that.searchQuery,
            _that.errorMessage,
            _that.downloadingDocumentId,
            _that.lastFailedEvent,
            _that.isOffline);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            List<DocumentEntity> documents,
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
            bool isOffline)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentsState():
        return $default(
            _that.documents,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.isSearching,
            _that.isDownloading,
            _that.hasReachedMax,
            _that.currentPage,
            _that.selectedType,
            _that.selectedCategory,
            _that.searchQuery,
            _that.errorMessage,
            _that.downloadingDocumentId,
            _that.lastFailedEvent,
            _that.isOffline);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<DocumentEntity> documents,
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
            bool isOffline)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentsState() when $default != null:
        return $default(
            _that.documents,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.isSearching,
            _that.isDownloading,
            _that.hasReachedMax,
            _that.currentPage,
            _that.selectedType,
            _that.selectedCategory,
            _that.searchQuery,
            _that.errorMessage,
            _that.downloadingDocumentId,
            _that.lastFailedEvent,
            _that.isOffline);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DocumentsState extends DocumentsState {
  const _DocumentsState(
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

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentsStateCopyWith<_DocumentsState> get copyWith =>
      __$DocumentsStateCopyWithImpl<_DocumentsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentsState &&
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

  @override
  String toString() {
    return 'DocumentsState(documents: $documents, categories: $categories, isLoading: $isLoading, isLoadingMore: $isLoadingMore, isSearching: $isSearching, isDownloading: $isDownloading, hasReachedMax: $hasReachedMax, currentPage: $currentPage, selectedType: $selectedType, selectedCategory: $selectedCategory, searchQuery: $searchQuery, errorMessage: $errorMessage, downloadingDocumentId: $downloadingDocumentId, lastFailedEvent: $lastFailedEvent, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class _$DocumentsStateCopyWith<$Res>
    implements $DocumentsStateCopyWith<$Res> {
  factory _$DocumentsStateCopyWith(
          _DocumentsState value, $Res Function(_DocumentsState) _then) =
      __$DocumentsStateCopyWithImpl;
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
class __$DocumentsStateCopyWithImpl<$Res>
    implements _$DocumentsStateCopyWith<$Res> {
  __$DocumentsStateCopyWithImpl(this._self, this._then);

  final _DocumentsState _self;
  final $Res Function(_DocumentsState) _then;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_DocumentsState(
      documents: null == documents
          ? _self._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentEntity>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _self.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedType: freezed == selectedType
          ? _self.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadingDocumentId: freezed == downloadingDocumentId
          ? _self.downloadingDocumentId
          : downloadingDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedEvent: freezed == lastFailedEvent
          ? _self.lastFailedEvent
          : lastFailedEvent // ignore: cast_nullable_to_non_nullable
              as DocumentsEvent?,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentsEventCopyWith<$Res>? get lastFailedEvent {
    if (_self.lastFailedEvent == null) {
      return null;
    }

    return $DocumentsEventCopyWith<$Res>(_self.lastFailedEvent!, (value) {
      return _then(_self.copyWith(lastFailedEvent: value));
    });
  }
}

// dart format on
