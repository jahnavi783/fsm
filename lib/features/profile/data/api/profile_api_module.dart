import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'profile_api_client.dart';

@module
abstract class ProfileApiModule {
  @lazySingleton
  ProfileApiClient profileApiClient(Dio dio) => ProfileApiClient(dio);
}