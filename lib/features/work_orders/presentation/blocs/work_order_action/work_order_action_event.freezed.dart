// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_action_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkOrderActionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderActionEventCopyWith<$Res> {
  factory $WorkOrderActionEventCopyWith(WorkOrderActionEvent value,
          $Res Function(WorkOrderActionEvent) then) =
      _$WorkOrderActionEventCopyWithImpl<$Res, WorkOrderActionEvent>;
}

/// @nodoc
class _$WorkOrderActionEventCopyWithImpl<$Res,
        $Val extends WorkOrderActionEvent>
    implements $WorkOrderActionEventCopyWith<$Res> {
  _$WorkOrderActionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadWorkOrderImplCopyWith<$Res> {
  factory _$$LoadWorkOrderImplCopyWith(
          _$LoadWorkOrderImpl value, $Res Function(_$LoadWorkOrderImpl) then) =
      __$$LoadWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$$LoadWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$LoadWorkOrderImpl>
    implements _$$LoadWorkOrderImplCopyWith<$Res> {
  __$$LoadWorkOrderImplCopyWithImpl(
      _$LoadWorkOrderImpl _value, $Res Function(_$LoadWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_$LoadWorkOrderImpl(
      null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadWorkOrderImpl implements _LoadWorkOrder {
  const _$LoadWorkOrderImpl(this.workOrderId);

  @override
  final int workOrderId;

  @override
  String toString() {
    return 'WorkOrderActionEvent.loadWorkOrder(workOrderId: $workOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWorkOrderImplCopyWith<_$LoadWorkOrderImpl> get copyWith =>
      __$$LoadWorkOrderImplCopyWithImpl<_$LoadWorkOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return loadWorkOrder(workOrderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return loadWorkOrder?.call(workOrderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadWorkOrder != null) {
      return loadWorkOrder(workOrderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadWorkOrder != null) {
      return loadWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _LoadWorkOrder implements WorkOrderActionEvent {
  const factory _LoadWorkOrder(final int workOrderId) = _$LoadWorkOrderImpl;

  int get workOrderId;
  @JsonKey(ignore: true)
  _$$LoadWorkOrderImplCopyWith<_$LoadWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartWorkOrderImplCopyWith<$Res> {
  factory _$$StartWorkOrderImplCopyWith(_$StartWorkOrderImpl value,
          $Res Function(_$StartWorkOrderImpl) then) =
      __$$StartWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workOrderId,
      double latitude,
      double longitude,
      List<File> files,
      String? notes});
}

/// @nodoc
class __$$StartWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$StartWorkOrderImpl>
    implements _$$StartWorkOrderImplCopyWith<$Res> {
  __$$StartWorkOrderImplCopyWithImpl(
      _$StartWorkOrderImpl _value, $Res Function(_$StartWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
    Object? notes = freezed,
  }) {
    return _then(_$StartWorkOrderImpl(
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StartWorkOrderImpl implements _StartWorkOrder {
  const _$StartWorkOrderImpl(
      {required this.workOrderId,
      required this.latitude,
      required this.longitude,
      final List<File> files = const [],
      this.notes})
      : _files = files;

  @override
  final int workOrderId;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<File> _files;
  @override
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkOrderActionEvent.startWorkOrder(workOrderId: $workOrderId, latitude: $latitude, longitude: $longitude, files: $files, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId, latitude, longitude,
      const DeepCollectionEquality().hash(_files), notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartWorkOrderImplCopyWith<_$StartWorkOrderImpl> get copyWith =>
      __$$StartWorkOrderImplCopyWithImpl<_$StartWorkOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return startWorkOrder(workOrderId, latitude, longitude, files, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return startWorkOrder?.call(workOrderId, latitude, longitude, files, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (startWorkOrder != null) {
      return startWorkOrder(workOrderId, latitude, longitude, files, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return startWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return startWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (startWorkOrder != null) {
      return startWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _StartWorkOrder implements WorkOrderActionEvent {
  const factory _StartWorkOrder(
      {required final int workOrderId,
      required final double latitude,
      required final double longitude,
      final List<File> files,
      final String? notes}) = _$StartWorkOrderImpl;

  int get workOrderId;
  double get latitude;
  double get longitude;
  List<File> get files;
  String? get notes;
  @JsonKey(ignore: true)
  _$$StartWorkOrderImplCopyWith<_$StartWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseWorkOrderImplCopyWith<$Res> {
  factory _$$PauseWorkOrderImplCopyWith(_$PauseWorkOrderImpl value,
          $Res Function(_$PauseWorkOrderImpl) then) =
      __$$PauseWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workOrderId,
      String reason,
      double latitude,
      double longitude,
      List<File> files});
}

/// @nodoc
class __$$PauseWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$PauseWorkOrderImpl>
    implements _$$PauseWorkOrderImplCopyWith<$Res> {
  __$$PauseWorkOrderImplCopyWithImpl(
      _$PauseWorkOrderImpl _value, $Res Function(_$PauseWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? reason = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
  }) {
    return _then(_$PauseWorkOrderImpl(
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$PauseWorkOrderImpl implements _PauseWorkOrder {
  const _$PauseWorkOrderImpl(
      {required this.workOrderId,
      required this.reason,
      required this.latitude,
      required this.longitude,
      final List<File> files = const []})
      : _files = files;

  @override
  final int workOrderId;
  @override
  final String reason;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<File> _files;
  @override
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'WorkOrderActionEvent.pauseWorkOrder(workOrderId: $workOrderId, reason: $reason, latitude: $latitude, longitude: $longitude, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId, reason, latitude,
      longitude, const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseWorkOrderImplCopyWith<_$PauseWorkOrderImpl> get copyWith =>
      __$$PauseWorkOrderImplCopyWithImpl<_$PauseWorkOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return pauseWorkOrder(workOrderId, reason, latitude, longitude, files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return pauseWorkOrder?.call(
        workOrderId, reason, latitude, longitude, files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (pauseWorkOrder != null) {
      return pauseWorkOrder(workOrderId, reason, latitude, longitude, files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return pauseWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return pauseWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (pauseWorkOrder != null) {
      return pauseWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _PauseWorkOrder implements WorkOrderActionEvent {
  const factory _PauseWorkOrder(
      {required final int workOrderId,
      required final String reason,
      required final double latitude,
      required final double longitude,
      final List<File> files}) = _$PauseWorkOrderImpl;

  int get workOrderId;
  String get reason;
  double get latitude;
  double get longitude;
  List<File> get files;
  @JsonKey(ignore: true)
  _$$PauseWorkOrderImplCopyWith<_$PauseWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResumeWorkOrderImplCopyWith<$Res> {
  factory _$$ResumeWorkOrderImplCopyWith(_$ResumeWorkOrderImpl value,
          $Res Function(_$ResumeWorkOrderImpl) then) =
      __$$ResumeWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workOrderId,
      double latitude,
      double longitude,
      List<File> files,
      String? notes});
}

/// @nodoc
class __$$ResumeWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$ResumeWorkOrderImpl>
    implements _$$ResumeWorkOrderImplCopyWith<$Res> {
  __$$ResumeWorkOrderImplCopyWithImpl(
      _$ResumeWorkOrderImpl _value, $Res Function(_$ResumeWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
    Object? notes = freezed,
  }) {
    return _then(_$ResumeWorkOrderImpl(
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResumeWorkOrderImpl implements _ResumeWorkOrder {
  const _$ResumeWorkOrderImpl(
      {required this.workOrderId,
      required this.latitude,
      required this.longitude,
      final List<File> files = const [],
      this.notes})
      : _files = files;

  @override
  final int workOrderId;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<File> _files;
  @override
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkOrderActionEvent.resumeWorkOrder(workOrderId: $workOrderId, latitude: $latitude, longitude: $longitude, files: $files, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId, latitude, longitude,
      const DeepCollectionEquality().hash(_files), notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeWorkOrderImplCopyWith<_$ResumeWorkOrderImpl> get copyWith =>
      __$$ResumeWorkOrderImplCopyWithImpl<_$ResumeWorkOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return resumeWorkOrder(workOrderId, latitude, longitude, files, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return resumeWorkOrder?.call(
        workOrderId, latitude, longitude, files, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (resumeWorkOrder != null) {
      return resumeWorkOrder(workOrderId, latitude, longitude, files, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return resumeWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return resumeWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (resumeWorkOrder != null) {
      return resumeWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _ResumeWorkOrder implements WorkOrderActionEvent {
  const factory _ResumeWorkOrder(
      {required final int workOrderId,
      required final double latitude,
      required final double longitude,
      final List<File> files,
      final String? notes}) = _$ResumeWorkOrderImpl;

  int get workOrderId;
  double get latitude;
  double get longitude;
  List<File> get files;
  String? get notes;
  @JsonKey(ignore: true)
  _$$ResumeWorkOrderImplCopyWith<_$ResumeWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteWorkOrderImplCopyWith<$Res> {
  factory _$$CompleteWorkOrderImplCopyWith(_$CompleteWorkOrderImpl value,
          $Res Function(_$CompleteWorkOrderImpl) then) =
      __$$CompleteWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workOrderId,
      String workLog,
      List<PartUsedEntity> partsUsed,
      List<File> files,
      double latitude,
      double longitude,
      String? completionNotes});
}

/// @nodoc
class __$$CompleteWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$CompleteWorkOrderImpl>
    implements _$$CompleteWorkOrderImplCopyWith<$Res> {
  __$$CompleteWorkOrderImplCopyWithImpl(_$CompleteWorkOrderImpl _value,
      $Res Function(_$CompleteWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? workLog = null,
    Object? partsUsed = null,
    Object? files = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_$CompleteWorkOrderImpl(
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      workLog: null == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _value._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedEntity>,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CompleteWorkOrderImpl implements _CompleteWorkOrder {
  const _$CompleteWorkOrderImpl(
      {required this.workOrderId,
      required this.workLog,
      required final List<PartUsedEntity> partsUsed,
      required final List<File> files,
      required this.latitude,
      required this.longitude,
      this.completionNotes})
      : _partsUsed = partsUsed,
        _files = files;

  @override
  final int workOrderId;
  @override
  final String workLog;
  final List<PartUsedEntity> _partsUsed;
  @override
  List<PartUsedEntity> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<File> _files;
  @override
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? completionNotes;

  @override
  String toString() {
    return 'WorkOrderActionEvent.completeWorkOrder(workOrderId: $workOrderId, workLog: $workLog, partsUsed: $partsUsed, files: $files, latitude: $latitude, longitude: $longitude, completionNotes: $completionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      workOrderId,
      workLog,
      const DeepCollectionEquality().hash(_partsUsed),
      const DeepCollectionEquality().hash(_files),
      latitude,
      longitude,
      completionNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteWorkOrderImplCopyWith<_$CompleteWorkOrderImpl> get copyWith =>
      __$$CompleteWorkOrderImplCopyWithImpl<_$CompleteWorkOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return completeWorkOrder(workOrderId, workLog, partsUsed, files, latitude,
        longitude, completionNotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return completeWorkOrder?.call(workOrderId, workLog, partsUsed, files,
        latitude, longitude, completionNotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (completeWorkOrder != null) {
      return completeWorkOrder(workOrderId, workLog, partsUsed, files, latitude,
          longitude, completionNotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return completeWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return completeWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (completeWorkOrder != null) {
      return completeWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _CompleteWorkOrder implements WorkOrderActionEvent {
  const factory _CompleteWorkOrder(
      {required final int workOrderId,
      required final String workLog,
      required final List<PartUsedEntity> partsUsed,
      required final List<File> files,
      required final double latitude,
      required final double longitude,
      final String? completionNotes}) = _$CompleteWorkOrderImpl;

  int get workOrderId;
  String get workLog;
  List<PartUsedEntity> get partsUsed;
  List<File> get files;
  double get latitude;
  double get longitude;
  String? get completionNotes;
  @JsonKey(ignore: true)
  _$$CompleteWorkOrderImplCopyWith<_$CompleteWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectWorkOrderImplCopyWith<$Res> {
  factory _$$RejectWorkOrderImplCopyWith(_$RejectWorkOrderImpl value,
          $Res Function(_$RejectWorkOrderImpl) then) =
      __$$RejectWorkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workOrderId, String reason, double latitude, double longitude});
}

/// @nodoc
class __$$RejectWorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$RejectWorkOrderImpl>
    implements _$$RejectWorkOrderImplCopyWith<$Res> {
  __$$RejectWorkOrderImplCopyWithImpl(
      _$RejectWorkOrderImpl _value, $Res Function(_$RejectWorkOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? reason = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$RejectWorkOrderImpl(
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RejectWorkOrderImpl implements _RejectWorkOrder {
  const _$RejectWorkOrderImpl(
      {required this.workOrderId,
      required this.reason,
      required this.latitude,
      required this.longitude});

  @override
  final int workOrderId;
  @override
  final String reason;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'WorkOrderActionEvent.rejectWorkOrder(workOrderId: $workOrderId, reason: $reason, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectWorkOrderImpl &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workOrderId, reason, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectWorkOrderImplCopyWith<_$RejectWorkOrderImpl> get copyWith =>
      __$$RejectWorkOrderImplCopyWithImpl<_$RejectWorkOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return rejectWorkOrder(workOrderId, reason, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return rejectWorkOrder?.call(workOrderId, reason, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (rejectWorkOrder != null) {
      return rejectWorkOrder(workOrderId, reason, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return rejectWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return rejectWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (rejectWorkOrder != null) {
      return rejectWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _RejectWorkOrder implements WorkOrderActionEvent {
  const factory _RejectWorkOrder(
      {required final int workOrderId,
      required final String reason,
      required final double latitude,
      required final double longitude}) = _$RejectWorkOrderImpl;

  int get workOrderId;
  String get reason;
  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$RejectWorkOrderImplCopyWith<_$RejectWorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CaptureLocationImplCopyWith<$Res> {
  factory _$$CaptureLocationImplCopyWith(_$CaptureLocationImpl value,
          $Res Function(_$CaptureLocationImpl) then) =
      __$$CaptureLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CaptureLocationImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$CaptureLocationImpl>
    implements _$$CaptureLocationImplCopyWith<$Res> {
  __$$CaptureLocationImplCopyWithImpl(
      _$CaptureLocationImpl _value, $Res Function(_$CaptureLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CaptureLocationImpl implements _CaptureLocation {
  const _$CaptureLocationImpl();

  @override
  String toString() {
    return 'WorkOrderActionEvent.captureLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CaptureLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return captureLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return captureLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (captureLocation != null) {
      return captureLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return captureLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return captureLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (captureLocation != null) {
      return captureLocation(this);
    }
    return orElse();
  }
}

abstract class _CaptureLocation implements WorkOrderActionEvent {
  const factory _CaptureLocation() = _$CaptureLocationImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$WorkOrderActionEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'WorkOrderActionEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int workOrderId) loadWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        startWorkOrder,
    required TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)
        pauseWorkOrder,
    required TResult Function(int workOrderId, double latitude,
            double longitude, List<File> files, String? notes)
        resumeWorkOrder,
    required TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)
        completeWorkOrder,
    required TResult Function(
            int workOrderId, String reason, double latitude, double longitude)
        rejectWorkOrder,
    required TResult Function() captureLocation,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workOrderId)? loadWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult? Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult? Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult? Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult? Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult? Function()? captureLocation,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workOrderId)? loadWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        startWorkOrder,
    TResult Function(int workOrderId, String reason, double latitude,
            double longitude, List<File> files)?
        pauseWorkOrder,
    TResult Function(int workOrderId, double latitude, double longitude,
            List<File> files, String? notes)?
        resumeWorkOrder,
    TResult Function(
            int workOrderId,
            String workLog,
            List<PartUsedEntity> partsUsed,
            List<File> files,
            double latitude,
            double longitude,
            String? completionNotes)?
        completeWorkOrder,
    TResult Function(
            int workOrderId, String reason, double latitude, double longitude)?
        rejectWorkOrder,
    TResult Function()? captureLocation,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWorkOrder value) loadWorkOrder,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
    required TResult Function(_RejectWorkOrder value) rejectWorkOrder,
    required TResult Function(_CaptureLocation value) captureLocation,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult? Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult? Function(_CaptureLocation value)? captureLocation,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWorkOrder value)? loadWorkOrder,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    TResult Function(_RejectWorkOrder value)? rejectWorkOrder,
    TResult Function(_CaptureLocation value)? captureLocation,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements WorkOrderActionEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}
