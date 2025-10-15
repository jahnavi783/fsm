import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/download_document_usecase.dart';
import 'package:fsm/features/documents/domain/usecases/get_document_categories_usecase.dart';
import 'package:fsm/features/documents/domain/usecases/get_documents_usecase.dart';
import 'package:fsm/features/documents/domain/usecases/search_documents_usecase.dart';
import 'package:fsm/features/documents/presentation/blocs/documents/documents_bloc.dart';
import 'package:fsm/features/documents/presentation/blocs/documents/documents_event.dart';
import 'package:fsm/features/documents/presentation/blocs/documents/documents_state.dart';

// Mock classes
class MockGetDocumentsUseCase extends Mock implements GetDocumentsUseCase {}

class MockSearchDocumentsUseCase extends Mock
    implements SearchDocumentsUseCase {}

class MockDownloadDocumentUseCase extends Mock
    implements DownloadDocumentUseCase {}

class MockGetDocumentCategoriesUseCase extends Mock
    implements GetDocumentCategoriesUseCase {}

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('DocumentsBloc', () {
    late DocumentsBloc documentsBloc;
    late MockGetDocumentsUseCase mockGetDocumentsUseCase;
    late MockSearchDocumentsUseCase mockSearchDocumentsUseCase;
    late MockDownloadDocumentUseCase mockDownloadDocumentUseCase;
    late MockGetDocumentCategoriesUseCase mockGetDocumentCategoriesUseCase;
    late MockDocumentRepository mockDocumentRepository;

    // Test data
    const testDocuments = [
      DocumentEntity(
        id: 1,
        title: 'Test Manual',
        description: 'Test manual description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/manual.pdf',
        fileName: 'manual.pdf',
        fileSize: 1024,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        tags: ['manual', 'test'],
        categories: ['equipment'],
      ),
      DocumentEntity(
        id: 2,
        title: 'Safety Procedure',
        description: 'Safety procedure document',
        type: DocumentType.safety,
        fileUrl: 'https://example.com/safety.pdf',
        fileName: 'safety.pdf',
        fileSize: 2048,
        createdAt: DateTime(2024, 1, 2),
        updatedAt: DateTime(2024, 1, 2),
        tags: ['safety', 'procedure'],
        categories: ['safety'],
      ),
    ];

    const testCategories = ['Equipment', 'Safety', 'Maintenance'];
    const testFailure = NetworkFailure(message: 'Network error');

    setUp(() {
      mockGetDocumentsUseCase = MockGetDocumentsUseCase();
      mockSearchDocumentsUseCase = MockSearchDocumentsUseCase();
      mockDownloadDocumentUseCase = MockDownloadDocumentUseCase();
      mockGetDocumentCategoriesUseCase = MockGetDocumentCategoriesUseCase();
      mockDocumentRepository = MockDocumentRepository();

      documentsBloc = DocumentsBloc(
        mockGetDocumentsUseCase,
        mockSearchDocumentsUseCase,
        mockDownloadDocumentUseCase,
        mockGetDocumentCategoriesUseCase,
        mockDocumentRepository,
      );
    });

    tearDown(() {
      documentsBloc.close();
    });

    test('initial state should be DocumentsState with default values', () {
      expect(documentsBloc.state, equals(const DocumentsState()));
    });

    group('LoadDocuments', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'emits [loading, success] when load documents succeeds',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.loadDocuments()),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true, // Less than limit (20)
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: null,
                category: null,
                searchQuery: null,
              )).called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'emits [loading, error] when load documents fails',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Left(testFailure));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.loadDocuments()),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            errorMessage:
                'No internet connection. Please check your network and try again.',
            isOffline: true,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: null,
                category: null,
                searchQuery: null,
              )).called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'emits correct state when loading with filters',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.loadDocuments(
          type: DocumentType.manual,
          category: 'equipment',
          searchQuery: 'test',
        )),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true,
            selectedType: DocumentType.manual,
            selectedCategory: 'equipment',
            searchQuery: 'test',
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: DocumentType.manual,
                category: 'equipment',
                searchQuery: 'test',
              )).called(1);
        },
      );
    });

    group('SearchDocuments', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'emits [searching, success] when search succeeds',
        build: () {
          when(() => mockSearchDocumentsUseCase(
                query: any(named: 'query'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                page: any(named: 'page'),
                limit: any(named: 'limit'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.searchDocuments(
          query: 'manual',
        )),
        expect: () => [
          const DocumentsState(
            isSearching: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isSearching: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true,
            searchQuery: 'manual',
          ),
        ],
        verify: (_) {
          verify(() => mockSearchDocumentsUseCase(
                query: 'manual',
                type: null,
                category: null,
                page: 1,
                limit: 20,
              )).called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'emits [searching, error] when search fails',
        build: () {
          when(() => mockSearchDocumentsUseCase(
                query: any(named: 'query'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                page: any(named: 'page'),
                limit: any(named: 'limit'),
              )).thenAnswer((_) async => const Left(testFailure));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.searchDocuments(
          query: 'manual',
        )),
        expect: () => [
          const DocumentsState(
            isSearching: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isSearching: false,
            errorMessage:
                'No internet connection. Please check your network and try again.',
            isOffline: true,
          ),
        ],
        verify: (_) {
          verify(() => mockSearchDocumentsUseCase(
                query: 'manual',
                type: null,
                category: null,
                page: 1,
                limit: 20,
              )).called(1);
        },
      );
    });

    group('DownloadDocument', () {
      const testDocument = DocumentEntity(
        id: 1,
        title: 'Test Manual',
        description: 'Test manual description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/manual.pdf',
        fileName: 'manual.pdf',
        fileSize: 1024,
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-01T00:00:00Z',
        tags: ['manual', 'test'],
        categories: ['equipment'],
      );

      const testLocalPath = '/local/path/manual.pdf';

      blocTest<DocumentsBloc, DocumentsState>(
        'emits [downloading, success] when download succeeds',
        build: () {
          when(() => mockDownloadDocumentUseCase(
                document: any(named: 'document'),
              )).thenAnswer((_) async => const Right(testLocalPath));
          return documentsBloc;
        },
        seed: () => const DocumentsState(documents: [testDocument]),
        act: (bloc) =>
            bloc.add(const DocumentsEvent.downloadDocument(testDocument)),
        expect: () => [
          const DocumentsState(
            documents: [testDocument],
            isDownloading: true,
            downloadingDocumentId: '1',
          ),
          DocumentsState(
            documents: [
              testDocument.copyWith(
                isDownloaded: true,
                localPath: testLocalPath,
              ),
            ],
            isDownloading: false,
            downloadingDocumentId: null,
          ),
        ],
        verify: (_) {
          verify(() => mockDownloadDocumentUseCase(
                document: testDocument,
              )).called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'emits [downloading, error] when download fails',
        build: () {
          when(() => mockDownloadDocumentUseCase(
                document: any(named: 'document'),
              )).thenAnswer((_) async => const Left(testFailure));
          return documentsBloc;
        },
        seed: () => const DocumentsState(documents: [testDocument]),
        act: (bloc) =>
            bloc.add(const DocumentsEvent.downloadDocument(testDocument)),
        expect: () => [
          const DocumentsState(
            documents: [testDocument],
            isDownloading: true,
            downloadingDocumentId: '1',
          ),
          const DocumentsState(
            documents: [testDocument],
            isDownloading: false,
            downloadingDocumentId: null,
            errorMessage:
                'Failed to download document: No internet connection. Please check your network and try again.',
          ),
        ],
        verify: (_) {
          verify(() => mockDownloadDocumentUseCase(
                document: testDocument,
              )).called(1);
        },
      );
    });

    group('DeleteDownloadedDocument', () {
      const downloadedDocument = DocumentEntity(
        id: 1,
        title: 'Test Manual',
        description: 'Test manual description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/manual.pdf',
        fileName: 'manual.pdf',
        fileSize: 1024,
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-01T00:00:00Z',
        tags: ['manual', 'test'],
        categories: ['equipment'],
        isDownloaded: true,
        localPath: '/local/path/manual.pdf',
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'updates document when delete succeeds',
        build: () {
          when(() => mockDocumentRepository.deleteDownloadedDocument(any()))
              .thenAnswer((_) async => const Right(null));
          return documentsBloc;
        },
        seed: () => const DocumentsState(documents: [downloadedDocument]),
        act: (bloc) =>
            bloc.add(const DocumentsEvent.deleteDownloadedDocument(1)),
        expect: () => [
          DocumentsState(
            documents: [
              downloadedDocument.copyWith(
                isDownloaded: false,
                localPath: null,
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(() => mockDocumentRepository.deleteDownloadedDocument(1))
              .called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'emits error when delete fails',
        build: () {
          when(() => mockDocumentRepository.deleteDownloadedDocument(any()))
              .thenAnswer((_) async => const Left(testFailure));
          return documentsBloc;
        },
        seed: () => const DocumentsState(documents: [downloadedDocument]),
        act: (bloc) =>
            bloc.add(const DocumentsEvent.deleteDownloadedDocument(1)),
        expect: () => [
          const DocumentsState(
            documents: [downloadedDocument],
            errorMessage:
                'Failed to delete document: No internet connection. Please check your network and try again.',
          ),
        ],
        verify: (_) {
          verify(() => mockDocumentRepository.deleteDownloadedDocument(1))
              .called(1);
        },
      );
    });

    group('LoadCategories', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'updates categories when load succeeds',
        build: () {
          when(() => mockGetDocumentCategoriesUseCase())
              .thenAnswer((_) async => const Right(testCategories));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.loadCategories()),
        expect: () => [
          const DocumentsState(categories: testCategories),
        ],
        verify: (_) {
          verify(() => mockGetDocumentCategoriesUseCase()).called(1);
        },
      );

      blocTest<DocumentsBloc, DocumentsState>(
        'does not emit error when load categories fails',
        build: () {
          when(() => mockGetDocumentCategoriesUseCase())
              .thenAnswer((_) async => const Left(testFailure));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.loadCategories()),
        expect: () => [],
        verify: (_) {
          verify(() => mockGetDocumentCategoriesUseCase()).called(1);
        },
      );
    });

    group('FilterByType', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'triggers LoadDocuments with type filter',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) =>
            bloc.add(const DocumentsEvent.filterByType(DocumentType.manual)),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true,
            selectedType: DocumentType.manual,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: DocumentType.manual,
                category: null,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('FilterByCategory', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'triggers LoadDocuments with category filter',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) =>
            bloc.add(const DocumentsEvent.filterByCategory('equipment')),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true,
            selectedCategory: 'equipment',
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: null,
                category: 'equipment',
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('ClearSearch', () {
      blocTest<DocumentsBloc, DocumentsState>(
        'triggers LoadDocuments without search query',
        build: () {
          when(() => mockGetDocumentsUseCase(
                page: any(named: 'page'),
                limit: any(named: 'limit'),
                type: any(named: 'type'),
                category: any(named: 'category'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testDocuments));
          return documentsBloc;
        },
        act: (bloc) => bloc.add(const DocumentsEvent.clearSearch()),
        expect: () => [
          const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false,
          ),
          const DocumentsState(
            isLoading: false,
            documents: testDocuments,
            currentPage: 1,
            hasReachedMax: true,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDocumentsUseCase(
                page: 1,
                limit: 20,
                type: null,
                category: null,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('State getters', () {
      test('hasDocuments returns true when documents list is not empty', () {
        const state = DocumentsState(documents: testDocuments);
        expect(state.hasDocuments, isTrue);
      });

      test('hasDocuments returns false when documents list is empty', () {
        const state = DocumentsState();
        expect(state.hasDocuments, isFalse);
      });

      test('hasError returns true when errorMessage is not null', () {
        const state = DocumentsState(errorMessage: 'Error');
        expect(state.hasError, isTrue);
      });

      test('hasError returns false when errorMessage is null', () {
        const state = DocumentsState();
        expect(state.hasError, isFalse);
      });

      test('canLoadMore returns true when conditions are met', () {
        const state = DocumentsState(
          hasReachedMax: false,
          isLoadingMore: false,
          isLoading: false,
        );
        expect(state.canLoadMore, isTrue);
      });

      test('canLoadMore returns false when hasReachedMax is true', () {
        const state = DocumentsState(hasReachedMax: true);
        expect(state.canLoadMore, isFalse);
      });

      test('isSearchMode returns true when searchQuery is not empty', () {
        const state = DocumentsState(searchQuery: 'test');
        expect(state.isSearchMode, isTrue);
      });

      test('isSearchMode returns false when searchQuery is empty', () {
        const state = DocumentsState(searchQuery: '');
        expect(state.isSearchMode, isFalse);
      });

      test('downloadedDocumentsCount returns correct count', () {
        const documents = [
          testDocuments.first.copyWith(isDownloaded: true, localPath: '/path1'),
          testDocuments.last,
        ];
        final state = DocumentsState(documents: documents);
        expect(state.downloadedDocumentsCount, equals(1));
      });
    });
  });
}
