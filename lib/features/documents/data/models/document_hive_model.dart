import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/entities/file_entity.dart';
import 'document_dto.dart';

part 'document_hive_model.freezed.dart';
part 'document_hive_model.g.dart';

@freezed
@HiveType(typeId: HiveBoxes.documentEntityTypeId)
abstract class DocumentHiveModel with _$DocumentHiveModel {
  const factory DocumentHiveModel({
    /// Changed to String to match API's upload_id
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required int type, // DocumentType as int
    @HiveField(4) required String fileUrl,
    @HiveField(5) required String fileName,
    @HiveField(6) required int fileSize,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
    @HiveField(9) required List<String> tags,
    @HiveField(10) required List<String> categories,
    @HiveField(11) String? relatedModel,
    @HiveField(12) String? keywords,
    @HiveField(13) int? uploadedBy,
    @HiveField(14) bool? isDownloaded,
    @HiveField(15) String? localPath,
    @HiveField(16) required DateTime cachedAt,
    @HiveField(17) required String category,
    @HiveField(18) required String fileType,

    /// New field for uploader name
    @HiveField(19) String? uploadedByName,

    /// JSON-serialized list of files with per-file offline metadata
    @HiveField(20) String? filesCache,
  }) = _DocumentHiveModel;

  factory DocumentHiveModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentHiveModelFromJson(json);

  // Factory method for creating from DTO
  factory DocumentHiveModel.fromDto(DocumentDto dto) {
    final primaryFile = dto.files.isNotEmpty ? dto.files.first : null;

    // Serialize files array to JSON for Hive storage
    final filesJson = jsonEncode(
      dto.files
          .map((f) => {
                'id': f.id,
                'fileName': f.fileName,
                'fileUrl': f.fileUrl,
                'fileType': f.fileType,
                'fileSize': f.fileSize,
                'isDownloaded': false,
                'localPath': null,
              })
          .toList(),
    );

    return DocumentHiveModel(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      type: DocumentDto.parseDocumentType(dto.category).index,
      fileUrl: primaryFile?.fileUrl ?? '',
      fileName: primaryFile?.fileName ?? 'document',
      fileSize: primaryFile?.fileSize ?? 0,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: dto.updatedAt != null && dto.updatedAt!.isNotEmpty
          ? DateTime.parse(dto.updatedAt!)
          : DateTime.parse(dto.createdAt),
      tags: dto.tags,
      categories: [dto.category],
      relatedModel: dto.relatedModel,
      keywords: dto.keywords,
      uploadedBy: dto.uploadedBy,
      uploadedByName: dto.uploader.fullName,
      isDownloaded: false,
      localPath: null,
      cachedAt: DateTime.now(),
      category: dto.category,
      fileType: dto.category,
      filesCache: filesJson,
    );
  }
}

// Extension for mapping to domain entity
extension DocumentHiveModelX on DocumentHiveModel {
  DocumentEntity toEntity() {
    // Deserialize files from JSON cache
    List<FileEntity> deserializedFiles = [];
    if (filesCache != null && filesCache!.isNotEmpty) {
      try {
        final filesList = jsonDecode(filesCache!) as List;
        deserializedFiles = filesList.map((fileJson) {
          return FileEntity(
            id: fileJson['id'] as int,
            fileName: fileJson['fileName'] as String?,
            fileUrl: fileJson['fileUrl'] as String,
            fileType: fileJson['fileType'] as String,
            fileSize: fileJson['fileSize'] as int,
            isDownloaded: fileJson['isDownloaded'] as bool?,
            localPath: fileJson['localPath'] as String?,
          );
        }).toList();
      } catch (e) {
        // Fallback: create FileEntity from primary file if deserialization fails
        deserializedFiles = [
          FileEntity(
            id: 0,
            fileName: fileName,
            fileUrl: fileUrl,
            fileType: fileType,
            fileSize: fileSize,
            isDownloaded: isDownloaded,
            localPath: localPath,
          )
        ];
      }
    } else {
      // Fallback: create FileEntity from primary file metadata
      deserializedFiles = [
        FileEntity(
          id: 0,
          fileName: fileName,
          fileUrl: fileUrl,
          fileType: fileType,
          fileSize: fileSize,
          isDownloaded: isDownloaded,
          localPath: localPath,
        )
      ];
    }

    return DocumentEntity(
      id: id,
      title: title,
      description: description,
      type: DocumentType.values[type],
      fileUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tags: tags,
      categories: categories,
      relatedModel: relatedModel,
      keywords: keywords,
      uploadedBy: uploadedBy,
      uploadedByName: uploadedByName,
      files: deserializedFiles,
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }
}

// Factory method for creating from domain entity
extension DocumentEntityX on DocumentEntity {
  DocumentHiveModel toHiveModel() {
    // Serialize files to JSON
    final filesJson = jsonEncode(
      files
          .map((f) => {
                'id': f.id,
                'fileName': f.fileName,
                'fileUrl': f.fileUrl,
                'fileType': f.fileType,
                'fileSize': f.fileSize,
                'isDownloaded': f.isDownloaded,
                'localPath': f.localPath,
              })
          .toList(),
    );

    return DocumentHiveModel(
      id: id,
      title: title,
      description: description,
      type: type.index,
      fileUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tags: tags,
      categories: categories,
      relatedModel: relatedModel,
      keywords: keywords,
      uploadedBy: uploadedBy,
      uploadedByName: uploadedByName,
      isDownloaded: isDownloaded,
      localPath: localPath,
      cachedAt: DateTime.now(),
      category: categories.isNotEmpty ? categories.first : 'general',
      fileType: type.name,
      filesCache: filesJson,
    );
  }
}
