// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileDto {
  int get id;
  @JsonKey(name: 'file_name')
  String? get fileName;
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @JsonKey(name: 'file_type')
  String get fileType;
  @JsonKey(name: 'file_size')
  int get fileSize;

  /// Create a copy of FileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileDtoCopyWith<FileDto> get copyWith =>
      _$FileDtoCopyWithImpl<FileDto>(this as FileDto, _$identity);

  /// Serializes this FileDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileUrl, fileType, fileSize);

  @override
  String toString() {
    return 'FileDto(id: $id, fileName: $fileName, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize)';
  }
}

/// @nodoc
abstract mixin class $FileDtoCopyWith<$Res> {
  factory $FileDtoCopyWith(FileDto value, $Res Function(FileDto) _then) =
      _$FileDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'file_name') String? fileName,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_size') int fileSize});
}

/// @nodoc
class _$FileDtoCopyWithImpl<$Res> implements $FileDtoCopyWith<$Res> {
  _$FileDtoCopyWithImpl(this._self, this._then);

  final FileDto _self;
  final $Res Function(FileDto) _then;

  /// Create a copy of FileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = freezed,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [FileDto].
extension FileDtoPatterns on FileDto {
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
    TResult Function(_FileDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileDto() when $default != null:
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
    TResult Function(_FileDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDto():
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
    TResult? Function(_FileDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDto() when $default != null:
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
            @JsonKey(name: 'file_name') String? fileName,
            @JsonKey(name: 'file_url') String fileUrl,
            @JsonKey(name: 'file_type') String fileType,
            @JsonKey(name: 'file_size') int fileSize)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileDto() when $default != null:
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize);
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
            @JsonKey(name: 'file_name') String? fileName,
            @JsonKey(name: 'file_url') String fileUrl,
            @JsonKey(name: 'file_type') String fileType,
            @JsonKey(name: 'file_size') int fileSize)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDto():
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize);
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
            @JsonKey(name: 'file_name') String? fileName,
            @JsonKey(name: 'file_url') String fileUrl,
            @JsonKey(name: 'file_type') String fileType,
            @JsonKey(name: 'file_size') int fileSize)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDto() when $default != null:
        return $default(_that.id, _that.fileName, _that.fileUrl, _that.fileType,
            _that.fileSize);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FileDto extends FileDto {
  const _FileDto(
      {required this.id,
      @JsonKey(name: 'file_name') this.fileName,
      @JsonKey(name: 'file_url') required this.fileUrl,
      @JsonKey(name: 'file_type') required this.fileType,
      @JsonKey(name: 'file_size') required this.fileSize})
      : super._();
  factory _FileDto.fromJson(Map<String, dynamic> json) =>
      _$FileDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'file_name')
  final String? fileName;
  @override
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @override
  @JsonKey(name: 'file_type')
  final String fileType;
  @override
  @JsonKey(name: 'file_size')
  final int fileSize;

  /// Create a copy of FileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileDtoCopyWith<_FileDto> get copyWith =>
      __$FileDtoCopyWithImpl<_FileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FileDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileUrl, fileType, fileSize);

  @override
  String toString() {
    return 'FileDto(id: $id, fileName: $fileName, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize)';
  }
}

/// @nodoc
abstract mixin class _$FileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$FileDtoCopyWith(_FileDto value, $Res Function(_FileDto) _then) =
      __$FileDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'file_name') String? fileName,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_size') int fileSize});
}

/// @nodoc
class __$FileDtoCopyWithImpl<$Res> implements _$FileDtoCopyWith<$Res> {
  __$FileDtoCopyWithImpl(this._self, this._then);

  final _FileDto _self;
  final $Res Function(_FileDto) _then;

  /// Create a copy of FileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fileName = freezed,
    Object? fileUrl = null,
    Object? fileType = null,
    Object? fileSize = null,
  }) {
    return _then(_FileDto(
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
    ));
  }
}

// dart format on
