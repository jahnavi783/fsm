import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:fsm/features/profile/data/models/profile_hive_model.dart';
import 'package:hive_ce/hive.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProfileLocalDataSourceImpl dataSource;
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_profile_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(10)) {
      // ProfileHiveModel is typically 10
      Hive.registerAdapter(ProfileHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      // ProfilePreferencesHiveModel is typically 11
      Hive.registerAdapter(ProfilePreferencesHiveModelAdapter());
    }
  });

  tearDownAll(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  setUp(() async {
    dataSource = ProfileLocalDataSourceImpl();

    // Clear boxes between tests
    if (Hive.isBoxOpen('profile_box')) {
      await Hive.box<ProfileHiveModel>('profile_box').clear();
    }
    if (Hive.isBoxOpen('profile_preferences_box')) {
      await Hive.box<ProfilePreferencesHiveModel>('profile_preferences_box')
          .clear();
    }
  });

  final tPreferences = ProfilePreferencesHiveModel(
    language: 'en',
    darkModeEnabled: false,
  );

  final tProfile = ProfileHiveModel(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    preferences: tPreferences,
    cachedAt: DateTime(2025),
  );

  group('profile caching', () {
    test('should return null when there is no cached profile', () async {
      // act
      final result = await dataSource.getCachedProfile();

      // assert
      expect(result, isNull);
    });

    test('should cache and retrieve profile', () async {
      // act
      await dataSource.cacheProfile(tProfile);
      final result = await dataSource.getCachedProfile();

      // assert
      expect(result, tProfile);
    });
  });

  group('preferences caching', () {
    test('should return null when there is no cached preferences', () async {
      // act
      final result = await dataSource.getCachedPreferences();

      // assert
      expect(result, isNull);
    });

    test('should cache and retrieve preferences', () async {
      // act
      await dataSource.cachePreferences(tPreferences);
      final result = await dataSource.getCachedPreferences();

      // assert
      expect(result, tPreferences);
    });
  });

  group('clearCache', () {
    test('should clear both profile and preferences boxes', () async {
      // arrange
      await dataSource.cacheProfile(tProfile);
      await dataSource.cachePreferences(tPreferences);

      // act
      await dataSource.clearCache();

      // assert
      final profile = await dataSource.getCachedProfile();
      final preferences = await dataSource.getCachedPreferences();
      expect(profile, isNull);
      expect(preferences, isNull);
    });
  });
}
