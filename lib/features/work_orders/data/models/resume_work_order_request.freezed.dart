// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResumeWorkOrderRequest _$ResumeWorkOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _ResumeWorkOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$ResumeWorkOrderRequest {
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResumeWorkOrderRequestCopyWith<ResumeWorkOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeWorkOrderRequestCopyWith<$Res> {
  factory $ResumeWorkOrderRequestCopyWith(ResumeWorkOrderRequest value,
          $Res Function(ResumeWorkOrderRequest) then) =
      _$ResumeWorkOrderRequestCopyWithImpl<$Res, ResumeWorkOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class _$ResumeWorkOrderRequestCopyWithImpl<$Res,
        $Val extends ResumeWorkOrderRequest>
    implements $ResumeWorkOrderRequestCopyWith<$Res> {
  _$ResumeWorkOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeWorkOrderRequestImplCopyWith<$Res>
    implements $ResumeWorkOrderRequestCopyWith<$Res> {
  factory _$$ResumeWorkOrderRequestImplCopyWith(
          _$ResumeWorkOrderRequestImpl value,
          $Res Function(_$ResumeWorkOrderRequestImpl) then) =
      __$$ResumeWorkOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class __$$ResumeWorkOrderRequestImplCopyWithImpl<$Res>
    extends _$ResumeWorkOrderRequestCopyWithImpl<$Res,
        _$ResumeWorkOrderRequestImpl>
    implements _$$ResumeWorkOrderRequestImplCopyWith<$Res> {
  __$$ResumeWorkOrderRequestImplCopyWithImpl(
      _$ResumeWorkOrderRequestImpl _value,
      $Res Function(_$ResumeWorkOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_$ResumeWorkOrderRequestImpl(
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResumeWorkOrderRequestImpl implements _ResumeWorkOrderRequest {
  const _$ResumeWorkOrderRequestImpl(
      {@JsonKey(name: 'gps_coordinates') required this.gpsCoordinates,
      this.notes});

  factory _$ResumeWorkOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeWorkOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ResumeWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeWorkOrderRequestImpl &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gpsCoordinates, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeWorkOrderRequestImplCopyWith<_$ResumeWorkOrderRequestImpl>
      get copyWith => __$$ResumeWorkOrderRequestImplCopyWithImpl<
          _$ResumeWorkOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeWorkOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _ResumeWorkOrderRequest implements ResumeWorkOrderRequest {
  const factory _ResumeWorkOrderRequest(
      {@JsonKey(name: 'gps_coordinates') required final String gpsCoordinates,
      final String? notes}) = _$ResumeWorkOrderRequestImpl;

  factory _ResumeWorkOrderRequest.fromJson(Map<String, dynamic> json) =
      _$ResumeWorkOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ResumeWorkOrderRequestImplCopyWith<_$ResumeWorkOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
