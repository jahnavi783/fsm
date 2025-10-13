import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/document_entity.dart';
import '../repositories/i_document_repository.dart';

@injectable
class GetDocumentByIdUseCase {
  final IDocumentRepository _repository;

  GetDocumentByIdUseCase(this._repository);

  Future<Either<Failure, DocumentEntity>> call(int documentId) async {
    if (documentId <= 0) {
      return const Left(ValidationFailure(
        message: 'Invalid document ID',
      ));
    }

    return await _repository.getDocumentById(documentId);
  }
}