import 'package:injectable/injectable.dart';
import '../api/auth_api_client.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/refresh_token_request.dart';
import '../models/refresh_token_response.dart';
import '../models/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RefreshTokenResponse> refreshToken(String refreshToken);
  Future<UserDto> getCurrentUser();
  Future<void> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _apiClient.login(loginRequest);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String refreshToken) async {
    return await _apiClient.refreshToken(
      RefreshTokenRequest(refreshToken: refreshToken),
    );
  }

  @override
  Future<UserDto> getCurrentUser() async {
    return await _apiClient.getCurrentUser();
  }

  @override
  Future<void> logout() async {
    return await _apiClient.logout();
  }
}