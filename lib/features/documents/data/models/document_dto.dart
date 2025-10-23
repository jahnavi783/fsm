import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/document_entity.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

@freezed
abstract class DocumentDto with _$DocumentDto {
  const DocumentDto._();

  const factory DocumentDto({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_size') required int fileSize,
    required String category,
    @JsonKey(name: 'related_model') String? relatedModel,
    String? keywords,
    @JsonKey(name: 'uploaded_by') int? uploadedBy,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @Default([]) List<String> tags,
    @Default([]) List<String> categories,
  }) = _DocumentDto;

  factory DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);

  DocumentEntity toEntity({
    bool? isDownloaded,
    String? localPath,
  }) {
    return DocumentEntity(
      id: id,
      title: title,
      description: description,
      type: DocumentDto.parseDocumentType(fileType),
      fileUrl: fileUrl,
      fileName: DocumentDto.extractFileName(fileUrl),
      fileSize: fileSize,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      tags: tags,
      categories: categories.isNotEmpty ? categories : [category],
      relatedModel: relatedModel,
      keywords: keywords,
      uploadedBy: uploadedBy,
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

  static String extractFileName(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments.last : 'document';
  }
}

@freezed
abstract class DocumentResponseDto with _$DocumentResponseDto {
  const factory DocumentResponseDto({
    @JsonKey(name: 'documents') required List<DocumentDto> documents,
    required int total,
    required int page,
    @JsonKey(name: 'pages') required int pageSize,
  }) = _DocumentResponseDto;

  factory DocumentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseDtoFromJson(json);
}
