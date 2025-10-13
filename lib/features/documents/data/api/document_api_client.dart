import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/document_dto.dart';

part 'document_api_client.g.dart';

@RestApi()
abstract class DocumentApiClient {
  factory DocumentApiClient(Dio dio, {String baseUrl}) = _DocumentApiClient;

  @GET('/documents')
  Future<DocumentResponseDto> getDocuments({
    @Query('model') String? model,
    @Query('category') String? category,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });


}