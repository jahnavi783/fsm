import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/document_entity.dart';
import 'file_dto.dart';
import 'uploaded_by_dto.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

@freezed
abstract class DocumentDto with _$DocumentDto {
  const DocumentDto._();

  const factory DocumentDto({
    /// API returns 'upload_id' as String, not 'id' as int
    @JsonKey(name: 'upload_id') required String uploadId,
    required String title,
    required String description,
    required String category,
    @JsonKey(name: 'related_model') String? relatedModel,
    /// API returns nested array of files instead of single file_url
    required List<FileDto> files,
    /// API returns uploaded_by as object, not just int
    @JsonKey(name: 'uploaded_by') required UploadedByDto uploadedBy,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    /// Optional fields from API
    List<String>? keywords,
    @Default([]) List<String> tags,
  }) = _DocumentDto;

  factory DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);

  DocumentEntity toEntity({
    bool? isDownloaded,
    String? localPath,
  }) {
    // Use the first file from the files array for compatibility
    // Note: 'files' will be available after build_runner generates the code
    final filesList = files;
    final primaryFile = filesList.isNotEmpty ? filesList.first : null;

    return DocumentEntity(
      id: uploadId,
      title: title,
      description: description,
      type: DocumentDto.parseDocumentType(category),
      fileUrl: primaryFile?.fileUrl ?? '',
      fileName: primaryFile?.filename ?? 'document',
      fileSize: primaryFile?.fileSize ?? 0,
      createdAt: DateTime.parse(createdAt),
      updatedAt: updatedAt != null && updatedAt!.isNotEmpty ? DateTime.parse(updatedAt!) : DateTime.parse(createdAt),
      tags: tags,
      categories: [category],
      relatedModel: relatedModel,
      keywords: keywords?.join(', '),
      uploadedBy: uploadedBy.id,
      uploadedByName: uploadedBy.fullName,
      files: filesList,
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }

  static DocumentType parseDocumentType(String fileType) {
    switch (fileType.toLowerCase()) {
      case 'manual':
        return DocumentType.manual;
      case 'procedure':
        return DocumentType.procedure;
      case 'schematic':
        return DocumentType.schematic;
      case 'specification':
        return DocumentType.specification;
      case 'safety':
        return DocumentType.safety;
      case 'training':
        return DocumentType.training;
      case 'report':
        return DocumentType.report;
      case 'certificate':
        return DocumentType.certificate;
      case 'warranty':
        return DocumentType.warranty;
      default:
        return DocumentType.other;
    }
  }

  static String extractFileName(String filename) {
    return filename.split('/').last;
  }
}

@freezed
abstract class DocumentResponseDto with _$DocumentResponseDto {
  const factory DocumentResponseDto({
    /// API returns 'uploads' array, not 'documents'
    @JsonKey(name: 'uploads') required List<DocumentDto> documents,
    required int total,
    required int page,
    /// API returns 'pages' for total pages
    required int pages,
  }) = _DocumentResponseDto;

  factory DocumentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseDtoFromJson(json);
}
