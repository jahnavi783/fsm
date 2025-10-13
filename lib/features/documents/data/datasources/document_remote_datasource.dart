import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../api/document_api_client.dart';
import '../models/document_dto.dart';

abstract class DocumentRemoteDataSource {
  Future<List<DocumentDto>> getDocuments({
    String? model,
    String? category,
    String? keyword,
    int? page,
    int? limit,
  });

  Future<Response<ResponseBody>> downloadDocumentFromUrl(String fileUrl);
}

@Injectable(as: DocumentRemoteDataSource)
class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final DocumentApiClient _apiClient;

  DocumentRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<DocumentDto>> getDocuments({
    String? model,
    String? category,
    String? keyword,
    int? page,
    int? limit,
  }) async {
    final response = await _apiClient.getDocuments(
      model: model,
      category: category,
      keyword: keyword,
      page: page,
      limit: limit,
    );
    return response.documents;
  }

  @override
  Future<Response<ResponseBody>> downloadDocumentFromUrl(String fileUrl) async {
    // Use Dio directly to download from the file URL
    final dio = Dio();
    return await dio.get<ResponseBody>(
      fileUrl,
      options: Options(responseType: ResponseType.stream),
    );
  }
}