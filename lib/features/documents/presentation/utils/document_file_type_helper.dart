import '../../domain/entities/document_entity.dart';

/// Helper class to detect and handle different document file types
class DocumentFileTypeHelper {
  /// Check if the file type represents a PDF
  static bool isPdf(String fileType) {
    return fileType.toLowerCase() == 'application/pdf' ||
        fileType.toLowerCase() == 'pdf';
  }

  /// Check if the file type represents an image
  static bool isImage(String fileType) {
    final imageTypes = [
      'png',
      'jpg',
      'jpeg',
      'gif',
      'bmp',
      'webp',
      'image/png',
      'image/jpeg',
      'image/gif',
      'image/bmp',
      'image/webp',
    ];
    return imageTypes.contains(fileType.toLowerCase());
  }

  /// Check if the file type represents a video
  static bool isVideo(String fileType) {
    final videoTypes = [
      'mp4',
      'mov',
      'avi',
      'mkv',
      'webm',
      'video/mp4',
      'video/quicktime',
      'video/x-msvideo',
      'video/x-matroska',
      'video/webm',
    ];
    return videoTypes.contains(fileType.toLowerCase());
  }

  /// Check if the file extension represents a PDF
  static bool isPdfByExtension(String extension) {
    return extension.toLowerCase() == 'pdf';
  }

  /// Check if the file extension represents an image
  static bool isImageByExtension(String extension) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(extension.toLowerCase());
  }

  /// Check if the file extension represents a video
  static bool isVideoByExtension(String extension) {
    final videoExtensions = ['mp4', 'avi', 'mov', 'wmv', 'flv', 'mkv', 'webm'];
    return videoExtensions.contains(extension.toLowerCase());
  }

  /// Get file type from document entity using both fileType and extension
  static DocumentViewerType getViewerType(DocumentEntity document) {
    // First check by file extension
    if (document.isPdf) {
      return DocumentViewerType.pdf;
    } else if (document.isImage) {
      return DocumentViewerType.image;
    } else if (document.isVideo) {
      return DocumentViewerType.video;
    }

    // Fallback: check by MIME type if available in a potential fileType field
    // This would need to be exposed from the entity if it has such a field
    return DocumentViewerType.unsupported;
  }

  /// Check if a document is viewable in the app
  static bool isViewable(DocumentEntity document) {
    return document.isPdf || document.isImage || document.isVideo;
  }
}

/// Enum to represent the type of viewer to use for a document
enum DocumentViewerType {
  pdf,
  image,
  video,
  unsupported,
}
