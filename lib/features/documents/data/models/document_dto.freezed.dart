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
  /// API returns 'id' as String UUID
  String get id;
  String get title;
  String get description;
  String get category;
  @JsonKey(name: 'related_model')
  String? get relatedModel;

  /// API returns nested array of files instead of single file_url
  List<FileDto> get files;

  /// API returns uploaded_by as int (user ID)
  @JsonKey(name: 'uploaded_by')
  int get uploadedBy;

  /// API returns uploader as full user object
  UploadedByDto get uploader;
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt;

  /// keywords is a string, not an array
  String? get keywords;
  List<String> get tags;

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
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.relatedModel, relatedModel) ||
                other.relatedModel == relatedModel) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      relatedModel,
      const DeepCollectionEquality().hash(files),
      uploadedBy,
      uploader,
      createdAt,
      updatedAt,
      keywords,
      const DeepCollectionEquality().hash(tags));

  @override
  String toString() {
    return 'DocumentDto(id: $id, title: $title, description: $description, category: $category, relatedModel: $relatedModel, files: $files, uploadedBy: $uploadedBy, uploader: $uploader, createdAt: $createdAt, updatedAt: $updatedAt, keywords: $keywords, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class $DocumentDtoCopyWith<$Res> {
  factory $DocumentDtoCopyWith(
          DocumentDto value, $Res Function(DocumentDto) _then) =
      _$DocumentDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      @JsonKey(name: 'related_model') String? relatedModel,
      List<FileDto> files,
      @JsonKey(name: 'uploaded_by') int uploadedBy,
      UploadedByDto uploader,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      String? keywords,
      List<String> tags});

  $UploadedByDtoCopyWith<$Res> get uploader;
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
    Object? category = null,
    Object? relatedModel = freezed,
    Object? files = null,
    Object? uploadedBy = null,
    Object? uploader = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? keywords = freezed,
    Object? tags = null,
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
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      relatedModel: freezed == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileDto>,
      uploadedBy: null == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploadedByDto,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of DocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploadedByDtoCopyWith<$Res> get uploader {
    return $UploadedByDtoCopyWith<$Res>(_self.uploader, (value) {
      return _then(_self.copyWith(uploader: value));
    });
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
            String id,
            String title,
            String description,
            String category,
            @JsonKey(name: 'related_model') String? relatedModel,
            List<FileDto> files,
            @JsonKey(name: 'uploaded_by') int uploadedBy,
            UploadedByDto uploader,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String? updatedAt,
            String? keywords,
            List<String> tags)?
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
            _that.category,
            _that.relatedModel,
            _that.files,
            _that.uploadedBy,
            _that.uploader,
            _that.createdAt,
            _that.updatedAt,
            _that.keywords,
            _that.tags);
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
            String category,
            @JsonKey(name: 'related_model') String? relatedModel,
            List<FileDto> files,
            @JsonKey(name: 'uploaded_by') int uploadedBy,
            UploadedByDto uploader,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String? updatedAt,
            String? keywords,
            List<String> tags)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.category,
            _that.relatedModel,
            _that.files,
            _that.uploadedBy,
            _that.uploader,
            _that.createdAt,
            _that.updatedAt,
            _that.keywords,
            _that.tags);
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
            String category,
            @JsonKey(name: 'related_model') String? relatedModel,
            List<FileDto> files,
            @JsonKey(name: 'uploaded_by') int uploadedBy,
            UploadedByDto uploader,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String? updatedAt,
            String? keywords,
            List<String> tags)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.category,
            _that.relatedModel,
            _that.files,
            _that.uploadedBy,
            _that.uploader,
            _that.createdAt,
            _that.updatedAt,
            _that.keywords,
            _that.tags);
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
      required this.category,
      @JsonKey(name: 'related_model') this.relatedModel,
      required final List<FileDto> files,
      @JsonKey(name: 'uploaded_by') required this.uploadedBy,
      required this.uploader,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      this.keywords,
      final List<String> tags = const []})
      : _files = files,
        _tags = tags,
        super._();
  factory _DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);

  /// API returns 'id' as String UUID
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey(name: 'related_model')
  final String? relatedModel;

  /// API returns nested array of files instead of single file_url
  final List<FileDto> _files;

  /// API returns nested array of files instead of single file_url
  @override
  List<FileDto> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  /// API returns uploaded_by as int (user ID)
  @override
  @JsonKey(name: 'uploaded_by')
  final int uploadedBy;

  /// API returns uploader as full user object
  @override
  final UploadedByDto uploader;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  /// keywords is a string, not an array
  @override
  final String? keywords;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
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
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.relatedModel, relatedModel) ||
                other.relatedModel == relatedModel) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      relatedModel,
      const DeepCollectionEquality().hash(_files),
      uploadedBy,
      uploader,
      createdAt,
      updatedAt,
      keywords,
      const DeepCollectionEquality().hash(_tags));

  @override
  String toString() {
    return 'DocumentDto(id: $id, title: $title, description: $description, category: $category, relatedModel: $relatedModel, files: $files, uploadedBy: $uploadedBy, uploader: $uploader, createdAt: $createdAt, updatedAt: $updatedAt, keywords: $keywords, tags: $tags)';
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
      {String id,
      String title,
      String description,
      String category,
      @JsonKey(name: 'related_model') String? relatedModel,
      List<FileDto> files,
      @JsonKey(name: 'uploaded_by') int uploadedBy,
      UploadedByDto uploader,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      String? keywords,
      List<String> tags});

  @override
  $UploadedByDtoCopyWith<$Res> get uploader;
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
    Object? category = null,
    Object? relatedModel = freezed,
    Object? files = null,
    Object? uploadedBy = null,
    Object? uploader = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? keywords = freezed,
    Object? tags = null,
  }) {
    return _then(_DocumentDto(
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
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      relatedModel: freezed == relatedModel
          ? _self.relatedModel
          : relatedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileDto>,
      uploadedBy: null == uploadedBy
          ? _self.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploadedByDto,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of DocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploadedByDtoCopyWith<$Res> get uploader {
    return $UploadedByDtoCopyWith<$Res>(_self.uploader, (value) {
      return _then(_self.copyWith(uploader: value));
    });
  }
}

/// @nodoc
mixin _$DocumentResponseDto {
  /// API returns 'uploads' array, not 'documents'
  @JsonKey(name: 'uploads')
  List<DocumentDto> get documents;
  int get total;
  int get page;

  /// API returns 'pages' for total pages
  int get pages;

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
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(documents), total, page, pages);

  @override
  String toString() {
    return 'DocumentResponseDto(documents: $documents, total: $total, page: $page, pages: $pages)';
  }
}

/// @nodoc
abstract mixin class $DocumentResponseDtoCopyWith<$Res> {
  factory $DocumentResponseDtoCopyWith(
          DocumentResponseDto value, $Res Function(DocumentResponseDto) _then) =
      _$DocumentResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'uploads') List<DocumentDto> documents,
      int total,
      int page,
      int pages});
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
    Object? pages = null,
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
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
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
    TResult Function(@JsonKey(name: 'uploads') List<DocumentDto> documents,
            int total, int page, int pages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
        return $default(_that.documents, _that.total, _that.page, _that.pages);
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
    TResult Function(@JsonKey(name: 'uploads') List<DocumentDto> documents,
            int total, int page, int pages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto():
        return $default(_that.documents, _that.total, _that.page, _that.pages);
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
    TResult? Function(@JsonKey(name: 'uploads') List<DocumentDto> documents,
            int total, int page, int pages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentResponseDto() when $default != null:
        return $default(_that.documents, _that.total, _that.page, _that.pages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentResponseDto implements DocumentResponseDto {
  const _DocumentResponseDto(
      {@JsonKey(name: 'uploads') required final List<DocumentDto> documents,
      required this.total,
      required this.page,
      required this.pages})
      : _documents = documents;
  factory _DocumentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentResponseDtoFromJson(json);

  /// API returns 'uploads' array, not 'documents'
  final List<DocumentDto> _documents;

  /// API returns 'uploads' array, not 'documents'
  @override
  @JsonKey(name: 'uploads')
  List<DocumentDto> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final int total;
  @override
  final int page;

  /// API returns 'pages' for total pages
  @override
  final int pages;

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
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), total, page, pages);

  @override
  String toString() {
    return 'DocumentResponseDto(documents: $documents, total: $total, page: $page, pages: $pages)';
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
      {@JsonKey(name: 'uploads') List<DocumentDto> documents,
      int total,
      int page,
      int pages});
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
    Object? pages = null,
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
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
