// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_completion_cache_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderCompletionCacheModel {
  /// Work order ID this cache is for
  @HiveField(0)
  int get workOrderId;

  /// Current step in the multi-step form (0-2)
  @HiveField(1)
  int get currentStep;

  /// Step 1: Basic Info - Customer name
  @HiveField(2)
  String? get customerName;

  /// Step 1: Basic Info - Work log description
  @HiveField(3)
  String? get workLog;

  /// Step 2: Resources - Parts used
  @HiveField(4)
  List<CachedPartUsedModel> get partsUsed;

  /// Step 2: Resources - Image file paths
  @HiveField(5)
  List<String> get images;

  /// Step 3: Verification - Signature file path
  @HiveField(6)
  String? get signaturePath;

  /// Step 3: Verification - Completion notes
  @HiveField(7)
  String? get completionNotes;

  /// Timestamp when cache was last updated
  @HiveField(8)
  DateTime get lastUpdated;

  /// Create a copy of WorkOrderCompletionCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderCompletionCacheModelCopyWith<WorkOrderCompletionCacheModel>
      get copyWith => _$WorkOrderCompletionCacheModelCopyWithImpl<
              WorkOrderCompletionCacheModel>(
          this as WorkOrderCompletionCacheModel, _$identity);

  /// Serializes this WorkOrderCompletionCacheModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderCompletionCacheModel &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality().equals(other.partsUsed, partsUsed) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.signaturePath, signaturePath) ||
                other.signaturePath == signaturePath) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workOrderId,
      currentStep,
      customerName,
      workLog,
      const DeepCollectionEquality().hash(partsUsed),
      const DeepCollectionEquality().hash(images),
      signaturePath,
      completionNotes,
      lastUpdated);

  @override
  String toString() {
    return 'WorkOrderCompletionCacheModel(workOrderId: $workOrderId, currentStep: $currentStep, customerName: $customerName, workLog: $workLog, partsUsed: $partsUsed, images: $images, signaturePath: $signaturePath, completionNotes: $completionNotes, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderCompletionCacheModelCopyWith<$Res> {
  factory $WorkOrderCompletionCacheModelCopyWith(
          WorkOrderCompletionCacheModel value,
          $Res Function(WorkOrderCompletionCacheModel) _then) =
      _$WorkOrderCompletionCacheModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int workOrderId,
      @HiveField(1) int currentStep,
      @HiveField(2) String? customerName,
      @HiveField(3) String? workLog,
      @HiveField(4) List<CachedPartUsedModel> partsUsed,
      @HiveField(5) List<String> images,
      @HiveField(6) String? signaturePath,
      @HiveField(7) String? completionNotes,
      @HiveField(8) DateTime lastUpdated});
}

/// @nodoc
class _$WorkOrderCompletionCacheModelCopyWithImpl<$Res>
    implements $WorkOrderCompletionCacheModelCopyWith<$Res> {
  _$WorkOrderCompletionCacheModelCopyWithImpl(this._self, this._then);

  final WorkOrderCompletionCacheModel _self;
  final $Res Function(WorkOrderCompletionCacheModel) _then;

  /// Create a copy of WorkOrderCompletionCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOrderId = null,
    Object? currentStep = null,
    Object? customerName = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? signaturePath = freezed,
    Object? completionNotes = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_self.copyWith(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<CachedPartUsedModel>,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      signaturePath: freezed == signaturePath
          ? _self.signaturePath
          : signaturePath // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkOrderCompletionCacheModel].
extension WorkOrderCompletionCacheModelPatterns
    on WorkOrderCompletionCacheModel {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WorkOrderCompletionCacheModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_WorkOrderCompletionCacheModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WorkOrderCompletionCacheModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) int workOrderId,
            @HiveField(1) int currentStep,
            @HiveField(2) String? customerName,
            @HiveField(3) String? workLog,
            @HiveField(4) List<CachedPartUsedModel> partsUsed,
            @HiveField(5) List<String> images,
            @HiveField(6) String? signaturePath,
            @HiveField(7) String? completionNotes,
            @HiveField(8) DateTime lastUpdated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel() when $default != null:
        return $default(
            _that.workOrderId,
            _that.currentStep,
            _that.customerName,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.signaturePath,
            _that.completionNotes,
            _that.lastUpdated);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) int workOrderId,
            @HiveField(1) int currentStep,
            @HiveField(2) String? customerName,
            @HiveField(3) String? workLog,
            @HiveField(4) List<CachedPartUsedModel> partsUsed,
            @HiveField(5) List<String> images,
            @HiveField(6) String? signaturePath,
            @HiveField(7) String? completionNotes,
            @HiveField(8) DateTime lastUpdated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel():
        return $default(
            _that.workOrderId,
            _that.currentStep,
            _that.customerName,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.signaturePath,
            _that.completionNotes,
            _that.lastUpdated);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) int workOrderId,
            @HiveField(1) int currentStep,
            @HiveField(2) String? customerName,
            @HiveField(3) String? workLog,
            @HiveField(4) List<CachedPartUsedModel> partsUsed,
            @HiveField(5) List<String> images,
            @HiveField(6) String? signaturePath,
            @HiveField(7) String? completionNotes,
            @HiveField(8) DateTime lastUpdated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderCompletionCacheModel() when $default != null:
        return $default(
            _that.workOrderId,
            _that.currentStep,
            _that.customerName,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.signaturePath,
            _that.completionNotes,
            _that.lastUpdated);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderCompletionCacheModel implements WorkOrderCompletionCacheModel {
  const _WorkOrderCompletionCacheModel(
      {@HiveField(0) required this.workOrderId,
      @HiveField(1) this.currentStep = 0,
      @HiveField(2) this.customerName,
      @HiveField(3) this.workLog,
      @HiveField(4) final List<CachedPartUsedModel> partsUsed = const [],
      @HiveField(5) final List<String> images = const [],
      @HiveField(6) this.signaturePath,
      @HiveField(7) this.completionNotes,
      @HiveField(8) required this.lastUpdated})
      : _partsUsed = partsUsed,
        _images = images;
  factory _WorkOrderCompletionCacheModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderCompletionCacheModelFromJson(json);

  /// Work order ID this cache is for
  @override
  @HiveField(0)
  final int workOrderId;

  /// Current step in the multi-step form (0-2)
  @override
  @JsonKey()
  @HiveField(1)
  final int currentStep;

  /// Step 1: Basic Info - Customer name
  @override
  @HiveField(2)
  final String? customerName;

  /// Step 1: Basic Info - Work log description
  @override
  @HiveField(3)
  final String? workLog;

  /// Step 2: Resources - Parts used
  final List<CachedPartUsedModel> _partsUsed;

  /// Step 2: Resources - Parts used
  @override
  @JsonKey()
  @HiveField(4)
  List<CachedPartUsedModel> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  /// Step 2: Resources - Image file paths
  final List<String> _images;

  /// Step 2: Resources - Image file paths
  @override
  @JsonKey()
  @HiveField(5)
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Step 3: Verification - Signature file path
  @override
  @HiveField(6)
  final String? signaturePath;

  /// Step 3: Verification - Completion notes
  @override
  @HiveField(7)
  final String? completionNotes;

  /// Timestamp when cache was last updated
  @override
  @HiveField(8)
  final DateTime lastUpdated;

  /// Create a copy of WorkOrderCompletionCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderCompletionCacheModelCopyWith<_WorkOrderCompletionCacheModel>
      get copyWith => __$WorkOrderCompletionCacheModelCopyWithImpl<
          _WorkOrderCompletionCacheModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderCompletionCacheModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderCompletionCacheModel &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.signaturePath, signaturePath) ||
                other.signaturePath == signaturePath) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workOrderId,
      currentStep,
      customerName,
      workLog,
      const DeepCollectionEquality().hash(_partsUsed),
      const DeepCollectionEquality().hash(_images),
      signaturePath,
      completionNotes,
      lastUpdated);

  @override
  String toString() {
    return 'WorkOrderCompletionCacheModel(workOrderId: $workOrderId, currentStep: $currentStep, customerName: $customerName, workLog: $workLog, partsUsed: $partsUsed, images: $images, signaturePath: $signaturePath, completionNotes: $completionNotes, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderCompletionCacheModelCopyWith<$Res>
    implements $WorkOrderCompletionCacheModelCopyWith<$Res> {
  factory _$WorkOrderCompletionCacheModelCopyWith(
          _WorkOrderCompletionCacheModel value,
          $Res Function(_WorkOrderCompletionCacheModel) _then) =
      __$WorkOrderCompletionCacheModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int workOrderId,
      @HiveField(1) int currentStep,
      @HiveField(2) String? customerName,
      @HiveField(3) String? workLog,
      @HiveField(4) List<CachedPartUsedModel> partsUsed,
      @HiveField(5) List<String> images,
      @HiveField(6) String? signaturePath,
      @HiveField(7) String? completionNotes,
      @HiveField(8) DateTime lastUpdated});
}

/// @nodoc
class __$WorkOrderCompletionCacheModelCopyWithImpl<$Res>
    implements _$WorkOrderCompletionCacheModelCopyWith<$Res> {
  __$WorkOrderCompletionCacheModelCopyWithImpl(this._self, this._then);

  final _WorkOrderCompletionCacheModel _self;
  final $Res Function(_WorkOrderCompletionCacheModel) _then;

  /// Create a copy of WorkOrderCompletionCacheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
    Object? currentStep = null,
    Object? customerName = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? signaturePath = freezed,
    Object? completionNotes = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_WorkOrderCompletionCacheModel(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<CachedPartUsedModel>,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      signaturePath: freezed == signaturePath
          ? _self.signaturePath
          : signaturePath // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$CachedPartUsedModel {
  @HiveField(0)
  String get partNumber;
  @HiveField(1)
  int get quantity;
  @HiveField(2)
  String get partName;
  @HiveField(3)
  String get category;
  @HiveField(4)
  int get quantityAvailable;
  @HiveField(5)
  double get unitPrice;
  @HiveField(6)
  String get status;

  /// Create a copy of CachedPartUsedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedPartUsedModelCopyWith<CachedPartUsedModel> get copyWith =>
      _$CachedPartUsedModelCopyWithImpl<CachedPartUsedModel>(
          this as CachedPartUsedModel, _$identity);

  /// Serializes this CachedPartUsedModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedPartUsedModel &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, quantity, partName,
      category, quantityAvailable, unitPrice, status);

  @override
  String toString() {
    return 'CachedPartUsedModel(partNumber: $partNumber, quantity: $quantity, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CachedPartUsedModelCopyWith<$Res> {
  factory $CachedPartUsedModelCopyWith(
          CachedPartUsedModel value, $Res Function(CachedPartUsedModel) _then) =
      _$CachedPartUsedModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantity,
      @HiveField(2) String partName,
      @HiveField(3) String category,
      @HiveField(4) int quantityAvailable,
      @HiveField(5) double unitPrice,
      @HiveField(6) String status});
}

/// @nodoc
class _$CachedPartUsedModelCopyWithImpl<$Res>
    implements $CachedPartUsedModelCopyWith<$Res> {
  _$CachedPartUsedModelCopyWithImpl(this._self, this._then);

  final CachedPartUsedModel _self;
  final $Res Function(CachedPartUsedModel) _then;

  /// Create a copy of CachedPartUsedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantity = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      partName: null == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _self.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CachedPartUsedModel].
extension CachedPartUsedModelPatterns on CachedPartUsedModel {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CachedPartUsedModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_CachedPartUsedModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CachedPartUsedModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String partNumber,
            @HiveField(1) int quantity,
            @HiveField(2) String partName,
            @HiveField(3) String category,
            @HiveField(4) int quantityAvailable,
            @HiveField(5) double unitPrice,
            @HiveField(6) String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel() when $default != null:
        return $default(
            _that.partNumber,
            _that.quantity,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String partNumber,
            @HiveField(1) int quantity,
            @HiveField(2) String partName,
            @HiveField(3) String category,
            @HiveField(4) int quantityAvailable,
            @HiveField(5) double unitPrice,
            @HiveField(6) String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel():
        return $default(
            _that.partNumber,
            _that.quantity,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) String partNumber,
            @HiveField(1) int quantity,
            @HiveField(2) String partName,
            @HiveField(3) String category,
            @HiveField(4) int quantityAvailable,
            @HiveField(5) double unitPrice,
            @HiveField(6) String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedPartUsedModel() when $default != null:
        return $default(
            _that.partNumber,
            _that.quantity,
            _that.partName,
            _that.category,
            _that.quantityAvailable,
            _that.unitPrice,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CachedPartUsedModel implements CachedPartUsedModel {
  const _CachedPartUsedModel(
      {@HiveField(0) required this.partNumber,
      @HiveField(1) required this.quantity,
      @HiveField(2) required this.partName,
      @HiveField(3) required this.category,
      @HiveField(4) required this.quantityAvailable,
      @HiveField(5) required this.unitPrice,
      @HiveField(6) required this.status});
  factory _CachedPartUsedModel.fromJson(Map<String, dynamic> json) =>
      _$CachedPartUsedModelFromJson(json);

  @override
  @HiveField(0)
  final String partNumber;
  @override
  @HiveField(1)
  final int quantity;
  @override
  @HiveField(2)
  final String partName;
  @override
  @HiveField(3)
  final String category;
  @override
  @HiveField(4)
  final int quantityAvailable;
  @override
  @HiveField(5)
  final double unitPrice;
  @override
  @HiveField(6)
  final String status;

  /// Create a copy of CachedPartUsedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedPartUsedModelCopyWith<_CachedPartUsedModel> get copyWith =>
      __$CachedPartUsedModelCopyWithImpl<_CachedPartUsedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedPartUsedModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedPartUsedModel &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partNumber, quantity, partName,
      category, quantityAvailable, unitPrice, status);

  @override
  String toString() {
    return 'CachedPartUsedModel(partNumber: $partNumber, quantity: $quantity, partName: $partName, category: $category, quantityAvailable: $quantityAvailable, unitPrice: $unitPrice, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CachedPartUsedModelCopyWith<$Res>
    implements $CachedPartUsedModelCopyWith<$Res> {
  factory _$CachedPartUsedModelCopyWith(_CachedPartUsedModel value,
          $Res Function(_CachedPartUsedModel) _then) =
      __$CachedPartUsedModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantity,
      @HiveField(2) String partName,
      @HiveField(3) String category,
      @HiveField(4) int quantityAvailable,
      @HiveField(5) double unitPrice,
      @HiveField(6) String status});
}

/// @nodoc
class __$CachedPartUsedModelCopyWithImpl<$Res>
    implements _$CachedPartUsedModelCopyWith<$Res> {
  __$CachedPartUsedModelCopyWithImpl(this._self, this._then);

  final _CachedPartUsedModel _self;
  final $Res Function(_CachedPartUsedModel) _then;

  /// Create a copy of CachedPartUsedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = null,
    Object? quantity = null,
    Object? partName = null,
    Object? category = null,
    Object? quantityAvailable = null,
    Object? unitPrice = null,
    Object? status = null,
  }) {
    return _then(_CachedPartUsedModel(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      partName: null == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAvailable: null == quantityAvailable
          ? _self.quantityAvailable
          : quantityAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
