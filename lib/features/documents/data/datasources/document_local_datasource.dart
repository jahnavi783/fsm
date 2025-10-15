import 'dart:io';
import 'package:fsm/features/documents/data/models/document_hive_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/constants/hive_boxes.dart';
import '../../domain/entities/document_entity.dart';
import '../models/document_dto.dart';

abstract class DocumentLocalDataSource {
  Future<List<DocumentHiveModel>> getCachedDocuments({
    DocumentType? type,
    String? category,
  });

  Future<void> cacheDocuments(List<DocumentHiveModel> documents);

  Future<DocumentHiveModel?> getCachedDocumentById(int id);

  Future<void> cacheDocument(DocumentHiveModel document);

  Future<String> saveDocumentFile({
    required int documentId,
    required String fileName,
    required List<int> bytes,
  });

  Future<void> updateDocumentDownloadStatus({
    required int documentId,
    required bool isDownloaded,
    String? localPath,
  });

  Future<void> deleteDocumentFile(int documentId);

  Future<void> clearCache();

  Future<List<String>> getCachedCategories();
}

@Injectable(as: DocumentLocalDataSource)
class DocumentLocalDataSourceImpl implements DocumentLocalDataSource {
  static const String _documentsBoxName = HiveBoxes.documents;
  static const String _downloadedDocumentsDir = 'downloaded_documents';

  @override
  Future<List<DocumentHiveModel>> getCachedDocuments({
    DocumentType? type,
    String? category,
  }) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    final allDocuments = box.values.toList();

    if (type == null && category == null) {
      return allDocuments;
    }

    return allDocuments.where((doc) {
      bool matchesType =
          type == null || doc.fileType.toLowerCase() == type.name;
      bool matchesCategory = category == null ||
          doc.category.toLowerCase() == category.toLowerCase() ||
          doc.categories
              .any((cat) => cat.toLowerCase() == category.toLowerCase());

      return matchesType && matchesCategory;
    }).toList();
  }

  @override
  Future<void> cacheDocuments(List<DocumentHiveModel> documents) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);

    for (final document in documents) {
      await box.put(document.id, document);
    }
  }

  @override
  Future<DocumentHiveModel?> getCachedDocumentById(int id) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    return box.get(id);
  }

  @override
  Future<void> cacheDocument(DocumentHiveModel document) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    await box.put(document.id, document);
  }

  @override
  Future<String> saveDocumentFile({
    required int documentId,
    required String fileName,
    required List<int> bytes,
  }) async {
    final appDir = await getApplicationDocumentsDirectory();
    final documentsDir = Directory('${appDir.path}/$_downloadedDocumentsDir');

    if (!await documentsDir.exists()) {
      await documentsDir.create(recursive: true);
    }

    // Create a unique filename to avoid conflicts
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileExtension = fileName.split('.').last;
    final uniqueFileName = '${documentId}_${timestamp}.$fileExtension';

    final file = File('${documentsDir.path}/$uniqueFileName');
    await file.writeAsBytes(bytes);

    return file.path;
  }

  @override
  Future<void> updateDocumentDownloadStatus({
    required int documentId,
    required bool isDownloaded,
    String? localPath,
  }) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    final document = box.get(documentId);

    if (document != null) {
      final updatedDocument = document.copyWith(
        isDownloaded: isDownloaded,
        localPath: localPath,
      );
      await box.put(documentId, updatedDocument);
    }
  }

  @override
  Future<void> deleteDocumentFile(int documentId) async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    final document = box.get(documentId);

    if (document?.localPath != null) {
      final file = File(document!.localPath!);
      if (await file.exists()) {
        await file.delete();
      }

      // Update the document to remove download status
      final updatedDocument = document.copyWith(
        isDownloaded: false,
        localPath: null,
      );
      await box.put(documentId, updatedDocument);
    }
  }

  @override
  Future<void> clearCache() async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    await box.clear();

    // Also delete all downloaded files
    final appDir = await getApplicationDocumentsDirectory();
    final documentsDir = Directory('${appDir.path}/$_downloadedDocumentsDir');

    if (await documentsDir.exists()) {
      await documentsDir.delete(recursive: true);
    }
  }

  @override
  Future<List<String>> getCachedCategories() async {
    final box = await Hive.openBox<DocumentHiveModel>(_documentsBoxName);
    final allDocuments = box.values.toList();

    final categories = <String>{};
    for (final document in allDocuments) {
      categories.add(document.category);
      categories.addAll(document.categories);
    }

    return categories.toList()..sort();
  }
}
