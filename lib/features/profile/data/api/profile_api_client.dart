import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../auth/data/models/user_dto.dart';
import '../models/profile_dto.dart';

part 'profile_api_client.g.dart';

@RestApi()
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String? baseUrl}) = _ProfileApiClient;

  // Use the existing auth endpoint that already returns user data
  @GET('/users/me')
  Future<UserDto> getCurrentUser();

  @PUT('/users/me')
  Future<UserDto> updateProfile(@Body() Map<String, dynamic> profileData);

  @GET('/users/me/preferences')
  Future<ProfilePreferencesDto> getPreferences();

  @PUT('/users/me/preferences')
  Future<ProfilePreferencesDto> updatePreferences(
      @Body() ProfilePreferencesDto preferences);

  @POST('/auth/logout')
  Future<void> logout();

  @DELETE('/users/me')
  Future<void> deleteAccount();
}
