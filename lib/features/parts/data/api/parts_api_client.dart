import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/part_dto.dart';

part 'parts_api_client.g.dart';

@RestApi()
abstract class PartsApiClient {
  factory PartsApiClient(Dio dio, {String? baseUrl}) = _PartsApiClient;

  /// Get all inventory parts
  @GET('/inventory')
  Future<PartsResponse> getParts();

  /// Check part availability using search query (part number or name)
  @GET('/inventory/check')
  Future<PartDto> checkPartAvailability({
    @Query('query') required String query,
  });
}
