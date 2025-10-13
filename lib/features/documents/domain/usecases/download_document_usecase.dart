import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/document_entity.dart';
import '../repositories/i_document_repository.dart';

@injectable
class DownloadDocumentUseCase {
  final IDocumentRepository _repository;

  DownloadDocumentUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required DocumentEntity document,
  }) async {
    // Validate document can be downloaded
    if (document.fileUrl.isEmpty) {
      return const Left(ValidationFailure(
        message: 'Document file URL is empty',
      ));
    }

    if (document.fileName.isEmpty) {
      return const Left(ValidationFailure(
        message: 'Document file name is empty',
      ));
    }

    // Check if already downloaded
    if (document.isAvailableOffline) {
      return Right(document.localPath!);
    }

    return await _repository.downloadDocument(
      documentId: document.id,
      fileUrl: document.fileUrl,
      fileName: document.fileName,
    );
  }
}