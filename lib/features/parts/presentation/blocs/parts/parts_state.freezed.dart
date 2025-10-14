// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PartsState {
  PartsStatus get status => throw _privateConstructorUsedError;
  List<PartEntity> get parts => throw _privateConstructorUsedError;
  List<PartEntity> get lowStockParts => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<InventoryEntity> get inventory => throw _privateConstructorUsedError;
  List<InventoryUpdateEntity> get inventoryHistory =>
      throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  PartStatus? get selectedStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isUpdatingInventory => throw _privateConstructorUsedError;
  int? get selectedPartId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartsStateCopyWith<PartsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartsStateCopyWith<$Res> {
  factory $PartsStateCopyWith(
          PartsState value, $Res Function(PartsState) then) =
      _$PartsStateCopyWithImpl<$Res, PartsState>;
  @useResult
  $Res call(
      {PartsStatus status,
      List<PartEntity> parts,
      List<PartEntity> lowStockParts,
      List<String> categories,
      List<InventoryEntity> inventory,
      List<InventoryUpdateEntity> inventoryHistory,
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
class _$PartsStateCopyWithImpl<$Res, $Val extends PartsState>
    implements $PartsStateCopyWith<$Res> {
  _$PartsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartsStatus,
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      lowStockParts: null == lowStockParts
          ? _value.lowStockParts
          : lowStockParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryEntity>,
      inventoryHistory: null == inventoryHistory
          ? _value.inventoryHistory
          : inventoryHistory // ignore: cast_nullable_to_non_nullable
              as List<InventoryUpdateEntity>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedStatus: freezed == selectedStatus
          ? _value.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingInventory: null == isUpdatingInventory
          ? _value.isUpdatingInventory
          : isUpdatingInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPartId: freezed == selectedPartId
          ? _value.selectedPartId
          : selectedPartId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartsStateImplCopyWith<$Res>
    implements $PartsStateCopyWith<$Res> {
  factory _$$PartsStateImplCopyWith(
          _$PartsStateImpl value, $Res Function(_$PartsStateImpl) then) =
      __$$PartsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PartsStatus status,
      List<PartEntity> parts,
      List<PartEntity> lowStockParts,
      List<String> categories,
      List<InventoryEntity> inventory,
      List<InventoryUpdateEntity> inventoryHistory,
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
class __$$PartsStateImplCopyWithImpl<$Res>
    extends _$PartsStateCopyWithImpl<$Res, _$PartsStateImpl>
    implements _$$PartsStateImplCopyWith<$Res> {
  __$$PartsStateImplCopyWithImpl(
      _$PartsStateImpl _value, $Res Function(_$PartsStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$PartsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartsStatus,
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      lowStockParts: null == lowStockParts
          ? _value._lowStockParts
          : lowStockParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inventory: null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryEntity>,
      inventoryHistory: null == inventoryHistory
          ? _value._inventoryHistory
          : inventoryHistory // ignore: cast_nullable_to_non_nullable
              as List<InventoryUpdateEntity>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedStatus: freezed == selectedStatus
          ? _value.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingInventory: null == isUpdatingInventory
          ? _value.isUpdatingInventory
          : isUpdatingInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPartId: freezed == selectedPartId
          ? _value.selectedPartId
          : selectedPartId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PartsStateImpl implements _PartsState {
  const _$PartsStateImpl(
      {this.status = PartsStatus.initial,
      final List<PartEntity> parts = const [],
      final List<PartEntity> lowStockParts = const [],
      final List<String> categories = const [],
      final List<InventoryEntity> inventory = const [],
      final List<InventoryUpdateEntity> inventoryHistory = const [],
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

  final List<InventoryEntity> _inventory;
  @override
  @JsonKey()
  List<InventoryEntity> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  final List<InventoryUpdateEntity> _inventoryHistory;
  @override
  @JsonKey()
  List<InventoryUpdateEntity> get inventoryHistory {
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

  @override
  String toString() {
    return 'PartsState(status: $status, parts: $parts, lowStockParts: $lowStockParts, categories: $categories, inventory: $inventory, inventoryHistory: $inventoryHistory, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, searchQuery: $searchQuery, selectedCategory: $selectedCategory, selectedStatus: $selectedStatus, errorMessage: $errorMessage, isSearching: $isSearching, isUpdatingInventory: $isUpdatingInventory, selectedPartId: $selectedPartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartsStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartsStateImplCopyWith<_$PartsStateImpl> get copyWith =>
      __$$PartsStateImplCopyWithImpl<_$PartsStateImpl>(this, _$identity);
}

abstract class _PartsState implements PartsState {
  const factory _PartsState(
      {final PartsStatus status,
      final List<PartEntity> parts,
      final List<PartEntity> lowStockParts,
      final List<String> categories,
      final List<InventoryEntity> inventory,
      final List<InventoryUpdateEntity> inventoryHistory,
      final int currentPage,
      final bool hasReachedMax,
      final bool isLoadingMore,
      final String? searchQuery,
      final String? selectedCategory,
      final PartStatus? selectedStatus,
      final String? errorMessage,
      final bool isSearching,
      final bool isUpdatingInventory,
      final int? selectedPartId}) = _$PartsStateImpl;

  @override
  PartsStatus get status;
  @override
  List<PartEntity> get parts;
  @override
  List<PartEntity> get lowStockParts;
  @override
  List<String> get categories;
  @override
  List<InventoryEntity> get inventory;
  @override
  List<InventoryUpdateEntity> get inventoryHistory;
  @override
  int get currentPage;
  @override
  bool get hasReachedMax;
  @override
  bool get isLoadingMore;
  @override
  String? get searchQuery;
  @override
  String? get selectedCategory;
  @override
  PartStatus? get selectedStatus;
  @override
  String? get errorMessage;
  @override
  bool get isSearching;
  @override
  bool get isUpdatingInventory;
  @override
  int? get selectedPartId;
  @override
  @JsonKey(ignore: true)
  _$$PartsStateImplCopyWith<_$PartsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
