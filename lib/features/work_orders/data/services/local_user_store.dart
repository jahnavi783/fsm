// import 'package:hive_ce/hive.dart';
//
// class LocalUserStore {
//   static const _boxName = 'user_box';
//   static const _keyUserId = 'current_user_id';
//
//   Future<void> saveUserId(String userId) async {
//     final box = await Hive.openBox(_boxName);
//     await box.put(_keyUserId, userId);
//   }
//
//   Future<String?> getUserId() async {
//     final box = await Hive.openBox(_boxName);
//     return box.get(_keyUserId);
//   }
//
//   Future<void> clearUserId() async {
//     final box = await Hive.openBox(_boxName);
//     await box.delete(_keyUserId);
//   }
// }
// import 'package:hive_ce/hive.dart';
//
// class LocalUserStore {
//   static const _boxName = 'user_box';
//   static const _keyUserId = 'current_user_id';
//
//   Future<void> saveUserId(String userId) async {
//     final box = await Hive.openBox(_boxName);
//     await box.put(_keyUserId, userId);
//   }
//
//   Future<String?> getUserId() async {
//     final box = await Hive.openBox(_boxName);
//     return box.get(_keyUserId);
//   }
//
//   Future<void> clearUserId() async {
//     final box = await Hive.openBox(_boxName);
//     await box.delete(_keyUserId);
//   }
// }
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalUserStore {
  static const _boxName = 'user_box';
  static const _keyUserId = 'current_user_id';
  static const _keyAccessToken = 'access_token';

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
