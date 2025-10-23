// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get title;
  @HiveField(2)
  String get description;
  @HiveField(3)
  int get type; // DocumentType as int
  @HiveField(4)
  String get fileUrl;
  @HiveField(5)
  String get fileName;
  @HiveField(6)
  int get fileSize;
  @HiveField(7)
  DateTime get createdAt;
  @HiveField(8)
  DateTime get updatedAt;
  @HiveField(9)
  List<String> get tags;
  @HiveField(10)
  List<String> get categories;
  @HiveField(11)
  String? get relatedModel;
  @HiveField(12)
  String? get keywords;
  @HiveField(13)
  int? get uploadedBy;
  @HiveField(14)
  bool? get isDownloaded;
  @HiveField(15)
  String? get localPath;
  @HiveField(16)
  DateTime get cachedAt;
  @HiveField(17)
  String get category;
  @HiveField(18)
  String get fileType;

  /// Create a copy of DocumentHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentHiveModelCopyWith<DocumentHiveModel> get copyWith =>
      _$DocumentHiveModelCopyWithImpl<DocumentHiveModel>(
          this as DocumentHiveModel, _$identity);

  /// Serializes this DocumentHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentHiveModel &&
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
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        isDownloaded,
        localPath,
        cachedAt,
        category,
        fileType
      ]);

  @override
  String toString() {
    return 'DocumentHiveModel(id: $id, title: $title, description: $description, type: $type, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, isDownloaded: $isDownloaded, localPath: $localPath, cachedAt: $cachedAt, category: $category, fileType: $fileType)';
  }
}

/// @nodoc
abstract mixin class $DocumentHiveModelCopyWith<$Res> {
  factory $DocumentHiveModelCopyWith(
          DocumentHiveModel value, $Res Function(DocumentHiveModel) _then) =
      _$DocumentHiveModelCopyWithImpl;
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
      @HiveField(16) DateTime cachedAt,
      @HiveField(17) String category,
      @HiveField(18) String fileType});
}

/// @nodoc
class _$DocumentHiveModelCopyWithImpl<$Res>
    implements $DocumentHiveModelCopyWith<$Res> {
  _$DocumentHiveModelCopyWithImpl(this._self, this._then);

  final DocumentHiveModel _self;
  final $Res Function(DocumentHiveModel) _then;

  /// Create a copy of DocumentHiveModel
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
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
    Object? cachedAt = null,
    Object? category = null,
    Object? fileType = null,
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
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
      isDownloaded: freezed == isDownloaded
          ? _self.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentHiveModel].
extension DocumentHiveModelPatterns on DocumentHiveModel {
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
    TResult Function(_DocumentHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel() when $default != null:
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
    TResult Function(_DocumentHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel():
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
    TResult? Function(_DocumentHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel() when $default != null:
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
            @HiveField(0) int id,
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
            @HiveField(16) DateTime cachedAt,
            @HiveField(17) String category,
            @HiveField(18) String fileType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel() when $default != null:
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
            _that.isDownloaded,
            _that.localPath,
            _that.cachedAt,
            _that.category,
            _that.fileType);
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
            @HiveField(0) int id,
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
            @HiveField(16) DateTime cachedAt,
            @HiveField(17) String category,
            @HiveField(18) String fileType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel():
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
            _that.isDownloaded,
            _that.localPath,
            _that.cachedAt,
            _that.category,
            _that.fileType);
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
            @HiveField(0) int id,
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
            @HiveField(16) DateTime cachedAt,
            @HiveField(17) String category,
            @HiveField(18) String fileType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentHiveModel() when $default != null:
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
            _that.isDownloaded,
            _that.localPath,
            _that.cachedAt,
            _that.category,
            _that.fileType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentHiveModel implements DocumentHiveModel {
  const _DocumentHiveModel(
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
      @HiveField(16) required this.cachedAt,
      @HiveField(17) required this.category,
      @HiveField(18) required this.fileType})
      : _tags = tags,
        _categories = categories;
  factory _DocumentHiveModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentHiveModelFromJson(json);

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
  @HiveField(17)
  final String category;
  @override
  @HiveField(18)
  final String fileType;

  /// Create a copy of DocumentHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentHiveModelCopyWith<_DocumentHiveModel> get copyWith =>
      __$DocumentHiveModelCopyWithImpl<_DocumentHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DocumentHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentHiveModel &&
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
                other.cachedAt == cachedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        cachedAt,
        category,
        fileType
      ]);

  @override
  String toString() {
    return 'DocumentHiveModel(id: $id, title: $title, description: $description, type: $type, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, isDownloaded: $isDownloaded, localPath: $localPath, cachedAt: $cachedAt, category: $category, fileType: $fileType)';
  }
}

/// @nodoc
abstract mixin class _$DocumentHiveModelCopyWith<$Res>
    implements $DocumentHiveModelCopyWith<$Res> {
  factory _$DocumentHiveModelCopyWith(
          _DocumentHiveModel value, $Res Function(_DocumentHiveModel) _then) =
      __$DocumentHiveModelCopyWithImpl;
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
      @HiveField(16) DateTime cachedAt,
      @HiveField(17) String category,
      @HiveField(18) String fileType});
}

/// @nodoc
class __$DocumentHiveModelCopyWithImpl<$Res>
    implements _$DocumentHiveModelCopyWith<$Res> {
  __$DocumentHiveModelCopyWithImpl(this._self, this._then);

  final _DocumentHiveModel _self;
  final $Res Function(_DocumentHiveModel) _then;

  /// Create a copy of DocumentHiveModel
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
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
    Object? cachedAt = null,
    Object? category = null,
    Object? fileType = null,
  }) {
    return _then(_DocumentHiveModel(
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
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
      isDownloaded: freezed == isDownloaded
          ? _self.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      localPath: freezed == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
