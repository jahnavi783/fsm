import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/part_entity.dart';

part 'parts_state.freezed.dart';

@freezed
class PartsState with _$PartsState {
  const factory PartsState({
    @Default(PartsStatus.initial) PartsStatus status,
    @Default([]) List<PartEntity> parts,
    @Default([]) List<PartEntity> lowStockParts,
    @Default([]) List<String> categories,
    @Default([]) List<Map<String, dynamic>> inventory,
    @Default([]) List<Map<String, dynamic>> inventoryHistory,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    String? searchQuery,
    String? selectedCategory,
    PartStatus? selectedStatus,
    String? errorMessage,
    @Default(false) bool isSearching,
    @Default(false) bool isUpdatingInventory,
    int? selectedPartId,
  }) = _PartsState;
}

enum PartsStatus {
  initial,
  loading,
  success,
  failure,
}

extension PartsStateX on PartsState {
  bool get isLoading => status == PartsStatus.loading;
  bool get isSuccess => status == PartsStatus.success;
  bool get isFailure => status == PartsStatus.failure;
  bool get isInitial => status == PartsStatus.initial;

  bool get hasFilters =>
      selectedCategory != null ||
      selectedStatus != null ||
      (searchQuery != null && searchQuery!.isNotEmpty);

  List<PartEntity> get filteredParts {
    if (!hasFilters) return parts;

    return parts.where((part) {
      // Category filter
      if (selectedCategory != null && selectedCategory!.isNotEmpty) {
        if (part.category != selectedCategory) return false;
      }

      // Status filter
      if (selectedStatus != null) {
        if (part.status != selectedStatus) return false;
      }

      // Search query filter
      if (searchQuery != null && searchQuery!.isNotEmpty) {
        final query = searchQuery!.toLowerCase();
        if (!part.partName.toLowerCase().contains(query) &&
            !part.partNumber.toLowerCase().contains(query)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  int get lowStockCount => lowStockParts.length;

  int get outOfStockCount => parts.where((part) => part.isOutOfStock).length;

  double get totalInventoryValue =>
      parts.fold(0.0, (sum, part) => sum + part.totalValue);
}
