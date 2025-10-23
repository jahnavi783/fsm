// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartsState {
  PartsStatus get status;
  List<PartEntity> get parts;
  List<PartEntity> get lowStockParts;
  List<String> get categories;
  List<Map<String, dynamic>> get inventory;
  List<Map<String, dynamic>> get inventoryHistory;
  int get currentPage;
  bool get hasReachedMax;
  bool get isLoadingMore;
  String? get searchQuery;
  String? get selectedCategory;
  PartStatus? get selectedStatus;
  String? get errorMessage;
  bool get isSearching;
  bool get isUpdatingInventory;
  int? get selectedPartId;

  /// Create a copy of PartsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartsStateCopyWith<PartsState> get copyWith =>
      _$PartsStateCopyWithImpl<PartsState>(this as PartsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.parts, parts) &&
            const DeepCollectionEquality()
                .equals(other.lowStockParts, lowStockParts) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.inventory, inventory) &&
            const DeepCollectionEquality()
                .equals(other.inventoryHistory, inventoryHistory) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedStatus, selectedStatus) ||
                other.selectedStatus == selectedStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isUpdatingInventory, isUpdatingInventory) ||
                other.isUpdatingInventory == isUpdatingInventory) &&
            (identical(other.selectedPartId, selectedPartId) ||
                other.selectedPartId == selectedPartId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(parts),
      const DeepCollectionEquality().hash(lowStockParts),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(inventory),
      const DeepCollectionEquality().hash(inventoryHistory),
      currentPage,
      hasReachedMax,
      isLoadingMore,
      searchQuery,
      selectedCategory,
      selectedStatus,
      errorMessage,
      isSearching,
      isUpdatingInventory,
      selectedPartId);

  @override
  String toString() {
    return 'PartsState(status: $status, parts: $parts, lowStockParts: $lowStockParts, categories: $categories, inventory: $inventory, inventoryHistory: $inventoryHistory, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, searchQuery: $searchQuery, selectedCategory: $selectedCategory, selectedStatus: $selectedStatus, errorMessage: $errorMessage, isSearching: $isSearching, isUpdatingInventory: $isUpdatingInventory, selectedPartId: $selectedPartId)';
  }
}

/// @nodoc
abstract mixin class $PartsStateCopyWith<$Res> {
  factory $PartsStateCopyWith(
          PartsState value, $Res Function(PartsState) _then) =
      _$PartsStateCopyWithImpl;
  @useResult
  $Res call(
      {PartsStatus status,
      List<PartEntity> parts,
      List<PartEntity> lowStockParts,
      List<String> categories,
      List<Map<String, dynamic>> inventory,
      List<Map<String, dynamic>> inventoryHistory,
      int currentPage,
      bool hasReachedMax,
      bool isLoadingMore,
      String? searchQuery,
      String? selectedCategory,
      PartStatus? selectedStatus,
      String? errorMessage,
      bool isSearching,
      bool isUpdatingInventory,
      int? selectedPartId});
}

/// @nodoc
class _$PartsStateCopyWithImpl<$Res> implements $PartsStateCopyWith<$Res> {
  _$PartsStateCopyWithImpl(this._self, this._then);

  final PartsState _self;
  final $Res Function(PartsState) _then;

  /// Create a copy of PartsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? parts = null,
    Object? lowStockParts = null,
    Object? categories = null,
    Object? inventory = null,
    Object? inventoryHistory = null,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? searchQuery = freezed,
    Object? selectedCategory = freezed,
    Object? selectedStatus = freezed,
    Object? errorMessage = freezed,
    Object? isSearching = null,
    Object? isUpdatingInventory = null,
    Object? selectedPartId = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartsStatus,
      parts: null == parts
          ? _self.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      lowStockParts: null == lowStockParts
          ? _self.lowStockParts
          : lowStockParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inventory: null == inventory
          ? _self.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      inventoryHistory: null == inventoryHistory
          ? _self.inventoryHistory
          : inventoryHistory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedStatus: freezed == selectedStatus
          ? _self.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingInventory: null == isUpdatingInventory
          ? _self.isUpdatingInventory
          : isUpdatingInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPartId: freezed == selectedPartId
          ? _self.selectedPartId
          : selectedPartId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartsState].
extension PartsStatePatterns on PartsState {
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
    TResult Function(_PartsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartsState() when $default != null:
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
    TResult Function(_PartsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsState():
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
    TResult? Function(_PartsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsState() when $default != null:
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
            PartsStatus status,
            List<PartEntity> parts,
            List<PartEntity> lowStockParts,
            List<String> categories,
            List<Map<String, dynamic>> inventory,
            List<Map<String, dynamic>> inventoryHistory,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? searchQuery,
            String? selectedCategory,
            PartStatus? selectedStatus,
            String? errorMessage,
            bool isSearching,
            bool isUpdatingInventory,
            int? selectedPartId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartsState() when $default != null:
        return $default(
            _that.status,
            _that.parts,
            _that.lowStockParts,
            _that.categories,
            _that.inventory,
            _that.inventoryHistory,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.searchQuery,
            _that.selectedCategory,
            _that.selectedStatus,
            _that.errorMessage,
            _that.isSearching,
            _that.isUpdatingInventory,
            _that.selectedPartId);
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
            PartsStatus status,
            List<PartEntity> parts,
            List<PartEntity> lowStockParts,
            List<String> categories,
            List<Map<String, dynamic>> inventory,
            List<Map<String, dynamic>> inventoryHistory,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? searchQuery,
            String? selectedCategory,
            PartStatus? selectedStatus,
            String? errorMessage,
            bool isSearching,
            bool isUpdatingInventory,
            int? selectedPartId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsState():
        return $default(
            _that.status,
            _that.parts,
            _that.lowStockParts,
            _that.categories,
            _that.inventory,
            _that.inventoryHistory,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.searchQuery,
            _that.selectedCategory,
            _that.selectedStatus,
            _that.errorMessage,
            _that.isSearching,
            _that.isUpdatingInventory,
            _that.selectedPartId);
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
            PartsStatus status,
            List<PartEntity> parts,
            List<PartEntity> lowStockParts,
            List<String> categories,
            List<Map<String, dynamic>> inventory,
            List<Map<String, dynamic>> inventoryHistory,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? searchQuery,
            String? selectedCategory,
            PartStatus? selectedStatus,
            String? errorMessage,
            bool isSearching,
            bool isUpdatingInventory,
            int? selectedPartId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartsState() when $default != null:
        return $default(
            _that.status,
            _that.parts,
            _that.lowStockParts,
            _that.categories,
            _that.inventory,
            _that.inventoryHistory,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.searchQuery,
            _that.selectedCategory,
            _that.selectedStatus,
            _that.errorMessage,
            _that.isSearching,
            _that.isUpdatingInventory,
            _that.selectedPartId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PartsState implements PartsState {
  const _PartsState(
      {this.status = PartsStatus.initial,
      final List<PartEntity> parts = const [],
      final List<PartEntity> lowStockParts = const [],
      final List<String> categories = const [],
      final List<Map<String, dynamic>> inventory = const [],
      final List<Map<String, dynamic>> inventoryHistory = const [],
      this.currentPage = 1,
      this.hasReachedMax = false,
      this.isLoadingMore = false,
      this.searchQuery,
      this.selectedCategory,
      this.selectedStatus,
      this.errorMessage,
      this.isSearching = false,
      this.isUpdatingInventory = false,
      this.selectedPartId})
      : _parts = parts,
        _lowStockParts = lowStockParts,
        _categories = categories,
        _inventory = inventory,
        _inventoryHistory = inventoryHistory;

  @override
  @JsonKey()
  final PartsStatus status;
  final List<PartEntity> _parts;
  @override
  @JsonKey()
  List<PartEntity> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  final List<PartEntity> _lowStockParts;
  @override
  @JsonKey()
  List<PartEntity> get lowStockParts {
    if (_lowStockParts is EqualUnmodifiableListView) return _lowStockParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockParts);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Map<String, dynamic>> _inventory;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  final List<Map<String, dynamic>> _inventoryHistory;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get inventoryHistory {
    if (_inventoryHistory is EqualUnmodifiableListView)
      return _inventoryHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventoryHistory);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? searchQuery;
  @override
  final String? selectedCategory;
  @override
  final PartStatus? selectedStatus;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isUpdatingInventory;
  @override
  final int? selectedPartId;

  /// Create a copy of PartsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartsStateCopyWith<_PartsState> get copyWith =>
      __$PartsStateCopyWithImpl<_PartsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            const DeepCollectionEquality()
                .equals(other._lowStockParts, _lowStockParts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            const DeepCollectionEquality()
                .equals(other._inventoryHistory, _inventoryHistory) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedStatus, selectedStatus) ||
                other.selectedStatus == selectedStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isUpdatingInventory, isUpdatingInventory) ||
                other.isUpdatingInventory == isUpdatingInventory) &&
            (identical(other.selectedPartId, selectedPartId) ||
                other.selectedPartId == selectedPartId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_parts),
      const DeepCollectionEquality().hash(_lowStockParts),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_inventory),
      const DeepCollectionEquality().hash(_inventoryHistory),
      currentPage,
      hasReachedMax,
      isLoadingMore,
      searchQuery,
      selectedCategory,
      selectedStatus,
      errorMessage,
      isSearching,
      isUpdatingInventory,
      selectedPartId);

  @override
  String toString() {
    return 'PartsState(status: $status, parts: $parts, lowStockParts: $lowStockParts, categories: $categories, inventory: $inventory, inventoryHistory: $inventoryHistory, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, searchQuery: $searchQuery, selectedCategory: $selectedCategory, selectedStatus: $selectedStatus, errorMessage: $errorMessage, isSearching: $isSearching, isUpdatingInventory: $isUpdatingInventory, selectedPartId: $selectedPartId)';
  }
}

/// @nodoc
abstract mixin class _$PartsStateCopyWith<$Res>
    implements $PartsStateCopyWith<$Res> {
  factory _$PartsStateCopyWith(
          _PartsState value, $Res Function(_PartsState) _then) =
      __$PartsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PartsStatus status,
      List<PartEntity> parts,
      List<PartEntity> lowStockParts,
      List<String> categories,
      List<Map<String, dynamic>> inventory,
      List<Map<String, dynamic>> inventoryHistory,
      int currentPage,
      bool hasReachedMax,
      bool isLoadingMore,
      String? searchQuery,
      String? selectedCategory,
      PartStatus? selectedStatus,
      String? errorMessage,
      bool isSearching,
      bool isUpdatingInventory,
      int? selectedPartId});
}

/// @nodoc
class __$PartsStateCopyWithImpl<$Res> implements _$PartsStateCopyWith<$Res> {
  __$PartsStateCopyWithImpl(this._self, this._then);

  final _PartsState _self;
  final $Res Function(_PartsState) _then;

  /// Create a copy of PartsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? parts = null,
    Object? lowStockParts = null,
    Object? categories = null,
    Object? inventory = null,
    Object? inventoryHistory = null,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? searchQuery = freezed,
    Object? selectedCategory = freezed,
    Object? selectedStatus = freezed,
    Object? errorMessage = freezed,
    Object? isSearching = null,
    Object? isUpdatingInventory = null,
    Object? selectedPartId = freezed,
  }) {
    return _then(_PartsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartsStatus,
      parts: null == parts
          ? _self._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      lowStockParts: null == lowStockParts
          ? _self._lowStockParts
          : lowStockParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inventory: null == inventory
          ? _self._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      inventoryHistory: null == inventoryHistory
          ? _self._inventoryHistory
          : inventoryHistory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedStatus: freezed == selectedStatus
          ? _self.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingInventory: null == isUpdatingInventory
          ? _self.isUpdatingInventory
          : isUpdatingInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPartId: freezed == selectedPartId
          ? _self.selectedPartId
          : selectedPartId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
