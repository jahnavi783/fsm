import 'package:either_dart/either.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile_entity.dart';

abstract class IProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile);
  Future<Either<Failure, ProfilePreferences>> getPreferences();
  Future<Either<Failure, ProfilePreferences>> updatePreferences(
      ProfilePreferences preferences);
}
