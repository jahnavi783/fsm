import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/profile_dto.dart';

part 'profile_api_client.g.dart';

@RestApi()
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String? baseUrl}) = _ProfileApiClient;

  @GET('/profile')
  Future<ProfileDto> getProfile();

  @PUT('/profile')
  Future<ProfileDto> updateProfile(@Body() ProfileDto profile);

  @GET('/profile/preferences')
  Future<ProfilePreferencesDto> getPreferences();

  @PUT('/profile/preferences')
  Future<ProfilePreferencesDto> updatePreferences(
      @Body() ProfilePreferencesDto preferences);

  @POST('/auth/logout')
  Future<void> logout();

  @DELETE('/profile')
  Future<void> deleteAccount();
}
