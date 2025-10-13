import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../api/auth_api_client.dart';

@module
abstract class AuthModule {
  @injectable
  AuthApiClient authApiClient(Dio dio) => AuthApiClient(dio);
}