// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RejectWorkOrderRequest _$RejectWorkOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _RejectWorkOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$RejectWorkOrderRequest {
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RejectWorkOrderRequestCopyWith<RejectWorkOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectWorkOrderRequestCopyWith<$Res> {
  factory $RejectWorkOrderRequestCopyWith(RejectWorkOrderRequest value,
          $Res Function(RejectWorkOrderRequest) then) =
      _$RejectWorkOrderRequestCopyWithImpl<$Res, RejectWorkOrderRequest>;
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class _$RejectWorkOrderRequestCopyWithImpl<$Res,
        $Val extends RejectWorkOrderRequest>
    implements $RejectWorkOrderRequestCopyWith<$Res> {
  _$RejectWorkOrderRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$RejectWorkOrderRequestImplCopyWith<$Res>
    implements $RejectWorkOrderRequestCopyWith<$Res> {
  factory _$$RejectWorkOrderRequestImplCopyWith(
          _$RejectWorkOrderRequestImpl value,
          $Res Function(_$RejectWorkOrderRequestImpl) then) =
      __$$RejectWorkOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reason, @JsonKey(name: 'gps_coordinates') String gpsCoordinates});
}

/// @nodoc
class __$$RejectWorkOrderRequestImplCopyWithImpl<$Res>
    extends _$RejectWorkOrderRequestCopyWithImpl<$Res,
        _$RejectWorkOrderRequestImpl>
    implements _$$RejectWorkOrderRequestImplCopyWith<$Res> {
  __$$RejectWorkOrderRequestImplCopyWithImpl(
      _$RejectWorkOrderRequestImpl _value,
      $Res Function(_$RejectWorkOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? gpsCoordinates = null,
  }) {
    return _then(_$RejectWorkOrderRequestImpl(
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
class _$RejectWorkOrderRequestImpl implements _RejectWorkOrderRequest {
  const _$RejectWorkOrderRequestImpl(
      {required this.reason,
      @JsonKey(name: 'gps_coordinates') required this.gpsCoordinates});

  factory _$RejectWorkOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectWorkOrderRequestImplFromJson(json);

  @override
  final String reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;

  @override
  String toString() {
    return 'RejectWorkOrderRequest(reason: $reason, gpsCoordinates: $gpsCoordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectWorkOrderRequestImpl &&
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
  _$$RejectWorkOrderRequestImplCopyWith<_$RejectWorkOrderRequestImpl>
      get copyWith => __$$RejectWorkOrderRequestImplCopyWithImpl<
          _$RejectWorkOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectWorkOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _RejectWorkOrderRequest implements RejectWorkOrderRequest {
  const factory _RejectWorkOrderRequest(
      {required final String reason,
      @JsonKey(name: 'gps_coordinates')
      required final String gpsCoordinates}) = _$RejectWorkOrderRequestImpl;

  factory _RejectWorkOrderRequest.fromJson(Map<String, dynamic> json) =
      _$RejectWorkOrderRequestImpl.fromJson;

  @override
  String get reason;
  @override
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  @override
  @JsonKey(ignore: true)
  _$$RejectWorkOrderRequestImplCopyWith<_$RejectWorkOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
