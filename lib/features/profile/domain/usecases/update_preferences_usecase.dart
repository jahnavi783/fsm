import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile_entity.dart';
import '../repositories/i_profile_repository.dart';

@injectable
class UpdatePreferencesUseCase {
  final IProfileRepository _repository;

  UpdatePreferencesUseCase(this._repository);

  Future<Either<Failure, ProfilePreferences>> call(ProfilePreferences preferences) async {
    return await _repository.updatePreferences(preferences);
  }
}