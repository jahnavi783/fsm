# Documents Feature

## Overview
The documents feature provides comprehensive document management capabilities including viewing, downloading, searching, and filtering documents. It supports multiple file types including PDFs, images, and videos.

## Architecture
Follows Clean Architecture with three main layers:

### Domain Layer
- **Entities**: `DocumentEntity` - Core business object representing a document
- **Repositories**: `IDocumentRepository` - Abstract interface for document operations
- **Use Cases**:
  - `GetDocumentsUseCase` - Fetch paginated list of documents
  - `SearchDocumentsUseCase` - Search documents by keyword
  - `GetDocumentByIdUseCase` - Fetch single document details
  - `DownloadDocumentUseCase` - Download document for offline access
  - `GetDocumentCategoriesUseCase` - Fetch available document categories

### Data Layer
- **Models**: 
  - `DocumentDto` - Data transfer object for API communication
  - `DocumentHiveModel` - Local storage model
- **Data Sources**:
  - `DocumentRemoteDataSource` - API communication
  - `DocumentLocalDataSource` - Local cache/offline storage
- **Repositories**: `DocumentRepositoryImpl` - Implementation of `IDocumentRepository`
- **API**: `DocumentApiClient` - Retrofit client for document endpoints

### Presentation Layer
- **Pages**:
  - `DocumentsPage` - Main documents list with search and filters
  - `DocumentViewerPage` - Document preview/viewer (supports PDF, images, videos)
- **BLoC**: `DocumentsBloc` - State management for documents
- **Widgets**: Reusable UI components (see Widgets section below)

## Supported File Types

### PDF Files
- View with syncfusion_flutter_pdfviewer
- Features: zoom, page navigation, text selection
- Supports both online and offline viewing

### Images
- Formats: jpg, jpeg, png, gif, bmp, webp
- Interactive viewer with zoom and pan
- Network and local file support

### Videos
- Formats: mp4, avi, mov, wmv, flv, mkv, webm
- Video player with chewie controls
- Supports both network streaming and offline playback

### Unsupported Types
- Displays info message with option to open in external app

## Reusable Widgets

### DocumentListItem
A card-based list item showing document information.

```dart
DocumentListItem(
  document: documentEntity,
  onTap: () => navigateToViewer(documentEntity),
  onDownload: () => downloadDocument(documentEntity),
  onDelete: () => deleteDocument(documentEntity),
  isDownloading: false,
)
```

### DocumentThumbnail
Displays a document thumbnail (image preview or file type icon).

```dart
DocumentThumbnail(
  document: documentEntity,
  width: 56.w,
  height: 56.h,
  borderRadius: BorderRadius.circular(8.r),
)
```

### DocumentSearchBar
A styled search input with loading state.

```dart
DocumentSearchBar(
  initialQuery: searchQuery,
  isLoading: isSearching,
  onSearchChanged: (query) => handleSearch(query),
  onClearSearch: () => clearSearch(),
)
```

### DocumentCategoryFilter
Horizontal scrollable filter chips for document types and categories.

```dart
DocumentCategoryFilter(
  categories: availableCategories,
  selectedType: currentType,
  selectedCategory: currentCategory,
  onTypeChanged: (type) => filterByType(type),
  onCategoryChanged: (category) => filterByCategory(category),
)
```

### DocumentShimmer
Loading skeleton for document list.

```dart
DocumentShimmer(
  itemCount: 5,
)
```

### DownloadProgressIndicator
Shows download progress with optional cancel button.

```dart
DownloadProgressIndicator(
  fileName: document.fileName,
  progress: 0.65, // 0.0 to 1.0, null for indeterminate
  onCancel: () => cancelDownload(),
)
```

### DocumentActionSheet
Full-featured bottom sheet for document selection (useful in other features).

```dart
// Show as modal
final selectedDocument = await DocumentActionSheet.show(
  context: context,
  documents: documentList,
  isLoading: isLoading,
  onLoadMore: () => loadMoreDocuments(),
  onSearch: (query) => searchDocuments(query),
);

// Or use as widget
DocumentActionSheet(
  documents: documentList,
  onDocumentSelected: (document) => handleSelection(document),
  initialSearchQuery: 'manual',
  initialType: DocumentType.manual,
)
```

## File Type Detection

Use `DocumentFileTypeHelper` utility for file type detection:

```dart
import '../utils/document_file_type_helper.dart';

// Check file type
if (DocumentFileTypeHelper.isVideo(fileType)) {
  // Handle video
}

// Get viewer type from entity
final viewerType = DocumentFileTypeHelper.getViewerType(document);

// Check if viewable
if (DocumentFileTypeHelper.isViewable(document)) {
  // Show in-app viewer
}
```

## Usage Examples

### Display Documents List
```dart
BlocBuilder<DocumentsBloc, DocumentsState>(
  builder: (context, state) {
    if (state.isLoading) {
      return DocumentShimmer();
    }
    
    return ListView.builder(
      itemCount: state.documents.length,
      itemBuilder: (context, index) {
        final document = state.documents[index];
        return DocumentListItem(
          document: document,
          onTap: () => context.router.push(
            DocumentViewerRoute(documentId: document.id),
          ),
          onDownload: () => context.read<DocumentsBloc>().add(
            DownloadDocument(document),
          ),
        );
      },
    );
  },
)
```

### Search and Filter
```dart
// Search
context.read<DocumentsBloc>().add(
  SearchDocuments(query: 'safety'),
);

// Filter by type
context.read<DocumentsBloc>().add(
  FilterByType(DocumentType.manual),
);

// Filter by category
context.read<DocumentsBloc>().add(
  FilterByCategory('maintenance'),
);
```

### Download for Offline Access
```dart
context.read<DocumentsBloc>().add(
  DownloadDocument(document),
);

// Check download status
if (document.isAvailableOffline) {
  // Document is downloaded
  print('Local path: ${document.localPath}');
}
```

### Open Document Viewer
```dart
// Via AutoRoute
context.router.push(
  DocumentViewerRoute(documentId: documentId),
);

// Or manually
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => DocumentViewerPage(
      documentId: documentId,
    ),
  ),
);
```

## ScreenUtil Usage
All widgets use `flutter_screenutil` for responsive sizing:
- `.w` for width
- `.h` for height
- `.sp` for font sizes
- `.r` for border radius

Example:
```dart
Container(
  width: 100.w,
  height: 50.h,
  padding: EdgeInsets.all(16.w),
  child: Text(
    'Document',
    style: TextStyle(fontSize: 14.sp),
  ),
)
```

## Offline Support
Documents can be downloaded for offline access:
- Downloads are stored locally using `path_provider`
- Hive is used to cache document metadata
- Offline documents are indicated with a download badge
- Users can delete offline copies to free up space

## State Management
Uses BLoC pattern for state management:
- `DocumentsBloc` manages documents list state
- Events: `LoadDocuments`, `SearchDocuments`, `DownloadDocument`, etc.
- States include loading, success, error with offline indicators

## Dependencies
- `syncfusion_flutter_pdfviewer` - PDF viewing
- `video_player` - Video playback
- `chewie` - Video player controls
- `url_launcher` - Open in external app
- `flutter_screenutil` - Responsive sizing
- `shimmer` - Loading skeletons

## Testing
Run tests with:
```bash
flutter test test/features/documents
```

## Error Handling
All use cases return `Either<Failure, Success>`:
- Network failures (no internet connection)
- Server failures (API errors)
- Cache failures (local storage issues)

User-friendly error messages are displayed via SnackBars in the UI.
