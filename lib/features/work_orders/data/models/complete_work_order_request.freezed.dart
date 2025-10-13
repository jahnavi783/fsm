// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompleteWorkOrderRequest _$CompleteWorkOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _CompleteWorkOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CompleteWorkOrderRequest {
  @JsonKey(name: 'work_log')
  String get workLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'parts_used')
  List<PartUsedRequestDto> get partsUsed => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_notes')
  String? get completionNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompleteWorkOrderRequestCopyWith<CompleteWorkOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteWorkOrderRequestCopyWith<$Res> {
  factory $CompleteWorkOrderRequestCopyWith(CompleteWorkOrderRequest value,
          $Res Function(CompleteWorkOrderRequest) then) =
      _$CompleteWorkOrderRequestCopyWithImpl<$Res, CompleteWorkOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'work_log') String workLog,
      @JsonKey(name: 'parts_used') List<PartUsedRequestDto> partsUsed,
      List<String> images,
      @JsonKey(name: 'gps_coordinates') String gpsCoordinates,
      @JsonKey(name: 'completion_notes') String? completionNotes});
}

/// @nodoc
class _$CompleteWorkOrderRequestCopyWithImpl<$Res,
        $Val extends CompleteWorkOrderRequest>
    implements $CompleteWorkOrderRequestCopyWith<$Res> {
  _$CompleteWorkOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workLog = null,
    Object? partsUsed = null,
    Object? images = null,
    Object? gpsCoordinates = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_value.copyWith(
      workLog: null == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _value.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedRequestDto>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteWorkOrderRequestImplCopyWith<$Res>
    implements $CompleteWorkOrderRequestCopyWith<$Res> {
  factory _$$CompleteWorkOrderRequestImplCopyWith(
          _$CompleteWorkOrderRequestImpl value,
          $Res Function(_$CompleteWorkOrderRequestImpl) then) =
      __$$CompleteWorkOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'work_log') String workLog,
      @JsonKey(name: 'parts_used') List<PartUsedRequestDto> partsUsed,
      List<String> images,
      @JsonKey(name: 'gps_coordinates') String gpsCoordinates,
      @JsonKey(name: 'completion_notes') String? completionNotes});
}

/// @nodoc
class __$$CompleteWorkOrderRequestImplCopyWithImpl<$Res>
    extends _$CompleteWorkOrderRequestCopyWithImpl<$Res,
        _$CompleteWorkOrderRequestImpl>
    implements _$$CompleteWorkOrderRequestImplCopyWith<$Res> {
  __$$CompleteWorkOrderRequestImplCopyWithImpl(
      _$CompleteWorkOrderRequestImpl _value,
      $Res Function(_$CompleteWorkOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workLog = null,
    Object? partsUsed = null,
    Object? images = null,
    Object? gpsCoordinates = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_$CompleteWorkOrderRequestImpl(
      workLog: null == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _value._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedRequestDto>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteWorkOrderRequestImpl implements _CompleteWorkOrderRequest {
  const _$CompleteWorkOrderRequestImpl(
      {@JsonKey(name: 'work_log') required this.workLog,
      @JsonKey(name: 'parts_used')
      required final List<PartUsedRequestDto> partsUsed,
      required final List<String> images,
      @JsonKey(name: 'gps_coordinates') required this.gpsCoordinates,
      @JsonKey(name: 'completion_notes') this.completionNotes})
      : _partsUsed = partsUsed,
        _images = images;

  factory _$CompleteWorkOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteWorkOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'work_log')
  final String workLog;
  final List<PartUsedRequestDto> _partsUsed;
  @override
  @JsonKey(name: 'parts_used')
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
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;
  @override
  @JsonKey(name: 'completion_notes')
  final String? completionNotes;

  @override
  String toString() {
    return 'CompleteWorkOrderRequest(workLog: $workLog, partsUsed: $partsUsed, images: $images, gpsCoordinates: $gpsCoordinates, completionNotes: $completionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteWorkOrderRequestImpl &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workLog,
      const DeepCollectionEquality().hash(_partsUsed),
      const DeepCollectionEquality().hash(_images),
      gpsCoordinates,
      completionNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteWorkOrderRequestImplCopyWith<_$CompleteWorkOrderRequestImpl>
      get copyWith => __$$CompleteWorkOrderRequestImplCopyWithImpl<
          _$CompleteWorkOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteWorkOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CompleteWorkOrderRequest implements CompleteWorkOrderRequest {
  const factory _CompleteWorkOrderRequest(
      {@JsonKey(name: 'work_log') required final String workLog,
      @JsonKey(name: 'parts_used')
      required final List<PartUsedRequestDto> partsUsed,
      required final List<String> images,
      @JsonKey(name: 'gps_coordinates') required final String gpsCoordinates,
      @JsonKey(name: 'completion_notes')
      final String? completionNotes}) = _$CompleteWorkOrderRequestImpl;

  factory _CompleteWorkOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CompleteWorkOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'work_log')
  String get workLog;
  @override
  @JsonKey(name: 'parts_used')
  List<PartUsedRequestDto> get partsUsed;
  @override
  List<String> get images;
  @override
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  @override
  @JsonKey(name: 'completion_notes')
  String? get completionNotes;
  @override
  @JsonKey(ignore: true)
  _$$CompleteWorkOrderRequestImplCopyWith<_$CompleteWorkOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PartUsedRequestDto _$PartUsedRequestDtoFromJson(Map<String, dynamic> json) {
  return _PartUsedRequestDto.fromJson(json);
}

/// @nodoc
mixin _$PartUsedRequestDto {
  @JsonKey(name: 'part_number')
  String get partNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_used')
  int get quantityUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartUsedRequestDtoCopyWith<PartUsedRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartUsedRequestDtoCopyWith<$Res> {
  factory $PartUsedRequestDtoCopyWith(
          PartUsedRequestDto value, $Res Function(PartUsedRequestDto) then) =
      _$PartUsedRequestDtoCopyWithImpl<$Res, PartUsedRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'quantity_used') int quantityUsed});
}

/// @nodoc
class _$PartUsedRequestDtoCopyWithImpl<$Res, $Val extends PartUsedRequestDto>
    implements $PartUsedRequestDtoCopyWith<$Res> {
  _$PartUsedRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
  }) {
    return _then(_value.copyWith(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _value.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartUsedRequestDtoImplCopyWith<$Res>
    implements $PartUsedRequestDtoCopyWith<$Res> {
  factory _$$PartUsedRequestDtoImplCopyWith(_$PartUsedRequestDtoImpl value,
          $Res Function(_$PartUsedRequestDtoImpl) then) =
      __$$PartUsedRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'part_number') String partNumber,
      @JsonKey(name: 'quantity_used') int quantityUsed});
}

/// @nodoc
class __$$PartUsedRequestDtoImplCopyWithImpl<$Res>
    extends _$PartUsedRequestDtoCopyWithImpl<$Res, _$PartUsedRequestDtoImpl>
    implements _$$PartUsedRequestDtoImplCopyWith<$Res> {
  __$$PartUsedRequestDtoImplCopyWithImpl(_$PartUsedRequestDtoImpl _value,
      $Res Function(_$PartUsedRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
  }) {
    return _then(_$PartUsedRequestDtoImpl(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _value.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartUsedRequestDtoImpl implements _PartUsedRequestDto {
  const _$PartUsedRequestDtoImpl(
      {@JsonKey(name: 'part_number') required this.partNumber,
      @JsonKey(name: 'quantity_used') required this.quantityUsed});

  factory _$PartUsedRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartUsedRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'part_number')
  final String partNumber;
  @override
  @JsonKey(name: 'quantity_used')
  final int quantityUsed;

  @override
  String toString() {
    return 'PartUsedRequestDto(partNumber: $partNumber, quantityUsed: $quantityUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartUsedRequestDtoImpl &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, quantityUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartUsedRequestDtoImplCopyWith<_$PartUsedRequestDtoImpl> get copyWith =>
      __$$PartUsedRequestDtoImplCopyWithImpl<_$PartUsedRequestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartUsedRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _PartUsedRequestDto implements PartUsedRequestDto {
  const factory _PartUsedRequestDto(
          {@JsonKey(name: 'part_number') required final String partNumber,
          @JsonKey(name: 'quantity_used') required final int quantityUsed}) =
      _$PartUsedRequestDtoImpl;

  factory _PartUsedRequestDto.fromJson(Map<String, dynamic> json) =
      _$PartUsedRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'part_number')
  String get partNumber;
  @override
  @JsonKey(name: 'quantity_used')
  int get quantityUsed;
  @override
  @JsonKey(ignore: true)
  _$$PartUsedRequestDtoImplCopyWith<_$PartUsedRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
