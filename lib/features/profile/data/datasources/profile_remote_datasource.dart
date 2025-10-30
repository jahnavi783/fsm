import 'package:injectable/injectable.dart';

import '../../../auth/data/models/user_dto.dart';
import '../api/profile_api_client.dart';
import '../models/profile_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<UserDto> getCurrentUser();
  Future<UserDto> updateProfile(Map<String, dynamic> profileData);
  Future<ProfilePreferencesDto> getPreferences();
  Future<ProfilePreferencesDto> updatePreferences(
      ProfilePreferencesDto preferences);
  Future<void> logout();
  Future<void> deleteAccount();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserDto> getCurrentUser() async {
    return await _apiClient.getCurrentUser();
  }

  @override
  Future<UserDto> updateProfile(Map<String, dynamic> profileData) async {
    return await _apiClient.updateProfile(profileData);
  }

  @override
  Future<ProfilePreferencesDto> getPreferences() async {
    return await _apiClient.getPreferences();
  }

  @override
  Future<ProfilePreferencesDto> updatePreferences(
      ProfilePreferencesDto preferences) async {
    return await _apiClient.updatePreferences(preferences);
  }

  @override
  Future<void> logout() async {
    return await _apiClient.logout();
  }

  @override
  Future<void> deleteAccount() async {
    return await _apiClient.deleteAccount();
  }
}
