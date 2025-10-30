import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/document_entity.dart';

abstract class IDocumentRepository {
  Future<Either<Failure, List<DocumentEntity>>> getDocuments({
    required int page,
    required int limit,
    DocumentType? type,
    String? category,
    String? searchQuery,
  });
  
  Future<Either<Failure, List<DocumentEntity>>> searchDocuments({
    required String query,
    DocumentType? type,
    String? category,
    required int page,
    required int limit,
  });
  
  Future<Either<Failure, DocumentEntity>> getDocumentById(String id);

  Future<Either<Failure, String>> downloadDocument({
    required String documentId,
    required String fileUrl,
    required String fileName,
  });

  Future<Either<Failure, List<String>>> getDocumentCategories();

  Future<Either<Failure, List<DocumentEntity>>> getCachedDocuments({
    DocumentType? type,
    String? category,
  });

  Future<Either<Failure, void>> clearDocumentCache();

  Future<Either<Failure, void>> deleteDownloadedDocument(String documentId);
}