// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentDto {
  int get id;
  String get title;
  String get description;
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @JsonKey(name: 'file_type')
  String get fileType;
  @JsonKey(name: 'file_size')
  int get fileSize;
  String get category;
  @JsonKey(name: 'related_model')
  String? get relatedModel;
  String? get keywords;
  @JsonKey(name: 'uploaded_by')
  int? get uploadedBy;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  List<String> get tags;
  List<String> get categories;

  /// Create a copy of DocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentDtoCopyWith<DocumentDto> get copyWith =>
      _$DocumentDtoCopyWithImpl<DocumentDto>(this as DocumentDto, _$identity);

  /// Serializes this DocumentDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentDto &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'DocumentDto(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, category: $category, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $DocumentDtoCopyWith<$Res> {
  factory $DocumentDtoCopyWith(
          DocumentDto value, $Res Function(DocumentDto) _then) =
      _$DocumentDtoCopyWithImpl;
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
class _$DocumentDtoCopyWithImpl<$Res> implements $DocumentDtoCopyWith<$Res> {
  _$DocumentDtoCopyWithImpl(this._self, this._then);

  final DocumentDto _self;
  final $Res Function(DocumentDto) _then;

  /// Create a copy of DocumentDto
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
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentDto].
extension DocumentDtoPatterns on DocumentDto {
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
    TResult Function(_DocumentDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentDto() when $default != null:
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
    TResult Function(_DocumentDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto():
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
    TResult? Function(_DocumentDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto() when $default != null:
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
            int id,
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
            List<String> categories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.fileUrl,
            _that.fileType,
            _that.fileSize,
            _that.category,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories);
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
            int id,
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
            List<String> categories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.fileUrl,
            _that.fileType,
            _that.fileSize,
            _that.category,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories);
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
            int id,
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
            List<String> categories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.fileUrl,
            _that.fileType,
            _that.fileSize,
            _that.category,
            _that.relatedModel,
            _that.keywords,
            _that.uploadedBy,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentDto extends DocumentDto {
  const _DocumentDto(
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
  factory _DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);

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

  /// Create a copy of DocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentDtoCopyWith<_DocumentDto> get copyWith =>
      __$DocumentDtoCopyWithImpl<_DocumentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DocumentDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'DocumentDto(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, category: $category, relatedModel: $relatedModel, keywords: $keywords, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$DocumentDtoCopyWith<$Res>
    implements $DocumentDtoCopyWith<$Res> {
  factory _$DocumentDtoCopyWith(
          _DocumentDto value, $Res Function(_DocumentDto) _then) =
      __$DocumentDtoCopyWithImpl;
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
class __$DocumentDtoCopyWithImpl<$Res> implements _$DocumentDtoCopyWith<$Res> {
  __$DocumentDtoCopyWithImpl(this._self, this._then);

  final _DocumentDto _self;
  final $Res Function(_DocumentDto) _then;

  /// Create a copy of DocumentDto
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
    Object? relatedModel = freezed,
    Object? keywords = freezed,
    Object? uploadedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? categories = null,
  }) {
    return _then(_DocumentDto(
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$DocumentResponseDto {
  @JsonKey(name: 'documents')
  List<DocumentDto> get documents;
  int get total;
  int get page;
  @JsonKey(name: 'pages')
  int get pageSize;

  /// Create a copy of DocumentResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentResponseDtoCopyWith<DocumentResponseDto> get copyWith =>
      _$DocumentResponseDtoCopyWithImpl<DocumentResponseDto>(
          this as DocumentResponseDto, _$identity);

  /// Serializes this DocumentResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentResponseDto &&
            const DeepCollectionEquality().equals(other.documents, documents) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(documents), total, page, pageSize);

  @override
  String toString() {
    return 'DocumentResponseDto(documents: $documents, total: $total, page: $page, pageSize: $pageSize)';
  }
}

/// @nodoc
abstract mixin class $DocumentResponseDtoCopyWith<$Res> {
  factory $DocumentResponseDtoCopyWith(
          DocumentResponseDto value, $Res Function(DocumentResponseDto) _then) =
      _$DocumentResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'documents') List<DocumentDto> documents,
      int total,
      int page,
      @JsonKey(name: 'pages') int pageSize});
}

/// @nodoc
class _$DocumentResponseDtoCopyWithImpl<$Res>
    implements $DocumentResponseDtoCopyWith<$Res> {
  _$DocumentResponseDtoCopyWithImpl(this._self, this._then);

  final DocumentResponseDto _self;
  final $Res Function(DocumentResponseDto) _then;

  /// Create a copy of DocumentResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? total = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_self.copyWith(
      documents: null == documents
          ? _self.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentDto>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentResponseDto].
extension DocumentResponseDtoPatterns on DocumentResponseDto {
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
    TResult Function(_DocumentResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
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
    TResult Function(_DocumentResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto():
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
    TResult? Function(_DocumentResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
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
    TResult Function(@JsonKey(name: 'documents') List<DocumentDto> documents,
            int total, int page, @JsonKey(name: 'pages') int pageSize)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
        return $default(
            _that.documents, _that.total, _that.page, _that.pageSize);
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
    TResult Function(@JsonKey(name: 'documents') List<DocumentDto> documents,
            int total, int page, @JsonKey(name: 'pages') int pageSize)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto():
        return $default(
            _that.documents, _that.total, _that.page, _that.pageSize);
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
    TResult? Function(@JsonKey(name: 'documents') List<DocumentDto> documents,
            int total, int page, @JsonKey(name: 'pages') int pageSize)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
        return $default(
            _that.documents, _that.total, _that.page, _that.pageSize);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentResponseDto implements DocumentResponseDto {
  const _DocumentResponseDto(
      {@JsonKey(name: 'documents') required final List<DocumentDto> documents,
      required this.total,
      required this.page,
      @JsonKey(name: 'pages') required this.pageSize})
      : _documents = documents;
  factory _DocumentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseDtoFromJson(json);

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

  /// Create a copy of DocumentResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentResponseDtoCopyWith<_DocumentResponseDto> get copyWith =>
      __$DocumentResponseDtoCopyWithImpl<_DocumentResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DocumentResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentResponseDto &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), total, page, pageSize);

  @override
  String toString() {
    return 'DocumentResponseDto(documents: $documents, total: $total, page: $page, pageSize: $pageSize)';
  }
}

/// @nodoc
abstract mixin class _$DocumentResponseDtoCopyWith<$Res>
    implements $DocumentResponseDtoCopyWith<$Res> {
  factory _$DocumentResponseDtoCopyWith(_DocumentResponseDto value,
          $Res Function(_DocumentResponseDto) _then) =
      __$DocumentResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'documents') List<DocumentDto> documents,
      int total,
      int page,
      @JsonKey(name: 'pages') int pageSize});
}

/// @nodoc
class __$DocumentResponseDtoCopyWithImpl<$Res>
    implements _$DocumentResponseDtoCopyWith<$Res> {
  __$DocumentResponseDtoCopyWithImpl(this._self, this._then);

  final _DocumentResponseDto _self;
  final $Res Function(_DocumentResponseDto) _then;

  /// Create a copy of DocumentResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documents = null,
    Object? total = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_DocumentResponseDto(
      documents: null == documents
          ? _self._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentDto>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
