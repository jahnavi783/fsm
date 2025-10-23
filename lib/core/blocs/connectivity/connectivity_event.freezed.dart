// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectivityEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConnectivityEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectivityEvent()';
  }
}

/// @nodoc
class $ConnectivityEventCopyWith<$Res> {
  $ConnectivityEventCopyWith(
      ConnectivityEvent _, $Res Function(ConnectivityEvent) __);
}

/// Adds pattern-matching-related methods to [ConnectivityEvent].
extension ConnectivityEventPatterns on ConnectivityEvent {
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
    TResult Function(_Started value)? started,
    TResult Function(_ConnectivityChanged value)? connectivityChanged,
    TResult Function(_CheckConnectivity value)? checkConnectivity,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _ConnectivityChanged() when connectivityChanged != null:
        return connectivityChanged(_that);
      case _CheckConnectivity() when checkConnectivity != null:
        return checkConnectivity(_that);
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
    required TResult Function(_Started value) started,
    required TResult Function(_ConnectivityChanged value) connectivityChanged,
    required TResult Function(_CheckConnectivity value) checkConnectivity,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _ConnectivityChanged():
        return connectivityChanged(_that);
      case _CheckConnectivity():
        return checkConnectivity(_that);
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
    TResult? Function(_Started value)? started,
    TResult? Function(_ConnectivityChanged value)? connectivityChanged,
    TResult? Function(_CheckConnectivity value)? checkConnectivity,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _ConnectivityChanged() when connectivityChanged != null:
        return connectivityChanged(_that);
      case _CheckConnectivity() when checkConnectivity != null:
        return checkConnectivity(_that);
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
    TResult Function()? started,
    TResult Function(bool isConnected)? connectivityChanged,
    TResult Function()? checkConnectivity,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _ConnectivityChanged() when connectivityChanged != null:
        return connectivityChanged(_that.isConnected);
      case _CheckConnectivity() when checkConnectivity != null:
        return checkConnectivity();
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
    required TResult Function() started,
    required TResult Function(bool isConnected) connectivityChanged,
    required TResult Function() checkConnectivity,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _ConnectivityChanged():
        return connectivityChanged(_that.isConnected);
      case _CheckConnectivity():
        return checkConnectivity();
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
    TResult? Function()? started,
    TResult? Function(bool isConnected)? connectivityChanged,
    TResult? Function()? checkConnectivity,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _ConnectivityChanged() when connectivityChanged != null:
        return connectivityChanged(_that.isConnected);
      case _CheckConnectivity() when checkConnectivity != null:
        return checkConnectivity();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements ConnectivityEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectivityEvent.started()';
  }
}

/// @nodoc

class _ConnectivityChanged implements ConnectivityEvent {
  const _ConnectivityChanged(this.isConnected);

  final bool isConnected;

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectivityChangedCopyWith<_ConnectivityChanged> get copyWith =>
      __$ConnectivityChangedCopyWithImpl<_ConnectivityChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConnectivityChanged &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  @override
  String toString() {
    return 'ConnectivityEvent.connectivityChanged(isConnected: $isConnected)';
  }
}

/// @nodoc
abstract mixin class _$ConnectivityChangedCopyWith<$Res>
    implements $ConnectivityEventCopyWith<$Res> {
  factory _$ConnectivityChangedCopyWith(_ConnectivityChanged value,
          $Res Function(_ConnectivityChanged) _then) =
      __$ConnectivityChangedCopyWithImpl;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$ConnectivityChangedCopyWithImpl<$Res>
    implements _$ConnectivityChangedCopyWith<$Res> {
  __$ConnectivityChangedCopyWithImpl(this._self, this._then);

  final _ConnectivityChanged _self;
  final $Res Function(_ConnectivityChanged) _then;

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_ConnectivityChanged(
      null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _CheckConnectivity implements ConnectivityEvent {
  const _CheckConnectivity();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckConnectivity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectivityEvent.checkConnectivity()';
  }
}

// dart format on
