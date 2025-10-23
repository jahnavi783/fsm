// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderActionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorkOrderActionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionState()';
  }
}

/// @nodoc
class $WorkOrderActionStateCopyWith<$Res> {
  $WorkOrderActionStateCopyWith(
      WorkOrderActionState _, $Res Function(WorkOrderActionState) __);
}

/// Adds pattern-matching-related methods to [WorkOrderActionState].
extension WorkOrderActionStatePatterns on WorkOrderActionState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    TResult Function(_LocationError value)? locationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _ActionInProgress() when actionInProgress != null:
        return actionInProgress(_that);
      case _ActionSuccess() when actionSuccess != null:
        return actionSuccess(_that);
      case _Error() when error != null:
        return error(_that);
      case _LocationError() when locationError != null:
        return locationError(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
    required TResult Function(_LocationError value) locationError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _ActionInProgress():
        return actionInProgress(_that);
      case _ActionSuccess():
        return actionSuccess(_that);
      case _Error():
        return error(_that);
      case _LocationError():
        return locationError(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
    TResult? Function(_LocationError value)? locationError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _ActionInProgress() when actionInProgress != null:
        return actionInProgress(_that);
      case _ActionSuccess() when actionSuccess != null:
        return actionSuccess(_that);
      case _Error() when error != null:
        return error(_that);
      case _LocationError() when locationError != null:
        return locationError(_that);
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            WorkOrderEntity workOrder,
            LocationEntity? currentLocation,
            bool isLocationLoading,
            bool isOffline,
            WorkOrderGroupedImagesEntity? groupedImages,
            bool isLoadingImages)?
        loaded,
    TResult Function(WorkOrderEntity workOrder, String actionType,
            LocationEntity? currentLocation)?
        actionInProgress,
    TResult Function(WorkOrderEntity workOrder, String actionType,
            String message, WorkOrderGroupedImagesEntity? groupedImages)?
        actionSuccess,
    TResult Function(
            Failure failure, WorkOrderEntity? workOrder, bool isOffline)?
        error,
    TResult Function(WorkOrderEntity workOrder, String message)? locationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.workOrder,
            _that.currentLocation,
            _that.isLocationLoading,
            _that.isOffline,
            _that.groupedImages,
            _that.isLoadingImages);
      case _ActionInProgress() when actionInProgress != null:
        return actionInProgress(
            _that.workOrder, _that.actionType, _that.currentLocation);
      case _ActionSuccess() when actionSuccess != null:
        return actionSuccess(_that.workOrder, _that.actionType, _that.message,
            _that.groupedImages);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrder, _that.isOffline);
      case _LocationError() when locationError != null:
        return locationError(_that.workOrder, _that.message);
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            WorkOrderEntity workOrder,
            LocationEntity? currentLocation,
            bool isLocationLoading,
            bool isOffline,
            WorkOrderGroupedImagesEntity? groupedImages,
            bool isLoadingImages)
        loaded,
    required TResult Function(WorkOrderEntity workOrder, String actionType,
            LocationEntity? currentLocation)
        actionInProgress,
    required TResult Function(WorkOrderEntity workOrder, String actionType,
            String message, WorkOrderGroupedImagesEntity? groupedImages)
        actionSuccess,
    required TResult Function(
            Failure failure, WorkOrderEntity? workOrder, bool isOffline)
        error,
    required TResult Function(WorkOrderEntity workOrder, String message)
        locationError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.workOrder,
            _that.currentLocation,
            _that.isLocationLoading,
            _that.isOffline,
            _that.groupedImages,
            _that.isLoadingImages);
      case _ActionInProgress():
        return actionInProgress(
            _that.workOrder, _that.actionType, _that.currentLocation);
      case _ActionSuccess():
        return actionSuccess(_that.workOrder, _that.actionType, _that.message,
            _that.groupedImages);
      case _Error():
        return error(_that.failure, _that.workOrder, _that.isOffline);
      case _LocationError():
        return locationError(_that.workOrder, _that.message);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            WorkOrderEntity workOrder,
            LocationEntity? currentLocation,
            bool isLocationLoading,
            bool isOffline,
            WorkOrderGroupedImagesEntity? groupedImages,
            bool isLoadingImages)?
        loaded,
    TResult? Function(WorkOrderEntity workOrder, String actionType,
            LocationEntity? currentLocation)?
        actionInProgress,
    TResult? Function(WorkOrderEntity workOrder, String actionType,
            String message, WorkOrderGroupedImagesEntity? groupedImages)?
        actionSuccess,
    TResult? Function(
            Failure failure, WorkOrderEntity? workOrder, bool isOffline)?
        error,
    TResult? Function(WorkOrderEntity workOrder, String message)? locationError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.workOrder,
            _that.currentLocation,
            _that.isLocationLoading,
            _that.isOffline,
            _that.groupedImages,
            _that.isLoadingImages);
      case _ActionInProgress() when actionInProgress != null:
        return actionInProgress(
            _that.workOrder, _that.actionType, _that.currentLocation);
      case _ActionSuccess() when actionSuccess != null:
        return actionSuccess(_that.workOrder, _that.actionType, _that.message,
            _that.groupedImages);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrder, _that.isOffline);
      case _LocationError() when locationError != null:
        return locationError(_that.workOrder, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements WorkOrderActionState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionState.initial()';
  }
}

/// @nodoc

class _Loading implements WorkOrderActionState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrderActionState.loading()';
  }
}

/// @nodoc

class _Loaded implements WorkOrderActionState {
  const _Loaded(
      {required this.workOrder,
      this.currentLocation,
      this.isLocationLoading = false,
      this.isOffline = false,
      this.groupedImages,
      this.isLoadingImages = false});

  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;
  @JsonKey()
  final bool isLocationLoading;
  @JsonKey()
  final bool isOffline;
  final WorkOrderGroupedImagesEntity? groupedImages;
  @JsonKey()
  final bool isLoadingImages;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.isLocationLoading, isLocationLoading) ||
                other.isLocationLoading == isLocationLoading) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.groupedImages, groupedImages) ||
                other.groupedImages == groupedImages) &&
            (identical(other.isLoadingImages, isLoadingImages) ||
                other.isLoadingImages == isLoadingImages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrder, currentLocation,
      isLocationLoading, isOffline, groupedImages, isLoadingImages);

  @override
  String toString() {
    return 'WorkOrderActionState.loaded(workOrder: $workOrder, currentLocation: $currentLocation, isLocationLoading: $isLocationLoading, isOffline: $isOffline, groupedImages: $groupedImages, isLoadingImages: $isLoadingImages)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $WorkOrderActionStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {WorkOrderEntity workOrder,
      LocationEntity? currentLocation,
      bool isLocationLoading,
      bool isOffline,
      WorkOrderGroupedImagesEntity? groupedImages,
      bool isLoadingImages});

  $WorkOrderEntityCopyWith<$Res> get workOrder;
  $LocationEntityCopyWith<$Res>? get currentLocation;
  $WorkOrderGroupedImagesEntityCopyWith<$Res>? get groupedImages;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrder = null,
    Object? currentLocation = freezed,
    Object? isLocationLoading = null,
    Object? isOffline = null,
    Object? groupedImages = freezed,
    Object? isLoadingImages = null,
  }) {
    return _then(_Loaded(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity,
      currentLocation: freezed == currentLocation
          ? _self.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      isLocationLoading: null == isLocationLoading
          ? _self.isLocationLoading
          : isLocationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      groupedImages: freezed == groupedImages
          ? _self.groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as WorkOrderGroupedImagesEntity?,
      isLoadingImages: null == isLoadingImages
          ? _self.isLoadingImages
          : isLoadingImages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res> get workOrder {
    return $WorkOrderEntityCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderGroupedImagesEntityCopyWith<$Res>? get groupedImages {
    if (_self.groupedImages == null) {
      return null;
    }

    return $WorkOrderGroupedImagesEntityCopyWith<$Res>(_self.groupedImages!,
        (value) {
      return _then(_self.copyWith(groupedImages: value));
    });
  }
}

/// @nodoc

class _ActionInProgress implements WorkOrderActionState {
  const _ActionInProgress(
      {required this.workOrder,
      required this.actionType,
      this.currentLocation});

  final WorkOrderEntity workOrder;
  final String actionType;
// 'start', 'pause', 'resume', 'complete', 'reject'
  final LocationEntity? currentLocation;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActionInProgressCopyWith<_ActionInProgress> get copyWith =>
      __$ActionInProgressCopyWithImpl<_ActionInProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionInProgress &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workOrder, actionType, currentLocation);

  @override
  String toString() {
    return 'WorkOrderActionState.actionInProgress(workOrder: $workOrder, actionType: $actionType, currentLocation: $currentLocation)';
  }
}

/// @nodoc
abstract mixin class _$ActionInProgressCopyWith<$Res>
    implements $WorkOrderActionStateCopyWith<$Res> {
  factory _$ActionInProgressCopyWith(
          _ActionInProgress value, $Res Function(_ActionInProgress) _then) =
      __$ActionInProgressCopyWithImpl;
  @useResult
  $Res call(
      {WorkOrderEntity workOrder,
      String actionType,
      LocationEntity? currentLocation});

  $WorkOrderEntityCopyWith<$Res> get workOrder;
  $LocationEntityCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$ActionInProgressCopyWithImpl<$Res>
    implements _$ActionInProgressCopyWith<$Res> {
  __$ActionInProgressCopyWithImpl(this._self, this._then);

  final _ActionInProgress _self;
  final $Res Function(_ActionInProgress) _then;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrder = null,
    Object? actionType = null,
    Object? currentLocation = freezed,
  }) {
    return _then(_ActionInProgress(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity,
      actionType: null == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      currentLocation: freezed == currentLocation
          ? _self.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
    ));
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res> get workOrder {
    return $WorkOrderEntityCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }
}

/// @nodoc

class _ActionSuccess implements WorkOrderActionState {
  const _ActionSuccess(
      {required this.workOrder,
      required this.actionType,
      required this.message,
      this.groupedImages});

  final WorkOrderEntity workOrder;
  final String actionType;
  final String message;
  final WorkOrderGroupedImagesEntity? groupedImages;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActionSuccessCopyWith<_ActionSuccess> get copyWith =>
      __$ActionSuccessCopyWithImpl<_ActionSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionSuccess &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.groupedImages, groupedImages) ||
                other.groupedImages == groupedImages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workOrder, actionType, message, groupedImages);

  @override
  String toString() {
    return 'WorkOrderActionState.actionSuccess(workOrder: $workOrder, actionType: $actionType, message: $message, groupedImages: $groupedImages)';
  }
}

/// @nodoc
abstract mixin class _$ActionSuccessCopyWith<$Res>
    implements $WorkOrderActionStateCopyWith<$Res> {
  factory _$ActionSuccessCopyWith(
          _ActionSuccess value, $Res Function(_ActionSuccess) _then) =
      __$ActionSuccessCopyWithImpl;
  @useResult
  $Res call(
      {WorkOrderEntity workOrder,
      String actionType,
      String message,
      WorkOrderGroupedImagesEntity? groupedImages});

  $WorkOrderEntityCopyWith<$Res> get workOrder;
  $WorkOrderGroupedImagesEntityCopyWith<$Res>? get groupedImages;
}

/// @nodoc
class __$ActionSuccessCopyWithImpl<$Res>
    implements _$ActionSuccessCopyWith<$Res> {
  __$ActionSuccessCopyWithImpl(this._self, this._then);

  final _ActionSuccess _self;
  final $Res Function(_ActionSuccess) _then;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrder = null,
    Object? actionType = null,
    Object? message = null,
    Object? groupedImages = freezed,
  }) {
    return _then(_ActionSuccess(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity,
      actionType: null == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      groupedImages: freezed == groupedImages
          ? _self.groupedImages
          : groupedImages // ignore: cast_nullable_to_non_nullable
              as WorkOrderGroupedImagesEntity?,
    ));
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res> get workOrder {
    return $WorkOrderEntityCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderGroupedImagesEntityCopyWith<$Res>? get groupedImages {
    if (_self.groupedImages == null) {
      return null;
    }

    return $WorkOrderGroupedImagesEntityCopyWith<$Res>(_self.groupedImages!,
        (value) {
      return _then(_self.copyWith(groupedImages: value));
    });
  }
}

/// @nodoc

class _Error implements WorkOrderActionState {
  const _Error({required this.failure, this.workOrder, this.isOffline = false});

  final Failure failure;
  final WorkOrderEntity? workOrder;
  @JsonKey()
  final bool isOffline;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, workOrder, isOffline);

  @override
  String toString() {
    return 'WorkOrderActionState.error(failure: $failure, workOrder: $workOrder, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $WorkOrderActionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure, WorkOrderEntity? workOrder, bool isOffline});

  $FailureCopyWith<$Res> get failure;
  $WorkOrderEntityCopyWith<$Res>? get workOrder;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? workOrder = freezed,
    Object? isOffline = null,
  }) {
    return _then(_Error(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      workOrder: freezed == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity?,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_self.failure, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res>? get workOrder {
    if (_self.workOrder == null) {
      return null;
    }

    return $WorkOrderEntityCopyWith<$Res>(_self.workOrder!, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }
}

/// @nodoc

class _LocationError implements WorkOrderActionState {
  const _LocationError({required this.workOrder, required this.message});

  final WorkOrderEntity workOrder;
  final String message;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationErrorCopyWith<_LocationError> get copyWith =>
      __$LocationErrorCopyWithImpl<_LocationError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationError &&
            (identical(other.workOrder, workOrder) ||
                other.workOrder == workOrder) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrder, message);

  @override
  String toString() {
    return 'WorkOrderActionState.locationError(workOrder: $workOrder, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$LocationErrorCopyWith<$Res>
    implements $WorkOrderActionStateCopyWith<$Res> {
  factory _$LocationErrorCopyWith(
          _LocationError value, $Res Function(_LocationError) _then) =
      __$LocationErrorCopyWithImpl;
  @useResult
  $Res call({WorkOrderEntity workOrder, String message});

  $WorkOrderEntityCopyWith<$Res> get workOrder;
}

/// @nodoc
class __$LocationErrorCopyWithImpl<$Res>
    implements _$LocationErrorCopyWith<$Res> {
  __$LocationErrorCopyWithImpl(this._self, this._then);

  final _LocationError _self;
  final $Res Function(_LocationError) _then;

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrder = null,
    Object? message = null,
  }) {
    return _then(_LocationError(
      workOrder: null == workOrder
          ? _self.workOrder
          : workOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of WorkOrderActionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res> get workOrder {
    return $WorkOrderEntityCopyWith<$Res>(_self.workOrder, (value) {
      return _then(_self.copyWith(workOrder: value));
    });
  }
}

// dart format on
