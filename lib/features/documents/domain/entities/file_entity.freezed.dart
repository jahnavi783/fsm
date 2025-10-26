// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileEntity {
  /// Unique file identifier from API
  int get id;

  /// File name with extension (e.g., "manual.pdf")
  String? get fileName;

  /// Direct URL to download/access the file
  String get fileUrl;

  /// File type/MIME type (e.g., "application/pdf", "image/png")
  String get fileType;

  /// File size in bytes
  int get fileSize;

  /// Whether file has been downloaded locally
  bool? get isDownloaded;

  /// Path to locally cached file (null if not downloaded)
  String? get localPath;

  /// Create a copy of FileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileEntityCopyWith<FileEntity> get copyWith =>
      _$FileEntityCopyWithImpl<FileEntity>(this as FileEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, fileUrl, fileType,
      fileSize, isDownloaded, localPath);

  @override
  String toString() {
    return 'FileEntity(id: $id, fileName: $fileName, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, isDownloaded: $isDownloaded, localPath: $localPath)';
  }
}

/// @nodoc
abstract mixin class $FileEntityCopyWith<$Res> {
  factory $FileEntityCopyWith(
          FileEntity value, $Res Function(FileEntity) _then) =
      _$FileEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? fileName,
      String fileUrl,
      String fileType,
      int fileSize,
      bool? isDownloaded,
      String? localPath});
}

/// @nodoc
class _$FileEntityCopyWithImpl<$Res> implements $FileEntityCopyWith<$Res> {
  _$FileEntityCopyWithImpl(this._self, this._then);

  final FileEntity _self;
  final $Res Function(FileEntity) _then;

  /// Create a copy of FileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = freezed,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [FileEntity].
extension FileEntityPatterns on FileEntity {
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
    TResult Function(_FileEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileEntity() when $default != null:
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
    TResult Function(_FileEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileEntity():
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
    TResult? Function(_FileEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileEntity() when $default != null:
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
    TResult Function(int id, String? fileName, String fileUrl, String fileType,
            int fileSize, bool? isDownloaded, String? localPath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileEntity() when $default != null:
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize, _that.isDownloaded, _that.localPath);
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
    TResult Function(int id, String? fileName, String fileUrl, String fileType,
            int fileSize, bool? isDownloaded, String? localPath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileEntity():
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize, _that.isDownloaded, _that.localPath);
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
    TResult? Function(int id, String? fileName, String fileUrl, String fileType,
            int fileSize, bool? isDownloaded, String? localPath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileEntity() when $default != null:
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize, _that.isDownloaded, _that.localPath);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FileEntity extends FileEntity {
  const _FileEntity(
      {required this.id,
      this.fileName,
      required this.fileUrl,
      required this.fileType,
      required this.fileSize,
      this.isDownloaded,
      this.localPath})
      : super._();

  /// Unique file identifier from API
  @override
  final int id;

  /// File name with extension (e.g., "manual.pdf")
  @override
  final String? fileName;

  /// Direct URL to download/access the file
  @override
  final String fileUrl;

  /// File type/MIME type (e.g., "application/pdf", "image/png")
  @override
  final String fileType;

  /// File size in bytes
  @override
  final int fileSize;

  /// Whether file has been downloaded locally
  @override
  final bool? isDownloaded;

  /// Path to locally cached file (null if not downloaded)
  @override
  final String? localPath;

  /// Create a copy of FileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileEntityCopyWith<_FileEntity> get copyWith =>
      __$FileEntityCopyWithImpl<_FileEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, fileUrl, fileType,
      fileSize, isDownloaded, localPath);

  @override
  String toString() {
    return 'FileEntity(id: $id, fileName: $fileName, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, isDownloaded: $isDownloaded, localPath: $localPath)';
  }
}

/// @nodoc
abstract mixin class _$FileEntityCopyWith<$Res>
    implements $FileEntityCopyWith<$Res> {
  factory _$FileEntityCopyWith(
          _FileEntity value, $Res Function(_FileEntity) _then) =
      __$FileEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? fileName,
      String fileUrl,
      String fileType,
      int fileSize,
      bool? isDownloaded,
      String? localPath});
}

/// @nodoc
class __$FileEntityCopyWithImpl<$Res> implements _$FileEntityCopyWith<$Res> {
  __$FileEntityCopyWithImpl(this._self, this._then);

  final _FileEntity _self;
  final $Res Function(_FileEntity) _then;

  /// Create a copy of FileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fileName = freezed,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? isDownloaded = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_FileEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
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
