import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';
import '../repositories/i_parts_repository.dart';

@injectable
class GetPartsUseCase {
  final IPartsRepository _repository;

  GetPartsUseCase(this._repository);

  Future<Either<Failure, List<PartEntity>>> call({
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) async {
    return await _repository.getParts(
      category: category,
      status: status,
      searchQuery: searchQuery,
    );
  }
}
