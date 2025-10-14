import 'package:injectable/injectable.dart';
import '../api/profile_api_client.dart';
import '../models/profile_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileDto> getProfile();
  Future<ProfileDto> updateProfile(ProfileDto profile);
  Future<ProfilePreferencesDto> getPreferences();
  Future<ProfilePreferencesDto> updatePreferences(ProfilePreferencesDto preferences);
  Future<void> logout();
  Future<void> deleteAccount();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileDto> getProfile() async {
    return await _apiClient.getProfile();
  }

  @override
  Future<ProfileDto> updateProfile(ProfileDto profile) async {
    return await _apiClient.updateProfile(profile);
  }

  @override
  Future<ProfilePreferencesDto> getPreferences() async {
    return await _apiClient.getPreferences();
  }

  @override
  Future<ProfilePreferencesDto> updatePreferences(ProfilePreferencesDto preferences) async {
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