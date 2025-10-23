// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompleteWorkOrderRequest {
  String get workLog;
  List<PartUsedRequestDto> get partsUsed;
  List<String> get images;
  String get gpsCoordinates;
  String? get completionNotes;

  /// Create a copy of CompleteWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompleteWorkOrderRequestCopyWith<CompleteWorkOrderRequest> get copyWith =>
      _$CompleteWorkOrderRequestCopyWithImpl<CompleteWorkOrderRequest>(
          this as CompleteWorkOrderRequest, _$identity);

  /// Serializes this CompleteWorkOrderRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompleteWorkOrderRequest &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality().equals(other.partsUsed, partsUsed) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workLog,
      const DeepCollectionEquality().hash(partsUsed),
      const DeepCollectionEquality().hash(images),
      gpsCoordinates,
      completionNotes);

  @override
  String toString() {
    return 'CompleteWorkOrderRequest(workLog: $workLog, partsUsed: $partsUsed, images: $images, gpsCoordinates: $gpsCoordinates, completionNotes: $completionNotes)';
  }
}

/// @nodoc
abstract mixin class $CompleteWorkOrderRequestCopyWith<$Res> {
  factory $CompleteWorkOrderRequestCopyWith(CompleteWorkOrderRequest value,
          $Res Function(CompleteWorkOrderRequest) _then) =
      _$CompleteWorkOrderRequestCopyWithImpl;
  @useResult
  $Res call(
      {String workLog,
      List<PartUsedRequestDto> partsUsed,
      List<String> images,
      String gpsCoordinates,
      String? completionNotes});
}

/// @nodoc
class _$CompleteWorkOrderRequestCopyWithImpl<$Res>
    implements $CompleteWorkOrderRequestCopyWith<$Res> {
  _$CompleteWorkOrderRequestCopyWithImpl(this._self, this._then);

  final CompleteWorkOrderRequest _self;
  final $Res Function(CompleteWorkOrderRequest) _then;

  /// Create a copy of CompleteWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workLog = null,
    Object? partsUsed = null,
    Object? images = null,
    Object? gpsCoordinates = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_self.copyWith(
      workLog: null == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _self.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedRequestDto>,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CompleteWorkOrderRequest].
extension CompleteWorkOrderRequestPatterns on CompleteWorkOrderRequest {
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
    TResult Function(_CompleteWorkOrderRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest() when $default != null:
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
    TResult Function(_CompleteWorkOrderRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest():
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
    TResult? Function(_CompleteWorkOrderRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest() when $default != null:
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
            String workLog,
            List<PartUsedRequestDto> partsUsed,
            List<String> images,
            String gpsCoordinates,
            String? completionNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest() when $default != null:
        return $default(_that.workLog, _that.partsUsed, _that.images,
            _that.gpsCoordinates, _that.completionNotes);
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
    TResult Function(String workLog, List<PartUsedRequestDto> partsUsed,
            List<String> images, String gpsCoordinates, String? completionNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest():
        return $default(_that.workLog, _that.partsUsed, _that.images,
            _that.gpsCoordinates, _that.completionNotes);
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
            String workLog,
            List<PartUsedRequestDto> partsUsed,
            List<String> images,
            String gpsCoordinates,
            String? completionNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompleteWorkOrderRequest() when $default != null:
        return $default(_that.workLog, _that.partsUsed, _that.images,
            _that.gpsCoordinates, _that.completionNotes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CompleteWorkOrderRequest implements CompleteWorkOrderRequest {
  const _CompleteWorkOrderRequest(
      {required this.workLog,
      required final List<PartUsedRequestDto> partsUsed,
      required final List<String> images,
      required this.gpsCoordinates,
      this.completionNotes})
      : _partsUsed = partsUsed,
        _images = images;
  factory _CompleteWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteWorkOrderRequestFromJson(json);

  @override
  final String workLog;
  final List<PartUsedRequestDto> _partsUsed;
  @override
  List<PartUsedRequestDto> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String gpsCoordinates;
  @override
  final String? completionNotes;

  /// Create a copy of CompleteWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompleteWorkOrderRequestCopyWith<_CompleteWorkOrderRequest> get copyWith =>
      __$CompleteWorkOrderRequestCopyWithImpl<_CompleteWorkOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompleteWorkOrderRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompleteWorkOrderRequest &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workLog,
      const DeepCollectionEquality().hash(_partsUsed),
      const DeepCollectionEquality().hash(_images),
      gpsCoordinates,
      completionNotes);

  @override
  String toString() {
    return 'CompleteWorkOrderRequest(workLog: $workLog, partsUsed: $partsUsed, images: $images, gpsCoordinates: $gpsCoordinates, completionNotes: $completionNotes)';
  }
}

/// @nodoc
abstract mixin class _$CompleteWorkOrderRequestCopyWith<$Res>
    implements $CompleteWorkOrderRequestCopyWith<$Res> {
  factory _$CompleteWorkOrderRequestCopyWith(_CompleteWorkOrderRequest value,
          $Res Function(_CompleteWorkOrderRequest) _then) =
      __$CompleteWorkOrderRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String workLog,
      List<PartUsedRequestDto> partsUsed,
      List<String> images,
      String gpsCoordinates,
      String? completionNotes});
}

/// @nodoc
class __$CompleteWorkOrderRequestCopyWithImpl<$Res>
    implements _$CompleteWorkOrderRequestCopyWith<$Res> {
  __$CompleteWorkOrderRequestCopyWithImpl(this._self, this._then);

  final _CompleteWorkOrderRequest _self;
  final $Res Function(_CompleteWorkOrderRequest) _then;

  /// Create a copy of CompleteWorkOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workLog = null,
    Object? partsUsed = null,
    Object? images = null,
    Object? gpsCoordinates = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_CompleteWorkOrderRequest(
      workLog: null == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedRequestDto>,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: null == gpsCoordinates
          ? _self.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PartUsedRequestDto {
  String get partNumber;
  int get quantityUsed;

  /// Create a copy of PartUsedRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartUsedRequestDtoCopyWith<PartUsedRequestDto> get copyWith =>
      _$PartUsedRequestDtoCopyWithImpl<PartUsedRequestDto>(
          this as PartUsedRequestDto, _$identity);

  /// Serializes this PartUsedRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartUsedRequestDto &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, quantityUsed);

  @override
  String toString() {
    return 'PartUsedRequestDto(partNumber: $partNumber, quantityUsed: $quantityUsed)';
  }
}

/// @nodoc
abstract mixin class $PartUsedRequestDtoCopyWith<$Res> {
  factory $PartUsedRequestDtoCopyWith(
          PartUsedRequestDto value, $Res Function(PartUsedRequestDto) _then) =
      _$PartUsedRequestDtoCopyWithImpl;
  @useResult
  $Res call({String partNumber, int quantityUsed});
}

/// @nodoc
class _$PartUsedRequestDtoCopyWithImpl<$Res>
    implements $PartUsedRequestDtoCopyWith<$Res> {
  _$PartUsedRequestDtoCopyWithImpl(this._self, this._then);

  final PartUsedRequestDto _self;
  final $Res Function(PartUsedRequestDto) _then;

  /// Create a copy of PartUsedRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
  }) {
    return _then(_self.copyWith(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartUsedRequestDto].
extension PartUsedRequestDtoPatterns on PartUsedRequestDto {
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
    TResult Function(_PartUsedRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto() when $default != null:
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
    TResult Function(_PartUsedRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto():
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
    TResult? Function(_PartUsedRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto() when $default != null:
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
    TResult Function(String partNumber, int quantityUsed)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed);
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
    TResult Function(String partNumber, int quantityUsed) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto():
        return $default(_that.partNumber, _that.quantityUsed);
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
    TResult? Function(String partNumber, int quantityUsed)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedRequestDto() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartUsedRequestDto implements PartUsedRequestDto {
  const _PartUsedRequestDto(
      {required this.partNumber, required this.quantityUsed});
  factory _PartUsedRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedRequestDtoFromJson(json);

  @override
  final String partNumber;
  @override
  final int quantityUsed;

  /// Create a copy of PartUsedRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartUsedRequestDtoCopyWith<_PartUsedRequestDto> get copyWith =>
      __$PartUsedRequestDtoCopyWithImpl<_PartUsedRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartUsedRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartUsedRequestDto &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, quantityUsed);

  @override
  String toString() {
    return 'PartUsedRequestDto(partNumber: $partNumber, quantityUsed: $quantityUsed)';
  }
}

/// @nodoc
abstract mixin class _$PartUsedRequestDtoCopyWith<$Res>
    implements $PartUsedRequestDtoCopyWith<$Res> {
  factory _$PartUsedRequestDtoCopyWith(
          _PartUsedRequestDto value, $Res Function(_PartUsedRequestDto) _then) =
      __$PartUsedRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String partNumber, int quantityUsed});
}

/// @nodoc
class __$PartUsedRequestDtoCopyWithImpl<$Res>
    implements _$PartUsedRequestDtoCopyWith<$Res> {
  __$PartUsedRequestDtoCopyWithImpl(this._self, this._then);

  final _PartUsedRequestDto _self;
  final $Res Function(_PartUsedRequestDto) _then;

  /// Create a copy of PartUsedRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
  }) {
    return _then(_PartUsedRequestDto(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
