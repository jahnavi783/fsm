import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/part_entity.dart';
import '../../../domain/usecases/get_parts_usecase.dart';
import '../../../domain/usecases/search_parts_usecase.dart';
import '../../../domain/usecases/get_low_stock_parts_usecase.dart';
import '../../../domain/repositories/i_parts_repository.dart';
import 'parts_event.dart';
import 'parts_state.dart';

@injectable
class PartsBloc extends Bloc<PartsEvent, PartsState> {
  final GetPartsUseCase _getPartsUseCase;
  final SearchPartsUseCase _searchPartsUseCase;
  final GetLowStockPartsUseCase _getLowStockPartsUseCase;
  final IPartsRepository _repository;

  PartsBloc(
    this._getPartsUseCase,
    this._searchPartsUseCase,
    this._getLowStockPartsUseCase,
    this._repository,
  ) : super(const PartsState()) {
    on<PartsEvent>(_onEvent);
  }

  Future<void> _onEvent(PartsEvent event, Emitter<PartsState> emit) async {
    await event.when(
      loadParts: (page, limit, category, status, searchQuery) => _onLoadParts(
        page: page,
        limit: limit,
        category: category,
        status: status,
        searchQuery: searchQuery,
        emit: emit,
      ),
      refreshParts: () => _onRefreshParts(emit),
      loadMoreParts: () => _onLoadMoreParts(emit),
      searchParts: (query, category, status) => _onSearchParts(
        query: query,
        category: category,
        status: status,
        emit: emit,
      ),
      clearSearch: () => _onClearSearch(emit),
      filterByCategory: (category) =>
          _onFilterByCategory(category: category, emit: emit),
      filterByStatus: (status) => _onFilterByStatus(status: status, emit: emit),
      loadLowStockParts: () => _onLoadLowStockParts(emit),
      loadPartCategories: () => _onLoadPartCategories(emit),
      loadInventory: (page, limit, lowStockOnly) => _onLoadInventory(
        page: page,
        limit: limit,
        lowStockOnly: lowStockOnly,
        emit: emit,
      ),
      updateInventory:
          (partId, quantityChange, type, reason, workOrderId, notes) =>
              _onUpdateInventory(
        partId: partId,
        quantityChange: quantityChange,
        type: type,
        reason: reason,
        workOrderId: workOrderId,
        notes: notes,
        emit: emit,
      ),
      loadInventoryHistory: (partId, page, limit) => _onLoadInventoryHistory(
        partId: partId,
        page: page,
        limit: limit,
        emit: emit,
      ),
    );
  }

  Future<void> _onLoadParts({
    int? page,
    int? limit,
    String? category,
    PartStatus? status,
    String? searchQuery,
    required Emitter<PartsState> emit,
  }) async {
    if (state.isLoading) return;

    emit(state.copyWith(
      status: PartsStatus.loading,
    ));

    final result = await _getPartsUseCase(
      category: category ?? state.selectedCategory,
      status: status ?? state.selectedStatus,
      searchQuery: searchQuery ?? state.searchQuery,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: PartsStatus.failure,
        errorMessage: failure.message,
      )),
      (parts) => emit(state.copyWith(
        status: PartsStatus.success,
        parts: parts,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onRefreshParts(Emitter<PartsState> emit) async {
    emit(state.copyWith(
      parts: [],
    ));

    add(const PartsEvent.loadParts());
  }

  Future<void> _onSearchParts({
    required String query,
    String? category,
    PartStatus? status,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(
      isSearching: true,
      searchQuery: query,
    ));

    final result = await _searchPartsUseCase(
      query: query,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isSearching: false,
        status: PartsStatus.failure,
        errorMessage: failure.message,
      )),
      (parts) => emit(state.copyWith(
        isSearching: false,
        status: PartsStatus.success,
        parts: parts,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onClearSearch(Emitter<PartsState> emit) async {
    emit(state.copyWith(
      searchQuery: null,
      isSearching: false,
    ));

    add(const PartsEvent.loadParts());
  }

  Future<void> _onFilterByCategory({
    String? category,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(
      selectedCategory: category,
      parts: [],
    ));

    add(const PartsEvent.loadParts());
  }

  Future<void> _onFilterByStatus({
    PartStatus? status,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(
      selectedStatus: status,
      parts: [],
    ));

    add(const PartsEvent.loadParts());
  }

  Future<void> _onLoadLowStockParts(Emitter<PartsState> emit) async {
    final result = await _getLowStockPartsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(
        errorMessage: failure.message,
      )),
      (lowStockParts) => emit(state.copyWith(
        lowStockParts: lowStockParts,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onLoadPartCategories(Emitter<PartsState> emit) async {
    final result = await _repository.getPartCategories();

    result.fold(
      (failure) => emit(state.copyWith(
        errorMessage: failure.message,
      )),
      (categories) => emit(state.copyWith(
        categories: categories,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onLoadMoreParts(Emitter<PartsState> emit) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _getPartsUseCase(
      category: state.selectedCategory,
      status: state.selectedStatus,
      searchQuery: state.searchQuery,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingMore: false,
        errorMessage: failure.message,
      )),
      (newParts) {
        final updatedParts = List<PartEntity>.from(state.parts)
          ..addAll(newParts);
        emit(state.copyWith(
          isLoadingMore: false,
          parts: updatedParts,
          currentPage: state.currentPage + 1,
          hasReachedMax: newParts.isEmpty,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onLoadInventory({
    required int page,
    required int limit,
    bool? lowStockOnly,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(status: PartsStatus.loading));

    // Placeholder implementation - would call repository method when available
    emit(state.copyWith(
      status: PartsStatus.success,
      inventory: [], // Empty list for now
      errorMessage: null,
    ));
  }

  Future<void> _onUpdateInventory({
    required int partId,
    required int quantityChange,
    required String type,
    required String reason,
    String? workOrderId,
    String? notes,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(
      isUpdatingInventory: true,
      selectedPartId: partId,
    ));

    // Placeholder implementation - would call repository method when available
    emit(state.copyWith(
      isUpdatingInventory: false,
      errorMessage: 'Update inventory functionality not yet implemented',
    ));
  }

  Future<void> _onLoadInventoryHistory({
    required int partId,
    required int page,
    required int limit,
    required Emitter<PartsState> emit,
  }) async {
    emit(state.copyWith(
      status: PartsStatus.loading,
      selectedPartId: partId,
    ));

    // Placeholder implementation - would call repository method when available
    emit(state.copyWith(
      status: PartsStatus.success,
      inventoryHistory: [], // Empty list for now
      errorMessage: null,
    ));
  }
}
