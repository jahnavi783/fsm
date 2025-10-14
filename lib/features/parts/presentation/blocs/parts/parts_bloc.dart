import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/get_parts_usecase.dart';
import '../../../domain/usecases/search_parts_usecase.dart';
import '../../../domain/usecases/update_inventory_usecase.dart';
import '../../../domain/usecases/get_low_stock_parts_usecase.dart';
import '../../../domain/repositories/i_parts_repository.dart';
import 'parts_event.dart';
import 'parts_state.dart';

@injectable
class PartsBloc extends Bloc<PartsEvent, PartsState> {
  final GetPartsUseCase _getPartsUseCase;
  final SearchPartsUseCase _searchPartsUseCase;
  final UpdateInventoryUseCase _updateInventoryUseCase;
  final GetLowStockPartsUseCase _getLowStockPartsUseCase;
  final IPartsRepository _repository;

  PartsBloc(
    this._getPartsUseCase,
    this._searchPartsUseCase,
    this._updateInventoryUseCase,
    this._getLowStockPartsUseCase,
    this._repository,
  ) : super(const PartsState()) {
    on<_LoadParts>(_onLoadParts);
    on<_RefreshParts>(_onRefreshParts);
    on<_LoadMoreParts>(_onLoadMoreParts);
    on<_SearchParts>(_onSearchParts);
    on<_ClearSearch>(_onClearSearch);
    on<_FilterByCategory>(_onFilterByCategory);
    on<_FilterByStatus>(_onFilterByStatus);
    on<_LoadLowStockParts>(_onLoadLowStockParts);
    on<_LoadPartCategories>(_onLoadPartCategories);
    on<_LoadInventory>(_onLoadInventory);
    on<_UpdateInventory>(_onUpdateInventory);
    on<_LoadInventoryHistory>(_onLoadInventoryHistory);
  }

  Future<void> _onLoadParts(_LoadParts event, Emitter<PartsState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(
      status: PartsStatus.loading,
      currentPage: event.page,
      hasReachedMax: false,
    ));

    final result = await _getPartsUseCase(
      page: event.page,
      limit: event.limit,
      category: event.category ?? state.selectedCategory,
      status: event.status ?? state.selectedStatus,
      searchQuery: event.searchQuery ?? state.searchQuery,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: PartsStatus.failure,
        errorMessage: failure.message,
      )),
      (parts) => emit(state.copyWith(
        status: PartsStatus.success,
        parts: event.page == 1 ? parts : [...state.parts, ...parts],
        hasReachedMax: parts.length < event.limit,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onRefreshParts(_RefreshParts event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      parts: [],
      currentPage: 1,
      hasReachedMax: false,
    ));

    add(const PartsEvent.loadParts(page: 1));
  }

  Future<void> _onLoadMoreParts(_LoadMoreParts event, Emitter<PartsState> emit) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final result = await _getPartsUseCase(
      page: nextPage,
      limit: 20,
      category: state.selectedCategory,
      status: state.selectedStatus,
      searchQuery: state.searchQuery,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingMore: false,
        errorMessage: failure.message,
      )),
      (parts) => emit(state.copyWith(
        parts: [...state.parts, ...parts],
        currentPage: nextPage,
        hasReachedMax: parts.length < 20,
        isLoadingMore: false,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onSearchParts(_SearchParts event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      isSearching: true,
      searchQuery: event.query,
    ));

    final result = await _searchPartsUseCase(
      query: event.query,
      category: event.category ?? state.selectedCategory,
      status: event.status ?? state.selectedStatus,
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
        currentPage: 1,
        hasReachedMax: true, // Search results are not paginated
        errorMessage: null,
      )),
    );
  }

  Future<void> _onClearSearch(_ClearSearch event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      searchQuery: null,
      isSearching: false,
    ));

    add(const PartsEvent.loadParts(page: 1));
  }

  Future<void> _onFilterByCategory(_FilterByCategory event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      selectedCategory: event.category,
      parts: [],
      currentPage: 1,
      hasReachedMax: false,
    ));

    add(const PartsEvent.loadParts(page: 1));
  }

  Future<void> _onFilterByStatus(_FilterByStatus event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      selectedStatus: event.status,
      parts: [],
      currentPage: 1,
      hasReachedMax: false,
    ));

    add(const PartsEvent.loadParts(page: 1));
  }

  Future<void> _onLoadLowStockParts(_LoadLowStockParts event, Emitter<PartsState> emit) async {
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

  Future<void> _onLoadPartCategories(_LoadPartCategories event, Emitter<PartsState> emit) async {
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

  Future<void> _onLoadInventory(_LoadInventory event, Emitter<PartsState> emit) async {
    final result = await _repository.getInventoryList(
      page: event.page,
      limit: event.limit,
      lowStockOnly: event.lowStockOnly,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        errorMessage: failure.message,
      )),
      (inventory) => emit(state.copyWith(
        inventory: inventory,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onUpdateInventory(_UpdateInventory event, Emitter<PartsState> emit) async {
    emit(state.copyWith(
      isUpdatingInventory: true,
      selectedPartId: event.partId,
    ));

    final result = await _updateInventoryUseCase(
      partId: event.partId,
      quantityChange: event.quantityChange,
      type: event.type,
      reason: event.reason,
      workOrderId: event.workOrderId,
      notes: event.notes,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdatingInventory: false,
        selectedPartId: null,
        errorMessage: failure.message,
      )),
      (_) {
        // Update the part in the current list
        final updatedParts = state.parts.map((part) {
          if (part.id == event.partId) {
            return part.copyWith(
              quantityAvailable: part.quantityAvailable + event.quantityChange,
              lastUpdated: DateTime.now(),
            );
          }
          return part;
        }).toList();

        emit(state.copyWith(
          isUpdatingInventory: false,
          selectedPartId: null,
          parts: updatedParts,
          errorMessage: null,
        ));

        // Reload low stock parts if needed
        add(const PartsEvent.loadLowStockParts());
      },
    );
  }

  Future<void> _onLoadInventoryHistory(_LoadInventoryHistory event, Emitter<PartsState> emit) async {
    final result = await _repository.getInventoryHistory(
      partId: event.partId,
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        errorMessage: failure.message,
      )),
      (history) => emit(state.copyWith(
        inventoryHistory: history,
        errorMessage: null,
      )),
    );
  }
}