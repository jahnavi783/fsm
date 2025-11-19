import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_entity.freezed.dart';

/// Domain entity representing an individual file within a document
/// Maps from FileDto in the data layer
@freezed
abstract class FileEntity with _$FileEntity {
  const FileEntity._();

  const factory FileEntity({
    /// Unique file identifier from API
    required int id,

    /// File name with extension (e.g., "manual.pdf")
    String? fileName,

    /// Direct URL to download/access the file
    required String fileUrl,

    /// File type/MIME type (e.g., "application/pdf", "image/png")
    required String fileType,

    /// File size in bytes
    required int fileSize,

    /// Whether file has been downloaded locally
    bool? isDownloaded,

    /// Path to locally cached file (null if not downloaded)
    String? localPath,
  }) = _FileEntity;

  // Business logic methods

  /// Whether file is available offline (downloaded and path exists)
  bool get isAvailableOffline => isDownloaded == true && localPath != null;

  /// Extract file extension from fileName
  // String get fileExtension {
  //   if (fileName?.isEmpty ?? true) {
  //     return '';
  //   }
  //   return fileName!.split('.').last.toLowerCase();
  // }
  /// Extract file extension safely (fallback to fileType or URL)
  String get fileExtension {
    // 1. Prefer MIME type "video/mp4"
    if (fileType.isNotEmpty && fileType.contains('/')) {
      return fileType.split('/').last.toLowerCase();
    }

    // 2. Fall back to URL extension
    final uri = Uri.tryParse(fileUrl);
    final path = uri?.path.toLowerCase() ?? '';

    if (path.contains('.')) {
      return path.split('.').last; // extract ".mp4"
    }

    return '';
  }

  /// Check if video
  bool get isVideo {
    final ext = fileExtension.toLowerCase();
    return ['mp4', 'mov', 'avi', 'mkv', 'wmv', 'flv', 'webm'].contains(ext);
  }

  /// Check if PDF
  bool get isPdf => fileExtension == 'pdf';

  /// Check if image
  bool get isImage => [
        'jpg',
        'jpeg',
        'png',
        'gif',
        'bmp',
        'webp',
      ].contains(fileExtension);

  /// Format file size for display (e.g., "1.5 MB")
  String get fileSizeFormatted {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}
