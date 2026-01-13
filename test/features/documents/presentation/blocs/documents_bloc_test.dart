import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
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
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'documents_bloc_test.mocks.dart';

@GenerateMocks([
  GetDocumentsUseCase,
  SearchDocumentsUseCase,
  DownloadDocumentUseCase,
  GetDocumentCategoriesUseCase,
  IDocumentRepository,
])
void main() {
  late DocumentsBloc bloc;
  late MockGetDocumentsUseCase mockGetDocumentsUseCase;
  late MockSearchDocumentsUseCase mockSearchDocumentsUseCase;
  late MockDownloadDocumentUseCase mockDownloadDocumentUseCase;
  late MockGetDocumentCategoriesUseCase mockGetDocumentCategoriesUseCase;
  late MockIDocumentRepository mockDocumentRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<DocumentEntity>>>(const Right([]));
    provideDummy<Either<Failure, String>>(const Right('path'));
    provideDummy<Either<Failure, List<String>>>(const Right([]));
    provideDummy<Either<Failure, void>>(const Right(null));
  });

  setUp(() {
    mockGetDocumentsUseCase = MockGetDocumentsUseCase();
    mockSearchDocumentsUseCase = MockSearchDocumentsUseCase();
    mockDownloadDocumentUseCase = MockDownloadDocumentUseCase();
    mockGetDocumentCategoriesUseCase = MockGetDocumentCategoriesUseCase();
    mockDocumentRepository = MockIDocumentRepository();

    bloc = DocumentsBloc(
      mockGetDocumentsUseCase,
      mockSearchDocumentsUseCase,
      mockDownloadDocumentUseCase,
      mockGetDocumentCategoriesUseCase,
      mockDocumentRepository,
    );
  });

  final tDocuments = [
    DocumentEntity(
      id: '1',
      title: 'T',
      description: 'D',
      type: DocumentType.manual,
      fileUrl: 'U',
      fileName: 'F',
      fileSize: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tags: [],
      categories: [],
    ),
  ];

  group('LoadDocuments', () {
    blocTest<DocumentsBloc, DocumentsState>(
      'should emit [isLoading: true, documents: [tDocuments], isLoading: false] when successful',
      build: () {
        when(mockGetDocumentsUseCase(
          page: anyNamed('page'),
          limit: anyNamed('limit'),
          type: anyNamed('type'),
          category: anyNamed('category'),
          searchQuery: anyNamed('searchQuery'),
        )).thenAnswer((_) async => Right(tDocuments));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadDocuments(page: 1)),
      expect: () => [
        const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false),
        DocumentsState(
            isLoading: false,
            documents: tDocuments,
            currentPage: 1,
            hasReachedMax: true),
      ],
    );

    blocTest<DocumentsBloc, DocumentsState>(
      'should emit [isLoading: true, errorMessage: failure, isLoading: false] when unsuccessful',
      build: () {
        when(mockGetDocumentsUseCase(
          page: anyNamed('page'),
          limit: anyNamed('limit'),
          type: anyNamed('type'),
          category: anyNamed('category'),
          searchQuery: anyNamed('searchQuery'),
        )).thenAnswer((_) async => const Left(ServerFailure(message: 'Error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadDocuments(page: 1)),
      expect: () => [
        const DocumentsState(
            isLoading: true,
            documents: [],
            currentPage: 1,
            hasReachedMax: false),
        isA<DocumentsState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', 'Error'),
      ],
    );
  });
}
