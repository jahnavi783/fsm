import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/refresh_token_request.dart';
import '../models/refresh_token_response.dart';
import '../models/user_dto.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;

  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/auth/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );

  @GET('/users/me')
  Future<UserDto> getCurrentUser();

  @POST('/auth/logout')
  Future<void> logout();
}
