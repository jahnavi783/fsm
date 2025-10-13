import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/document_entity.dart';
import '../repositories/i_document_repository.dart';

@injectable
class SearchDocumentsUseCase {
  final IDocumentRepository _repository;

  SearchDocumentsUseCase(this._repository);

  Future<Either<Failure, List<DocumentEntity>>> call({
    required String query,
    DocumentType? type,
    String? category,
    required int page,
    required int limit,
  }) async {
    if (query.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Search query cannot be empty',
      ));
    }

    return await _repository.searchDocuments(
      query: query.trim(),
      type: type,
      category: category,
      page: page,
      limit: limit,
    );
  }
}