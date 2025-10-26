// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  /// Changed to String to match API's upload_id
  String get id;
  String get title;
  String get description;
  DocumentType get type;
  String get fileUrl;
  String get fileName;
  int get fileSize;
  DateTime get createdAt;
  DateTime get updatedAt;
  List<String> get tags;
  List<String> get categories;
  String? get relatedModel;
  String? get keywords;
  int? get uploadedBy;
  String? get uploadedByName;

  /// Added files array from API
  List<FileEntity> get files;
  bool? get isDownloaded;
  String? get localPath;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentEntityCopyWith<DocumentEntity> get copyWith =>
      _$DocumentEntityCopyWithImpl<DocumentEntity>(
          this as DocumentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentEntity &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.relatedModel, relatedModel) ||
                other.relatedModel == relatedModel) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.uploadedByName, uploadedByName) ||
                other.uploadedByName == uploadedByName) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

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
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(categories),
      relatedModel,
      keywords,
      uploadedBy,
      uploadedByName,
      const DeepCollectionEquality().hash(files),
      isDownloaded,
      localPath);

  @override
  String toString() {
    return 'DocumentEntity(id: $id, title: $title, description: $description, type: $type, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, uploadedByName: $uploadedByName, files: $files, isDownloaded: $isDownloaded, localPath: $localPath)';
  }
}

/// @nodoc
abstract mixin class $DocumentEntityCopyWith<$Res> {
  factory $DocumentEntityCopyWith(
          DocumentEntity value, $Res Function(DocumentEntity) _then) =
      _$DocumentEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DocumentType type,
      String fileUrl,
      String fileName,
      int fileSize,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> tags,
      List<String> categories,
      String? relatedModel,
      String? keywords,
      int? uploadedBy,
      String? uploadedByName,
      List<FileEntity> files,
      bool? isDownloaded,
      String? localPath});
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
    Object? uploadedByName = freezed,
    Object? files = null,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedModel: freezed == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadedByName: freezed == uploadedByName
          ? _self.uploadedByName
          : uploadedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileEntity>,
      isDownloaded: freezed == isDownloaded
          ? _self.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentEntity].
extension DocumentEntityPatterns on DocumentEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DocumentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DocumentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DocumentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String description,
            DocumentType type,
            String fileUrl,
            String fileName,
            int fileSize,
            DateTime createdAt,
            DateTime updatedAt,
            List<String> tags,
            List<String> categories,
            String? relatedModel,
            String? keywords,
            int? uploadedBy,
            String? uploadedByName,
            List<FileEntity> files,
            bool? isDownloaded,
            String? localPath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.type,
            _that.fileUrl,
            _that.fileName,
            _that.fileSize,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.uploadedByName,
            _that.files,
            _that.isDownloaded,
            _that.localPath);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String description,
            DocumentType type,
            String fileUrl,
            String fileName,
            int fileSize,
            DateTime createdAt,
            DateTime updatedAt,
            List<String> tags,
            List<String> categories,
            String? relatedModel,
            String? keywords,
            int? uploadedBy,
            String? uploadedByName,
            List<FileEntity> files,
            bool? isDownloaded,
            String? localPath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.type,
            _that.fileUrl,
            _that.fileName,
            _that.fileSize,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.uploadedByName,
            _that.files,
            _that.isDownloaded,
            _that.localPath);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String title,
            String description,
            DocumentType type,
            String fileUrl,
            String fileName,
            int fileSize,
            DateTime createdAt,
            DateTime updatedAt,
            List<String> tags,
            List<String> categories,
            String? relatedModel,
            String? keywords,
            int? uploadedBy,
            String? uploadedByName,
            List<FileEntity> files,
            bool? isDownloaded,
            String? localPath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.type,
            _that.fileUrl,
            _that.fileName,
            _that.fileSize,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.uploadedByName,
            _that.files,
            _that.isDownloaded,
            _that.localPath);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DocumentEntity extends DocumentEntity {
  const _DocumentEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.fileUrl,
      required this.fileName,
      required this.fileSize,
      required this.createdAt,
      required this.updatedAt,
      required final List<String> tags,
      required final List<String> categories,
      this.relatedModel,
      this.keywords,
      this.uploadedBy,
      this.uploadedByName,
      final List<FileEntity> files = const [],
      this.isDownloaded,
      this.localPath})
      : _tags = tags,
        _categories = categories,
        _files = files,
        super._();

  /// Changed to String to match API's upload_id
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DocumentType type;
  @override
  final String fileUrl;
  @override
  final String fileName;
  @override
  final int fileSize;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? relatedModel;
  @override
  final String? keywords;
  @override
  final int? uploadedBy;
  @override
  final String? uploadedByName;

  /// Added files array from API
  final List<FileEntity> _files;

  /// Added files array from API
  @override
  @JsonKey()
  List<FileEntity> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final bool? isDownloaded;
  @override
  final String? localPath;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentEntityCopyWith<_DocumentEntity> get copyWith =>
      __$DocumentEntityCopyWithImpl<_DocumentEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentEntity &&
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
            (identical(other.uploadedByName, uploadedByName) ||
                other.uploadedByName == uploadedByName) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

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
      uploadedByName,
      const DeepCollectionEquality().hash(_files),
      isDownloaded,
      localPath);

  @override
  String toString() {
    return 'DocumentEntity(id: $id, title: $title, description: $description, type: $type, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, uploadedByName: $uploadedByName, files: $files, isDownloaded: $isDownloaded, localPath: $localPath)';
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
      {String id,
      String title,
      String description,
      DocumentType type,
      String fileUrl,
      String fileName,
      int fileSize,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> tags,
      List<String> categories,
      String? relatedModel,
      String? keywords,
      int? uploadedBy,
      String? uploadedByName,
      List<FileEntity> files,
      bool? isDownloaded,
      String? localPath});
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
    Object? uploadedByName = freezed,
    Object? files = null,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_DocumentEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedModel: freezed == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadedByName: freezed == uploadedByName
          ? _self.uploadedByName
          : uploadedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileEntity>,
      isDownloaded: freezed == isDownloaded
          ? _self.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
