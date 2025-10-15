// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentHiveModel _$DocumentHiveModelFromJson(Map<String, dynamic> json) {
  return _DocumentHiveModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  int get type => throw _privateConstructorUsedError; // DocumentType as int
  @HiveField(4)
  String get fileUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  String get fileName => throw _privateConstructorUsedError;
  @HiveField(6)
  int get fileSize => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(9)
  List<String> get tags => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String> get categories => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get relatedModel => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get keywords => throw _privateConstructorUsedError;
  @HiveField(13)
  int? get uploadedBy => throw _privateConstructorUsedError;
  @HiveField(14)
  bool? get isDownloaded => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get localPath => throw _privateConstructorUsedError;
  @HiveField(16)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentHiveModelCopyWith<DocumentHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentHiveModelCopyWith<$Res> {
  factory $DocumentHiveModelCopyWith(
          DocumentHiveModel value, $Res Function(DocumentHiveModel) then) =
      _$DocumentHiveModelCopyWithImpl<$Res, DocumentHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) int type,
      @HiveField(4) String fileUrl,
      @HiveField(5) String fileName,
      @HiveField(6) int fileSize,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) List<String> tags,
      @HiveField(10) List<String> categories,
      @HiveField(11) String? relatedModel,
      @HiveField(12) String? keywords,
      @HiveField(13) int? uploadedBy,
      @HiveField(14) bool? isDownloaded,
      @HiveField(15) String? localPath,
      @HiveField(16) DateTime cachedAt});
}

/// @nodoc
class _$DocumentHiveModelCopyWithImpl<$Res, $Val extends DocumentHiveModel>
    implements $DocumentHiveModelCopyWith<$Res> {
  _$DocumentHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? fileUrl = null,
    Object? fileName = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
    Object? cachedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedModel: freezed == relatedModel
          ? _value.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isDownloaded: freezed == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentHiveModelImplCopyWith<$Res>
    implements $DocumentHiveModelCopyWith<$Res> {
  factory _$$DocumentHiveModelImplCopyWith(_$DocumentHiveModelImpl value,
          $Res Function(_$DocumentHiveModelImpl) then) =
      __$$DocumentHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) int type,
      @HiveField(4) String fileUrl,
      @HiveField(5) String fileName,
      @HiveField(6) int fileSize,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) List<String> tags,
      @HiveField(10) List<String> categories,
      @HiveField(11) String? relatedModel,
      @HiveField(12) String? keywords,
      @HiveField(13) int? uploadedBy,
      @HiveField(14) bool? isDownloaded,
      @HiveField(15) String? localPath,
      @HiveField(16) DateTime cachedAt});
}

/// @nodoc
class __$$DocumentHiveModelImplCopyWithImpl<$Res>
    extends _$DocumentHiveModelCopyWithImpl<$Res, _$DocumentHiveModelImpl>
    implements _$$DocumentHiveModelImplCopyWith<$Res> {
  __$$DocumentHiveModelImplCopyWithImpl(_$DocumentHiveModelImpl _value,
      $Res Function(_$DocumentHiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? fileUrl = null,
    Object? fileName = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
    Object? cachedAt = null,
  }) {
    return _then(_$DocumentHiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedModel: freezed == relatedModel
          ? _value.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isDownloaded: freezed == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentHiveModelImpl implements _DocumentHiveModel {
  const _$DocumentHiveModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.description,
      @HiveField(3) required this.type,
      @HiveField(4) required this.fileUrl,
      @HiveField(5) required this.fileName,
      @HiveField(6) required this.fileSize,
      @HiveField(7) required this.createdAt,
      @HiveField(8) required this.updatedAt,
      @HiveField(9) required final List<String> tags,
      @HiveField(10) required final List<String> categories,
      @HiveField(11) this.relatedModel,
      @HiveField(12) this.keywords,
      @HiveField(13) this.uploadedBy,
      @HiveField(14) this.isDownloaded,
      @HiveField(15) this.localPath,
      @HiveField(16) required this.cachedAt})
      : _tags = tags,
        _categories = categories;

  factory _$DocumentHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentHiveModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final int type;
// DocumentType as int
  @override
  @HiveField(4)
  final String fileUrl;
  @override
  @HiveField(5)
  final String fileName;
  @override
  @HiveField(6)
  final int fileSize;
  @override
  @HiveField(7)
  final DateTime createdAt;
  @override
  @HiveField(8)
  final DateTime updatedAt;
  final List<String> _tags;
  @override
  @HiveField(9)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _categories;
  @override
  @HiveField(10)
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @HiveField(11)
  final String? relatedModel;
  @override
  @HiveField(12)
  final String? keywords;
  @override
  @HiveField(13)
  final int? uploadedBy;
  @override
  @HiveField(14)
  final bool? isDownloaded;
  @override
  @HiveField(15)
  final String? localPath;
  @override
  @HiveField(16)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'DocumentHiveModel(id: $id, title: $title, description: $description, type: $type, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, isDownloaded: $isDownloaded, localPath: $localPath, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentHiveModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.relatedModel, relatedModel) ||
                other.relatedModel == relatedModel) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      fileUrl,
      fileName,
      fileSize,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_categories),
      relatedModel,
      keywords,
      uploadedBy,
      isDownloaded,
      localPath,
      cachedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentHiveModelImplCopyWith<_$DocumentHiveModelImpl> get copyWith =>
      __$$DocumentHiveModelImplCopyWithImpl<_$DocumentHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentHiveModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentHiveModel implements DocumentHiveModel {
  const factory _DocumentHiveModel(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String title,
          @HiveField(2) required final String description,
          @HiveField(3) required final int type,
          @HiveField(4) required final String fileUrl,
          @HiveField(5) required final String fileName,
          @HiveField(6) required final int fileSize,
          @HiveField(7) required final DateTime createdAt,
          @HiveField(8) required final DateTime updatedAt,
          @HiveField(9) required final List<String> tags,
          @HiveField(10) required final List<String> categories,
          @HiveField(11) final String? relatedModel,
          @HiveField(12) final String? keywords,
          @HiveField(13) final int? uploadedBy,
          @HiveField(14) final bool? isDownloaded,
          @HiveField(15) final String? localPath,
          @HiveField(16) required final DateTime cachedAt}) =
      _$DocumentHiveModelImpl;

  factory _DocumentHiveModel.fromJson(Map<String, dynamic> json) =
      _$DocumentHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  int get type;
  @override // DocumentType as int
  @HiveField(4)
  String get fileUrl;
  @override
  @HiveField(5)
  String get fileName;
  @override
  @HiveField(6)
  int get fileSize;
  @override
  @HiveField(7)
  DateTime get createdAt;
  @override
  @HiveField(8)
  DateTime get updatedAt;
  @override
  @HiveField(9)
  List<String> get tags;
  @override
  @HiveField(10)
  List<String> get categories;
  @override
  @HiveField(11)
  String? get relatedModel;
  @override
  @HiveField(12)
  String? get keywords;
  @override
  @HiveField(13)
  int? get uploadedBy;
  @override
  @HiveField(14)
  bool? get isDownloaded;
  @override
  @HiveField(15)
  String? get localPath;
  @override
  @HiveField(16)
  DateTime get cachedAt;
  @override
  @JsonKey(ignore: true)
  _$$DocumentHiveModelImplCopyWith<_$DocumentHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
