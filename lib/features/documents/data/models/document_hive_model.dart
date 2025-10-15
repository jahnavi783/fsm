import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';

part 'document_hive_model.freezed.dart';
part 'document_hive_model.g.dart';

@freezed
@HiveType(typeId: HiveBoxes.documentEntityTypeId)
class DocumentHiveModel with _$DocumentHiveModel {
  const factory DocumentHiveModel({
    @HiveField(0) required int id,
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
  }) = _DocumentHiveModel;

  factory DocumentHiveModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentHiveModelFromJson(json);
}

// Extension for mapping to domain entity
extension DocumentHiveModelX on DocumentHiveModel {
  DocumentEntity toEntity() {
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
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }
}

// Factory method for creating from domain entity
extension DocumentEntityX on DocumentEntity {
  DocumentHiveModel toHiveModel() {
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
      isDownloaded: isDownloaded,
      localPath: localPath,
      cachedAt: DateTime.now(),
    );
  }
}
