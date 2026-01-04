// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderEntity {
  int get id;
  String get woNumber;
  int get srId;
  String get summary;
  String get problemDescription;
  WorkOrderPriority get priority;
  DateTime get visitDate;
  String get location;
  WorkOrderStatus get status;
  int get durationDays;
  String? get serviceRequestNumber;
  double? get durationHours; // @Default(0) int pauseCount,
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get startedAt;
  DateTime? get resumedAt;
  DateTime? get completedAt;
  String? get pauseLogs;
  String? get workLog;
  List<PartUsedEntity> get partsUsed;
  List<String> get images;
  CustomerEntity? get customer;
  LocationEntity? get locationDetails;
  ServiceRequestEntity? get serviceRequest;
  List<WorkLogEntity> get workLogs;
  List<String> get requiredSkills;
  List<PartEntity> get requiredParts;
  List<String> get attachments;
  String? get completionNotes;
  String? get userId;

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<WorkOrderEntity> get copyWith =>
      _$WorkOrderEntityCopyWithImpl<WorkOrderEntity>(
          this as WorkOrderEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderEntity &&
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
            (identical(other.serviceRequestNumber, serviceRequestNumber) ||
                other.serviceRequestNumber == serviceRequestNumber) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
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
            (identical(other.userId, userId) || other.userId == userId));
  }

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
        serviceRequestNumber,
        durationHours,
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
        userId
      ]);

  @override
  String toString() {
    return 'WorkOrderEntity(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, serviceRequestNumber: $serviceRequestNumber, durationHours: $durationHours, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderEntityCopyWith<$Res> {
  factory $WorkOrderEntityCopyWith(
          WorkOrderEntity value, $Res Function(WorkOrderEntity) _then) =
      _$WorkOrderEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String woNumber,
      int srId,
      String summary,
      String problemDescription,
      WorkOrderPriority priority,
      DateTime visitDate,
      String location,
      WorkOrderStatus status,
      int durationDays,
      String? serviceRequestNumber,
      double? durationHours,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? startedAt,
      DateTime? resumedAt,
      DateTime? completedAt,
      String? pauseLogs,
      String? workLog,
      List<PartUsedEntity> partsUsed,
      List<String> images,
      CustomerEntity? customer,
      LocationEntity? locationDetails,
      ServiceRequestEntity? serviceRequest,
      List<WorkLogEntity> workLogs,
      List<String> requiredSkills,
      List<PartEntity> requiredParts,
      List<String> attachments,
      String? completionNotes,
      String? userId});

  $CustomerEntityCopyWith<$Res>? get customer;
  $LocationEntityCopyWith<$Res>? get locationDetails;
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class _$WorkOrderEntityCopyWithImpl<$Res>
    implements $WorkOrderEntityCopyWith<$Res> {
  _$WorkOrderEntityCopyWithImpl(this._self, this._then);

  final WorkOrderEntity _self;
  final $Res Function(WorkOrderEntity) _then;

  /// Create a copy of WorkOrderEntity
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
    Object? serviceRequestNumber = freezed,
    Object? durationHours = freezed,
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
    Object? userId = freezed,
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
              as WorkOrderPriority,
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
              as WorkOrderStatus,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequestNumber: freezed == serviceRequestNumber
          ? _self.serviceRequestNumber
          : serviceRequestNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as List<PartUsedEntity>,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
      workLogs: null == workLogs
          ? _self.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogEntity>,
      requiredSkills: null == requiredSkills
          ? _self.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _self.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerEntityCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestEntityCopyWith<$Res>(_self.serviceRequest!, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderEntity].
extension WorkOrderEntityPatterns on WorkOrderEntity {
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
    TResult Function(_WorkOrderEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity() when $default != null:
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
    TResult Function(_WorkOrderEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity():
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
    TResult? Function(_WorkOrderEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity() when $default != null:
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
            int id,
            String woNumber,
            int srId,
            String summary,
            String problemDescription,
            WorkOrderPriority priority,
            DateTime visitDate,
            String location,
            WorkOrderStatus status,
            int durationDays,
            String? serviceRequestNumber,
            double? durationHours,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? startedAt,
            DateTime? resumedAt,
            DateTime? completedAt,
            String? pauseLogs,
            String? workLog,
            List<PartUsedEntity> partsUsed,
            List<String> images,
            CustomerEntity? customer,
            LocationEntity? locationDetails,
            ServiceRequestEntity? serviceRequest,
            List<WorkLogEntity> workLogs,
            List<String> requiredSkills,
            List<PartEntity> requiredParts,
            List<String> attachments,
            String? completionNotes,
            String? userId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity() when $default != null:
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
            _that.serviceRequestNumber,
            _that.durationHours,
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
            _that.userId);
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
            int id,
            String woNumber,
            int srId,
            String summary,
            String problemDescription,
            WorkOrderPriority priority,
            DateTime visitDate,
            String location,
            WorkOrderStatus status,
            int durationDays,
            String? serviceRequestNumber,
            double? durationHours,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? startedAt,
            DateTime? resumedAt,
            DateTime? completedAt,
            String? pauseLogs,
            String? workLog,
            List<PartUsedEntity> partsUsed,
            List<String> images,
            CustomerEntity? customer,
            LocationEntity? locationDetails,
            ServiceRequestEntity? serviceRequest,
            List<WorkLogEntity> workLogs,
            List<String> requiredSkills,
            List<PartEntity> requiredParts,
            List<String> attachments,
            String? completionNotes,
            String? userId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity():
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
            _that.serviceRequestNumber,
            _that.durationHours,
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
            _that.userId);
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
            int id,
            String woNumber,
            int srId,
            String summary,
            String problemDescription,
            WorkOrderPriority priority,
            DateTime visitDate,
            String location,
            WorkOrderStatus status,
            int durationDays,
            String? serviceRequestNumber,
            double? durationHours,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? startedAt,
            DateTime? resumedAt,
            DateTime? completedAt,
            String? pauseLogs,
            String? workLog,
            List<PartUsedEntity> partsUsed,
            List<String> images,
            CustomerEntity? customer,
            LocationEntity? locationDetails,
            ServiceRequestEntity? serviceRequest,
            List<WorkLogEntity> workLogs,
            List<String> requiredSkills,
            List<PartEntity> requiredParts,
            List<String> attachments,
            String? completionNotes,
            String? userId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderEntity() when $default != null:
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
            _that.serviceRequestNumber,
            _that.durationHours,
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
            _that.userId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkOrderEntity extends WorkOrderEntity {
  const _WorkOrderEntity(
      {required this.id,
      required this.woNumber,
      required this.srId,
      required this.summary,
      required this.problemDescription,
      required this.priority,
      required this.visitDate,
      required this.location,
      required this.status,
      required this.durationDays,
      this.serviceRequestNumber,
      this.durationHours,
      required this.createdAt,
      required this.updatedAt,
      this.startedAt,
      this.resumedAt,
      this.completedAt,
      this.pauseLogs,
      this.workLog,
      final List<PartUsedEntity> partsUsed = const [],
      final List<String> images = const [],
      this.customer,
      this.locationDetails,
      this.serviceRequest,
      final List<WorkLogEntity> workLogs = const [],
      final List<String> requiredSkills = const [],
      final List<PartEntity> requiredParts = const [],
      final List<String> attachments = const [],
      this.completionNotes,
      this.userId})
      : _partsUsed = partsUsed,
        _images = images,
        _workLogs = workLogs,
        _requiredSkills = requiredSkills,
        _requiredParts = requiredParts,
        _attachments = attachments,
        super._();

  @override
  final int id;
  @override
  final String woNumber;
  @override
  final int srId;
  @override
  final String summary;
  @override
  final String problemDescription;
  @override
  final WorkOrderPriority priority;
  @override
  final DateTime visitDate;
  @override
  final String location;
  @override
  final WorkOrderStatus status;
  @override
  final int durationDays;
  @override
  final String? serviceRequestNumber;
  @override
  final double? durationHours;
// @Default(0) int pauseCount,
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? resumedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? pauseLogs;
  @override
  final String? workLog;
  final List<PartUsedEntity> _partsUsed;
  @override
  @JsonKey()
  List<PartUsedEntity> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final CustomerEntity? customer;
  @override
  final LocationEntity? locationDetails;
  @override
  final ServiceRequestEntity? serviceRequest;
  final List<WorkLogEntity> _workLogs;
  @override
  @JsonKey()
  List<WorkLogEntity> get workLogs {
    if (_workLogs is EqualUnmodifiableListView) return _workLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workLogs);
  }

  final List<String> _requiredSkills;
  @override
  @JsonKey()
  List<String> get requiredSkills {
    if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSkills);
  }

  final List<PartEntity> _requiredParts;
  @override
  @JsonKey()
  List<PartEntity> get requiredParts {
    if (_requiredParts is EqualUnmodifiableListView) return _requiredParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredParts);
  }

  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final String? completionNotes;
  @override
  final String? userId;

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderEntityCopyWith<_WorkOrderEntity> get copyWith =>
      __$WorkOrderEntityCopyWithImpl<_WorkOrderEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderEntity &&
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
            (identical(other.serviceRequestNumber, serviceRequestNumber) ||
                other.serviceRequestNumber == serviceRequestNumber) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
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
            (identical(other.userId, userId) || other.userId == userId));
  }

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
        serviceRequestNumber,
        durationHours,
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
        userId
      ]);

  @override
  String toString() {
    return 'WorkOrderEntity(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, serviceRequestNumber: $serviceRequestNumber, durationHours: $durationHours, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderEntityCopyWith<$Res>
    implements $WorkOrderEntityCopyWith<$Res> {
  factory _$WorkOrderEntityCopyWith(
          _WorkOrderEntity value, $Res Function(_WorkOrderEntity) _then) =
      __$WorkOrderEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String woNumber,
      int srId,
      String summary,
      String problemDescription,
      WorkOrderPriority priority,
      DateTime visitDate,
      String location,
      WorkOrderStatus status,
      int durationDays,
      String? serviceRequestNumber,
      double? durationHours,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? startedAt,
      DateTime? resumedAt,
      DateTime? completedAt,
      String? pauseLogs,
      String? workLog,
      List<PartUsedEntity> partsUsed,
      List<String> images,
      CustomerEntity? customer,
      LocationEntity? locationDetails,
      ServiceRequestEntity? serviceRequest,
      List<WorkLogEntity> workLogs,
      List<String> requiredSkills,
      List<PartEntity> requiredParts,
      List<String> attachments,
      String? completionNotes,
      String? userId});

  @override
  $CustomerEntityCopyWith<$Res>? get customer;
  @override
  $LocationEntityCopyWith<$Res>? get locationDetails;
  @override
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class __$WorkOrderEntityCopyWithImpl<$Res>
    implements _$WorkOrderEntityCopyWith<$Res> {
  __$WorkOrderEntityCopyWithImpl(this._self, this._then);

  final _WorkOrderEntity _self;
  final $Res Function(_WorkOrderEntity) _then;

  /// Create a copy of WorkOrderEntity
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
    Object? serviceRequestNumber = freezed,
    Object? durationHours = freezed,
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
    Object? userId = freezed,
  }) {
    return _then(_WorkOrderEntity(
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
              as WorkOrderPriority,
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
              as WorkOrderStatus,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequestNumber: freezed == serviceRequestNumber
          ? _self.serviceRequestNumber
          : serviceRequestNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as List<PartUsedEntity>,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
      workLogs: null == workLogs
          ? _self._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogEntity>,
      requiredSkills: null == requiredSkills
          ? _self._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _self._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerEntityCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestEntityCopyWith<$Res>(_self.serviceRequest!, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }
}

/// @nodoc
mixin _$PartUsedEntity {
  String get partNumber;
  int get quantityUsed;
  String? get partName;
  String? get description;

  /// Create a copy of PartUsedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartUsedEntityCopyWith<PartUsedEntity> get copyWith =>
      _$PartUsedEntityCopyWithImpl<PartUsedEntity>(
          this as PartUsedEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartUsedEntity &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedEntity(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PartUsedEntityCopyWith<$Res> {
  factory $PartUsedEntityCopyWith(
          PartUsedEntity value, $Res Function(PartUsedEntity) _then) =
      _$PartUsedEntityCopyWithImpl;
  @useResult
  $Res call(
      {String partNumber,
      int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class _$PartUsedEntityCopyWithImpl<$Res>
    implements $PartUsedEntityCopyWith<$Res> {
  _$PartUsedEntityCopyWithImpl(this._self, this._then);

  final PartUsedEntity _self;
  final $Res Function(PartUsedEntity) _then;

  /// Create a copy of PartUsedEntity
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

/// Adds pattern-matching-related methods to [PartUsedEntity].
extension PartUsedEntityPatterns on PartUsedEntity {
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
    TResult Function(_PartUsedEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity() when $default != null:
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
    TResult Function(_PartUsedEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity():
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
    TResult? Function(_PartUsedEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity() when $default != null:
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
    TResult Function(String partNumber, int quantityUsed, String? partName,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity() when $default != null:
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
    TResult Function(String partNumber, int quantityUsed, String? partName,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity():
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
    TResult? Function(String partNumber, int quantityUsed, String? partName,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PartUsedEntity() when $default != null:
        return $default(_that.partNumber, _that.quantityUsed, _that.partName,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PartUsedEntity implements PartUsedEntity {
  const _PartUsedEntity(
      {required this.partNumber,
      required this.quantityUsed,
      this.partName,
      this.description});

  @override
  final String partNumber;
  @override
  final int quantityUsed;
  @override
  final String? partName;
  @override
  final String? description;

  /// Create a copy of PartUsedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartUsedEntityCopyWith<_PartUsedEntity> get copyWith =>
      __$PartUsedEntityCopyWithImpl<_PartUsedEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartUsedEntity &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @override
  String toString() {
    return 'PartUsedEntity(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PartUsedEntityCopyWith<$Res>
    implements $PartUsedEntityCopyWith<$Res> {
  factory _$PartUsedEntityCopyWith(
          _PartUsedEntity value, $Res Function(_PartUsedEntity) _then) =
      __$PartUsedEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String partNumber,
      int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class __$PartUsedEntityCopyWithImpl<$Res>
    implements _$PartUsedEntityCopyWith<$Res> {
  __$PartUsedEntityCopyWithImpl(this._self, this._then);

  final _PartUsedEntity _self;
  final $Res Function(_PartUsedEntity) _then;

  /// Create a copy of PartUsedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_PartUsedEntity(
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

// dart format on
