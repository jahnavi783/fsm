// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PartsEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartsEventCopyWith<$Res> {
  factory $PartsEventCopyWith(
          PartsEvent value, $Res Function(PartsEvent) then) =
      _$PartsEventCopyWithImpl<$Res, PartsEvent>;
}

/// @nodoc
class _$PartsEventCopyWithImpl<$Res, $Val extends PartsEvent>
    implements $PartsEventCopyWith<$Res> {
  _$PartsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPartsImplCopyWith<$Res> {
  factory _$$LoadPartsImplCopyWith(
          _$LoadPartsImpl value, $Res Function(_$LoadPartsImpl) then) =
      __$$LoadPartsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int page,
      int limit,
      String? category,
      PartStatus? status,
      String? searchQuery});
}

/// @nodoc
class __$$LoadPartsImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadPartsImpl>
    implements _$$LoadPartsImplCopyWith<$Res> {
  __$$LoadPartsImplCopyWithImpl(
      _$LoadPartsImpl _value, $Res Function(_$LoadPartsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? category = freezed,
    Object? status = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$LoadPartsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadPartsImpl implements _LoadParts {
  const _$LoadPartsImpl(
      {this.page = 1,
      this.limit = 20,
      this.category,
      this.status,
      this.searchQuery});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? category;
  @override
  final PartStatus? status;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'PartsEvent.loadParts(page: $page, limit: $limit, category: $category, status: $status, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPartsImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPartsImplCopyWith<_$LoadPartsImpl> get copyWith =>
      __$$LoadPartsImplCopyWithImpl<_$LoadPartsImpl>(this, _$identity);

  @override
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
    return loadParts(page, limit, category, status, searchQuery);
  }

  @override
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
    return loadParts?.call(page, limit, category, status, searchQuery);
  }

  @override
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
    if (loadParts != null) {
      return loadParts(page, limit, category, status, searchQuery);
    }
    return orElse();
  }

  @override
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
    return loadParts(this);
  }

  @override
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
    return loadParts?.call(this);
  }

  @override
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
    if (loadParts != null) {
      return loadParts(this);
    }
    return orElse();
  }
}

abstract class _LoadParts implements PartsEvent {
  const factory _LoadParts(
      {final int page,
      final int limit,
      final String? category,
      final PartStatus? status,
      final String? searchQuery}) = _$LoadPartsImpl;

  int get page;
  int get limit;
  String? get category;
  PartStatus? get status;
  String? get searchQuery;
  @JsonKey(ignore: true)
  _$$LoadPartsImplCopyWith<_$LoadPartsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshPartsImplCopyWith<$Res> {
  factory _$$RefreshPartsImplCopyWith(
          _$RefreshPartsImpl value, $Res Function(_$RefreshPartsImpl) then) =
      __$$RefreshPartsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshPartsImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$RefreshPartsImpl>
    implements _$$RefreshPartsImplCopyWith<$Res> {
  __$$RefreshPartsImplCopyWithImpl(
      _$RefreshPartsImpl _value, $Res Function(_$RefreshPartsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshPartsImpl implements _RefreshParts {
  const _$RefreshPartsImpl();

  @override
  String toString() {
    return 'PartsEvent.refreshParts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshPartsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return refreshParts();
  }

  @override
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
    return refreshParts?.call();
  }

  @override
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
    if (refreshParts != null) {
      return refreshParts();
    }
    return orElse();
  }

  @override
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
    return refreshParts(this);
  }

  @override
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
    return refreshParts?.call(this);
  }

  @override
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
    if (refreshParts != null) {
      return refreshParts(this);
    }
    return orElse();
  }
}

abstract class _RefreshParts implements PartsEvent {
  const factory _RefreshParts() = _$RefreshPartsImpl;
}

/// @nodoc
abstract class _$$LoadMorePartsImplCopyWith<$Res> {
  factory _$$LoadMorePartsImplCopyWith(
          _$LoadMorePartsImpl value, $Res Function(_$LoadMorePartsImpl) then) =
      __$$LoadMorePartsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMorePartsImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadMorePartsImpl>
    implements _$$LoadMorePartsImplCopyWith<$Res> {
  __$$LoadMorePartsImplCopyWithImpl(
      _$LoadMorePartsImpl _value, $Res Function(_$LoadMorePartsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMorePartsImpl implements _LoadMoreParts {
  const _$LoadMorePartsImpl();

  @override
  String toString() {
    return 'PartsEvent.loadMoreParts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMorePartsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadMoreParts();
  }

  @override
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
    return loadMoreParts?.call();
  }

  @override
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
    if (loadMoreParts != null) {
      return loadMoreParts();
    }
    return orElse();
  }

  @override
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
    return loadMoreParts(this);
  }

  @override
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
    return loadMoreParts?.call(this);
  }

  @override
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
    if (loadMoreParts != null) {
      return loadMoreParts(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreParts implements PartsEvent {
  const factory _LoadMoreParts() = _$LoadMorePartsImpl;
}

/// @nodoc
abstract class _$$SearchPartsImplCopyWith<$Res> {
  factory _$$SearchPartsImplCopyWith(
          _$SearchPartsImpl value, $Res Function(_$SearchPartsImpl) then) =
      __$$SearchPartsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String? category, PartStatus? status});
}

/// @nodoc
class __$$SearchPartsImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$SearchPartsImpl>
    implements _$$SearchPartsImplCopyWith<$Res> {
  __$$SearchPartsImplCopyWithImpl(
      _$SearchPartsImpl _value, $Res Function(_$SearchPartsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? category = freezed,
    Object? status = freezed,
  }) {
    return _then(_$SearchPartsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
    ));
  }
}

/// @nodoc

class _$SearchPartsImpl implements _SearchParts {
  const _$SearchPartsImpl({required this.query, this.category, this.status});

  @override
  final String query;
  @override
  final String? category;
  @override
  final PartStatus? status;

  @override
  String toString() {
    return 'PartsEvent.searchParts(query: $query, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPartsImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, category, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPartsImplCopyWith<_$SearchPartsImpl> get copyWith =>
      __$$SearchPartsImplCopyWithImpl<_$SearchPartsImpl>(this, _$identity);

  @override
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
    return searchParts(query, category, status);
  }

  @override
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
    return searchParts?.call(query, category, status);
  }

  @override
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
    if (searchParts != null) {
      return searchParts(query, category, status);
    }
    return orElse();
  }

  @override
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
    return searchParts(this);
  }

  @override
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
    return searchParts?.call(this);
  }

  @override
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
    if (searchParts != null) {
      return searchParts(this);
    }
    return orElse();
  }
}

abstract class _SearchParts implements PartsEvent {
  const factory _SearchParts(
      {required final String query,
      final String? category,
      final PartStatus? status}) = _$SearchPartsImpl;

  String get query;
  String? get category;
  PartStatus? get status;
  @JsonKey(ignore: true)
  _$$SearchPartsImplCopyWith<_$SearchPartsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'PartsEvent.clearSearch()';
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
    return clearSearch();
  }

  @override
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
    return clearSearch?.call();
  }

  @override
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
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
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
    return clearSearch(this);
  }

  @override
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
    return clearSearch?.call(this);
  }

  @override
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
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements PartsEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
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
    extends _$PartsEventCopyWithImpl<$Res, _$FilterByCategoryImpl>
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

class _$FilterByCategoryImpl implements _FilterByCategory {
  const _$FilterByCategoryImpl(this.category);

  @override
  final String? category;

  @override
  String toString() {
    return 'PartsEvent.filterByCategory(category: $category)';
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
    return filterByCategory(category);
  }

  @override
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
    return filterByCategory?.call(category);
  }

  @override
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
    if (filterByCategory != null) {
      return filterByCategory(category);
    }
    return orElse();
  }

  @override
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
    return filterByCategory(this);
  }

  @override
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
    return filterByCategory?.call(this);
  }

  @override
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
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class _FilterByCategory implements PartsEvent {
  const factory _FilterByCategory(final String? category) =
      _$FilterByCategoryImpl;

  String? get category;
  @JsonKey(ignore: true)
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartStatus? status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FilterByStatusImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PartStatus?,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements _FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final PartStatus? status;

  @override
  String toString() {
    return 'PartsEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
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
    return filterByStatus(status);
  }

  @override
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
    return filterByStatus?.call(status);
  }

  @override
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
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
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
    return filterByStatus(this);
  }

  @override
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
    return filterByStatus?.call(this);
  }

  @override
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
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterByStatus implements PartsEvent {
  const factory _FilterByStatus(final PartStatus? status) =
      _$FilterByStatusImpl;

  PartStatus? get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadLowStockPartsImplCopyWith<$Res> {
  factory _$$LoadLowStockPartsImplCopyWith(_$LoadLowStockPartsImpl value,
          $Res Function(_$LoadLowStockPartsImpl) then) =
      __$$LoadLowStockPartsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadLowStockPartsImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadLowStockPartsImpl>
    implements _$$LoadLowStockPartsImplCopyWith<$Res> {
  __$$LoadLowStockPartsImplCopyWithImpl(_$LoadLowStockPartsImpl _value,
      $Res Function(_$LoadLowStockPartsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadLowStockPartsImpl implements _LoadLowStockParts {
  const _$LoadLowStockPartsImpl();

  @override
  String toString() {
    return 'PartsEvent.loadLowStockParts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadLowStockPartsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadLowStockParts();
  }

  @override
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
    return loadLowStockParts?.call();
  }

  @override
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
    if (loadLowStockParts != null) {
      return loadLowStockParts();
    }
    return orElse();
  }

  @override
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
    return loadLowStockParts(this);
  }

  @override
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
    return loadLowStockParts?.call(this);
  }

  @override
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
    if (loadLowStockParts != null) {
      return loadLowStockParts(this);
    }
    return orElse();
  }
}

abstract class _LoadLowStockParts implements PartsEvent {
  const factory _LoadLowStockParts() = _$LoadLowStockPartsImpl;
}

/// @nodoc
abstract class _$$LoadPartCategoriesImplCopyWith<$Res> {
  factory _$$LoadPartCategoriesImplCopyWith(_$LoadPartCategoriesImpl value,
          $Res Function(_$LoadPartCategoriesImpl) then) =
      __$$LoadPartCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPartCategoriesImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadPartCategoriesImpl>
    implements _$$LoadPartCategoriesImplCopyWith<$Res> {
  __$$LoadPartCategoriesImplCopyWithImpl(_$LoadPartCategoriesImpl _value,
      $Res Function(_$LoadPartCategoriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadPartCategoriesImpl implements _LoadPartCategories {
  const _$LoadPartCategoriesImpl();

  @override
  String toString() {
    return 'PartsEvent.loadPartCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPartCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadPartCategories();
  }

  @override
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
    return loadPartCategories?.call();
  }

  @override
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
    if (loadPartCategories != null) {
      return loadPartCategories();
    }
    return orElse();
  }

  @override
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
    return loadPartCategories(this);
  }

  @override
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
    return loadPartCategories?.call(this);
  }

  @override
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
    if (loadPartCategories != null) {
      return loadPartCategories(this);
    }
    return orElse();
  }
}

abstract class _LoadPartCategories implements PartsEvent {
  const factory _LoadPartCategories() = _$LoadPartCategoriesImpl;
}

/// @nodoc
abstract class _$$LoadInventoryImplCopyWith<$Res> {
  factory _$$LoadInventoryImplCopyWith(
          _$LoadInventoryImpl value, $Res Function(_$LoadInventoryImpl) then) =
      __$$LoadInventoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, bool? lowStockOnly});
}

/// @nodoc
class __$$LoadInventoryImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadInventoryImpl>
    implements _$$LoadInventoryImplCopyWith<$Res> {
  __$$LoadInventoryImplCopyWithImpl(
      _$LoadInventoryImpl _value, $Res Function(_$LoadInventoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? lowStockOnly = freezed,
  }) {
    return _then(_$LoadInventoryImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockOnly: freezed == lowStockOnly
          ? _value.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoadInventoryImpl implements _LoadInventory {
  const _$LoadInventoryImpl(
      {this.page = 1, this.limit = 20, this.lowStockOnly});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final bool? lowStockOnly;

  @override
  String toString() {
    return 'PartsEvent.loadInventory(page: $page, limit: $limit, lowStockOnly: $lowStockOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInventoryImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, lowStockOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInventoryImplCopyWith<_$LoadInventoryImpl> get copyWith =>
      __$$LoadInventoryImplCopyWithImpl<_$LoadInventoryImpl>(this, _$identity);

  @override
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
    return loadInventory(page, limit, lowStockOnly);
  }

  @override
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
    return loadInventory?.call(page, limit, lowStockOnly);
  }

  @override
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
    if (loadInventory != null) {
      return loadInventory(page, limit, lowStockOnly);
    }
    return orElse();
  }

  @override
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
    return loadInventory(this);
  }

  @override
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
    return loadInventory?.call(this);
  }

  @override
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
    if (loadInventory != null) {
      return loadInventory(this);
    }
    return orElse();
  }
}

abstract class _LoadInventory implements PartsEvent {
  const factory _LoadInventory(
      {final int page,
      final int limit,
      final bool? lowStockOnly}) = _$LoadInventoryImpl;

  int get page;
  int get limit;
  bool? get lowStockOnly;
  @JsonKey(ignore: true)
  _$$LoadInventoryImplCopyWith<_$LoadInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateInventoryImplCopyWith<$Res> {
  factory _$$UpdateInventoryImplCopyWith(_$UpdateInventoryImpl value,
          $Res Function(_$UpdateInventoryImpl) then) =
      __$$UpdateInventoryImplCopyWithImpl<$Res>;
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
class __$$UpdateInventoryImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$UpdateInventoryImpl>
    implements _$$UpdateInventoryImplCopyWith<$Res> {
  __$$UpdateInventoryImplCopyWithImpl(
      _$UpdateInventoryImpl _value, $Res Function(_$UpdateInventoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? quantityChange = null,
    Object? type = null,
    Object? reason = null,
    Object? workOrderId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$UpdateInventoryImpl(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workOrderId: freezed == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateInventoryImpl implements _UpdateInventory {
  const _$UpdateInventoryImpl(
      {required this.partId,
      required this.quantityChange,
      required this.type,
      required this.reason,
      this.workOrderId,
      this.notes});

  @override
  final int partId;
  @override
  final int quantityChange;
  @override
  final String type;
  @override
  final String reason;
  @override
  final String? workOrderId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PartsEvent.updateInventory(partId: $partId, quantityChange: $quantityChange, type: $type, reason: $reason, workOrderId: $workOrderId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateInventoryImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateInventoryImplCopyWith<_$UpdateInventoryImpl> get copyWith =>
      __$$UpdateInventoryImplCopyWithImpl<_$UpdateInventoryImpl>(
          this, _$identity);

  @override
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
    return updateInventory(
        partId, quantityChange, type, reason, workOrderId, notes);
  }

  @override
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
    return updateInventory?.call(
        partId, quantityChange, type, reason, workOrderId, notes);
  }

  @override
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
    if (updateInventory != null) {
      return updateInventory(
          partId, quantityChange, type, reason, workOrderId, notes);
    }
    return orElse();
  }

  @override
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
    return updateInventory(this);
  }

  @override
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
    return updateInventory?.call(this);
  }

  @override
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
    if (updateInventory != null) {
      return updateInventory(this);
    }
    return orElse();
  }
}

abstract class _UpdateInventory implements PartsEvent {
  const factory _UpdateInventory(
      {required final int partId,
      required final int quantityChange,
      required final String type,
      required final String reason,
      final String? workOrderId,
      final String? notes}) = _$UpdateInventoryImpl;

  int get partId;
  int get quantityChange;
  String get type;
  String get reason;
  String? get workOrderId;
  String? get notes;
  @JsonKey(ignore: true)
  _$$UpdateInventoryImplCopyWith<_$UpdateInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInventoryHistoryImplCopyWith<$Res> {
  factory _$$LoadInventoryHistoryImplCopyWith(_$LoadInventoryHistoryImpl value,
          $Res Function(_$LoadInventoryHistoryImpl) then) =
      __$$LoadInventoryHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int partId, int page, int limit});
}

/// @nodoc
class __$$LoadInventoryHistoryImplCopyWithImpl<$Res>
    extends _$PartsEventCopyWithImpl<$Res, _$LoadInventoryHistoryImpl>
    implements _$$LoadInventoryHistoryImplCopyWith<$Res> {
  __$$LoadInventoryHistoryImplCopyWithImpl(_$LoadInventoryHistoryImpl _value,
      $Res Function(_$LoadInventoryHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partId = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$LoadInventoryHistoryImpl(
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$LoadInventoryHistoryImpl implements _LoadInventoryHistory {
  const _$LoadInventoryHistoryImpl(
      {required this.partId, this.page = 1, this.limit = 20});

  @override
  final int partId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'PartsEvent.loadInventoryHistory(partId: $partId, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInventoryHistoryImpl &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partId, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInventoryHistoryImplCopyWith<_$LoadInventoryHistoryImpl>
      get copyWith =>
          __$$LoadInventoryHistoryImplCopyWithImpl<_$LoadInventoryHistoryImpl>(
              this, _$identity);

  @override
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
    return loadInventoryHistory(partId, page, limit);
  }

  @override
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
    return loadInventoryHistory?.call(partId, page, limit);
  }

  @override
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
    if (loadInventoryHistory != null) {
      return loadInventoryHistory(partId, page, limit);
    }
    return orElse();
  }

  @override
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
    return loadInventoryHistory(this);
  }

  @override
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
    return loadInventoryHistory?.call(this);
  }

  @override
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
    if (loadInventoryHistory != null) {
      return loadInventoryHistory(this);
    }
    return orElse();
  }
}

abstract class _LoadInventoryHistory implements PartsEvent {
  const factory _LoadInventoryHistory(
      {required final int partId,
      final int page,
      final int limit}) = _$LoadInventoryHistoryImpl;

  int get partId;
  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$LoadInventoryHistoryImplCopyWith<_$LoadInventoryHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
