import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/document_entity.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

@freezed
class DocumentDto with _$DocumentDto {
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
      type: _parseDocumentType(fileType),
      fileUrl: fileUrl,
      fileName: _extractFileName(fileUrl),
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

  DocumentType _parseDocumentType(String fileType) {
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

  String _extractFileName(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments.last : 'document';
  }
}

@freezed
class DocumentResponseDto with _$DocumentResponseDto {
  const factory DocumentResponseDto({
    @JsonKey(name: 'documents') required List<DocumentDto> documents,
    required int total,
    required int page,
    @JsonKey(name: 'pages') required int pageSize,
  }) = _DocumentResponseDto;

  factory DocumentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseDtoFromJson(json);
}

@HiveType(typeId: 8)
@freezed
class DocumentHiveModel with _$DocumentHiveModel {
  const DocumentHiveModel._();

  const factory DocumentHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required String fileUrl,
    @HiveField(4) required String fileType,
    @HiveField(5) required int fileSize,
    @HiveField(6) required String category,
    @HiveField(7) String? relatedModel,
    @HiveField(8) String? keywords,
    @HiveField(9) int? uploadedBy,
    @HiveField(10) required DateTime createdAt,
    @HiveField(11) required DateTime updatedAt,
    @HiveField(12) @Default([]) List<String> tags,
    @HiveField(13) @Default([]) List<String> categories,
    @HiveField(14) required DateTime cachedAt,
    @HiveField(15) bool? isDownloaded,
    @HiveField(16) String? localPath,
  }) = _DocumentHiveModel;

  factory DocumentHiveModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentHiveModelFromJson(json);

  factory DocumentHiveModel.fromDto(
    DocumentDto dto, {
    bool? isDownloaded,
    String? localPath,
  }) {
    return DocumentHiveModel(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      fileUrl: dto.fileUrl,
      fileType: dto.fileType,
      fileSize: dto.fileSize,
      category: dto.category,
      relatedModel: dto.relatedModel,
      keywords: dto.keywords,
      uploadedBy: dto.uploadedBy,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      tags: dto.tags,
      categories: dto.categories.isNotEmpty ? dto.categories : [dto.category],
      cachedAt: DateTime.now(),
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }

  DocumentEntity toEntity() {
    return DocumentEntity(
      id: id,
      title: title,
      description: description,
      type: _parseDocumentType(fileType),
      fileUrl: fileUrl,
      fileName: _extractFileName(fileUrl),
      fileSize: fileSize,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tags: tags,
      categories: categories,
      relatedModel: relatedModel,
      keywords: keywords,
      uploadedBy: uploadedBy,
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }

  DocumentType _parseDocumentType(String fileType) {
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

  String _extractFileName(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments.last : 'document';
  }
}
