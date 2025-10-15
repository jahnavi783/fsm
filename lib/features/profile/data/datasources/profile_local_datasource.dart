import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/hive_boxes.dart';
import '../models/profile_hive_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileHiveModel?> getCachedProfile();
  Future<void> cacheProfile(ProfileHiveModel profile);
  Future<ProfilePreferencesHiveModel?> getCachedPreferences();
  Future<void> cachePreferences(ProfilePreferencesHiveModel preferences);
  Future<void> clearCache();
}

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  static const String _profileKey = 'profile';
  static const String _preferencesKey = 'preferences';

  @override
  Future<ProfileHiveModel?> getCachedProfile() async {
    final box = await Hive.openBox<ProfileHiveModel>(HiveBoxes.profile);
    return box.get(_profileKey);
  }

  @override
  Future<void> cacheProfile(ProfileHiveModel profile) async {
    final box = await Hive.openBox<ProfileHiveModel>(HiveBoxes.profile);
    await box.put(_profileKey, profile);
  }

  @override
  Future<ProfilePreferencesHiveModel?> getCachedPreferences() async {
    final box = await Hive.openBox<ProfilePreferencesHiveModel>(
        HiveBoxes.profilePreferences);
    return box.get(_preferencesKey);
  }

  @override
  Future<void> cachePreferences(ProfilePreferencesHiveModel preferences) async {
    final box = await Hive.openBox<ProfilePreferencesHiveModel>(
        HiveBoxes.profilePreferences);
    await box.put(_preferencesKey, preferences);
  }

  @override
  Future<void> clearCache() async {
    final profileBox = await Hive.openBox<ProfileHiveModel>(HiveBoxes.profile);
    final preferencesBox = await Hive.openBox<ProfilePreferencesHiveModel>(
        HiveBoxes.profilePreferences);

    await profileBox.clear();
    await preferencesBox.clear();
  }
}
