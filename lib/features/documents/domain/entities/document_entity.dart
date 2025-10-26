import 'package:freezed_annotation/freezed_annotation.dart';
import 'file_entity.dart';

part 'document_entity.freezed.dart';

@freezed
abstract class DocumentEntity with _$DocumentEntity {
  const DocumentEntity._();

  const factory DocumentEntity({
    /// Changed to String to match API's upload_id
    required String id,
    required String title,
    required String description,
    required DocumentType type,
    required String fileUrl,
    required String fileName,
    required int fileSize,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<String> tags,
    required List<String> categories,
    String? relatedModel,
    String? keywords,
    int? uploadedBy,
    String? uploadedByName,

    /// Added files array from API
    @Default([]) List<FileEntity> files,
    bool? isDownloaded,
    String? localPath,
  }) = _DocumentEntity;

  // Business logic methods
  bool get isAvailableOffline => isDownloaded == true && localPath != null;

  String get fileSizeFormatted {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  String get fileExtension {
    return fileName.split('.').last.toLowerCase();
  }

  bool get isPdf => fileExtension == 'pdf';
  bool get isImage =>
      ['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(fileExtension);
  bool get isVideo =>
      ['mp4', 'avi', 'mov', 'wmv', 'flv'].contains(fileExtension);
}

enum DocumentType {
  manual,
  procedure,
  schematic,
  specification,
  safety,
  training,
  report,
  certificate,
  warranty,
  other;

  String get displayName {
    switch (this) {
      case DocumentType.manual:
        return 'Manual';
      case DocumentType.procedure:
        return 'Procedure';
      case DocumentType.schematic:
        return 'Schematic';
      case DocumentType.specification:
        return 'Specification';
      case DocumentType.safety:
        return 'Safety';
      case DocumentType.training:
        return 'Training';
      case DocumentType.report:
        return 'Report';
      case DocumentType.certificate:
        return 'Certificate';
      case DocumentType.warranty:
        return 'Warranty';
      case DocumentType.other:
        return 'Other';
    }
  }
}
