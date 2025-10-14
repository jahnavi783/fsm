import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/part_entity.dart';
import '../../../domain/entities/inventory_entity.dart';

part 'parts_event.freezed.dart';

@freezed
class PartsEvent with _$PartsEvent {
  const factory PartsEvent.loadParts({
    @Default(1) int page,
    @Default(20) int limit,
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) = _LoadParts;

  const factory PartsEvent.refreshParts() = _RefreshParts;

  const factory PartsEvent.loadMoreParts() = _LoadMoreParts;

  const factory PartsEvent.searchParts({
    required String query,
    String? category,
    PartStatus? status,
  }) = _SearchParts;

  const factory PartsEvent.clearSearch() = _ClearSearch;

  const factory PartsEvent.filterByCategory(String? category) = _FilterByCategory;

  const factory PartsEvent.filterByStatus(PartStatus? status) = _FilterByStatus;

  const factory PartsEvent.loadLowStockParts() = _LoadLowStockParts;

  const factory PartsEvent.loadPartCategories() = _LoadPartCategories;

  const factory PartsEvent.loadInventory({
    @Default(1) int page,
    @Default(20) int limit,
    bool? lowStockOnly,
  }) = _LoadInventory;

  const factory PartsEvent.updateInventory({
    required int partId,
    required int quantityChange,
    required InventoryUpdateType type,
    required String reason,
    String? workOrderId,
    String? notes,
  }) = _UpdateInventory;

  const factory PartsEvent.loadInventoryHistory({
    required int partId,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _LoadInventoryHistory;
}