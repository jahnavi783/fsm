// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NavigationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState()';
  }
}

/// @nodoc
class $NavigationStateCopyWith<$Res> {
  $NavigationStateCopyWith(
      NavigationState _, $Res Function(NavigationState) __);
}

/// Adds pattern-matching-related methods to [NavigationState].
extension NavigationStatePatterns on NavigationState {
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
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_NavigateToTab value)? navigateToTab,
    TResult Function(_NavigateToWorkOrder value)? navigateToWorkOrder,
    TResult Function(_NavigateToDocument value)? navigateToDocument,
    TResult Function(_NavigateToPart value)? navigateToPart,
    TResult Function(_DrawerOpened value)? drawerOpened,
    TResult Function(_DrawerClosed value)? drawerClosed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _TabChanged() when tabChanged != null:
        return tabChanged(_that);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that);
      case _NavigateToWorkOrder() when navigateToWorkOrder != null:
        return navigateToWorkOrder(_that);
      case _NavigateToDocument() when navigateToDocument != null:
        return navigateToDocument(_that);
      case _NavigateToPart() when navigateToPart != null:
        return navigateToPart(_that);
      case _DrawerOpened() when drawerOpened != null:
        return drawerOpened(_that);
      case _DrawerClosed() when drawerClosed != null:
        return drawerClosed(_that);
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
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_NavigateToTab value) navigateToTab,
    required TResult Function(_NavigateToWorkOrder value) navigateToWorkOrder,
    required TResult Function(_NavigateToDocument value) navigateToDocument,
    required TResult Function(_NavigateToPart value) navigateToPart,
    required TResult Function(_DrawerOpened value) drawerOpened,
    required TResult Function(_DrawerClosed value) drawerClosed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _TabChanged():
        return tabChanged(_that);
      case _NavigateToTab():
        return navigateToTab(_that);
      case _NavigateToWorkOrder():
        return navigateToWorkOrder(_that);
      case _NavigateToDocument():
        return navigateToDocument(_that);
      case _NavigateToPart():
        return navigateToPart(_that);
      case _DrawerOpened():
        return drawerOpened(_that);
      case _DrawerClosed():
        return drawerClosed(_that);
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
    TResult? Function(_TabChanged value)? tabChanged,
    TResult? Function(_NavigateToTab value)? navigateToTab,
    TResult? Function(_NavigateToWorkOrder value)? navigateToWorkOrder,
    TResult? Function(_NavigateToDocument value)? navigateToDocument,
    TResult? Function(_NavigateToPart value)? navigateToPart,
    TResult? Function(_DrawerOpened value)? drawerOpened,
    TResult? Function(_DrawerClosed value)? drawerClosed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _TabChanged() when tabChanged != null:
        return tabChanged(_that);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that);
      case _NavigateToWorkOrder() when navigateToWorkOrder != null:
        return navigateToWorkOrder(_that);
      case _NavigateToDocument() when navigateToDocument != null:
        return navigateToDocument(_that);
      case _NavigateToPart() when navigateToPart != null:
        return navigateToPart(_that);
      case _DrawerOpened() when drawerOpened != null:
        return drawerOpened(_that);
      case _DrawerClosed() when drawerClosed != null:
        return drawerClosed(_that);
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
    TResult Function(int index)? tabChanged,
    TResult Function(int index)? navigateToTab,
    TResult Function(int workOrderId)? navigateToWorkOrder,
    TResult Function(int documentId)? navigateToDocument,
    TResult Function(int partId)? navigateToPart,
    TResult Function()? drawerOpened,
    TResult Function()? drawerClosed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _TabChanged() when tabChanged != null:
        return tabChanged(_that.index);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that.index);
      case _NavigateToWorkOrder() when navigateToWorkOrder != null:
        return navigateToWorkOrder(_that.workOrderId);
      case _NavigateToDocument() when navigateToDocument != null:
        return navigateToDocument(_that.documentId);
      case _NavigateToPart() when navigateToPart != null:
        return navigateToPart(_that.partId);
      case _DrawerOpened() when drawerOpened != null:
        return drawerOpened();
      case _DrawerClosed() when drawerClosed != null:
        return drawerClosed();
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
    required TResult Function(int index) tabChanged,
    required TResult Function(int index) navigateToTab,
    required TResult Function(int workOrderId) navigateToWorkOrder,
    required TResult Function(int documentId) navigateToDocument,
    required TResult Function(int partId) navigateToPart,
    required TResult Function() drawerOpened,
    required TResult Function() drawerClosed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _TabChanged():
        return tabChanged(_that.index);
      case _NavigateToTab():
        return navigateToTab(_that.index);
      case _NavigateToWorkOrder():
        return navigateToWorkOrder(_that.workOrderId);
      case _NavigateToDocument():
        return navigateToDocument(_that.documentId);
      case _NavigateToPart():
        return navigateToPart(_that.partId);
      case _DrawerOpened():
        return drawerOpened();
      case _DrawerClosed():
        return drawerClosed();
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
    TResult? Function(int index)? tabChanged,
    TResult? Function(int index)? navigateToTab,
    TResult? Function(int workOrderId)? navigateToWorkOrder,
    TResult? Function(int documentId)? navigateToDocument,
    TResult? Function(int partId)? navigateToPart,
    TResult? Function()? drawerOpened,
    TResult? Function()? drawerClosed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _TabChanged() when tabChanged != null:
        return tabChanged(_that.index);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that.index);
      case _NavigateToWorkOrder() when navigateToWorkOrder != null:
        return navigateToWorkOrder(_that.workOrderId);
      case _NavigateToDocument() when navigateToDocument != null:
        return navigateToDocument(_that.documentId);
      case _NavigateToPart() when navigateToPart != null:
        return navigateToPart(_that.partId);
      case _DrawerOpened() when drawerOpened != null:
        return drawerOpened();
      case _DrawerClosed() when drawerClosed != null:
        return drawerClosed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements NavigationState {
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
    return 'NavigationState.initial()';
  }
}

/// @nodoc

class _TabChanged implements NavigationState {
  const _TabChanged(this.index);

  final int index;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TabChangedCopyWith<_TabChanged> get copyWith =>
      __$TabChangedCopyWithImpl<_TabChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TabChanged &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'NavigationState.tabChanged(index: $index)';
  }
}

/// @nodoc
abstract mixin class _$TabChangedCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$TabChangedCopyWith(
          _TabChanged value, $Res Function(_TabChanged) _then) =
      __$TabChangedCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$TabChangedCopyWithImpl<$Res> implements _$TabChangedCopyWith<$Res> {
  __$TabChangedCopyWithImpl(this._self, this._then);

  final _TabChanged _self;
  final $Res Function(_TabChanged) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(_TabChanged(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NavigateToTab implements NavigationState {
  const _NavigateToTab(this.index);

  final int index;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToTabCopyWith<_NavigateToTab> get copyWith =>
      __$NavigateToTabCopyWithImpl<_NavigateToTab>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToTab &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'NavigationState.navigateToTab(index: $index)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToTabCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToTabCopyWith(
          _NavigateToTab value, $Res Function(_NavigateToTab) _then) =
      __$NavigateToTabCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$NavigateToTabCopyWithImpl<$Res>
    implements _$NavigateToTabCopyWith<$Res> {
  __$NavigateToTabCopyWithImpl(this._self, this._then);

  final _NavigateToTab _self;
  final $Res Function(_NavigateToTab) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(_NavigateToTab(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NavigateToWorkOrder implements NavigationState {
  const _NavigateToWorkOrder(this.workOrderId);

  final int workOrderId;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToWorkOrderCopyWith<_NavigateToWorkOrder> get copyWith =>
      __$NavigateToWorkOrderCopyWithImpl<_NavigateToWorkOrder>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'NavigationState.navigateToWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToWorkOrderCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToWorkOrderCopyWith(_NavigateToWorkOrder value,
          $Res Function(_NavigateToWorkOrder) _then) =
      __$NavigateToWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$NavigateToWorkOrderCopyWithImpl<$Res>
    implements _$NavigateToWorkOrderCopyWith<$Res> {
  __$NavigateToWorkOrderCopyWithImpl(this._self, this._then);

  final _NavigateToWorkOrder _self;
  final $Res Function(_NavigateToWorkOrder) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_NavigateToWorkOrder(
      null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NavigateToDocument implements NavigationState {
  const _NavigateToDocument(this.documentId);

  final int documentId;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToDocumentCopyWith<_NavigateToDocument> get copyWith =>
      __$NavigateToDocumentCopyWithImpl<_NavigateToDocument>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToDocument &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentId);

  @override
  String toString() {
    return 'NavigationState.navigateToDocument(documentId: $documentId)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToDocumentCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToDocumentCopyWith(
          _NavigateToDocument value, $Res Function(_NavigateToDocument) _then) =
      __$NavigateToDocumentCopyWithImpl;
  @useResult
  $Res call({int documentId});
}

/// @nodoc
class __$NavigateToDocumentCopyWithImpl<$Res>
    implements _$NavigateToDocumentCopyWith<$Res> {
  __$NavigateToDocumentCopyWithImpl(this._self, this._then);

  final _NavigateToDocument _self;
  final $Res Function(_NavigateToDocument) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = null,
  }) {
    return _then(_NavigateToDocument(
      null == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NavigateToPart implements NavigationState {
  const _NavigateToPart(this.partId);

  final int partId;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToPartCopyWith<_NavigateToPart> get copyWith =>
      __$NavigateToPartCopyWithImpl<_NavigateToPart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToPart &&
            (identical(other.partId, partId) || other.partId == partId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partId);

  @override
  String toString() {
    return 'NavigationState.navigateToPart(partId: $partId)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToPartCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToPartCopyWith(
          _NavigateToPart value, $Res Function(_NavigateToPart) _then) =
      __$NavigateToPartCopyWithImpl;
  @useResult
  $Res call({int partId});
}

/// @nodoc
class __$NavigateToPartCopyWithImpl<$Res>
    implements _$NavigateToPartCopyWith<$Res> {
  __$NavigateToPartCopyWithImpl(this._self, this._then);

  final _NavigateToPart _self;
  final $Res Function(_NavigateToPart) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partId = null,
  }) {
    return _then(_NavigateToPart(
      null == partId
          ? _self.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DrawerOpened implements NavigationState {
  const _DrawerOpened();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DrawerOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState.drawerOpened()';
  }
}

/// @nodoc

class _DrawerClosed implements NavigationState {
  const _DrawerClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DrawerClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState.drawerClosed()';
  }
}

// dart format on
