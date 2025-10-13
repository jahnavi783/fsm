import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../api/document_api_client.dart';

@module
abstract class DocumentModule {
  @injectable
  DocumentApiClient documentApiClient(Dio dio) => DocumentApiClient(dio);
}