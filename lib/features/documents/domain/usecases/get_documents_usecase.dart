import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/document_entity.dart';
import '../repositories/i_document_repository.dart';

@injectable
class GetDocumentsUseCase {
  final IDocumentRepository _repository;

  GetDocumentsUseCase(this._repository);

  Future<Either<Failure, List<DocumentEntity>>> call({
    required int page,
    required int limit,
    DocumentType? type,
    String? category,
    String? searchQuery,
  }) async {
    return await _repository.getDocuments(
      page: page,
      limit: limit,
      type: type,
      category: category,
      searchQuery: searchQuery,
    );
  }
}