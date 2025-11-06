// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentEntity {
  int get id;
  set id(int value);
  String get title;
  set title(String value);
  String get description;
  set description(String value);
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @JsonKey(name: 'file_url')
  set fileUrl(String value);
  @JsonKey(name: 'file_type')
  String get fileType;
  @JsonKey(name: 'file_type')
  set fileType(String value);
  @JsonKey(name: 'file_size')
  int get fileSize;
  @JsonKey(name: 'file_size')
  set fileSize(int value);
  String get category;
  set category(String value);
  @JsonKey(name: 'related_model')
  String get relatedModel;
  @JsonKey(name: 'related_model')
  set relatedModel(String value);
  String get keywords;
  set keywords(String value);
  @JsonKey(name: 'uploaded_by')
  int get uploadedBy;
  @JsonKey(name: 'uploaded_by')
  set uploadedBy(int value);
  @DateTimeConverter()
  DateTime get createdAt;
  @DateTimeConverter()
  set createdAt(DateTime value);
  @DateTimeConverter()
  DateTime get updatedAt;
  @DateTimeConverter()
  set updatedAt(DateTime value);

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentEntityCopyWith<DocumentEntity> get copyWith =>
      _$DocumentEntityCopyWithImpl<DocumentEntity>(
          this as DocumentEntity, _$identity);

  /// Serializes this DocumentEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'DocumentEntity(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, category: $category, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DocumentEntityCopyWith<$Res> {
  factory $DocumentEntityCopyWith(
          DocumentEntity value, $Res Function(DocumentEntity) _then) =
      _$DocumentEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_size') int fileSize,
      String category,
      @JsonKey(name: 'related_model') String relatedModel,
      String keywords,
      @JsonKey(name: 'uploaded_by') int uploadedBy,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class _$DocumentEntityCopyWithImpl<$Res>
    implements $DocumentEntityCopyWith<$Res> {
  _$DocumentEntityCopyWithImpl(this._self, this._then);

  final DocumentEntity _self;
  final $Res Function(DocumentEntity) _then;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? category = null,
    Object? relatedModel = null,
    Object? keywords = null,
    Object? uploadedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      relatedModel: null == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedBy: null == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentEntity implements DocumentEntity {
  _DocumentEntity(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'file_url') required this.fileUrl,
      @JsonKey(name: 'file_type') required this.fileType,
      @JsonKey(name: 'file_size') required this.fileSize,
      required this.category,
      @JsonKey(name: 'related_model') required this.relatedModel,
      required this.keywords,
      @JsonKey(name: 'uploaded_by') required this.uploadedBy,
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt});
  factory _DocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentEntityFromJson(json);

  @override
  int id;
  @override
  String title;
  @override
  String description;
  @override
  @JsonKey(name: 'file_url')
  String fileUrl;
  @override
  @JsonKey(name: 'file_type')
  String fileType;
  @override
  @JsonKey(name: 'file_size')
  int fileSize;
  @override
  String category;
  @override
  @JsonKey(name: 'related_model')
  String relatedModel;
  @override
  String keywords;
  @override
  @JsonKey(name: 'uploaded_by')
  int uploadedBy;
  @override
  @DateTimeConverter()
  DateTime createdAt;
  @override
  @DateTimeConverter()
  DateTime updatedAt;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentEntityCopyWith<_DocumentEntity> get copyWith =>
      __$DocumentEntityCopyWithImpl<_DocumentEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DocumentEntityToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'DocumentEntity(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, category: $category, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DocumentEntityCopyWith<$Res>
    implements $DocumentEntityCopyWith<$Res> {
  factory _$DocumentEntityCopyWith(
          _DocumentEntity value, $Res Function(_DocumentEntity) _then) =
      __$DocumentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_size') int fileSize,
      String category,
      @JsonKey(name: 'related_model') String relatedModel,
      String keywords,
      @JsonKey(name: 'uploaded_by') int uploadedBy,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class __$DocumentEntityCopyWithImpl<$Res>
    implements _$DocumentEntityCopyWith<$Res> {
  __$DocumentEntityCopyWithImpl(this._self, this._then);

  final _DocumentEntity _self;
  final $Res Function(_DocumentEntity) _then;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? category = null,
    Object? relatedModel = null,
    Object? keywords = null,
    Object? uploadedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_DocumentEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      relatedModel: null == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedBy: null == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
