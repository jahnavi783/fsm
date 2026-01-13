import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/documents/data/datasources/document_local_datasource.dart';
import 'package:fsm/features/documents/data/models/document_hive_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:flutter/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DocumentLocalDataSourceImpl dataSource;
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DocumentHiveModelAdapter());
    }
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  setUp(() async {
    dataSource = DocumentLocalDataSourceImpl();

    // Clear Hive between tests
    final boxName = 'documents'; // From DocumentLocalDataSourceImpl
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box<DocumentHiveModel>(boxName).clear();
    }

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return tempDir.path;
        }
        return null;
      },
    );
  });

  final tDocumentModel = DocumentHiveModel(
    id: '1',
    title: 'Test',
    description: 'Desc',
    type: 0,
    fileUrl: 'url',
    fileName: 'test.pdf',
    fileSize: 1024,
    createdAt: DateTime(2025),
    updatedAt: DateTime(2025),
    tags: [],
    categories: ['cat1'],
    category: 'cat1',
    fileType: 'pdf',
    cachedAt: DateTime(2025),
  );

  group('getCachedDocuments', () {
    test('should return all documents when no filters are applied', () async {
      // Act
      await dataSource.cacheDocuments([tDocumentModel]);
      final result = await dataSource.getCachedDocuments();

      // Assert
      expect(result.length, 1);
      expect(result.first.id, '1');
    });

    test('should filter by category', () async {
      // Arrange
      await dataSource.cacheDocuments([
        tDocumentModel,
        tDocumentModel
            .copyWith(id: '2', category: 'cat2', categories: ['cat2']),
      ]);

      // Act
      final result = await dataSource.getCachedDocuments(category: 'cat1');

      // Assert
      expect(result.length, 1);
      expect(result.first.id, '1');
    });
  });

  group('cacheDocuments', () {
    test('should put documents in box', () async {
      // Act
      await dataSource.cacheDocuments([tDocumentModel]);

      // Assert
      final result = await dataSource.getCachedDocumentById('1');
      expect(result, tDocumentModel);
    });
  });

  group('updateDocumentDownloadStatus', () {
    test('should update download status in cache', () async {
      // Arrange
      await dataSource.cacheDocuments([tDocumentModel]);

      // Act
      await dataSource.updateDocumentDownloadStatus(
        documentId: '1',
        isDownloaded: true,
        localPath: 'local/path',
      );

      // Assert
      final result = await dataSource.getCachedDocumentById('1');
      expect(result?.isDownloaded, true);
      expect(result?.localPath, 'local/path');
    });
  });

  group('clearCache', () {
    test('should remove all documents from cache', () async {
      // Arrange
      await dataSource.cacheDocuments([tDocumentModel]);

      // Act
      await dataSource.clearCache();

      // Assert
      final result = await dataSource.getCachedDocuments();
      expect(result.isEmpty, true);
    });
  });
}
