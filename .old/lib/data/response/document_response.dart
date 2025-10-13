import 'package:fsm_flutter/data/entity/document_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_response.g.dart';

@JsonSerializable()
class DocumentResponse {
  @JsonKey(name: 'documents')
  final List<DocumentEntity> documents;
  final int total;
  final int page;
  @JsonKey(name: 'pages')
  final int pageSize;

  DocumentResponse({
    required this.documents,
    required this.total,
    required this.page,
    required this.pageSize,
  });

  factory DocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentResponseToJson(this);
}
