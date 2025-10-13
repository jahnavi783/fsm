// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderResponse _$WorkOrderResponseFromJson(Map<String, dynamic> json) {
  return _WorkOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderResponse {
  @JsonKey(name: 'work_order')
  WorkOrderDto get workOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOrderResponseCopyWith<WorkOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderResponseCopyWith<$Res> {
  factory $WorkOrderResponseCopyWith(
          WorkOrderResponse value, $Res Function(WorkOrderResponse) then) =
      _$WorkOrderResponseCopyWithImpl<$Res, WorkOrderResponse>;
  @useResult
  $Res call({@JsonKey(name: 'work_order') WorkOrderDto workOrder});

  $WorkOrderDtoCopyWith<$Res> get workOrder;
}

/// @nodoc
class _$WorkOrderResponseCopyWithImpl<$Res, $Val extends WorkOrderResponse>
    implements $WorkOrderResponseCopyWith<$Res> {
  _$WorkOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrder = null,
  }) {
    return _then(_value.copyWith(
      workOrder: null == workOrder
          ? _value.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkOrderDtoCopyWith<$Res> get workOrder {
    return $WorkOrderDtoCopyWith<$Res>(_value.workOrder, (value) {
      return _then(_value.copyWith(workOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderResponseImplCopyWith<$Res>
    implements $WorkOrderResponseCopyWith<$Res> {
  factory _$$WorkOrderResponseImplCopyWith(_$WorkOrderResponseImpl value,
          $Res Function(_$WorkOrderResponseImpl) then) =
      __$$WorkOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'work_order') WorkOrderDto workOrder});

  @override
  $WorkOrderDtoCopyWith<$Res> get workOrder;
}

/// @nodoc
class __$$WorkOrderResponseImplCopyWithImpl<$Res>
    extends _$WorkOrderResponseCopyWithImpl<$Res, _$WorkOrderResponseImpl>
    implements _$$WorkOrderResponseImplCopyWith<$Res> {
  __$$WorkOrderResponseImplCopyWithImpl(_$WorkOrderResponseImpl _value,
      $Res Function(_$WorkOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrder = null,
  }) {
    return _then(_$WorkOrderResponseImpl(
      workOrder: null == workOrder
          ? _value.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOrderResponseImpl implements _WorkOrderResponse {
  const _$WorkOrderResponseImpl(
      {@JsonKey(name: 'work_order') required this.workOrder});

  factory _$WorkOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderResponseImplFromJson(json);

  @override
  @JsonKey(name: 'work_order')
  final WorkOrderDto workOrder;

  @override
  String toString() {
    return 'WorkOrderResponse(workOrder: $workOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderResponseImpl &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, workOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderResponseImplCopyWith<_$WorkOrderResponseImpl> get copyWith =>
      __$$WorkOrderResponseImplCopyWithImpl<_$WorkOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderResponse implements WorkOrderResponse {
  const factory _WorkOrderResponse(
      {@JsonKey(name: 'work_order')
      required final WorkOrderDto workOrder}) = _$WorkOrderResponseImpl;

  factory _WorkOrderResponse.fromJson(Map<String, dynamic> json) =
      _$WorkOrderResponseImpl.fromJson;

  @override
  @JsonKey(name: 'work_order')
  WorkOrderDto get workOrder;
  @override
  @JsonKey(ignore: true)
  _$$WorkOrderResponseImplCopyWith<_$WorkOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
