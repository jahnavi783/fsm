// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pause_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PauseWorkOrderRequest _$PauseWorkOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _PauseWorkOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$PauseWorkOrderRequest {
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PauseWorkOrderRequestCopyWith<PauseWorkOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PauseWorkOrderRequestCopyWith<$Res> {
  factory $PauseWorkOrderRequestCopyWith(PauseWorkOrderRequest value,
          $Res Function(PauseWorkOrderRequest) then) =
      _$PauseWorkOrderRequestCopyWithImpl<$Res, PauseWorkOrderRequest>;
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class _$PauseWorkOrderRequestCopyWithImpl<$Res,
        $Val extends PauseWorkOrderRequest>
    implements $PauseWorkOrderRequestCopyWith<$Res> {
  _$PauseWorkOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PauseWorkOrderRequestImplCopyWith<$Res>
    implements $PauseWorkOrderRequestCopyWith<$Res> {
  factory _$$PauseWorkOrderRequestImplCopyWith(
          _$PauseWorkOrderRequestImpl value,
          $Res Function(_$PauseWorkOrderRequestImpl) then) =
      __$$PauseWorkOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class __$$PauseWorkOrderRequestImplCopyWithImpl<$Res>
    extends _$PauseWorkOrderRequestCopyWithImpl<$Res,
        _$PauseWorkOrderRequestImpl>
    implements _$$PauseWorkOrderRequestImplCopyWith<$Res> {
  __$$PauseWorkOrderRequestImplCopyWithImpl(_$PauseWorkOrderRequestImpl _value,
      $Res Function(_$PauseWorkOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_$PauseWorkOrderRequestImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      gpsCoordinates: null == gpsCoordinates
          ? _value.gpsCoordinates
          : gpsCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PauseWorkOrderRequestImpl implements _PauseWorkOrderRequest {
  const _$PauseWorkOrderRequestImpl(
      {required this.reason,
      @JsonKey(name: 'gps_coordinates') required this.gpsCoordinates});

  factory _$PauseWorkOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PauseWorkOrderRequestImplFromJson(json);

  @override
  final String reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;

  @override
  String toString() {
    return 'PauseWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseWorkOrderRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.gpsCoordinates, gpsCoordinates) ||
                other.gpsCoordinates == gpsCoordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason, gpsCoordinates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseWorkOrderRequestImplCopyWith<_$PauseWorkOrderRequestImpl>
      get copyWith => __$$PauseWorkOrderRequestImplCopyWithImpl<
          _$PauseWorkOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PauseWorkOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _PauseWorkOrderRequest implements PauseWorkOrderRequest {
  const factory _PauseWorkOrderRequest(
      {required final String reason,
      @JsonKey(name: 'gps_coordinates')
      required final String gpsCoordinates}) = _$PauseWorkOrderRequestImpl;

  factory _PauseWorkOrderRequest.fromJson(Map<String, dynamic> json) =
      _$PauseWorkOrderRequestImpl.fromJson;

  @override
  String get reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  @override
  @JsonKey(ignore: true)
  _$$PauseWorkOrderRequestImplCopyWith<_$PauseWorkOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
