import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm_flutter/core/utils.dart';

part 'document_entity.freezed.dart';
part 'document_entity.g.dart';

@unfreezed
abstract class DocumentEntity with _$DocumentEntity {
  factory DocumentEntity({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_size') required int fileSize,
    required String category,
    @JsonKey(name: 'related_model') String? relatedModel,
    String? keywords,
    @JsonKey(name: 'uploaded_by') required int uploadedBy,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _DocumentEntity;

  factory DocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentEntityFromJson(json);
}
