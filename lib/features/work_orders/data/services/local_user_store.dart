import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalUserStore {
  static const _boxName = 'user_box';
  static const _keyUserId = 'current_user_id';
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  // ------------------- ACCESS TOKEN -------------------
  Future<void> saveAccessToken(String token) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyAccessToken, token);
  }

  Future<String?> getAccessToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_keyAccessToken);
  }

  Future<void> clearAccessToken() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_keyAccessToken);
  }

  // ------------------- REFRESH TOKEN -------------------
  Future<void> saveRefreshToken(String token) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyRefreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_keyRefreshToken);
  }

  Future<void> clearRefreshToken() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_keyRefreshToken);
  }

  // Save both tokens together (used at login)
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyAccessToken, accessToken);
    await box.put(_keyRefreshToken, refreshToken);
  }

  // ------------------- USER -------------------
  Future<void> saveUserId(String userId) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyUserId, userId);
  }

  Future<String?> getUserId() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_keyUserId);
  }

  Future<void> clearUserId() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_keyUserId);
  }
}
