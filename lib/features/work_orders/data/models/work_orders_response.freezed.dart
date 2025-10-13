// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrdersResponse _$WorkOrdersResponseFromJson(Map<String, dynamic> json) {
  return _WorkOrdersResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkOrdersResponse {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOrdersResponseCopyWith<WorkOrdersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrdersResponseCopyWith<$Res> {
  factory $WorkOrdersResponseCopyWith(
          WorkOrdersResponse value, $Res Function(WorkOrdersResponse) then) =
      _$WorkOrdersResponseCopyWithImpl<$Res, WorkOrdersResponse>;
  @useResult
  $Res call(
      {int total,
      int page,
      int pages,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});
}

/// @nodoc
class _$WorkOrdersResponseCopyWithImpl<$Res, $Val extends WorkOrdersResponse>
    implements $WorkOrdersResponseCopyWith<$Res> {
  _$WorkOrdersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? workOrders = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      workOrders: null == workOrders
          ? _value.workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkOrdersResponseImplCopyWith<$Res>
    implements $WorkOrdersResponseCopyWith<$Res> {
  factory _$$WorkOrdersResponseImplCopyWith(_$WorkOrdersResponseImpl value,
          $Res Function(_$WorkOrdersResponseImpl) then) =
      __$$WorkOrdersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int page,
      int pages,
      @JsonKey(name: 'work_orders') List<WorkOrderDto> workOrders});
}

/// @nodoc
class __$$WorkOrdersResponseImplCopyWithImpl<$Res>
    extends _$WorkOrdersResponseCopyWithImpl<$Res, _$WorkOrdersResponseImpl>
    implements _$$WorkOrdersResponseImplCopyWith<$Res> {
  __$$WorkOrdersResponseImplCopyWithImpl(_$WorkOrdersResponseImpl _value,
      $Res Function(_$WorkOrdersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? workOrders = null,
  }) {
    return _then(_$WorkOrdersResponseImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      workOrders: null == workOrders
          ? _value._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOrdersResponseImpl implements _WorkOrdersResponse {
  const _$WorkOrdersResponseImpl(
      {required this.total,
      required this.page,
      required this.pages,
      @JsonKey(name: 'work_orders')
      required final List<WorkOrderDto> workOrders})
      : _workOrders = workOrders;

  factory _$WorkOrdersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrdersResponseImplFromJson(json);

  @override
  final int total;
  @override
  final int page;
  @override
  final int pages;
  final List<WorkOrderDto> _workOrders;
  @override
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  @override
  String toString() {
    return 'WorkOrdersResponse(total: $total, page: $page, pages: $pages, workOrders: $workOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrdersResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_workOrders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrdersResponseImplCopyWith<_$WorkOrdersResponseImpl> get copyWith =>
      __$$WorkOrdersResponseImplCopyWithImpl<_$WorkOrdersResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrdersResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkOrdersResponse implements WorkOrdersResponse {
  const factory _WorkOrdersResponse(
      {required final int total,
      required final int page,
      required final int pages,
      @JsonKey(name: 'work_orders')
      required final List<WorkOrderDto> workOrders}) = _$WorkOrdersResponseImpl;

  factory _WorkOrdersResponse.fromJson(Map<String, dynamic> json) =
      _$WorkOrdersResponseImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  int get pages;
  @override
  @JsonKey(name: 'work_orders')
  List<WorkOrderDto> get workOrders;
  @override
  @JsonKey(ignore: true)
  _$$WorkOrdersResponseImplCopyWith<_$WorkOrdersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
