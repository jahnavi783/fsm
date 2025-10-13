import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/i_document_repository.dart';

@injectable
class GetDocumentCategoriesUseCase {
  final IDocumentRepository _repository;

  GetDocumentCategoriesUseCase(this._repository);

  Future<Either<Failure, List<String>>> call() async {
    return await _repository.getDocumentCategories();
  }
}