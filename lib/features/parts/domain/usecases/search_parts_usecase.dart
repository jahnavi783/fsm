import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';
import '../repositories/i_parts_repository.dart';

@injectable
class SearchPartsUseCase {
  final IPartsRepository _repository;

  SearchPartsUseCase(this._repository);

  Future<Either<Failure, List<PartEntity>>> call({
    required String query,
  }) {
    return _repository.searchParts(query: query);
  }
}
