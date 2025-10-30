import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'parts_api_client.dart';

@module
abstract class PartsApiModule {
  @lazySingleton
  PartsApiClient partsApiClient(Dio dio) => PartsApiClient(dio);
}
