import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';

import '../../lib/app.dart';
import '../../lib/core/error/failures.dart';
import '../../lib/features/documents/domain/entities/document_entity.dart';
import '../../lib/features/documents/domain/repositories/i_document_repository.dart';
import '../../lib/features/auth/domain/repositories/i_auth_repository.dart';
import 'integration_test_helpers.dart';

void main() {
  group('Document Viewing and Downloading Flow Integration Tests', () {
    late MockDocumentRepository mockDocumentRepository;
    late MockAuthRepository mockAuthRepository;
    late List<DocumentEntity> testDocuments;

    setUpAll(() async {
      await IntegrationTestHelpers.setupIntegrationTest();
    });

    tearDownAll(() async {
      await IntegrationTestHelpers.tearDownIntegrationTest();
    });

    setUp(() {
      mockDocumentRepository = MockDocumentRepository();
      mockAuthRepository = MockAuthRepository();

      // Create test documents
      testDocuments = [
        IntegrationTestHelpers.createTestDocument(
          id: 1,
          title: 'Equipment Manual',
          type: DocumentType.manual,
          isDownloaded: false,
        ),
        IntegrationTestHelpers.createTestDocument(
          id: 2,
          title: 'Safety Procedure',
          type: DocumentType.safety,
          isDownloaded: true,
          localPath: '/cache/safety_procedure.pdf',
        ),
        IntegrationTestHelpers.createTestDocument(
          id: 3,
          title: 'Wiring Schematic',
          type: DocumentType.schematic,
          isDownloaded: false,
        ),
      ];

      // Setup auth mock
      final testUser = IntegrationTestHelpers.createTestUser();
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );

      // Setup document repository mocks
      when(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: anyNamed('category'),
      )).thenAnswer((_) async => Right(testDocuments));

      when(mockDocumentRepository.getDocumentCategories()).thenAnswer(
        (_) async => const Right(['equipment', 'safety', 'procedures']),
      );
    });

    testWidgets('Complete document flow - browse, search, and view',
        (tester) async {
      // Arrange
      when(mockDocumentRepository.getDocumentById(2)).thenAnswer(
        (_) async => Right(testDocuments[1]),
      );

      // Act - Launch app and navigate to documents
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Navigate to documents
      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      // Assert - Should show documents page
      expect(find.byKey(const Key('documents_page')), findsOneWidget);
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.text('Wiring Schematic'), findsOneWidget);

      // Should show download indicators
      expect(find.byKey(const Key('download_indicator_1')),
          findsNothing); // Not downloaded
      expect(find.byKey(const Key('download_indicator_2')),
          findsOneWidget); // Downloaded
      expect(find.byKey(const Key('download_indicator_3')),
          findsNothing); // Not downloaded

      // Act - Search for documents
      await tester.tap(find.byKey(const Key('search_button')));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('search_field')),
        'safety',
      );
      await tester.pumpAndSettle();

      // Mock search results
      when(mockDocumentRepository.searchDocuments(
        query: 'safety',
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => Right([testDocuments[1]]));

      await tester.tap(find.byKey(const Key('search_submit_button')));
      await tester.pumpAndSettle();

      // Assert - Should show filtered results
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.text('Equipment Manual'), findsNothing);
      expect(find.text('Wiring Schematic'), findsNothing);

      // Clear search
      await tester.tap(find.byKey(const Key('clear_search_button')));
      await tester.pumpAndSettle();

      // Should show all documents again
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.text('Wiring Schematic'), findsOneWidget);

      // Act - Open downloaded document
      await tester.tap(find.text('Safety Procedure'));
      await tester.pumpAndSettle();

      // Assert - Should open document viewer
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.byKey(const Key('pdf_viewer')), findsOneWidget);

      // Should show viewer controls
      expect(find.byKey(const Key('zoom_in_button')), findsOneWidget);
      expect(find.byKey(const Key('zoom_out_button')), findsOneWidget);
      expect(find.byKey(const Key('page_navigation')), findsOneWidget);

      // Verify document was loaded
      verify(mockDocumentRepository.getDocumentById(2)).called(1);
    });

    testWidgets('Document download flow - download and cache document',
        (tester) async {
      // Arrange
      var documentToDownload = testDocuments[0]; // Equipment Manual

      when(mockDocumentRepository.getDocumentById(1)).thenAnswer(
        (_) async => Right(documentToDownload),
      );

      // Mock download process
      when(mockDocumentRepository.downloadDocument(1)).thenAnswer((_) async {
        // Simulate download progress
        await Future.delayed(const Duration(milliseconds: 500));

        documentToDownload = documentToDownload.copyWith(
          isDownloaded: true,
          localPath: '/cache/equipment_manual.pdf',
        );

        return Right(documentToDownload);
      });

      // Act - Launch app and navigate to documents
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      // Act - Try to open non-downloaded document
      await tester.tap(find.text('Equipment Manual'));
      await tester.pumpAndSettle();

      // Assert - Should show download prompt
      expect(find.text('Document not downloaded'), findsOneWidget);
      expect(find.text('Download for offline access?'), findsOneWidget);
      expect(find.byKey(const Key('download_button')), findsOneWidget);
      expect(find.byKey(const Key('view_online_button')), findsOneWidget);

      // Act - Choose to download
      await tester.tap(find.byKey(const Key('download_button')));
      await tester.pump();

      // Assert - Should show download progress
      expect(
          find.byKey(const Key('download_progress_indicator')), findsOneWidget);
      expect(find.text('Downloading...'), findsOneWidget);

      // Wait for download completion
      await tester.pumpAndSettle();

      // Assert - Should open document viewer after download
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.byKey(const Key('pdf_viewer')), findsOneWidget);

      // Verify download was called
      verify(mockDocumentRepository.downloadDocument(1)).called(1);

      // Go back to documents list
      await tester.tap(find.byKey(const Key('back_button')));
      await tester.pumpAndSettle();

      // Assert - Document should now show as downloaded
      expect(find.byKey(const Key('download_indicator_1')), findsOneWidget);
    });

    testWidgets('Document download flow - download failure handling',
        (tester) async {
      // Arrange
      when(mockDocumentRepository.getDocumentById(3)).thenAnswer(
        (_) async => Right(testDocuments[2]),
      );

      // Mock download failure
      when(mockDocumentRepository.downloadDocument(3)).thenAnswer(
        (_) async => const Left(NetworkFailure(
          message: 'Download failed - network error',
        )),
      );

      // Act - Launch app and try to download
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Wiring Schematic'));
      await tester.pumpAndSettle();

      // Try to download
      await tester.tap(find.byKey(const Key('download_button')));
      await tester.pump();

      // Should show progress initially
      expect(
          find.byKey(const Key('download_progress_indicator')), findsOneWidget);

      await tester.pumpAndSettle();

      // Assert - Should show download error
      IntegrationTestHelpers.verifyErrorMessage(
          'Download failed - network error');
      expect(find.byKey(const Key('retry_download_button')), findsOneWidget);
      expect(find.byKey(const Key('view_online_button')), findsOneWidget);

      // Act - Retry download
      when(mockDocumentRepository.downloadDocument(3)).thenAnswer((_) async {
        final updatedDoc = testDocuments[2].copyWith(
          isDownloaded: true,
          localPath: '/cache/wiring_schematic.pdf',
        );
        return Right(updatedDoc);
      });

      await tester.tap(find.byKey(const Key('retry_download_button')));
      await tester.pumpAndSettle();

      // Assert - Should succeed on retry
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );
      expect(find.text('Wiring Schematic'), findsOneWidget);

      // Verify retry was called
      verify(mockDocumentRepository.downloadDocument(3)).called(2);
    });

    testWidgets('Document viewer - navigation and zoom controls',
        (tester) async {
      // Arrange
      when(mockDocumentRepository.getDocumentById(2)).thenAnswer(
        (_) async => Right(testDocuments[1]), // Downloaded document
      );

      // Act - Launch app and open document
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Safety Procedure'));
      await tester.pumpAndSettle();

      // Assert - Should show document viewer with controls
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );

      expect(find.byKey(const Key('pdf_viewer')), findsOneWidget);
      expect(find.byKey(const Key('zoom_in_button')), findsOneWidget);
      expect(find.byKey(const Key('zoom_out_button')), findsOneWidget);
      expect(find.byKey(const Key('page_navigation')), findsOneWidget);
      expect(find.text('Page 1 of 10'), findsOneWidget);

      // Act - Test zoom controls
      await tester.tap(find.byKey(const Key('zoom_in_button')));
      await tester.pumpAndSettle();

      // Should update zoom level indicator
      expect(find.text('150%'), findsOneWidget);

      await tester.tap(find.byKey(const Key('zoom_out_button')));
      await tester.pumpAndSettle();

      expect(find.text('100%'), findsOneWidget);

      // Act - Test page navigation
      await tester.tap(find.byKey(const Key('next_page_button')));
      await tester.pumpAndSettle();

      expect(find.text('Page 2 of 10'), findsOneWidget);

      await tester.tap(find.byKey(const Key('previous_page_button')));
      await tester.pumpAndSettle();

      expect(find.text('Page 1 of 10'), findsOneWidget);

      // Act - Test page jump
      await tester.tap(find.byKey(const Key('page_navigation')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('page_jump_dialog')), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('page_number_field')),
        '5',
      );
      await tester.tap(find.byKey(const Key('jump_to_page_button')));
      await tester.pumpAndSettle();

      expect(find.text('Page 5 of 10'), findsOneWidget);
    });

    testWidgets('Document filtering and categorization', (tester) async {
      // Arrange
      when(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'safety',
      )).thenAnswer((_) async => Right([testDocuments[1]]));

      when(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'equipment',
      )).thenAnswer((_) async => Right([testDocuments[0], testDocuments[2]]));

      // Act - Launch app and test filtering
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      // Act - Open filter menu
      await tester.tap(find.byKey(const Key('filter_button')));
      await tester.pumpAndSettle();

      // Assert - Should show category filters
      expect(find.text('Filter by Category'), findsOneWidget);
      expect(find.text('equipment'), findsOneWidget);
      expect(find.text('safety'), findsOneWidget);
      expect(find.text('procedures'), findsOneWidget);

      // Act - Filter by safety category
      await tester.tap(find.text('safety'));
      await tester.pumpAndSettle();

      // Assert - Should show only safety documents
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.text('Equipment Manual'), findsNothing);
      expect(find.text('Wiring Schematic'), findsNothing);

      // Act - Filter by equipment category
      await tester.tap(find.byKey(const Key('filter_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('equipment'));
      await tester.pumpAndSettle();

      // Assert - Should show equipment documents
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.text('Wiring Schematic'), findsOneWidget);
      expect(find.text('Safety Procedure'), findsNothing);

      // Act - Clear filters
      await tester.tap(find.byKey(const Key('clear_filters_button')));
      await tester.pumpAndSettle();

      // Assert - Should show all documents
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.text('Safety Procedure'), findsOneWidget);
      expect(find.text('Wiring Schematic'), findsOneWidget);

      // Verify filter calls
      verify(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'safety',
      )).called(1);

      verify(mockDocumentRepository.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: 'equipment',
      )).called(1);
    });

    testWidgets('Document offline access and sync', (tester) async {
      // Arrange - Start online, download document, then go offline
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      when(mockDocumentRepository.getDocumentById(1)).thenAnswer(
        (_) async => Right(testDocuments[0]),
      );

      // Mock successful download
      when(mockDocumentRepository.downloadDocument(1)).thenAnswer((_) async {
        final downloadedDoc = testDocuments[0].copyWith(
          isDownloaded: true,
          localPath: '/cache/equipment_manual.pdf',
        );
        return Right(downloadedDoc);
      });

      // Act - Launch app and download document
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      await tester.tap(find.byKey(const Key('documents_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Equipment Manual'));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('download_button')));
      await tester.pumpAndSettle();

      // Document should be downloaded and viewable
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );

      // Go back to documents list
      await tester.tap(find.byKey(const Key('back_button')));
      await tester.pumpAndSettle();

      // Simulate going offline
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      // Act - Try to access downloaded document offline
      await tester.tap(find.text('Equipment Manual'));
      await tester.pumpAndSettle();

      // Assert - Should open successfully from cache
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('document_viewer_page')),
      );
      expect(find.text('Equipment Manual'), findsOneWidget);
      expect(find.byKey(const Key('offline_indicator')), findsOneWidget);

      // Go back and try to access non-downloaded document
      await tester.tap(find.byKey(const Key('back_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Wiring Schematic'));
      await tester.pumpAndSettle();

      // Assert - Should show offline error
      IntegrationTestHelpers.verifyErrorMessage(
          'Document not available offline');
      expect(find.text('Download when online'), findsOneWidget);
    });
  });
}

/// Mock repository for testing
class MockDocumentRepository extends Mock implements IDocumentRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}
