import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';
import '../repositories/i_parts_repository.dart';

@injectable
class CheckPartAvailabilityUseCase {
  final IPartsRepository _repository;

  CheckPartAvailabilityUseCase(this._repository);

  Future<Either<Failure, PartEntity>> call({
    required String query,
  }) async {
    if (query.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Search query cannot be empty',
      ));
    }

    return await _repository.checkPartAvailability(query.trim());
  }
}
