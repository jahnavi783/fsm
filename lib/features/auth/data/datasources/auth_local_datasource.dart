import 'package:injectable/injectable.dart';

import '../../../../core/constants/hive_boxes.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/user_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> saveUser(UserDto user);
  Future<UserDto?> getUser();
  Future<String?> getUserName(); // ADD THIS

  Future<void> clearAuthData();
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    await box.put(HiveKeys.accessToken, accessToken);
    await box.put(HiveKeys.refreshToken, refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    return box.get(HiveKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    return box.get(HiveKeys.refreshToken);
  }

  @override
  Future<void> saveUser(UserDto user) async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    await box.put(HiveKeys.user, user.toJson());
  }

  @override
  Future<UserDto?> getUser() async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    final userData = box.get(HiveKeys.user);
    if (userData != null) {
      return UserDto.fromJson(Map<String, dynamic>.from(userData));
    }
    return null;
  }

  // ADD THIS METHOD
  @override
  Future<String?> getUserName() async {
    final user = await getUser();
    if (user != null) {
      return '${user.firstName} ${user.lastName}'.trim();
    }
    return null;
  }

  @override
  Future<void> clearAuthData() async {
    final box = await _hiveService.getBox(HiveBoxes.authBox);
    await box.clear();
  }
}

class HiveKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String user = 'user';
}
