// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PartsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent()';
  }
}

/// @nodoc
class $PartsEventCopyWith<$Res> {
  $PartsEventCopyWith(PartsEvent _, $Res Function(PartsEvent) __);
}

/// Adds pattern-matching-related methods to [PartsEvent].
extension PartsEventPatterns on PartsEvent {
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
    TResult Function(_LoadParts value)? loadParts,
    TResult Function(_RefreshParts value)? refreshParts,
    TResult Function(_LoadMoreParts value)? loadMoreParts,
    TResult Function(_SearchParts value)? searchParts,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_LoadLowStockParts value)? loadLowStockParts,
    TResult Function(_LoadPartCategories value)? loadPartCategories,
    TResult Function(_LoadInventory value)? loadInventory,
    TResult Function(_UpdateInventory value)? updateInventory,
    TResult Function(_LoadInventoryHistory value)? loadInventoryHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts() when loadParts != null:
        return loadParts(_that);
      case _RefreshParts() when refreshParts != null:
        return refreshParts(_that);
      case _LoadMoreParts() when loadMoreParts != null:
        return loadMoreParts(_that);
      case _SearchParts() when searchParts != null:
        return searchParts(_that);
      case _ClearSearch() when clearSearch != null:
        return clearSearch(_that);
      case _FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _LoadLowStockParts() when loadLowStockParts != null:
        return loadLowStockParts(_that);
      case _LoadPartCategories() when loadPartCategories != null:
        return loadPartCategories(_that);
      case _LoadInventory() when loadInventory != null:
        return loadInventory(_that);
      case _UpdateInventory() when updateInventory != null:
        return updateInventory(_that);
      case _LoadInventoryHistory() when loadInventoryHistory != null:
        return loadInventoryHistory(_that);
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
    required TResult Function(_LoadParts value) loadParts,
    required TResult Function(_RefreshParts value) refreshParts,
    required TResult Function(_LoadMoreParts value) loadMoreParts,
    required TResult Function(_SearchParts value) searchParts,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_LoadLowStockParts value) loadLowStockParts,
    required TResult Function(_LoadPartCategories value) loadPartCategories,
    required TResult Function(_LoadInventory value) loadInventory,
    required TResult Function(_UpdateInventory value) updateInventory,
    required TResult Function(_LoadInventoryHistory value) loadInventoryHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts():
        return loadParts(_that);
      case _RefreshParts():
        return refreshParts(_that);
      case _LoadMoreParts():
        return loadMoreParts(_that);
      case _SearchParts():
        return searchParts(_that);
      case _ClearSearch():
        return clearSearch(_that);
      case _FilterByCategory():
        return filterByCategory(_that);
      case _FilterByStatus():
        return filterByStatus(_that);
      case _LoadLowStockParts():
        return loadLowStockParts(_that);
      case _LoadPartCategories():
        return loadPartCategories(_that);
      case _LoadInventory():
        return loadInventory(_that);
      case _UpdateInventory():
        return updateInventory(_that);
      case _LoadInventoryHistory():
        return loadInventoryHistory(_that);
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
    TResult? Function(_LoadParts value)? loadParts,
    TResult? Function(_RefreshParts value)? refreshParts,
    TResult? Function(_LoadMoreParts value)? loadMoreParts,
    TResult? Function(_SearchParts value)? searchParts,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_LoadLowStockParts value)? loadLowStockParts,
    TResult? Function(_LoadPartCategories value)? loadPartCategories,
    TResult? Function(_LoadInventory value)? loadInventory,
    TResult? Function(_UpdateInventory value)? updateInventory,
    TResult? Function(_LoadInventoryHistory value)? loadInventoryHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts() when loadParts != null:
        return loadParts(_that);
      case _RefreshParts() when refreshParts != null:
        return refreshParts(_that);
      case _LoadMoreParts() when loadMoreParts != null:
        return loadMoreParts(_that);
      case _SearchParts() when searchParts != null:
        return searchParts(_that);
      case _ClearSearch() when clearSearch != null:
        return clearSearch(_that);
      case _FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _LoadLowStockParts() when loadLowStockParts != null:
        return loadLowStockParts(_that);
      case _LoadPartCategories() when loadPartCategories != null:
        return loadPartCategories(_that);
      case _LoadInventory() when loadInventory != null:
        return loadInventory(_that);
      case _UpdateInventory() when updateInventory != null:
        return updateInventory(_that);
      case _LoadInventoryHistory() when loadInventoryHistory != null:
        return loadInventoryHistory(_that);
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
    TResult Function(int page, int limit, String? category, PartStatus? status,
            String? searchQuery)?
        loadParts,
    TResult Function()? refreshParts,
    TResult Function()? loadMoreParts,
    TResult Function(String query, String? category, PartStatus? status)?
        searchParts,
    TResult Function()? clearSearch,
    TResult Function(String? category)? filterByCategory,
    TResult Function(PartStatus? status)? filterByStatus,
    TResult Function()? loadLowStockParts,
    TResult Function()? loadPartCategories,
    TResult Function(int page, int limit, bool? lowStockOnly)? loadInventory,
    TResult Function(int partId, int quantityChange, String type, String reason,
            String? workOrderId, String? notes)?
        updateInventory,
    TResult Function(int partId, int page, int limit)? loadInventoryHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts() when loadParts != null:
        return loadParts(_that.page, _that.limit, _that.category, _that.status,
            _that.searchQuery);
      case _RefreshParts() when refreshParts != null:
        return refreshParts();
      case _LoadMoreParts() when loadMoreParts != null:
        return loadMoreParts();
      case _SearchParts() when searchParts != null:
        return searchParts(_that.query, _that.category, _that.status);
      case _ClearSearch() when clearSearch != null:
        return clearSearch();
      case _FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that.category);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _LoadLowStockParts() when loadLowStockParts != null:
        return loadLowStockParts();
      case _LoadPartCategories() when loadPartCategories != null:
        return loadPartCategories();
      case _LoadInventory() when loadInventory != null:
        return loadInventory(_that.page, _that.limit, _that.lowStockOnly);
      case _UpdateInventory() when updateInventory != null:
        return updateInventory(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.workOrderId, _that.notes);
      case _LoadInventoryHistory() when loadInventoryHistory != null:
        return loadInventoryHistory(_that.partId, _that.page, _that.limit);
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
    required TResult Function(int page, int limit, String? category,
            PartStatus? status, String? searchQuery)
        loadParts,
    required TResult Function() refreshParts,
    required TResult Function() loadMoreParts,
    required TResult Function(
            String query, String? category, PartStatus? status)
        searchParts,
    required TResult Function() clearSearch,
    required TResult Function(String? category) filterByCategory,
    required TResult Function(PartStatus? status) filterByStatus,
    required TResult Function() loadLowStockParts,
    required TResult Function() loadPartCategories,
    required TResult Function(int page, int limit, bool? lowStockOnly)
        loadInventory,
    required TResult Function(int partId, int quantityChange, String type,
            String reason, String? workOrderId, String? notes)
        updateInventory,
    required TResult Function(int partId, int page, int limit)
        loadInventoryHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts():
        return loadParts(_that.page, _that.limit, _that.category, _that.status,
            _that.searchQuery);
      case _RefreshParts():
        return refreshParts();
      case _LoadMoreParts():
        return loadMoreParts();
      case _SearchParts():
        return searchParts(_that.query, _that.category, _that.status);
      case _ClearSearch():
        return clearSearch();
      case _FilterByCategory():
        return filterByCategory(_that.category);
      case _FilterByStatus():
        return filterByStatus(_that.status);
      case _LoadLowStockParts():
        return loadLowStockParts();
      case _LoadPartCategories():
        return loadPartCategories();
      case _LoadInventory():
        return loadInventory(_that.page, _that.limit, _that.lowStockOnly);
      case _UpdateInventory():
        return updateInventory(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.workOrderId, _that.notes);
      case _LoadInventoryHistory():
        return loadInventoryHistory(_that.partId, _that.page, _that.limit);
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
    TResult? Function(int page, int limit, String? category, PartStatus? status,
            String? searchQuery)?
        loadParts,
    TResult? Function()? refreshParts,
    TResult? Function()? loadMoreParts,
    TResult? Function(String query, String? category, PartStatus? status)?
        searchParts,
    TResult? Function()? clearSearch,
    TResult? Function(String? category)? filterByCategory,
    TResult? Function(PartStatus? status)? filterByStatus,
    TResult? Function()? loadLowStockParts,
    TResult? Function()? loadPartCategories,
    TResult? Function(int page, int limit, bool? lowStockOnly)? loadInventory,
    TResult? Function(int partId, int quantityChange, String type,
            String reason, String? workOrderId, String? notes)?
        updateInventory,
    TResult? Function(int partId, int page, int limit)? loadInventoryHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadParts() when loadParts != null:
        return loadParts(_that.page, _that.limit, _that.category, _that.status,
            _that.searchQuery);
      case _RefreshParts() when refreshParts != null:
        return refreshParts();
      case _LoadMoreParts() when loadMoreParts != null:
        return loadMoreParts();
      case _SearchParts() when searchParts != null:
        return searchParts(_that.query, _that.category, _that.status);
      case _ClearSearch() when clearSearch != null:
        return clearSearch();
      case _FilterByCategory() when filterByCategory != null:
        return filterByCategory(_that.category);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _LoadLowStockParts() when loadLowStockParts != null:
        return loadLowStockParts();
      case _LoadPartCategories() when loadPartCategories != null:
        return loadPartCategories();
      case _LoadInventory() when loadInventory != null:
        return loadInventory(_that.page, _that.limit, _that.lowStockOnly);
      case _UpdateInventory() when updateInventory != null:
        return updateInventory(_that.partId, _that.quantityChange, _that.type,
            _that.reason, _that.workOrderId, _that.notes);
      case _LoadInventoryHistory() when loadInventoryHistory != null:
        return loadInventoryHistory(_that.partId, _that.page, _that.limit);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadParts implements PartsEvent {
  const _LoadParts(
      {this.page = 1,
      this.limit = 20,
      this.category,
      this.status,
      this.searchQuery});

  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;
  final String? category;
  final PartStatus? status;
  final String? searchQuery;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadPartsCopyWith<_LoadParts> get copyWith =>
      __$LoadPartsCopyWithImpl<_LoadParts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadParts &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, category, status, searchQuery);

  @override
  String toString() {
    return 'PartsEvent.loadParts(page: $page, limit: $limit, category: $category, status: $status, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class _$LoadPartsCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$LoadPartsCopyWith(
          _LoadParts value, $Res Function(_LoadParts) _then) =
      __$LoadPartsCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int limit,
      String? category,
      PartStatus? status,
      String? searchQuery});
}

/// @nodoc
class __$LoadPartsCopyWithImpl<$Res> implements _$LoadPartsCopyWith<$Res> {
  __$LoadPartsCopyWithImpl(this._self, this._then);

  final _LoadParts _self;
  final $Res Function(_LoadParts) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? category = freezed,
    Object? status = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_LoadParts(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _RefreshParts implements PartsEvent {
  const _RefreshParts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RefreshParts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent.refreshParts()';
  }
}

/// @nodoc

class _LoadMoreParts implements PartsEvent {
  const _LoadMoreParts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreParts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent.loadMoreParts()';
  }
}

/// @nodoc

class _SearchParts implements PartsEvent {
  const _SearchParts({required this.query, this.category, this.status});

  final String query;
  final String? category;
  final PartStatus? status;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchPartsCopyWith<_SearchParts> get copyWith =>
      __$SearchPartsCopyWithImpl<_SearchParts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchParts &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, category, status);

  @override
  String toString() {
    return 'PartsEvent.searchParts(query: $query, category: $category, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$SearchPartsCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$SearchPartsCopyWith(
          _SearchParts value, $Res Function(_SearchParts) _then) =
      __$SearchPartsCopyWithImpl;
  @useResult
  $Res call({String query, String? category, PartStatus? status});
}

/// @nodoc
class __$SearchPartsCopyWithImpl<$Res> implements _$SearchPartsCopyWith<$Res> {
  __$SearchPartsCopyWithImpl(this._self, this._then);

  final _SearchParts _self;
  final $Res Function(_SearchParts) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? category = freezed,
    Object? status = freezed,
  }) {
    return _then(_SearchParts(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
    ));
  }
}

/// @nodoc

class _ClearSearch implements PartsEvent {
  const _ClearSearch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClearSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent.clearSearch()';
  }
}

/// @nodoc

class _FilterByCategory implements PartsEvent {
  const _FilterByCategory(this.category);

  final String? category;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterByCategoryCopyWith<_FilterByCategory> get copyWith =>
      __$FilterByCategoryCopyWithImpl<_FilterByCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterByCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'PartsEvent.filterByCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$FilterByCategoryCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$FilterByCategoryCopyWith(
          _FilterByCategory value, $Res Function(_FilterByCategory) _then) =
      __$FilterByCategoryCopyWithImpl;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class __$FilterByCategoryCopyWithImpl<$Res>
    implements _$FilterByCategoryCopyWith<$Res> {
  __$FilterByCategoryCopyWithImpl(this._self, this._then);

  final _FilterByCategory _self;
  final $Res Function(_FilterByCategory) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_FilterByCategory(
      freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _FilterByStatus implements PartsEvent {
  const _FilterByStatus(this.status);

  final PartStatus? status;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterByStatusCopyWith<_FilterByStatus> get copyWith =>
      __$FilterByStatusCopyWithImpl<_FilterByStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterByStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'PartsEvent.filterByStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$FilterByStatusCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$FilterByStatusCopyWith(
          _FilterByStatus value, $Res Function(_FilterByStatus) _then) =
      __$FilterByStatusCopyWithImpl;
  @useResult
  $Res call({PartStatus? status});
}

/// @nodoc
class __$FilterByStatusCopyWithImpl<$Res>
    implements _$FilterByStatusCopyWith<$Res> {
  __$FilterByStatusCopyWithImpl(this._self, this._then);

  final _FilterByStatus _self;
  final $Res Function(_FilterByStatus) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_FilterByStatus(
      freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
    ));
  }
}

/// @nodoc

class _LoadLowStockParts implements PartsEvent {
  const _LoadLowStockParts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadLowStockParts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent.loadLowStockParts()';
  }
}

/// @nodoc

class _LoadPartCategories implements PartsEvent {
  const _LoadPartCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadPartCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartsEvent.loadPartCategories()';
  }
}

/// @nodoc

class _LoadInventory implements PartsEvent {
  const _LoadInventory({this.page = 1, this.limit = 20, this.lowStockOnly});

  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;
  final bool? lowStockOnly;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadInventoryCopyWith<_LoadInventory> get copyWith =>
      __$LoadInventoryCopyWithImpl<_LoadInventory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInventory &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, lowStockOnly);

  @override
  String toString() {
    return 'PartsEvent.loadInventory(page: $page, limit: $limit, lowStockOnly: $lowStockOnly)';
  }
}

/// @nodoc
abstract mixin class _$LoadInventoryCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$LoadInventoryCopyWith(
          _LoadInventory value, $Res Function(_LoadInventory) _then) =
      __$LoadInventoryCopyWithImpl;
  @useResult
  $Res call({int page, int limit, bool? lowStockOnly});
}

/// @nodoc
class __$LoadInventoryCopyWithImpl<$Res>
    implements _$LoadInventoryCopyWith<$Res> {
  __$LoadInventoryCopyWithImpl(this._self, this._then);

  final _LoadInventory _self;
  final $Res Function(_LoadInventory) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? lowStockOnly = freezed,
  }) {
    return _then(_LoadInventory(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockOnly: freezed == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _UpdateInventory implements PartsEvent {
  const _UpdateInventory(
      {required this.partId,
      required this.quantityChange,
      required this.type,
      required this.reason,
      this.workOrderId,
      this.notes});

  final int partId;
  final int quantityChange;
  final String type;
  final String reason;
  final String? workOrderId;
  final String? notes;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateInventoryCopyWith<_UpdateInventory> get copyWith =>
      __$UpdateInventoryCopyWithImpl<_UpdateInventory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateInventory &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, partId, quantityChange, type, reason, workOrderId, notes);

  @override
  String toString() {
    return 'PartsEvent.updateInventory(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, workOrderId: $workOrderId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$UpdateInventoryCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$UpdateInventoryCopyWith(
          _UpdateInventory value, $Res Function(_UpdateInventory) _then) =
      __$UpdateInventoryCopyWithImpl;
  @useResult
  $Res call(
      {int partId,
      int quantityChange,
      String type,
      String reason,
      String? workOrderId,
      String? notes});
}

/// @nodoc
class __$UpdateInventoryCopyWithImpl<$Res>
    implements _$UpdateInventoryCopyWith<$Res> {
  __$UpdateInventoryCopyWithImpl(this._self, this._then);

  final _UpdateInventory _self;
  final $Res Function(_UpdateInventory) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_UpdateInventory(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _self.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _LoadInventoryHistory implements PartsEvent {
  const _LoadInventoryHistory(
      {required this.partId, this.page = 1, this.limit = 20});

  final int partId;
  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadInventoryHistoryCopyWith<_LoadInventoryHistory> get copyWith =>
      __$LoadInventoryHistoryCopyWithImpl<_LoadInventoryHistory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInventoryHistory &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partId, page, limit);

  @override
  String toString() {
    return 'PartsEvent.loadInventoryHistory(partId: $partId, page: $page, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$LoadInventoryHistoryCopyWith<$Res>
    implements $PartsEventCopyWith<$Res> {
  factory _$LoadInventoryHistoryCopyWith(_LoadInventoryHistory value,
          $Res Function(_LoadInventoryHistory) _then) =
      __$LoadInventoryHistoryCopyWithImpl;
  @useResult
  $Res call({int partId, int page, int limit});
}

/// @nodoc
class __$LoadInventoryHistoryCopyWithImpl<$Res>
    implements _$LoadInventoryHistoryCopyWith<$Res> {
  __$LoadInventoryHistoryCopyWithImpl(this._self, this._then);

  final _LoadInventoryHistory _self;
  final $Res Function(_LoadInventoryHistory) _then;

  /// Create a copy of PartsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partId = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_LoadInventoryHistory(
      partId: null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
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

// dart format on
