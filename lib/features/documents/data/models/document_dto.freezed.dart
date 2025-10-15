// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentDto _$DocumentDtoFromJson(Map<String, dynamic> json) {
  return _DocumentDto.fromJson(json);
}

/// @nodoc
mixin _$DocumentDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_type')
  String get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_size')
  int get fileSize => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_model')
  String? get relatedModel => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_by')
  int? get uploadedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentDtoCopyWith<DocumentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDtoCopyWith<$Res> {
  factory $DocumentDtoCopyWith(
          DocumentDto value, $Res Function(DocumentDto) then) =
      _$DocumentDtoCopyWithImpl<$Res, DocumentDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_size') int fileSize,
      String category,
      @JsonKey(name: 'related_model') String? relatedModel,
      String? keywords,
      @JsonKey(name: 'uploaded_by') int? uploadedBy,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<String> tags,
      List<String> categories});
}

/// @nodoc
class _$DocumentDtoCopyWithImpl<$Res, $Val extends DocumentDto>
    implements $DocumentDtoCopyWith<$Res> {
  _$DocumentDtoCopyWithImpl(this._value, this._then);

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
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? category = null,
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
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
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentDtoImplCopyWith<$Res>
    implements $DocumentDtoCopyWith<$Res> {
  factory _$$DocumentDtoImplCopyWith(
          _$DocumentDtoImpl value, $Res Function(_$DocumentDtoImpl) then) =
      __$$DocumentDtoImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'related_model') String? relatedModel,
      String? keywords,
      @JsonKey(name: 'uploaded_by') int? uploadedBy,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<String> tags,
      List<String> categories});
}

/// @nodoc
class __$$DocumentDtoImplCopyWithImpl<$Res>
    extends _$DocumentDtoCopyWithImpl<$Res, _$DocumentDtoImpl>
    implements _$$DocumentDtoImplCopyWith<$Res> {
  __$$DocumentDtoImplCopyWithImpl(
      _$DocumentDtoImpl _value, $Res Function(_$DocumentDtoImpl) _then)
      : super(_value, _then);

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
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
  }) {
    return _then(_$DocumentDtoImpl(
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
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentDtoImpl extends _DocumentDto {
  const _$DocumentDtoImpl(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'file_url') required this.fileUrl,
      @JsonKey(name: 'file_type') required this.fileType,
      @JsonKey(name: 'file_size') required this.fileSize,
      required this.category,
      @JsonKey(name: 'related_model') this.relatedModel,
      this.keywords,
      @JsonKey(name: 'uploaded_by') this.uploadedBy,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final List<String> tags = const [],
      final List<String> categories = const []})
      : _tags = tags,
        _categories = categories,
        super._();

  factory _$DocumentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @override
  @JsonKey(name: 'file_type')
  final String fileType;
  @override
  @JsonKey(name: 'file_size')
  final int fileSize;
  @override
  final String category;
  @override
  @JsonKey(name: 'related_model')
  final String? relatedModel;
  @override
  final String? keywords;
  @override
  @JsonKey(name: 'uploaded_by')
  final int? uploadedBy;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'DocumentDto(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, category: $category, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.relatedModel, relatedModel) ||
                other.relatedModel == relatedModel) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      fileUrl,
      fileType,
      fileSize,
      category,
      relatedModel,
      keywords,
      uploadedBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDtoImplCopyWith<_$DocumentDtoImpl> get copyWith =>
      __$$DocumentDtoImplCopyWithImpl<_$DocumentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentDtoImplToJson(
      this,
    );
  }
}

abstract class _DocumentDto extends DocumentDto {
  const factory _DocumentDto(
      {required final int id,
      required final String title,
      required final String description,
      @JsonKey(name: 'file_url') required final String fileUrl,
      @JsonKey(name: 'file_type') required final String fileType,
      @JsonKey(name: 'file_size') required final int fileSize,
      required final String category,
      @JsonKey(name: 'related_model') final String? relatedModel,
      final String? keywords,
      @JsonKey(name: 'uploaded_by') final int? uploadedBy,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      final List<String> tags,
      final List<String> categories}) = _$DocumentDtoImpl;
  const _DocumentDto._() : super._();

  factory _DocumentDto.fromJson(Map<String, dynamic> json) =
      _$DocumentDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @override
  @JsonKey(name: 'file_type')
  String get fileType;
  @override
  @JsonKey(name: 'file_size')
  int get fileSize;
  @override
  String get category;
  @override
  @JsonKey(name: 'related_model')
  String? get relatedModel;
  @override
  String? get keywords;
  @override
  @JsonKey(name: 'uploaded_by')
  int? get uploadedBy;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  List<String> get tags;
  @override
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$DocumentDtoImplCopyWith<_$DocumentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentResponseDto _$DocumentResponseDtoFromJson(Map<String, dynamic> json) {
  return _DocumentResponseDto.fromJson(json);
}

/// @nodoc
mixin _$DocumentResponseDto {
  @JsonKey(name: 'documents')
  List<DocumentDto> get documents => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'pages')
  int get pageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentResponseDtoCopyWith<DocumentResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentResponseDtoCopyWith<$Res> {
  factory $DocumentResponseDtoCopyWith(
          DocumentResponseDto value, $Res Function(DocumentResponseDto) then) =
      _$DocumentResponseDtoCopyWithImpl<$Res, DocumentResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'documents') List<DocumentDto> documents,
      int total,
      int page,
      @JsonKey(name: 'pages') int pageSize});
}

/// @nodoc
class _$DocumentResponseDtoCopyWithImpl<$Res, $Val extends DocumentResponseDto>
    implements $DocumentResponseDtoCopyWith<$Res> {
  _$DocumentResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? total = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentDto>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentResponseDtoImplCopyWith<$Res>
    implements $DocumentResponseDtoCopyWith<$Res> {
  factory _$$DocumentResponseDtoImplCopyWith(_$DocumentResponseDtoImpl value,
          $Res Function(_$DocumentResponseDtoImpl) then) =
      __$$DocumentResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'documents') List<DocumentDto> documents,
      int total,
      int page,
      @JsonKey(name: 'pages') int pageSize});
}

/// @nodoc
class __$$DocumentResponseDtoImplCopyWithImpl<$Res>
    extends _$DocumentResponseDtoCopyWithImpl<$Res, _$DocumentResponseDtoImpl>
    implements _$$DocumentResponseDtoImplCopyWith<$Res> {
  __$$DocumentResponseDtoImplCopyWithImpl(_$DocumentResponseDtoImpl _value,
      $Res Function(_$DocumentResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? total = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$DocumentResponseDtoImpl(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentDto>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentResponseDtoImpl implements _DocumentResponseDto {
  const _$DocumentResponseDtoImpl(
      {@JsonKey(name: 'documents') required final List<DocumentDto> documents,
      required this.total,
      required this.page,
      @JsonKey(name: 'pages') required this.pageSize})
      : _documents = documents;

  factory _$DocumentResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentResponseDtoImplFromJson(json);

  final List<DocumentDto> _documents;
  @override
  @JsonKey(name: 'documents')
  List<DocumentDto> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  @JsonKey(name: 'pages')
  final int pageSize;

  @override
  String toString() {
    return 'DocumentResponseDto(documents: $documents, total: $total, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentResponseDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), total, page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentResponseDtoImplCopyWith<_$DocumentResponseDtoImpl> get copyWith =>
      __$$DocumentResponseDtoImplCopyWithImpl<_$DocumentResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _DocumentResponseDto implements DocumentResponseDto {
  const factory _DocumentResponseDto(
      {@JsonKey(name: 'documents') required final List<DocumentDto> documents,
      required final int total,
      required final int page,
      @JsonKey(name: 'pages')
      required final int pageSize}) = _$DocumentResponseDtoImpl;

  factory _DocumentResponseDto.fromJson(Map<String, dynamic> json) =
      _$DocumentResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'documents')
  List<DocumentDto> get documents;
  @override
  int get total;
  @override
  int get page;
  @override
  @JsonKey(name: 'pages')
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$DocumentResponseDtoImplCopyWith<_$DocumentResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
