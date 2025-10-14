import 'package:injectable/injectable.dart';
import '../api/parts_api_client.dart';
import '../models/part_dto.dart';

abstract class PartsRemoteDataSource {
  /// Get all parts from inventory
  Future<PartsResponse> getParts();

  /// Check part availability using search query
  Future<PartDto> checkPartAvailability(String query);

  /// Search parts (wraps checkPartAvailability)
  Future<List<PartDto>> searchParts({
    required String query,
  });

  /// Get low stock parts (filtered from main inventory)
  Future<List<PartDto>> getLowStockParts();

  /// Get part categories (extracted from inventory)
  Future<List<String>> getPartCategories();
}

@Injectable(as: PartsRemoteDataSource)
class PartsRemoteDataSourceImpl implements PartsRemoteDataSource {
  final PartsApiClient _apiClient;

  PartsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<PartsResponse> getParts() async {
    return await _apiClient.getParts();
  }

  @override
  Future<PartDto> checkPartAvailability(String query) async {
    return await _apiClient.checkPartAvailability(query: query);
  }

  @override
  Future<List<PartDto>> searchParts({
    required String query,
  }) async {
    try {
      final part = await _apiClient.checkPartAvailability(query: query);
      return [part];
    } catch (e) {
      // If single part not found, return empty list
      return [];
    }
  }

  @override
  Future<List<PartDto>> getLowStockParts() async {
    final response = await _apiClient.getParts();
    return response.parts.where((part) => part.isLowStock).toList();
  }

  @override
  Future<List<String>> getPartCategories() async {
    final response = await _apiClient.getParts();
    final categories =
        response.parts.map((part) => part.category).toSet().toList();
    return categories;
  }
}
