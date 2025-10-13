// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_work_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartWorkOrderRequest _$StartWorkOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _StartWorkOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$StartWorkOrderRequest {
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartWorkOrderRequestCopyWith<StartWorkOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartWorkOrderRequestCopyWith<$Res> {
  factory $StartWorkOrderRequestCopyWith(StartWorkOrderRequest value,
          $Res Function(StartWorkOrderRequest) then) =
      _$StartWorkOrderRequestCopyWithImpl<$Res, StartWorkOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class _$StartWorkOrderRequestCopyWithImpl<$Res,
        $Val extends StartWorkOrderRequest>
    implements $StartWorkOrderRequestCopyWith<$Res> {
  _$StartWorkOrderRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$StartWorkOrderRequestImplCopyWith<$Res>
    implements $StartWorkOrderRequestCopyWith<$Res> {
  factory _$$StartWorkOrderRequestImplCopyWith(
          _$StartWorkOrderRequestImpl value,
          $Res Function(_$StartWorkOrderRequestImpl) then) =
      __$$StartWorkOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gps_coordinates') String gpsCoordinates, String? notes});
}

/// @nodoc
class __$$StartWorkOrderRequestImplCopyWithImpl<$Res>
    extends _$StartWorkOrderRequestCopyWithImpl<$Res,
        _$StartWorkOrderRequestImpl>
    implements _$$StartWorkOrderRequestImplCopyWith<$Res> {
  __$$StartWorkOrderRequestImplCopyWithImpl(_$StartWorkOrderRequestImpl _value,
      $Res Function(_$StartWorkOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsCoordinates = null,
    Object? notes = freezed,
  }) {
    return _then(_$StartWorkOrderRequestImpl(
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
class _$StartWorkOrderRequestImpl implements _StartWorkOrderRequest {
  const _$StartWorkOrderRequestImpl(
      {@JsonKey(name: 'gps_coordinates') required this.gpsCoordinates,
      this.notes});

  factory _$StartWorkOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartWorkOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'gps_coordinates')
  final String gpsCoordinates;
  @override
  final String? notes;

  @override
  String toString() {
    return 'StartWorkOrderRequest(gpsCoordinates: $gpsCoordinates, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartWorkOrderRequestImpl &&
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
  _$$StartWorkOrderRequestImplCopyWith<_$StartWorkOrderRequestImpl>
      get copyWith => __$$StartWorkOrderRequestImplCopyWithImpl<
          _$StartWorkOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartWorkOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _StartWorkOrderRequest implements StartWorkOrderRequest {
  const factory _StartWorkOrderRequest(
      {@JsonKey(name: 'gps_coordinates') required final String gpsCoordinates,
      final String? notes}) = _$StartWorkOrderRequestImpl;

  factory _StartWorkOrderRequest.fromJson(Map<String, dynamic> json) =
      _$StartWorkOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'gps_coordinates')
  String get gpsCoordinates;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$StartWorkOrderRequestImplCopyWith<_$StartWorkOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
