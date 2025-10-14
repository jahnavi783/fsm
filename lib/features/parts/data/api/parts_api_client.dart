import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/inventory_dto.dart';
import '../models/part_dto.dart';

part 'parts_api_client.g.dart';

@RestApi()
abstract class PartsApiClient {
  factory PartsApiClient(Dio dio, {String? baseUrl}) = _PartsApiClient;

  @GET('/parts')
  Future<List<PartDto>> getParts({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('category') String? category,
    @Query('status') String? status,
    @Query('search') String? searchQuery,
  });

  @GET('/parts/{id}')
  Future<PartDto> getPartById(@Path('id') int id);

  @GET('/parts/search')
  Future<List<PartDto>> searchParts({
    @Query('query') required String query,
    @Query('category') String? category,
    @Query('status') String? status,
  });

  @GET('/parts/low-stock')
  Future<List<PartDto>> getLowStockParts();

  @GET('/parts/categories')
  Future<List<String>> getPartCategories();

  @GET('/inventory')
  Future<List<InventoryDto>> getInventoryList({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('low_stock_only') bool? lowStockOnly,
  });

  @GET('/inventory/part/{partId}')
  Future<InventoryDto> getInventoryByPartId(@Path('partId') int partId);

  @PUT('/inventory/part/{partId}')
  Future<void> updateInventory(
    @Path('partId') int partId,
    @Body() Map<String, dynamic> request,
  );

  @GET('/inventory/part/{partId}/history')
  Future<List<InventoryDto>> getInventoryHistory({
    @Path('partId') required int partId,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });
}
