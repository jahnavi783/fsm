// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_action_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderActionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorkOrderActionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionEvent()';
  }
}

/// @nodoc
class $WorkOrderActionEventCopyWith<$Res> {
  $WorkOrderActionEventCopyWith(
      WorkOrderActionEvent _, $Res Function(WorkOrderActionEvent) __);
}

/// Adds pattern-matching-related methods to [WorkOrderActionEvent].
extension WorkOrderActionEventPatterns on WorkOrderActionEvent {
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder() when loadWorkOrder != null:
        return loadWorkOrder(_that);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that);
      case _RejectWorkOrder() when rejectWorkOrder != null:
        return rejectWorkOrder(_that);
      case _CaptureLocation() when captureLocation != null:
        return captureLocation(_that);
      case _ClearError() when clearError != null:
        return clearError(_that);
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder():
        return loadWorkOrder(_that);
      case _StartWorkOrder():
        return startWorkOrder(_that);
      case _PauseWorkOrder():
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder():
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder():
        return completeWorkOrder(_that);
      case _RejectWorkOrder():
        return rejectWorkOrder(_that);
      case _CaptureLocation():
        return captureLocation(_that);
      case _ClearError():
        return clearError(_that);
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder() when loadWorkOrder != null:
        return loadWorkOrder(_that);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that);
      case _RejectWorkOrder() when rejectWorkOrder != null:
        return rejectWorkOrder(_that);
      case _CaptureLocation() when captureLocation != null:
        return captureLocation(_that);
      case _ClearError() when clearError != null:
        return clearError(_that);
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder() when loadWorkOrder != null:
        return loadWorkOrder(_that.workOrderId);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that.workOrderId, _that.reason, _that.latitude,
            _that.longitude, _that.files);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(
            _that.workOrderId,
            _that.workLog,
            _that.partsUsed,
            _that.files,
            _that.latitude,
            _that.longitude,
            _that.completionNotes);
      case _RejectWorkOrder() when rejectWorkOrder != null:
        return rejectWorkOrder(
            _that.workOrderId, _that.reason, _that.latitude, _that.longitude);
      case _CaptureLocation() when captureLocation != null:
        return captureLocation();
      case _ClearError() when clearError != null:
        return clearError();
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder():
        return loadWorkOrder(_that.workOrderId);
      case _StartWorkOrder():
        return startWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _PauseWorkOrder():
        return pauseWorkOrder(_that.workOrderId, _that.reason, _that.latitude,
            _that.longitude, _that.files);
      case _ResumeWorkOrder():
        return resumeWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _CompleteWorkOrder():
        return completeWorkOrder(
            _that.workOrderId,
            _that.workLog,
            _that.partsUsed,
            _that.files,
            _that.latitude,
            _that.longitude,
            _that.completionNotes);
      case _RejectWorkOrder():
        return rejectWorkOrder(
            _that.workOrderId, _that.reason, _that.latitude, _that.longitude);
      case _CaptureLocation():
        return captureLocation();
      case _ClearError():
        return clearError();
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
    final _that = this;
    switch (_that) {
      case _LoadWorkOrder() when loadWorkOrder != null:
        return loadWorkOrder(_that.workOrderId);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that.workOrderId, _that.reason, _that.latitude,
            _that.longitude, _that.files);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that.workOrderId, _that.latitude,
            _that.longitude, _that.files, _that.notes);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(
            _that.workOrderId,
            _that.workLog,
            _that.partsUsed,
            _that.files,
            _that.latitude,
            _that.longitude,
            _that.completionNotes);
      case _RejectWorkOrder() when rejectWorkOrder != null:
        return rejectWorkOrder(
            _that.workOrderId, _that.reason, _that.latitude, _that.longitude);
      case _CaptureLocation() when captureLocation != null:
        return captureLocation();
      case _ClearError() when clearError != null:
        return clearError();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadWorkOrder implements WorkOrderActionEvent {
  const _LoadWorkOrder(this.workOrderId);

  final int workOrderId;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadWorkOrderCopyWith<_LoadWorkOrder> get copyWith =>
      __$LoadWorkOrderCopyWithImpl<_LoadWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'WorkOrderActionEvent.loadWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$LoadWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$LoadWorkOrderCopyWith(
          _LoadWorkOrder value, $Res Function(_LoadWorkOrder) _then) =
      __$LoadWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$LoadWorkOrderCopyWithImpl<$Res>
    implements _$LoadWorkOrderCopyWith<$Res> {
  __$LoadWorkOrderCopyWithImpl(this._self, this._then);

  final _LoadWorkOrder _self;
  final $Res Function(_LoadWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_LoadWorkOrder(
      null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _StartWorkOrder implements WorkOrderActionEvent {
  const _StartWorkOrder(
      {required this.workOrderId,
      required this.latitude,
      required this.longitude,
      final List<File> files = const [],
      this.notes})
      : _files = files;

  final int workOrderId;
  final double latitude;
  final double longitude;
  final List<File> _files;
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  final String? notes;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartWorkOrderCopyWith<_StartWorkOrder> get copyWith =>
      __$StartWorkOrderCopyWithImpl<_StartWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartWorkOrder &&
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

  @override
  String toString() {
    return 'WorkOrderActionEvent.startWorkOrder(workOrderId: $workOrderId, latitude: $latitude, longitude: $longitude, files: $files, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StartWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$StartWorkOrderCopyWith(
          _StartWorkOrder value, $Res Function(_StartWorkOrder) _then) =
      __$StartWorkOrderCopyWithImpl;
  @useResult
  $Res call(
      {int workOrderId,
      double latitude,
      double longitude,
      List<File> files,
      String? notes});
}

/// @nodoc
class __$StartWorkOrderCopyWithImpl<$Res>
    implements _$StartWorkOrderCopyWith<$Res> {
  __$StartWorkOrderCopyWithImpl(this._self, this._then);

  final _StartWorkOrder _self;
  final $Res Function(_StartWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
    Object? notes = freezed,
  }) {
    return _then(_StartWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _PauseWorkOrder implements WorkOrderActionEvent {
  const _PauseWorkOrder(
      {required this.workOrderId,
      required this.reason,
      required this.latitude,
      required this.longitude,
      final List<File> files = const []})
      : _files = files;

  final int workOrderId;
  final String reason;
  final double latitude;
  final double longitude;
  final List<File> _files;
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauseWorkOrderCopyWith<_PauseWorkOrder> get copyWith =>
      __$PauseWorkOrderCopyWithImpl<_PauseWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauseWorkOrder &&
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

  @override
  String toString() {
    return 'WorkOrderActionEvent.pauseWorkOrder(workOrderId: $workOrderId, reason: $reason, latitude: $latitude, longitude: $longitude, files: $files)';
  }
}

/// @nodoc
abstract mixin class _$PauseWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$PauseWorkOrderCopyWith(
          _PauseWorkOrder value, $Res Function(_PauseWorkOrder) _then) =
      __$PauseWorkOrderCopyWithImpl;
  @useResult
  $Res call(
      {int workOrderId,
      String reason,
      double latitude,
      double longitude,
      List<File> files});
}

/// @nodoc
class __$PauseWorkOrderCopyWithImpl<$Res>
    implements _$PauseWorkOrderCopyWith<$Res> {
  __$PauseWorkOrderCopyWithImpl(this._self, this._then);

  final _PauseWorkOrder _self;
  final $Res Function(_PauseWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? reason = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
  }) {
    return _then(_PauseWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _ResumeWorkOrder implements WorkOrderActionEvent {
  const _ResumeWorkOrder(
      {required this.workOrderId,
      required this.latitude,
      required this.longitude,
      final List<File> files = const [],
      this.notes})
      : _files = files;

  final int workOrderId;
  final double latitude;
  final double longitude;
  final List<File> _files;
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  final String? notes;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResumeWorkOrderCopyWith<_ResumeWorkOrder> get copyWith =>
      __$ResumeWorkOrderCopyWithImpl<_ResumeWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResumeWorkOrder &&
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

  @override
  String toString() {
    return 'WorkOrderActionEvent.resumeWorkOrder(workOrderId: $workOrderId, latitude: $latitude, longitude: $longitude, files: $files, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$ResumeWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$ResumeWorkOrderCopyWith(
          _ResumeWorkOrder value, $Res Function(_ResumeWorkOrder) _then) =
      __$ResumeWorkOrderCopyWithImpl;
  @useResult
  $Res call(
      {int workOrderId,
      double latitude,
      double longitude,
      List<File> files,
      String? notes});
}

/// @nodoc
class __$ResumeWorkOrderCopyWithImpl<$Res>
    implements _$ResumeWorkOrderCopyWith<$Res> {
  __$ResumeWorkOrderCopyWithImpl(this._self, this._then);

  final _ResumeWorkOrder _self;
  final $Res Function(_ResumeWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? files = null,
    Object? notes = freezed,
  }) {
    return _then(_ResumeWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _CompleteWorkOrder implements WorkOrderActionEvent {
  const _CompleteWorkOrder(
      {required this.workOrderId,
      required this.workLog,
      required final List<PartUsedEntity> partsUsed,
      required final List<File> files,
      required this.latitude,
      required this.longitude,
      this.completionNotes})
      : _partsUsed = partsUsed,
        _files = files;

  final int workOrderId;
  final String workLog;
  final List<PartUsedEntity> _partsUsed;
  List<PartUsedEntity> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<File> _files;
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  final double latitude;
  final double longitude;
  final String? completionNotes;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompleteWorkOrderCopyWith<_CompleteWorkOrder> get copyWith =>
      __$CompleteWorkOrderCopyWithImpl<_CompleteWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompleteWorkOrder &&
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

  @override
  String toString() {
    return 'WorkOrderActionEvent.completeWorkOrder(workOrderId: $workOrderId, workLog: $workLog, partsUsed: $partsUsed, files: $files, latitude: $latitude, longitude: $longitude, completionNotes: $completionNotes)';
  }
}

/// @nodoc
abstract mixin class _$CompleteWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$CompleteWorkOrderCopyWith(
          _CompleteWorkOrder value, $Res Function(_CompleteWorkOrder) _then) =
      __$CompleteWorkOrderCopyWithImpl;
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
class __$CompleteWorkOrderCopyWithImpl<$Res>
    implements _$CompleteWorkOrderCopyWith<$Res> {
  __$CompleteWorkOrderCopyWithImpl(this._self, this._then);

  final _CompleteWorkOrder _self;
  final $Res Function(_CompleteWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? workLog = null,
    Object? partsUsed = null,
    Object? files = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? completionNotes = freezed,
  }) {
    return _then(_CompleteWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      workLog: null == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String,
      partsUsed: null == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedEntity>,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _RejectWorkOrder implements WorkOrderActionEvent {
  const _RejectWorkOrder(
      {required this.workOrderId,
      required this.reason,
      required this.latitude,
      required this.longitude});

  final int workOrderId;
  final String reason;
  final double latitude;
  final double longitude;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RejectWorkOrderCopyWith<_RejectWorkOrder> get copyWith =>
      __$RejectWorkOrderCopyWithImpl<_RejectWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RejectWorkOrder &&
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

  @override
  String toString() {
    return 'WorkOrderActionEvent.rejectWorkOrder(workOrderId: $workOrderId, reason: $reason, latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$RejectWorkOrderCopyWith<$Res>
    implements $WorkOrderActionEventCopyWith<$Res> {
  factory _$RejectWorkOrderCopyWith(
          _RejectWorkOrder value, $Res Function(_RejectWorkOrder) _then) =
      __$RejectWorkOrderCopyWithImpl;
  @useResult
  $Res call(
      {int workOrderId, String reason, double latitude, double longitude});
}

/// @nodoc
class __$RejectWorkOrderCopyWithImpl<$Res>
    implements _$RejectWorkOrderCopyWith<$Res> {
  __$RejectWorkOrderCopyWithImpl(this._self, this._then);

  final _RejectWorkOrder _self;
  final $Res Function(_RejectWorkOrder) _then;

  /// Create a copy of WorkOrderActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? reason = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_RejectWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _CaptureLocation implements WorkOrderActionEvent {
  const _CaptureLocation();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CaptureLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionEvent.captureLocation()';
  }
}

/// @nodoc

class _ClearError implements WorkOrderActionEvent {
  const _ClearError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClearError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionEvent.clearError()';
  }
}

// dart format on
