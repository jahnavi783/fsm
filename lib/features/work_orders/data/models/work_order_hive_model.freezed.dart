// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get woNumber;
  @HiveField(2)
  int get srId;
  @HiveField(3)
  String get summary;
  @HiveField(4)
  String get problemDescription;
  @HiveField(5)
  int get priority; // Store as int for enum
  @HiveField(6)
  DateTime get visitDate;
  @HiveField(7)
  String get location;
  @HiveField(8)
  int get status; // Store as int for enum
  @HiveField(9)
  int get durationDays;
  @HiveField(10)
  DateTime get createdAt;
  @HiveField(11)
  DateTime get updatedAt;
  @HiveField(12)
  DateTime? get startedAt;
  @HiveField(13)
  DateTime? get resumedAt;
  @HiveField(14)
  DateTime? get completedAt;
  @HiveField(15)
  String? get pauseLogs;
  @HiveField(16)
  String? get workLog;
  @HiveField(17)
  List<PartUsedHiveModel> get partsUsed;
  @HiveField(18)
  List<String> get images;
  @HiveField(19)
  CustomerHiveModel? get customer;
  @HiveField(20)
  LocationHiveModel? get locationDetails;
  @HiveField(21)
  ServiceRequestHiveModel? get serviceRequest;
  @HiveField(22)
  List<WorkLogHiveModel> get workLogs;
  @HiveField(23)
  List<String> get requiredSkills;
  @HiveField(24)
  List<PartHiveModel> get requiredParts;
  @HiveField(25)
  List<String> get attachments;
  @HiveField(26)
  String? get completionNotes;
  @HiveField(27)
  DateTime get cachedAt;
  @HiveField(28)
  bool get isPendingSync;
  @HiveField(29)
  String? get pendingAction;

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderHiveModelCopyWith<WorkOrderHiveModel> get copyWith =>
      _$WorkOrderHiveModelCopyWithImpl<WorkOrderHiveModel>(
          this as WorkOrderHiveModel, _$identity);

  /// Serializes this WorkOrderHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.woNumber, woNumber) ||
                other.woNumber == woNumber) &&
            (identical(other.srId, srId) || other.srId == srId) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.problemDescription, problemDescription) ||
                other.problemDescription == problemDescription) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pauseLogs, pauseLogs) ||
                other.pauseLogs == pauseLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality().equals(other.partsUsed, partsUsed) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            const DeepCollectionEquality().equals(other.workLogs, workLogs) &&
            const DeepCollectionEquality()
                .equals(other.requiredSkills, requiredSkills) &&
            const DeepCollectionEquality()
                .equals(other.requiredParts, requiredParts) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.isPendingSync, isPendingSync) ||
                other.isPendingSync == isPendingSync) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        woNumber,
        srId,
        summary,
        problemDescription,
        priority,
        visitDate,
        location,
        status,
        durationDays,
        createdAt,
        updatedAt,
        startedAt,
        resumedAt,
        completedAt,
        pauseLogs,
        workLog,
        const DeepCollectionEquality().hash(partsUsed),
        const DeepCollectionEquality().hash(images),
        customer,
        locationDetails,
        serviceRequest,
        const DeepCollectionEquality().hash(workLogs),
        const DeepCollectionEquality().hash(requiredSkills),
        const DeepCollectionEquality().hash(requiredParts),
        const DeepCollectionEquality().hash(attachments),
        completionNotes,
        cachedAt,
        isPendingSync,
        pendingAction
      ]);

  @override
  String toString() {
    return 'WorkOrderHiveModel(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderHiveModelCopyWith<$Res> {
  factory $WorkOrderHiveModelCopyWith(
          WorkOrderHiveModel value, $Res Function(WorkOrderHiveModel) _then) =
      _$WorkOrderHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String woNumber,
      @HiveField(2) int srId,
      @HiveField(3) String summary,
      @HiveField(4) String problemDescription,
      @HiveField(5) int priority,
      @HiveField(6) DateTime visitDate,
      @HiveField(7) String location,
      @HiveField(8) int status,
      @HiveField(9) int durationDays,
      @HiveField(10) DateTime createdAt,
      @HiveField(11) DateTime updatedAt,
      @HiveField(12) DateTime? startedAt,
      @HiveField(13) DateTime? resumedAt,
      @HiveField(14) DateTime? completedAt,
      @HiveField(15) String? pauseLogs,
      @HiveField(16) String? workLog,
      @HiveField(17) List<PartUsedHiveModel> partsUsed,
      @HiveField(18) List<String> images,
      @HiveField(19) CustomerHiveModel? customer,
      @HiveField(20) LocationHiveModel? locationDetails,
      @HiveField(21) ServiceRequestHiveModel? serviceRequest,
      @HiveField(22) List<WorkLogHiveModel> workLogs,
      @HiveField(23) List<String> requiredSkills,
      @HiveField(24) List<PartHiveModel> requiredParts,
      @HiveField(25) List<String> attachments,
      @HiveField(26) String? completionNotes,
      @HiveField(27) DateTime cachedAt,
      @HiveField(28) bool isPendingSync,
      @HiveField(29) String? pendingAction});

  $CustomerHiveModelCopyWith<$Res>? get customer;
  $LocationHiveModelCopyWith<$Res>? get locationDetails;
  $ServiceRequestHiveModelCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class _$WorkOrderHiveModelCopyWithImpl<$Res>
    implements $WorkOrderHiveModelCopyWith<$Res> {
  _$WorkOrderHiveModelCopyWithImpl(this._self, this._then);

  final WorkOrderHiveModel _self;
  final $Res Function(WorkOrderHiveModel) _then;

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? woNumber = null,
    Object? srId = null,
    Object? summary = null,
    Object? problemDescription = null,
    Object? priority = null,
    Object? visitDate = null,
    Object? location = null,
    Object? status = null,
    Object? durationDays = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? customer = freezed,
    Object? locationDetails = freezed,
    Object? serviceRequest = freezed,
    Object? workLogs = null,
    Object? requiredSkills = null,
    Object? requiredParts = null,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? cachedAt = null,
    Object? isPendingSync = null,
    Object? pendingAction = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      woNumber: null == woNumber
          ? _self.woNumber
          : woNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srId: null == srId
          ? _self.srId
          : srId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      problemDescription: null == problemDescription
          ? _self.problemDescription
          : problemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedAt: freezed == resumedAt
          ? _self.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseLogs: freezed == pauseLogs
          ? _self.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedHiveModel>,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerHiveModel?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationHiveModel?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestHiveModel?,
      workLogs: null == workLogs
          ? _self.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogHiveModel>,
      requiredSkills: null == requiredSkills
          ? _self.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _self.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartHiveModel>,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _self.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _self.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerHiveModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerHiveModelCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationHiveModelCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationHiveModelCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestHiveModelCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestHiveModelCopyWith<$Res>(_self.serviceRequest!,
        (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderHiveModel].
extension WorkOrderHiveModelPatterns on WorkOrderHiveModel {
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
    TResult Function(_WorkOrderHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel() when $default != null:
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
    TResult Function(_WorkOrderHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel():
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
    TResult? Function(_WorkOrderHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel() when $default != null:
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
            @HiveField(0) int id,
            @HiveField(1) String woNumber,
            @HiveField(2) int srId,
            @HiveField(3) String summary,
            @HiveField(4) String problemDescription,
            @HiveField(5) int priority,
            @HiveField(6) DateTime visitDate,
            @HiveField(7) String location,
            @HiveField(8) int status,
            @HiveField(9) int durationDays,
            @HiveField(10) DateTime createdAt,
            @HiveField(11) DateTime updatedAt,
            @HiveField(12) DateTime? startedAt,
            @HiveField(13) DateTime? resumedAt,
            @HiveField(14) DateTime? completedAt,
            @HiveField(15) String? pauseLogs,
            @HiveField(16) String? workLog,
            @HiveField(17) List<PartUsedHiveModel> partsUsed,
            @HiveField(18) List<String> images,
            @HiveField(19) CustomerHiveModel? customer,
            @HiveField(20) LocationHiveModel? locationDetails,
            @HiveField(21) ServiceRequestHiveModel? serviceRequest,
            @HiveField(22) List<WorkLogHiveModel> workLogs,
            @HiveField(23) List<String> requiredSkills,
            @HiveField(24) List<PartHiveModel> requiredParts,
            @HiveField(25) List<String> attachments,
            @HiveField(26) String? completionNotes,
            @HiveField(27) DateTime cachedAt,
            @HiveField(28) bool isPendingSync,
            @HiveField(29) String? pendingAction)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.createdAt,
            _that.updatedAt,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.customer,
            _that.locationDetails,
            _that.serviceRequest,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
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
            @HiveField(0) int id,
            @HiveField(1) String woNumber,
            @HiveField(2) int srId,
            @HiveField(3) String summary,
            @HiveField(4) String problemDescription,
            @HiveField(5) int priority,
            @HiveField(6) DateTime visitDate,
            @HiveField(7) String location,
            @HiveField(8) int status,
            @HiveField(9) int durationDays,
            @HiveField(10) DateTime createdAt,
            @HiveField(11) DateTime updatedAt,
            @HiveField(12) DateTime? startedAt,
            @HiveField(13) DateTime? resumedAt,
            @HiveField(14) DateTime? completedAt,
            @HiveField(15) String? pauseLogs,
            @HiveField(16) String? workLog,
            @HiveField(17) List<PartUsedHiveModel> partsUsed,
            @HiveField(18) List<String> images,
            @HiveField(19) CustomerHiveModel? customer,
            @HiveField(20) LocationHiveModel? locationDetails,
            @HiveField(21) ServiceRequestHiveModel? serviceRequest,
            @HiveField(22) List<WorkLogHiveModel> workLogs,
            @HiveField(23) List<String> requiredSkills,
            @HiveField(24) List<PartHiveModel> requiredParts,
            @HiveField(25) List<String> attachments,
            @HiveField(26) String? completionNotes,
            @HiveField(27) DateTime cachedAt,
            @HiveField(28) bool isPendingSync,
            @HiveField(29) String? pendingAction)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel():
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.createdAt,
            _that.updatedAt,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.customer,
            _that.locationDetails,
            _that.serviceRequest,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
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
            @HiveField(0) int id,
            @HiveField(1) String woNumber,
            @HiveField(2) int srId,
            @HiveField(3) String summary,
            @HiveField(4) String problemDescription,
            @HiveField(5) int priority,
            @HiveField(6) DateTime visitDate,
            @HiveField(7) String location,
            @HiveField(8) int status,
            @HiveField(9) int durationDays,
            @HiveField(10) DateTime createdAt,
            @HiveField(11) DateTime updatedAt,
            @HiveField(12) DateTime? startedAt,
            @HiveField(13) DateTime? resumedAt,
            @HiveField(14) DateTime? completedAt,
            @HiveField(15) String? pauseLogs,
            @HiveField(16) String? workLog,
            @HiveField(17) List<PartUsedHiveModel> partsUsed,
            @HiveField(18) List<String> images,
            @HiveField(19) CustomerHiveModel? customer,
            @HiveField(20) LocationHiveModel? locationDetails,
            @HiveField(21) ServiceRequestHiveModel? serviceRequest,
            @HiveField(22) List<WorkLogHiveModel> workLogs,
            @HiveField(23) List<String> requiredSkills,
            @HiveField(24) List<PartHiveModel> requiredParts,
            @HiveField(25) List<String> attachments,
            @HiveField(26) String? completionNotes,
            @HiveField(27) DateTime cachedAt,
            @HiveField(28) bool isPendingSync,
            @HiveField(29) String? pendingAction)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.createdAt,
            _that.updatedAt,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.workLog,
            _that.partsUsed,
            _that.images,
            _that.customer,
            _that.locationDetails,
            _that.serviceRequest,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.cachedAt,
            _that.isPendingSync,
            _that.pendingAction);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderHiveModel implements WorkOrderHiveModel {
  const _WorkOrderHiveModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.woNumber,
      @HiveField(2) required this.srId,
      @HiveField(3) required this.summary,
      @HiveField(4) required this.problemDescription,
      @HiveField(5) required this.priority,
      @HiveField(6) required this.visitDate,
      @HiveField(7) required this.location,
      @HiveField(8) required this.status,
      @HiveField(9) required this.durationDays,
      @HiveField(10) required this.createdAt,
      @HiveField(11) required this.updatedAt,
      @HiveField(12) this.startedAt,
      @HiveField(13) this.resumedAt,
      @HiveField(14) this.completedAt,
      @HiveField(15) this.pauseLogs,
      @HiveField(16) this.workLog,
      @HiveField(17) final List<PartUsedHiveModel> partsUsed = const [],
      @HiveField(18) final List<String> images = const [],
      @HiveField(19) this.customer,
      @HiveField(20) this.locationDetails,
      @HiveField(21) this.serviceRequest,
      @HiveField(22) final List<WorkLogHiveModel> workLogs = const [],
      @HiveField(23) final List<String> requiredSkills = const [],
      @HiveField(24) final List<PartHiveModel> requiredParts = const [],
      @HiveField(25) final List<String> attachments = const [],
      @HiveField(26) this.completionNotes,
      @HiveField(27) required this.cachedAt,
      @HiveField(28) this.isPendingSync = false,
      @HiveField(29) this.pendingAction})
      : _partsUsed = partsUsed,
        _images = images,
        _workLogs = workLogs,
        _requiredSkills = requiredSkills,
        _requiredParts = requiredParts,
        _attachments = attachments;
  factory _WorkOrderHiveModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderHiveModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String woNumber;
  @override
  @HiveField(2)
  final int srId;
  @override
  @HiveField(3)
  final String summary;
  @override
  @HiveField(4)
  final String problemDescription;
  @override
  @HiveField(5)
  final int priority;
// Store as int for enum
  @override
  @HiveField(6)
  final DateTime visitDate;
  @override
  @HiveField(7)
  final String location;
  @override
  @HiveField(8)
  final int status;
// Store as int for enum
  @override
  @HiveField(9)
  final int durationDays;
  @override
  @HiveField(10)
  final DateTime createdAt;
  @override
  @HiveField(11)
  final DateTime updatedAt;
  @override
  @HiveField(12)
  final DateTime? startedAt;
  @override
  @HiveField(13)
  final DateTime? resumedAt;
  @override
  @HiveField(14)
  final DateTime? completedAt;
  @override
  @HiveField(15)
  final String? pauseLogs;
  @override
  @HiveField(16)
  final String? workLog;
  final List<PartUsedHiveModel> _partsUsed;
  @override
  @JsonKey()
  @HiveField(17)
  List<PartUsedHiveModel> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<String> _images;
  @override
  @JsonKey()
  @HiveField(18)
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @HiveField(19)
  final CustomerHiveModel? customer;
  @override
  @HiveField(20)
  final LocationHiveModel? locationDetails;
  @override
  @HiveField(21)
  final ServiceRequestHiveModel? serviceRequest;
  final List<WorkLogHiveModel> _workLogs;
  @override
  @JsonKey()
  @HiveField(22)
  List<WorkLogHiveModel> get workLogs {
    if (_workLogs is EqualUnmodifiableListView) return _workLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workLogs);
  }

  final List<String> _requiredSkills;
  @override
  @JsonKey()
  @HiveField(23)
  List<String> get requiredSkills {
    if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSkills);
  }

  final List<PartHiveModel> _requiredParts;
  @override
  @JsonKey()
  @HiveField(24)
  List<PartHiveModel> get requiredParts {
    if (_requiredParts is EqualUnmodifiableListView) return _requiredParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredParts);
  }

  final List<String> _attachments;
  @override
  @JsonKey()
  @HiveField(25)
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @HiveField(26)
  final String? completionNotes;
  @override
  @HiveField(27)
  final DateTime cachedAt;
  @override
  @JsonKey()
  @HiveField(28)
  final bool isPendingSync;
  @override
  @HiveField(29)
  final String? pendingAction;

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderHiveModelCopyWith<_WorkOrderHiveModel> get copyWith =>
      __$WorkOrderHiveModelCopyWithImpl<_WorkOrderHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.woNumber, woNumber) ||
                other.woNumber == woNumber) &&
            (identical(other.srId, srId) || other.srId == srId) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.problemDescription, problemDescription) ||
                other.problemDescription == problemDescription) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pauseLogs, pauseLogs) ||
                other.pauseLogs == pauseLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            const DeepCollectionEquality().equals(other._workLogs, _workLogs) &&
            const DeepCollectionEquality()
                .equals(other._requiredSkills, _requiredSkills) &&
            const DeepCollectionEquality()
                .equals(other._requiredParts, _requiredParts) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt) &&
            (identical(other.isPendingSync, isPendingSync) ||
                other.isPendingSync == isPendingSync) &&
            (identical(other.pendingAction, pendingAction) ||
                other.pendingAction == pendingAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        woNumber,
        srId,
        summary,
        problemDescription,
        priority,
        visitDate,
        location,
        status,
        durationDays,
        createdAt,
        updatedAt,
        startedAt,
        resumedAt,
        completedAt,
        pauseLogs,
        workLog,
        const DeepCollectionEquality().hash(_partsUsed),
        const DeepCollectionEquality().hash(_images),
        customer,
        locationDetails,
        serviceRequest,
        const DeepCollectionEquality().hash(_workLogs),
        const DeepCollectionEquality().hash(_requiredSkills),
        const DeepCollectionEquality().hash(_requiredParts),
        const DeepCollectionEquality().hash(_attachments),
        completionNotes,
        cachedAt,
        isPendingSync,
        pendingAction
      ]);

  @override
  String toString() {
    return 'WorkOrderHiveModel(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderHiveModelCopyWith<$Res>
    implements $WorkOrderHiveModelCopyWith<$Res> {
  factory _$WorkOrderHiveModelCopyWith(
          _WorkOrderHiveModel value, $Res Function(_WorkOrderHiveModel) _then) =
      __$WorkOrderHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String woNumber,
      @HiveField(2) int srId,
      @HiveField(3) String summary,
      @HiveField(4) String problemDescription,
      @HiveField(5) int priority,
      @HiveField(6) DateTime visitDate,
      @HiveField(7) String location,
      @HiveField(8) int status,
      @HiveField(9) int durationDays,
      @HiveField(10) DateTime createdAt,
      @HiveField(11) DateTime updatedAt,
      @HiveField(12) DateTime? startedAt,
      @HiveField(13) DateTime? resumedAt,
      @HiveField(14) DateTime? completedAt,
      @HiveField(15) String? pauseLogs,
      @HiveField(16) String? workLog,
      @HiveField(17) List<PartUsedHiveModel> partsUsed,
      @HiveField(18) List<String> images,
      @HiveField(19) CustomerHiveModel? customer,
      @HiveField(20) LocationHiveModel? locationDetails,
      @HiveField(21) ServiceRequestHiveModel? serviceRequest,
      @HiveField(22) List<WorkLogHiveModel> workLogs,
      @HiveField(23) List<String> requiredSkills,
      @HiveField(24) List<PartHiveModel> requiredParts,
      @HiveField(25) List<String> attachments,
      @HiveField(26) String? completionNotes,
      @HiveField(27) DateTime cachedAt,
      @HiveField(28) bool isPendingSync,
      @HiveField(29) String? pendingAction});

  @override
  $CustomerHiveModelCopyWith<$Res>? get customer;
  @override
  $LocationHiveModelCopyWith<$Res>? get locationDetails;
  @override
  $ServiceRequestHiveModelCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class __$WorkOrderHiveModelCopyWithImpl<$Res>
    implements _$WorkOrderHiveModelCopyWith<$Res> {
  __$WorkOrderHiveModelCopyWithImpl(this._self, this._then);

  final _WorkOrderHiveModel _self;
  final $Res Function(_WorkOrderHiveModel) _then;

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? woNumber = null,
    Object? srId = null,
    Object? summary = null,
    Object? problemDescription = null,
    Object? priority = null,
    Object? visitDate = null,
    Object? location = null,
    Object? status = null,
    Object? durationDays = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? customer = freezed,
    Object? locationDetails = freezed,
    Object? serviceRequest = freezed,
    Object? workLogs = null,
    Object? requiredSkills = null,
    Object? requiredParts = null,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? cachedAt = null,
    Object? isPendingSync = null,
    Object? pendingAction = freezed,
  }) {
    return _then(_WorkOrderHiveModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      woNumber: null == woNumber
          ? _self.woNumber
          : woNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srId: null == srId
          ? _self.srId
          : srId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      problemDescription: null == problemDescription
          ? _self.problemDescription
          : problemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedAt: freezed == resumedAt
          ? _self.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseLogs: freezed == pauseLogs
          ? _self.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedHiveModel>,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerHiveModel?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationHiveModel?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestHiveModel?,
      workLogs: null == workLogs
          ? _self._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogHiveModel>,
      requiredSkills: null == requiredSkills
          ? _self._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _self._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartHiveModel>,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _self.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _self.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerHiveModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerHiveModelCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationHiveModelCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationHiveModelCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }

  /// Create a copy of WorkOrderHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestHiveModelCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestHiveModelCopyWith<$Res>(_self.serviceRequest!,
        (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

/// @nodoc
mixin _$PartUsedHiveModel {
  @HiveField(0)
  String get partNumber;
  @HiveField(1)
  int get quantityUsed;
  @HiveField(2)
  String? get partName;
  @HiveField(3)
  String? get description;

  /// Create a copy of PartUsedHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartUsedHiveModelCopyWith<PartUsedHiveModel> get copyWith =>
      _$PartUsedHiveModelCopyWithImpl<PartUsedHiveModel>(
          this as PartUsedHiveModel, _$identity);

  /// Serializes this PartUsedHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartUsedHiveModel &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedHiveModel(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PartUsedHiveModelCopyWith<$Res> {
  factory $PartUsedHiveModelCopyWith(
          PartUsedHiveModel value, $Res Function(PartUsedHiveModel) _then) =
      _$PartUsedHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantityUsed,
      @HiveField(2) String? partName,
      @HiveField(3) String? description});
}

/// @nodoc
class _$PartUsedHiveModelCopyWithImpl<$Res>
    implements $PartUsedHiveModelCopyWith<$Res> {
  _$PartUsedHiveModelCopyWithImpl(this._self, this._then);

  final PartUsedHiveModel _self;
  final $Res Function(PartUsedHiveModel) _then;

  /// Create a copy of PartUsedHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PartUsedHiveModel].
extension PartUsedHiveModelPatterns on PartUsedHiveModel {
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
    TResult Function(_PartUsedHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel() when $default != null:
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
    TResult Function(_PartUsedHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel():
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
    TResult? Function(_PartUsedHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel() when $default != null:
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
            @HiveField(1) int quantityUsed,
            @HiveField(2) String? partName,
            @HiveField(3) String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
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
            @HiveField(1) int quantityUsed,
            @HiveField(2) String? partName,
            @HiveField(3) String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel():
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
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
            @HiveField(1) int quantityUsed,
            @HiveField(2) String? partName,
            @HiveField(3) String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedHiveModel() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PartUsedHiveModel implements PartUsedHiveModel {
  const _PartUsedHiveModel(
      {@HiveField(0) required this.partNumber,
      @HiveField(1) required this.quantityUsed,
      @HiveField(2) this.partName,
      @HiveField(3) this.description});
  factory _PartUsedHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartUsedHiveModelFromJson(json);

  @override
  @HiveField(0)
  final String partNumber;
  @override
  @HiveField(1)
  final int quantityUsed;
  @override
  @HiveField(2)
  final String? partName;
  @override
  @HiveField(3)
  final String? description;

  /// Create a copy of PartUsedHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartUsedHiveModelCopyWith<_PartUsedHiveModel> get copyWith =>
      __$PartUsedHiveModelCopyWithImpl<_PartUsedHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartUsedHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartUsedHiveModel &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedHiveModel(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PartUsedHiveModelCopyWith<$Res>
    implements $PartUsedHiveModelCopyWith<$Res> {
  factory _$PartUsedHiveModelCopyWith(
          _PartUsedHiveModel value, $Res Function(_PartUsedHiveModel) _then) =
      __$PartUsedHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantityUsed,
      @HiveField(2) String? partName,
      @HiveField(3) String? description});
}

/// @nodoc
class __$PartUsedHiveModelCopyWithImpl<$Res>
    implements _$PartUsedHiveModelCopyWith<$Res> {
  __$PartUsedHiveModelCopyWithImpl(this._self, this._then);

  final _PartUsedHiveModel _self;
  final $Res Function(_PartUsedHiveModel) _then;

  /// Create a copy of PartUsedHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_PartUsedHiveModel(
      partNumber: null == partNumber
          ? _self.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _self.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _self.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CustomerHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  String get email;
  @HiveField(3)
  String? get phone;
  @HiveField(4)
  String? get address;
  @HiveField(5)
  String? get city;
  @HiveField(6)
  String? get state;
  @HiveField(7)
  String? get postalCode;
  @HiveField(8)
  String? get country;

  /// Create a copy of CustomerHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerHiveModelCopyWith<CustomerHiveModel> get copyWith =>
      _$CustomerHiveModelCopyWithImpl<CustomerHiveModel>(
          this as CustomerHiveModel, _$identity);

  /// Serializes this CustomerHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, address,
      city, state, postalCode, country);

  @override
  String toString() {
    return 'CustomerHiveModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }
}

/// @nodoc
abstract mixin class $CustomerHiveModelCopyWith<$Res> {
  factory $CustomerHiveModelCopyWith(
          CustomerHiveModel value, $Res Function(CustomerHiveModel) _then) =
      _$CustomerHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) String? phone,
      @HiveField(4) String? address,
      @HiveField(5) String? city,
      @HiveField(6) String? state,
      @HiveField(7) String? postalCode,
      @HiveField(8) String? country});
}

/// @nodoc
class _$CustomerHiveModelCopyWithImpl<$Res>
    implements $CustomerHiveModelCopyWith<$Res> {
  _$CustomerHiveModelCopyWithImpl(this._self, this._then);

  final CustomerHiveModel _self;
  final $Res Function(CustomerHiveModel) _then;

  /// Create a copy of CustomerHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerHiveModel].
extension CustomerHiveModelPatterns on CustomerHiveModel {
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
    TResult Function(_CustomerHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel() when $default != null:
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
    TResult Function(_CustomerHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel():
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
    TResult? Function(_CustomerHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel() when $default != null:
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
            @HiveField(0) int id,
            @HiveField(1) String name,
            @HiveField(2) String email,
            @HiveField(3) String? phone,
            @HiveField(4) String? address,
            @HiveField(5) String? city,
            @HiveField(6) String? state,
            @HiveField(7) String? postalCode,
            @HiveField(8) String? country)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country);
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
            @HiveField(0) int id,
            @HiveField(1) String name,
            @HiveField(2) String email,
            @HiveField(3) String? phone,
            @HiveField(4) String? address,
            @HiveField(5) String? city,
            @HiveField(6) String? state,
            @HiveField(7) String? postalCode,
            @HiveField(8) String? country)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel():
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country);
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
            @HiveField(0) int id,
            @HiveField(1) String name,
            @HiveField(2) String email,
            @HiveField(3) String? phone,
            @HiveField(4) String? address,
            @HiveField(5) String? city,
            @HiveField(6) String? state,
            @HiveField(7) String? postalCode,
            @HiveField(8) String? country)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerHiveModel implements CustomerHiveModel {
  const _CustomerHiveModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.email,
      @HiveField(3) this.phone,
      @HiveField(4) this.address,
      @HiveField(5) this.city,
      @HiveField(6) this.state,
      @HiveField(7) this.postalCode,
      @HiveField(8) this.country});
  factory _CustomerHiveModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerHiveModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final String? phone;
  @override
  @HiveField(4)
  final String? address;
  @override
  @HiveField(5)
  final String? city;
  @override
  @HiveField(6)
  final String? state;
  @override
  @HiveField(7)
  final String? postalCode;
  @override
  @HiveField(8)
  final String? country;

  /// Create a copy of CustomerHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerHiveModelCopyWith<_CustomerHiveModel> get copyWith =>
      __$CustomerHiveModelCopyWithImpl<_CustomerHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, address,
      city, state, postalCode, country);

  @override
  String toString() {
    return 'CustomerHiveModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }
}

/// @nodoc
abstract mixin class _$CustomerHiveModelCopyWith<$Res>
    implements $CustomerHiveModelCopyWith<$Res> {
  factory _$CustomerHiveModelCopyWith(
          _CustomerHiveModel value, $Res Function(_CustomerHiveModel) _then) =
      __$CustomerHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) String? phone,
      @HiveField(4) String? address,
      @HiveField(5) String? city,
      @HiveField(6) String? state,
      @HiveField(7) String? postalCode,
      @HiveField(8) String? country});
}

/// @nodoc
class __$CustomerHiveModelCopyWithImpl<$Res>
    implements _$CustomerHiveModelCopyWith<$Res> {
  __$CustomerHiveModelCopyWithImpl(this._self, this._then);

  final _CustomerHiveModel _self;
  final $Res Function(_CustomerHiveModel) _then;

  /// Create a copy of CustomerHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_CustomerHiveModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$LocationHiveModel {
  @HiveField(0)
  double get latitude;
  @HiveField(1)
  double get longitude;
  @HiveField(2)
  String? get address;
  @HiveField(3)
  String? get city;
  @HiveField(4)
  String? get state;
  @HiveField(5)
  String? get postalCode;
  @HiveField(6)
  String? get country;
  @HiveField(7)
  String? get landmark;
  @HiveField(8)
  double? get accuracy;
  @HiveField(9)
  DateTime? get capturedAt;

  /// Create a copy of LocationHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationHiveModelCopyWith<LocationHiveModel> get copyWith =>
      _$LocationHiveModelCopyWithImpl<LocationHiveModel>(
          this as LocationHiveModel, _$identity);

  /// Serializes this LocationHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationHiveModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, postalCode, country, landmark, accuracy, capturedAt);

  @override
  String toString() {
    return 'LocationHiveModel(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, landmark: $landmark, accuracy: $accuracy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class $LocationHiveModelCopyWith<$Res> {
  factory $LocationHiveModelCopyWith(
          LocationHiveModel value, $Res Function(LocationHiveModel) _then) =
      _$LocationHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address,
      @HiveField(3) String? city,
      @HiveField(4) String? state,
      @HiveField(5) String? postalCode,
      @HiveField(6) String? country,
      @HiveField(7) String? landmark,
      @HiveField(8) double? accuracy,
      @HiveField(9) DateTime? capturedAt});
}

/// @nodoc
class _$LocationHiveModelCopyWithImpl<$Res>
    implements $LocationHiveModelCopyWith<$Res> {
  _$LocationHiveModelCopyWithImpl(this._self, this._then);

  final LocationHiveModel _self;
  final $Res Function(LocationHiveModel) _then;

  /// Create a copy of LocationHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? landmark = freezed,
    Object? accuracy = freezed,
    Object? capturedAt = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationHiveModel].
extension LocationHiveModelPatterns on LocationHiveModel {
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
    TResult Function(_LocationHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel() when $default != null:
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
    TResult Function(_LocationHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel():
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
    TResult? Function(_LocationHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel() when $default != null:
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
            @HiveField(0) double latitude,
            @HiveField(1) double longitude,
            @HiveField(2) String? address,
            @HiveField(3) String? city,
            @HiveField(4) String? state,
            @HiveField(5) String? postalCode,
            @HiveField(6) String? country,
            @HiveField(7) String? landmark,
            @HiveField(8) double? accuracy,
            @HiveField(9) DateTime? capturedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel() when $default != null:
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
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
            @HiveField(0) double latitude,
            @HiveField(1) double longitude,
            @HiveField(2) String? address,
            @HiveField(3) String? city,
            @HiveField(4) String? state,
            @HiveField(5) String? postalCode,
            @HiveField(6) String? country,
            @HiveField(7) String? landmark,
            @HiveField(8) double? accuracy,
            @HiveField(9) DateTime? capturedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel():
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
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
            @HiveField(0) double latitude,
            @HiveField(1) double longitude,
            @HiveField(2) String? address,
            @HiveField(3) String? city,
            @HiveField(4) String? state,
            @HiveField(5) String? postalCode,
            @HiveField(6) String? country,
            @HiveField(7) String? landmark,
            @HiveField(8) double? accuracy,
            @HiveField(9) DateTime? capturedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationHiveModel() when $default != null:
        return $default(
            _that.latitude,
            _that.longitude,
            _that.address,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.landmark,
            _that.accuracy,
            _that.capturedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationHiveModel implements LocationHiveModel {
  const _LocationHiveModel(
      {@HiveField(0) required this.latitude,
      @HiveField(1) required this.longitude,
      @HiveField(2) this.address,
      @HiveField(3) this.city,
      @HiveField(4) this.state,
      @HiveField(5) this.postalCode,
      @HiveField(6) this.country,
      @HiveField(7) this.landmark,
      @HiveField(8) this.accuracy,
      @HiveField(9) this.capturedAt});
  factory _LocationHiveModel.fromJson(Map<String, dynamic> json) =>
      _$LocationHiveModelFromJson(json);

  @override
  @HiveField(0)
  final double latitude;
  @override
  @HiveField(1)
  final double longitude;
  @override
  @HiveField(2)
  final String? address;
  @override
  @HiveField(3)
  final String? city;
  @override
  @HiveField(4)
  final String? state;
  @override
  @HiveField(5)
  final String? postalCode;
  @override
  @HiveField(6)
  final String? country;
  @override
  @HiveField(7)
  final String? landmark;
  @override
  @HiveField(8)
  final double? accuracy;
  @override
  @HiveField(9)
  final DateTime? capturedAt;

  /// Create a copy of LocationHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationHiveModelCopyWith<_LocationHiveModel> get copyWith =>
      __$LocationHiveModelCopyWithImpl<_LocationHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationHiveModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, postalCode, country, landmark, accuracy, capturedAt);

  @override
  String toString() {
    return 'LocationHiveModel(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, landmark: $landmark, accuracy: $accuracy, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$LocationHiveModelCopyWith<$Res>
    implements $LocationHiveModelCopyWith<$Res> {
  factory _$LocationHiveModelCopyWith(
          _LocationHiveModel value, $Res Function(_LocationHiveModel) _then) =
      __$LocationHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address,
      @HiveField(3) String? city,
      @HiveField(4) String? state,
      @HiveField(5) String? postalCode,
      @HiveField(6) String? country,
      @HiveField(7) String? landmark,
      @HiveField(8) double? accuracy,
      @HiveField(9) DateTime? capturedAt});
}

/// @nodoc
class __$LocationHiveModelCopyWithImpl<$Res>
    implements _$LocationHiveModelCopyWith<$Res> {
  __$LocationHiveModelCopyWithImpl(this._self, this._then);

  final _LocationHiveModel _self;
  final $Res Function(_LocationHiveModel) _then;

  /// Create a copy of LocationHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? landmark = freezed,
    Object? accuracy = freezed,
    Object? capturedAt = freezed,
  }) {
    return _then(_LocationHiveModel(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ServiceRequestHiveModel {
  @HiveField(0)
  String get srNumber;
  @HiveField(1)
  String get srType;
  @HiveField(2)
  String? get priority;
  @HiveField(3)
  String? get issueDescription;
  @HiveField(4)
  String? get machineSerial;
  @HiveField(5)
  String? get model;
  @HiveField(6)
  String? get customerName;
  @HiveField(7)
  String? get location;
  @HiveField(8)
  String? get postalCode;
  @HiveField(9)
  String? get underWarranty;
  @HiveField(10)
  DateTime? get visitDate;

  /// Create a copy of ServiceRequestHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceRequestHiveModelCopyWith<ServiceRequestHiveModel> get copyWith =>
      _$ServiceRequestHiveModelCopyWithImpl<ServiceRequestHiveModel>(
          this as ServiceRequestHiveModel, _$identity);

  /// Serializes this ServiceRequestHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceRequestHiveModel &&
            (identical(other.srNumber, srNumber) ||
                other.srNumber == srNumber) &&
            (identical(other.srType, srType) || other.srType == srType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.issueDescription, issueDescription) ||
                other.issueDescription == issueDescription) &&
            (identical(other.machineSerial, machineSerial) ||
                other.machineSerial == machineSerial) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.underWarranty, underWarranty) ||
                other.underWarranty == underWarranty) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      srNumber,
      srType,
      priority,
      issueDescription,
      machineSerial,
      model,
      customerName,
      location,
      postalCode,
      underWarranty,
      visitDate);

  @override
  String toString() {
    return 'ServiceRequestHiveModel(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class $ServiceRequestHiveModelCopyWith<$Res> {
  factory $ServiceRequestHiveModelCopyWith(ServiceRequestHiveModel value,
          $Res Function(ServiceRequestHiveModel) _then) =
      _$ServiceRequestHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String srNumber,
      @HiveField(1) String srType,
      @HiveField(2) String? priority,
      @HiveField(3) String? issueDescription,
      @HiveField(4) String? machineSerial,
      @HiveField(5) String? model,
      @HiveField(6) String? customerName,
      @HiveField(7) String? location,
      @HiveField(8) String? postalCode,
      @HiveField(9) String? underWarranty,
      @HiveField(10) DateTime? visitDate});
}

/// @nodoc
class _$ServiceRequestHiveModelCopyWithImpl<$Res>
    implements $ServiceRequestHiveModelCopyWith<$Res> {
  _$ServiceRequestHiveModelCopyWithImpl(this._self, this._then);

  final ServiceRequestHiveModel _self;
  final $Res Function(ServiceRequestHiveModel) _then;

  /// Create a copy of ServiceRequestHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNumber = null,
    Object? srType = null,
    Object? priority = freezed,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_self.copyWith(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _self.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _self.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _self.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceRequestHiveModel].
extension ServiceRequestHiveModelPatterns on ServiceRequestHiveModel {
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
    TResult Function(_ServiceRequestHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel() when $default != null:
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
    TResult Function(_ServiceRequestHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel():
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
    TResult? Function(_ServiceRequestHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel() when $default != null:
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
            @HiveField(0) String srNumber,
            @HiveField(1) String srType,
            @HiveField(2) String? priority,
            @HiveField(3) String? issueDescription,
            @HiveField(4) String? machineSerial,
            @HiveField(5) String? model,
            @HiveField(6) String? customerName,
            @HiveField(7) String? location,
            @HiveField(8) String? postalCode,
            @HiveField(9) String? underWarranty,
            @HiveField(10) DateTime? visitDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel() when $default != null:
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
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
            @HiveField(0) String srNumber,
            @HiveField(1) String srType,
            @HiveField(2) String? priority,
            @HiveField(3) String? issueDescription,
            @HiveField(4) String? machineSerial,
            @HiveField(5) String? model,
            @HiveField(6) String? customerName,
            @HiveField(7) String? location,
            @HiveField(8) String? postalCode,
            @HiveField(9) String? underWarranty,
            @HiveField(10) DateTime? visitDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel():
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
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
            @HiveField(0) String srNumber,
            @HiveField(1) String srType,
            @HiveField(2) String? priority,
            @HiveField(3) String? issueDescription,
            @HiveField(4) String? machineSerial,
            @HiveField(5) String? model,
            @HiveField(6) String? customerName,
            @HiveField(7) String? location,
            @HiveField(8) String? postalCode,
            @HiveField(9) String? underWarranty,
            @HiveField(10) DateTime? visitDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceRequestHiveModel() when $default != null:
        return $default(
            _that.srNumber,
            _that.srType,
            _that.priority,
            _that.issueDescription,
            _that.machineSerial,
            _that.model,
            _that.customerName,
            _that.location,
            _that.postalCode,
            _that.underWarranty,
            _that.visitDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceRequestHiveModel implements ServiceRequestHiveModel {
  const _ServiceRequestHiveModel(
      {@HiveField(0) required this.srNumber,
      @HiveField(1) required this.srType,
      @HiveField(2) this.priority,
      @HiveField(3) this.issueDescription,
      @HiveField(4) this.machineSerial,
      @HiveField(5) this.model,
      @HiveField(6) this.customerName,
      @HiveField(7) this.location,
      @HiveField(8) this.postalCode,
      @HiveField(9) this.underWarranty,
      @HiveField(10) this.visitDate});
  factory _ServiceRequestHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestHiveModelFromJson(json);

  @override
  @HiveField(0)
  final String srNumber;
  @override
  @HiveField(1)
  final String srType;
  @override
  @HiveField(2)
  final String? priority;
  @override
  @HiveField(3)
  final String? issueDescription;
  @override
  @HiveField(4)
  final String? machineSerial;
  @override
  @HiveField(5)
  final String? model;
  @override
  @HiveField(6)
  final String? customerName;
  @override
  @HiveField(7)
  final String? location;
  @override
  @HiveField(8)
  final String? postalCode;
  @override
  @HiveField(9)
  final String? underWarranty;
  @override
  @HiveField(10)
  final DateTime? visitDate;

  /// Create a copy of ServiceRequestHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceRequestHiveModelCopyWith<_ServiceRequestHiveModel> get copyWith =>
      __$ServiceRequestHiveModelCopyWithImpl<_ServiceRequestHiveModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceRequestHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestHiveModel &&
            (identical(other.srNumber, srNumber) ||
                other.srNumber == srNumber) &&
            (identical(other.srType, srType) || other.srType == srType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.issueDescription, issueDescription) ||
                other.issueDescription == issueDescription) &&
            (identical(other.machineSerial, machineSerial) ||
                other.machineSerial == machineSerial) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.underWarranty, underWarranty) ||
                other.underWarranty == underWarranty) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      srNumber,
      srType,
      priority,
      issueDescription,
      machineSerial,
      model,
      customerName,
      location,
      postalCode,
      underWarranty,
      visitDate);

  @override
  String toString() {
    return 'ServiceRequestHiveModel(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }
}

/// @nodoc
abstract mixin class _$ServiceRequestHiveModelCopyWith<$Res>
    implements $ServiceRequestHiveModelCopyWith<$Res> {
  factory _$ServiceRequestHiveModelCopyWith(_ServiceRequestHiveModel value,
          $Res Function(_ServiceRequestHiveModel) _then) =
      __$ServiceRequestHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String srNumber,
      @HiveField(1) String srType,
      @HiveField(2) String? priority,
      @HiveField(3) String? issueDescription,
      @HiveField(4) String? machineSerial,
      @HiveField(5) String? model,
      @HiveField(6) String? customerName,
      @HiveField(7) String? location,
      @HiveField(8) String? postalCode,
      @HiveField(9) String? underWarranty,
      @HiveField(10) DateTime? visitDate});
}

/// @nodoc
class __$ServiceRequestHiveModelCopyWithImpl<$Res>
    implements _$ServiceRequestHiveModelCopyWith<$Res> {
  __$ServiceRequestHiveModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestHiveModel _self;
  final $Res Function(_ServiceRequestHiveModel) _then;

  /// Create a copy of ServiceRequestHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? srNumber = null,
    Object? srType = null,
    Object? priority = freezed,
    Object? issueDescription = freezed,
    Object? machineSerial = freezed,
    Object? model = freezed,
    Object? customerName = freezed,
    Object? location = freezed,
    Object? postalCode = freezed,
    Object? underWarranty = freezed,
    Object? visitDate = freezed,
  }) {
    return _then(_ServiceRequestHiveModel(
      srNumber: null == srNumber
          ? _self.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _self.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _self.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _self.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _self.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$WorkLogHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  int get workOrderId;
  @HiveField(2)
  int get type; // Store as int for enum
  @HiveField(3)
  String get description;
  @HiveField(4)
  DateTime get timestamp;
  @HiveField(5)
  String? get notes;
  @HiveField(6)
  double? get latitude;
  @HiveField(7)
  double? get longitude;
  @HiveField(8)
  String? get userId;
  @HiveField(9)
  String? get userName;

  /// Create a copy of WorkLogHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkLogHiveModelCopyWith<WorkLogHiveModel> get copyWith =>
      _$WorkLogHiveModelCopyWithImpl<WorkLogHiveModel>(
          this as WorkLogHiveModel, _$identity);

  /// Serializes this WorkLogHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkLogHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @override
  String toString() {
    return 'WorkLogHiveModel(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class $WorkLogHiveModelCopyWith<$Res> {
  factory $WorkLogHiveModelCopyWith(
          WorkLogHiveModel value, $Res Function(WorkLogHiveModel) _then) =
      _$WorkLogHiveModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int workOrderId,
      @HiveField(2) int type,
      @HiveField(3) String description,
      @HiveField(4) DateTime timestamp,
      @HiveField(5) String? notes,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) String? userId,
      @HiveField(9) String? userName});
}

/// @nodoc
class _$WorkLogHiveModelCopyWithImpl<$Res>
    implements $WorkLogHiveModelCopyWith<$Res> {
  _$WorkLogHiveModelCopyWithImpl(this._self, this._then);

  final WorkLogHiveModel _self;
  final $Res Function(WorkLogHiveModel) _then;

  /// Create a copy of WorkLogHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workOrderId = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? notes = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkLogHiveModel].
extension WorkLogHiveModelPatterns on WorkLogHiveModel {
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
    TResult Function(_WorkLogHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel() when $default != null:
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
    TResult Function(_WorkLogHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel():
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
    TResult? Function(_WorkLogHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel() when $default != null:
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
            @HiveField(0) int id,
            @HiveField(1) int workOrderId,
            @HiveField(2) int type,
            @HiveField(3) String description,
            @HiveField(4) DateTime timestamp,
            @HiveField(5) String? notes,
            @HiveField(6) double? latitude,
            @HiveField(7) double? longitude,
            @HiveField(8) String? userId,
            @HiveField(9) String? userName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
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
            @HiveField(0) int id,
            @HiveField(1) int workOrderId,
            @HiveField(2) int type,
            @HiveField(3) String description,
            @HiveField(4) DateTime timestamp,
            @HiveField(5) String? notes,
            @HiveField(6) double? latitude,
            @HiveField(7) double? longitude,
            @HiveField(8) String? userId,
            @HiveField(9) String? userName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel():
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
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
            @HiveField(0) int id,
            @HiveField(1) int workOrderId,
            @HiveField(2) int type,
            @HiveField(3) String description,
            @HiveField(4) DateTime timestamp,
            @HiveField(5) String? notes,
            @HiveField(6) double? latitude,
            @HiveField(7) double? longitude,
            @HiveField(8) String? userId,
            @HiveField(9) String? userName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkLogHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.workOrderId,
            _that.type,
            _that.description,
            _that.timestamp,
            _that.notes,
            _that.latitude,
            _that.longitude,
            _that.userId,
            _that.userName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkLogHiveModel implements WorkLogHiveModel {
  const _WorkLogHiveModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.workOrderId,
      @HiveField(2) required this.type,
      @HiveField(3) required this.description,
      @HiveField(4) required this.timestamp,
      @HiveField(5) this.notes,
      @HiveField(6) this.latitude,
      @HiveField(7) this.longitude,
      @HiveField(8) this.userId,
      @HiveField(9) this.userName});
  factory _WorkLogHiveModel.fromJson(Map<String, dynamic> json) =>
      _$WorkLogHiveModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final int workOrderId;
  @override
  @HiveField(2)
  final int type;
// Store as int for enum
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final DateTime timestamp;
  @override
  @HiveField(5)
  final String? notes;
  @override
  @HiveField(6)
  final double? latitude;
  @override
  @HiveField(7)
  final double? longitude;
  @override
  @HiveField(8)
  final String? userId;
  @override
  @HiveField(9)
  final String? userName;

  /// Create a copy of WorkLogHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkLogHiveModelCopyWith<_WorkLogHiveModel> get copyWith =>
      __$WorkLogHiveModelCopyWithImpl<_WorkLogHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkLogHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkLogHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @override
  String toString() {
    return 'WorkLogHiveModel(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class _$WorkLogHiveModelCopyWith<$Res>
    implements $WorkLogHiveModelCopyWith<$Res> {
  factory _$WorkLogHiveModelCopyWith(
          _WorkLogHiveModel value, $Res Function(_WorkLogHiveModel) _then) =
      __$WorkLogHiveModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int workOrderId,
      @HiveField(2) int type,
      @HiveField(3) String description,
      @HiveField(4) DateTime timestamp,
      @HiveField(5) String? notes,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) String? userId,
      @HiveField(9) String? userName});
}

/// @nodoc
class __$WorkLogHiveModelCopyWithImpl<$Res>
    implements _$WorkLogHiveModelCopyWith<$Res> {
  __$WorkLogHiveModelCopyWithImpl(this._self, this._then);

  final _WorkLogHiveModel _self;
  final $Res Function(_WorkLogHiveModel) _then;

  /// Create a copy of WorkLogHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workOrderId = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? notes = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_WorkLogHiveModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
