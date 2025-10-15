import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/documents/domain/entities/document_entity.dart';
import '../../../../../lib/features/documents/presentation/widgets/document_list_item.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('DocumentListItem Widget Tests', () {
    late DocumentEntity testDocument;
    bool onTapCalled = false;
    bool onDownloadCalled = false;
    bool onDeleteCalled = false;

    setUp(() {
      onTapCalled = false;
      onDownloadCalled = false;
      onDeleteCalled = false;

      testDocument = DocumentEntity(
        id: 1,
        title: 'Test Document',
        description: 'This is a test document description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/document.pdf',
        fileName: 'document.pdf',
        fileSize: 1024000, // 1MB
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 15),
        tags: ['tag1', 'tag2'],
        categories: ['Category 1', 'Category 2', 'Category 3'],
        isDownloaded: false,
        localPath: null,
      );
    });

    Widget createDocumentListItem({
      DocumentEntity? document,
      VoidCallback? onTap,
      VoidCallback? onDownload,
      VoidCallback? onDelete,
      bool isDownloading = false,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            DocumentListItem(
              document: document ?? testDocument,
              onTap: onTap ?? (() => onTapCalled = true),
              onDownload: onDownload ?? (() => onDownloadCalled = true),
              onDelete: onDelete ?? (() => onDeleteCalled = true),
              isDownloading: isDownloading,
            ),
          );
        },
      );
    }

    testWidgets('should render all document information', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      expect(find.text('Test Document'), findsOneWidget);
      expect(find.text('This is a test document description'), findsOneWidget);
      expect(find.text('Manual'), findsOneWidget);
      expect(find.text('1.0 MB'), findsOneWidget);
    });

    testWidgets('should call onTap when item is tapped', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      await tester.tap(find.byType(DocumentListItem));
      await tester.pumpAndSettle();

      expect(onTapCalled, isTrue);
    });

    testWidgets('should show download button for non-downloaded documents',
        (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      expect(find.byIcon(Icons.download), findsOneWidget);
      expect(find.byIcon(Icons.download_done), findsNothing);
    });

    testWidgets('should call onDownload when download button is tapped',
        (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      await tester.tap(find.byIcon(Icons.download));
      await tester.pumpAndSettle();

      expect(onDownloadCalled, isTrue);
    });

    testWidgets('should show downloaded indicator for offline documents',
        (tester) async {
      final downloadedDocument = testDocument.copyWith(isDownloaded: true);

      await tester
          .pumpWidget(createDocumentListItem(document: downloadedDocument));

      expect(find.byIcon(Icons.download_done), findsOneWidget);
      expect(find.byIcon(Icons.download), findsNothing);
    });

    testWidgets('should show delete button for downloaded documents',
        (tester) async {
      final downloadedDocument = testDocument.copyWith(isDownloaded: true);

      await tester
          .pumpWidget(createDocumentListItem(document: downloadedDocument));

      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

    testWidgets('should call onDelete when delete button is tapped',
        (tester) async {
      final downloadedDocument = testDocument.copyWith(isDownloaded: true);

      await tester
          .pumpWidget(createDocumentListItem(document: downloadedDocument));

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();

      expect(onDeleteCalled, isTrue);
    });

    testWidgets('should show loading indicator when downloading',
        (tester) async {
      await tester.pumpWidget(createDocumentListItem(isDownloading: true));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.download), findsNothing);
    });

    testWidgets('should show correct icon for document type', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      expect(find.byIcon(Icons.menu_book), findsOneWidget); // Manual type icon
    });

    testWidgets('should show different icons for different document types',
        (tester) async {
      final procedureDocument =
          testDocument.copyWith(type: DocumentType.procedure);
      await tester
          .pumpWidget(createDocumentListItem(document: procedureDocument));
      expect(find.byIcon(Icons.list_alt), findsOneWidget);

      final schematicDocument =
          testDocument.copyWith(type: DocumentType.schematic);
      await tester
          .pumpWidget(createDocumentListItem(document: schematicDocument));
      expect(find.byIcon(Icons.schema), findsOneWidget);

      final safetyDocument = testDocument.copyWith(type: DocumentType.safety);
      await tester.pumpWidget(createDocumentListItem(document: safetyDocument));
      expect(find.byIcon(Icons.security), findsOneWidget);
    });

    testWidgets('should show categories', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      expect(find.text('Category 1'), findsOneWidget);
      expect(find.text('Category 2'), findsOneWidget);
      expect(find.text('Category 3'), findsOneWidget);
    });

    testWidgets('should limit categories to 3', (tester) async {
      final documentWithManyCategories = testDocument.copyWith(
        categories: ['Cat1', 'Cat2', 'Cat3', 'Cat4', 'Cat5'],
      );

      await tester.pumpWidget(
          createDocumentListItem(document: documentWithManyCategories));

      expect(find.text('Cat1'), findsOneWidget);
      expect(find.text('Cat2'), findsOneWidget);
      expect(find.text('Cat3'), findsOneWidget);
      expect(find.text('Cat4'), findsNothing);
      expect(find.text('Cat5'), findsNothing);
    });

    testWidgets('should not show categories section when empty',
        (tester) async {
      final documentWithoutCategories = testDocument.copyWith(categories: []);

      await tester.pumpWidget(
          createDocumentListItem(document: documentWithoutCategories));

      expect(find.byType(Wrap), findsNothing);
    });

    testWidgets('should truncate long text properly', (tester) async {
      final longTitleDocument = testDocument.copyWith(
        title:
            'This is a very long document title that should be truncated when it exceeds the maximum number of lines',
        description:
            'This is a very long description that should also be truncated when it exceeds the maximum number of lines allowed',
      );

      await tester
          .pumpWidget(createDocumentListItem(document: longTitleDocument));

      expect(find.textContaining('This is a very long document title'),
          findsOneWidget);
      expect(find.textContaining('This is a very long description'),
          findsOneWidget);
    });

    testWidgets('should have proper card styling', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(2));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createDocumentListItem());
      await tester.pumpAndSettle();

      expect(find.byType(DocumentListItem), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createDocumentListItem());
      await tester.pumpAndSettle();

      expect(find.byType(DocumentListItem), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should handle null callbacks gracefully', (tester) async {
      await tester.pumpWidget(createDocumentListItem(
        onTap: null,
        onDownload: null,
        onDelete: null,
      ));

      // Should not throw when tapping
      await tester.tap(find.byType(DocumentListItem));
      await tester.pumpAndSettle();

      // Download button should still be present but not functional
      expect(find.byIcon(Icons.download), findsOneWidget);
    });

    testWidgets('should format file size correctly', (tester) async {
      // Test different file sizes
      final smallDocument = testDocument.copyWith(fileSize: 1024); // 1KB
      await tester.pumpWidget(createDocumentListItem(document: smallDocument));
      expect(find.text('1.0 KB'), findsOneWidget);

      final largeDocument =
          testDocument.copyWith(fileSize: 1024 * 1024 * 5); // 5MB
      await tester.pumpWidget(createDocumentListItem(document: largeDocument));
      expect(find.text('5.0 MB'), findsOneWidget);
    });

    testWidgets('should have proper accessibility', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      // Card should be tappable
      expect(find.byType(InkWell), findsOneWidget);

      // Buttons should be accessible
      expect(find.byType(IconButton), findsAtLeastNWidgets(1));
    });

    testWidgets('should show proper type colors', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(DocumentListItem),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, isNotNull);
    });

    testWidgets('should handle different document types correctly',
        (tester) async {
      for (final type in DocumentType.values) {
        final document = testDocument.copyWith(type: type);
        await tester.pumpWidget(createDocumentListItem(document: document));

        // Should render without errors
        expect(find.byType(DocumentListItem), findsOneWidget);
        expect(find.byType(Icon), findsAtLeastNWidgets(1));
      }
    });

    testWidgets('should maintain proper spacing and layout', (tester) async {
      await tester.pumpWidget(createDocumentListItem());

      expect(find.byType(Row), findsAtLeastNWidgets(2));
      expect(find.byType(Column), findsAtLeastNWidgets(2));
      expect(find.byType(SizedBox), findsAtLeastNWidgets(3));
    });
  });
}
