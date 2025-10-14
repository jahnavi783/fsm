import 'package:injectable/injectable.dart';
import '../api/parts_api_client.dart';
import '../models/inventory_dto.dart';
import '../models/part_dto.dart';

abstract class PartsRemoteDataSource {
  Future<List<PartDto>> getParts({
    required int page,
    required int limit,
    String? category,
    String? status,
    String? searchQuery,
  });

  Future<PartDto> getPartById(int id);

  Future<List<PartDto>> searchParts({
    required String query,
    String? category,
    String? status,
  });

  Future<List<PartDto>> getLowStockParts();

  Future<List<String>> getPartCategories();

  Future<List<InventoryDto>> getInventoryList({
    required int page,
    required int limit,
    bool? lowStockOnly,
  });

  Future<InventoryDto> getInventoryByPartId(int partId);

  Future<void> updateInventory(int partId, Map<String, dynamic> request);

  Future<List<InventoryDto>> getInventoryHistory({
    required int partId,
    required int page,
    required int limit,
  });
}

@Injectable(as: PartsRemoteDataSource)
class PartsRemoteDataSourceImpl implements PartsRemoteDataSource {
  final PartsApiClient _apiClient;

  PartsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PartDto>> getParts({
    required int page,
    required int limit,
    String? category,
    String? status,
    String? searchQuery,
  }) async {
    return await _apiClient.getParts(
      page: page,
      limit: limit,
      category: category,
      status: status,
      searchQuery: searchQuery,
    );
  }

  @override
  Future<PartDto> getPartById(int id) async {
    return await _apiClient.getPartById(id);
  }

  @override
  Future<List<PartDto>> searchParts({
    required String query,
    String? category,
    String? status,
  }) async {
    return await _apiClient.searchParts(
      query: query,
      category: category,
      status: status,
    );
  }

  @override
  Future<List<PartDto>> getLowStockParts() async {
    return await _apiClient.getLowStockParts();
  }

  @override
  Future<List<String>> getPartCategories() async {
    return await _apiClient.getPartCategories();
  }

  @override
  Future<List<InventoryDto>> getInventoryList({
    required int page,
    required int limit,
    bool? lowStockOnly,
  }) async {
    return await _apiClient.getInventoryList(
      page: page,
      limit: limit,
      lowStockOnly: lowStockOnly,
    );
  }

  @override
  Future<InventoryDto> getInventoryByPartId(int partId) async {
    return await _apiClient.getInventoryByPartId(partId);
  }

  @override
  Future<void> updateInventory(int partId, Map<String, dynamic> request) async {
    return await _apiClient.updateInventory(partId, request);
  }

  @override
  Future<List<InventoryDto>> getInventoryHistory({
    required int partId,
    required int page,
    required int limit,
  }) async {
    return await _apiClient.getInventoryHistory(
      partId: partId,
      page: page,
      limit: limit,
    );
  }
}
