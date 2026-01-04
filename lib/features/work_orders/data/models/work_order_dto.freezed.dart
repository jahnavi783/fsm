// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrderDto {
  int get id;
  @JsonKey(name: 'wo_number')
  String get woNumber;
  @JsonKey(name: 'sr_id')
  int get srId;
  @JsonKey(name: 'pause_count')
  int get pauseCount;
  @JsonKey(name: 'service_request_number')
  String? get serviceRequestNumber;
  String get summary;
  @JsonKey(name: 'problem_description')
  String get problemDescription;
  String get priority;
  @JsonKey(name: 'visit_date')
  String get visitDate;
  String get location;
  String get status;
  @JsonKey(name: 'duration_days')
  int get durationDays;
  @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
  double? get durationHours;
  @JsonKey(name: 'created_by')
  int? get createdBy;
  @JsonKey(name: 'assigned_to')
  int? get assignedTo;
  @JsonKey(name: 'started_at')
  String? get startedAt;
  @JsonKey(name: 'resumed_at')
  String? get resumedAt;
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @JsonKey(name: 'pause_logs')
  String? get pauseLogs;
  @JsonKey(name: 'rejection_logs')
  String? get rejectionLogs;
  @JsonKey(name: 'work_log')
  String? get workLog;
  @JsonKey(
      name: 'parts_used',
      fromJson: _partsUsedFromJson,
      toJson: _partsUsedToJson)
  List<PartUsedDto>? get partsUsed;
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @JsonKey(name: 'updatedAt')
  String get updatedAt;
  @JsonKey(name: 'createdBy')
  UserDto? get createdByUser;
  @JsonKey(name: 'assignedTo')
  UserDto? get assignedToUser;
  @JsonKey(name: 'serviceRequest')
  ServiceRequestDto?
      get serviceRequest; // Optional fields that may not be in the API response
  CustomerDto? get customer;
  @JsonKey(name: 'location_details')
  LocationDto? get locationDetails;
  List<WorkLogDto> get workLogs;
  List<String> get requiredSkills;
  @JsonArrayConverter<PartDto>()
  List<PartDto>? get requiredParts;
  List<String> get attachments;
  String? get completionNotes;
  List<String> get images;

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderDtoCopyWith<WorkOrderDto> get copyWith =>
      _$WorkOrderDtoCopyWithImpl<WorkOrderDto>(
          this as WorkOrderDto, _$identity);

  /// Serializes this WorkOrderDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.woNumber, woNumber) ||
                other.woNumber == woNumber) &&
            (identical(other.srId, srId) || other.srId == srId) &&
            (identical(other.pauseCount, pauseCount) ||
                other.pauseCount == pauseCount) &&
            (identical(other.serviceRequestNumber, serviceRequestNumber) ||
                other.serviceRequestNumber == serviceRequestNumber) &&
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
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pauseLogs, pauseLogs) ||
                other.pauseLogs == pauseLogs) &&
            (identical(other.rejectionLogs, rejectionLogs) ||
                other.rejectionLogs == rejectionLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality().equals(other.partsUsed, partsUsed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdByUser, createdByUser) ||
                other.createdByUser == createdByUser) &&
            (identical(other.assignedToUser, assignedToUser) ||
                other.assignedToUser == assignedToUser) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            const DeepCollectionEquality().equals(other.workLogs, workLogs) &&
            const DeepCollectionEquality()
                .equals(other.requiredSkills, requiredSkills) &&
            const DeepCollectionEquality()
                .equals(other.requiredParts, requiredParts) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        woNumber,
        srId,
        pauseCount,
        serviceRequestNumber,
        summary,
        problemDescription,
        priority,
        visitDate,
        location,
        status,
        durationDays,
        durationHours,
        createdBy,
        assignedTo,
        startedAt,
        resumedAt,
        completedAt,
        pauseLogs,
        rejectionLogs,
        workLog,
        const DeepCollectionEquality().hash(partsUsed),
        createdAt,
        updatedAt,
        createdByUser,
        assignedToUser,
        serviceRequest,
        customer,
        locationDetails,
        const DeepCollectionEquality().hash(workLogs),
        const DeepCollectionEquality().hash(requiredSkills),
        const DeepCollectionEquality().hash(requiredParts),
        const DeepCollectionEquality().hash(attachments),
        completionNotes,
        const DeepCollectionEquality().hash(images)
      ]);

  @override
  String toString() {
    return 'WorkOrderDto(id: $id, woNumber: $woNumber, srId: $srId, pauseCount: $pauseCount, serviceRequestNumber: $serviceRequestNumber, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, durationHours: $durationHours, createdBy: $createdBy, assignedTo: $assignedTo, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, rejectionLogs: $rejectionLogs, workLog: $workLog, partsUsed: $partsUsed, createdAt: $createdAt, updatedAt: $updatedAt, createdByUser: $createdByUser, assignedToUser: $assignedToUser, serviceRequest: $serviceRequest, customer: $customer, locationDetails: $locationDetails, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, images: $images)';
  }
}

/// @nodoc
abstract mixin class $WorkOrderDtoCopyWith<$Res> {
  factory $WorkOrderDtoCopyWith(
          WorkOrderDto value, $Res Function(WorkOrderDto) _then) =
      _$WorkOrderDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      @JsonKey(name: 'pause_count') int pauseCount,
      @JsonKey(name: 'service_request_number') String? serviceRequestNumber,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      String priority,
      @JsonKey(name: 'visit_date') String visitDate,
      String location,
      String status,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
      double? durationHours,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'resumed_at') String? resumedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'pause_logs') String? pauseLogs,
      @JsonKey(name: 'rejection_logs') String? rejectionLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonKey(
          name: 'parts_used',
          fromJson: _partsUsedFromJson,
          toJson: _partsUsedToJson)
      List<PartUsedDto>? partsUsed,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'createdBy') UserDto? createdByUser,
      @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
      @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
      CustomerDto? customer,
      @JsonKey(name: 'location_details') LocationDto? locationDetails,
      List<WorkLogDto> workLogs,
      List<String> requiredSkills,
      @JsonArrayConverter<PartDto>() List<PartDto>? requiredParts,
      List<String> attachments,
      String? completionNotes,
      List<String> images});

  $UserDtoCopyWith<$Res>? get createdByUser;
  $UserDtoCopyWith<$Res>? get assignedToUser;
  $ServiceRequestDtoCopyWith<$Res>? get serviceRequest;
  $CustomerDtoCopyWith<$Res>? get customer;
  $LocationDtoCopyWith<$Res>? get locationDetails;
}

/// @nodoc
class _$WorkOrderDtoCopyWithImpl<$Res> implements $WorkOrderDtoCopyWith<$Res> {
  _$WorkOrderDtoCopyWithImpl(this._self, this._then);

  final WorkOrderDto _self;
  final $Res Function(WorkOrderDto) _then;

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? woNumber = null,
    Object? srId = null,
    Object? pauseCount = null,
    Object? serviceRequestNumber = freezed,
    Object? summary = null,
    Object? problemDescription = null,
    Object? priority = null,
    Object? visitDate = null,
    Object? location = null,
    Object? status = null,
    Object? durationDays = null,
    Object? durationHours = freezed,
    Object? createdBy = freezed,
    Object? assignedTo = freezed,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? rejectionLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdByUser = freezed,
    Object? assignedToUser = freezed,
    Object? serviceRequest = freezed,
    Object? customer = freezed,
    Object? locationDetails = freezed,
    Object? workLogs = null,
    Object? requiredSkills = null,
    Object? requiredParts = freezed,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? images = null,
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
      pauseCount: null == pauseCount
          ? _self.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequestNumber: freezed == serviceRequestNumber
          ? _self.serviceRequestNumber
          : serviceRequestNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      resumedAt: freezed == resumedAt
          ? _self.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseLogs: freezed == pauseLogs
          ? _self.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionLogs: freezed == rejectionLogs
          ? _self.rejectionLogs
          : rejectionLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: freezed == partsUsed
          ? _self.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedDto>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: freezed == createdByUser
          ? _self.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      assignedToUser: freezed == assignedToUser
          ? _self.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDto?,
      workLogs: null == workLogs
          ? _self.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogDto>,
      requiredSkills: null == requiredSkills
          ? _self.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: freezed == requiredParts
          ? _self.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>?,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.createdByUser!, (value) {
      return _then(_self.copyWith(createdByUser: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get assignedToUser {
    if (_self.assignedToUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.assignedToUser!, (value) {
      return _then(_self.copyWith(assignedToUser: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestDtoCopyWith<$Res>(_self.serviceRequest!, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerDtoCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationDtoCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WorkOrderDto].
extension WorkOrderDtoPatterns on WorkOrderDto {
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
    TResult Function(_WorkOrderDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto() when $default != null:
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
    TResult Function(_WorkOrderDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto():
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
    TResult? Function(_WorkOrderDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto() when $default != null:
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
            @JsonKey(name: 'wo_number') String woNumber,
            @JsonKey(name: 'sr_id') int srId,
            @JsonKey(name: 'pause_count') int pauseCount,
            @JsonKey(name: 'service_request_number')
            String? serviceRequestNumber,
            String summary,
            @JsonKey(name: 'problem_description') String problemDescription,
            String priority,
            @JsonKey(name: 'visit_date') String visitDate,
            String location,
            String status,
            @JsonKey(name: 'duration_days') int durationDays,
            @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
            double? durationHours,
            @JsonKey(name: 'created_by') int? createdBy,
            @JsonKey(name: 'assigned_to') int? assignedTo,
            @JsonKey(name: 'started_at') String? startedAt,
            @JsonKey(name: 'resumed_at') String? resumedAt,
            @JsonKey(name: 'completed_at') String? completedAt,
            @JsonKey(name: 'pause_logs') String? pauseLogs,
            @JsonKey(name: 'rejection_logs') String? rejectionLogs,
            @JsonKey(name: 'work_log') String? workLog,
            @JsonKey(
                name: 'parts_used',
                fromJson: _partsUsedFromJson,
                toJson: _partsUsedToJson)
            List<PartUsedDto>? partsUsed,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String updatedAt,
            @JsonKey(name: 'createdBy') UserDto? createdByUser,
            @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
            @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
            CustomerDto? customer,
            @JsonKey(name: 'location_details') LocationDto? locationDetails,
            List<WorkLogDto> workLogs,
            List<String> requiredSkills,
            @JsonArrayConverter<PartDto>() List<PartDto>? requiredParts,
            List<String> attachments,
            String? completionNotes,
            List<String> images)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto() when $default != null:
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.pauseCount,
            _that.serviceRequestNumber,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.durationHours,
            _that.createdBy,
            _that.assignedTo,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.rejectionLogs,
            _that.workLog,
            _that.partsUsed,
            _that.createdAt,
            _that.updatedAt,
            _that.createdByUser,
            _that.assignedToUser,
            _that.serviceRequest,
            _that.customer,
            _that.locationDetails,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.images);
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
            @JsonKey(name: 'wo_number') String woNumber,
            @JsonKey(name: 'sr_id') int srId,
            @JsonKey(name: 'pause_count') int pauseCount,
            @JsonKey(name: 'service_request_number')
            String? serviceRequestNumber,
            String summary,
            @JsonKey(name: 'problem_description') String problemDescription,
            String priority,
            @JsonKey(name: 'visit_date') String visitDate,
            String location,
            String status,
            @JsonKey(name: 'duration_days') int durationDays,
            @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
            double? durationHours,
            @JsonKey(name: 'created_by') int? createdBy,
            @JsonKey(name: 'assigned_to') int? assignedTo,
            @JsonKey(name: 'started_at') String? startedAt,
            @JsonKey(name: 'resumed_at') String? resumedAt,
            @JsonKey(name: 'completed_at') String? completedAt,
            @JsonKey(name: 'pause_logs') String? pauseLogs,
            @JsonKey(name: 'rejection_logs') String? rejectionLogs,
            @JsonKey(name: 'work_log') String? workLog,
            @JsonKey(
                name: 'parts_used',
                fromJson: _partsUsedFromJson,
                toJson: _partsUsedToJson)
            List<PartUsedDto>? partsUsed,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String updatedAt,
            @JsonKey(name: 'createdBy') UserDto? createdByUser,
            @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
            @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
            CustomerDto? customer,
            @JsonKey(name: 'location_details') LocationDto? locationDetails,
            List<WorkLogDto> workLogs,
            List<String> requiredSkills,
            @JsonArrayConverter<PartDto>() List<PartDto>? requiredParts,
            List<String> attachments,
            String? completionNotes,
            List<String> images)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto():
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.pauseCount,
            _that.serviceRequestNumber,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.durationHours,
            _that.createdBy,
            _that.assignedTo,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.rejectionLogs,
            _that.workLog,
            _that.partsUsed,
            _that.createdAt,
            _that.updatedAt,
            _that.createdByUser,
            _that.assignedToUser,
            _that.serviceRequest,
            _that.customer,
            _that.locationDetails,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.images);
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
            @JsonKey(name: 'wo_number') String woNumber,
            @JsonKey(name: 'sr_id') int srId,
            @JsonKey(name: 'pause_count') int pauseCount,
            @JsonKey(name: 'service_request_number')
            String? serviceRequestNumber,
            String summary,
            @JsonKey(name: 'problem_description') String problemDescription,
            String priority,
            @JsonKey(name: 'visit_date') String visitDate,
            String location,
            String status,
            @JsonKey(name: 'duration_days') int durationDays,
            @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
            double? durationHours,
            @JsonKey(name: 'created_by') int? createdBy,
            @JsonKey(name: 'assigned_to') int? assignedTo,
            @JsonKey(name: 'started_at') String? startedAt,
            @JsonKey(name: 'resumed_at') String? resumedAt,
            @JsonKey(name: 'completed_at') String? completedAt,
            @JsonKey(name: 'pause_logs') String? pauseLogs,
            @JsonKey(name: 'rejection_logs') String? rejectionLogs,
            @JsonKey(name: 'work_log') String? workLog,
            @JsonKey(
                name: 'parts_used',
                fromJson: _partsUsedFromJson,
                toJson: _partsUsedToJson)
            List<PartUsedDto>? partsUsed,
            @JsonKey(name: 'createdAt') String createdAt,
            @JsonKey(name: 'updatedAt') String updatedAt,
            @JsonKey(name: 'createdBy') UserDto? createdByUser,
            @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
            @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
            CustomerDto? customer,
            @JsonKey(name: 'location_details') LocationDto? locationDetails,
            List<WorkLogDto> workLogs,
            List<String> requiredSkills,
            @JsonArrayConverter<PartDto>() List<PartDto>? requiredParts,
            List<String> attachments,
            String? completionNotes,
            List<String> images)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkOrderDto() when $default != null:
        return $default(
            _that.id,
            _that.woNumber,
            _that.srId,
            _that.pauseCount,
            _that.serviceRequestNumber,
            _that.summary,
            _that.problemDescription,
            _that.priority,
            _that.visitDate,
            _that.location,
            _that.status,
            _that.durationDays,
            _that.durationHours,
            _that.createdBy,
            _that.assignedTo,
            _that.startedAt,
            _that.resumedAt,
            _that.completedAt,
            _that.pauseLogs,
            _that.rejectionLogs,
            _that.workLog,
            _that.partsUsed,
            _that.createdAt,
            _that.updatedAt,
            _that.createdByUser,
            _that.assignedToUser,
            _that.serviceRequest,
            _that.customer,
            _that.locationDetails,
            _that.workLogs,
            _that.requiredSkills,
            _that.requiredParts,
            _that.attachments,
            _that.completionNotes,
            _that.images);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkOrderDto implements WorkOrderDto {
  const _WorkOrderDto(
      {required this.id,
      @JsonKey(name: 'wo_number') required this.woNumber,
      @JsonKey(name: 'sr_id') required this.srId,
      @JsonKey(name: 'pause_count') this.pauseCount = 0,
      @JsonKey(name: 'service_request_number') this.serviceRequestNumber,
      this.summary = '',
      @JsonKey(name: 'problem_description') this.problemDescription = '',
      required this.priority,
      @JsonKey(name: 'visit_date') required this.visitDate,
      this.location = '',
      required this.status,
      @JsonKey(name: 'duration_days') this.durationDays = 0,
      @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
      this.durationHours,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'assigned_to') this.assignedTo,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'resumed_at') this.resumedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'pause_logs') this.pauseLogs,
      @JsonKey(name: 'rejection_logs') this.rejectionLogs,
      @JsonKey(name: 'work_log') this.workLog,
      @JsonKey(
          name: 'parts_used',
          fromJson: _partsUsedFromJson,
          toJson: _partsUsedToJson)
      final List<PartUsedDto>? partsUsed,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      @JsonKey(name: 'createdBy') this.createdByUser,
      @JsonKey(name: 'assignedTo') this.assignedToUser,
      @JsonKey(name: 'serviceRequest') this.serviceRequest,
      this.customer,
      @JsonKey(name: 'location_details') this.locationDetails,
      final List<WorkLogDto> workLogs = const [],
      final List<String> requiredSkills = const [],
      @JsonArrayConverter<PartDto>()
      final List<PartDto>? requiredParts = const [],
      final List<String> attachments = const [],
      this.completionNotes,
      final List<String> images = const []})
      : _partsUsed = partsUsed,
        _workLogs = workLogs,
        _requiredSkills = requiredSkills,
        _requiredParts = requiredParts,
        _attachments = attachments,
        _images = images;
  factory _WorkOrderDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'wo_number')
  final String woNumber;
  @override
  @JsonKey(name: 'sr_id')
  final int srId;
  @override
  @JsonKey(name: 'pause_count')
  final int pauseCount;
  @override
  @JsonKey(name: 'service_request_number')
  final String? serviceRequestNumber;
  @override
  @JsonKey()
  final String summary;
  @override
  @JsonKey(name: 'problem_description')
  final String problemDescription;
  @override
  final String priority;
  @override
  @JsonKey(name: 'visit_date')
  final String visitDate;
  @override
  @JsonKey()
  final String location;
  @override
  final String status;
  @override
  @JsonKey(name: 'duration_days')
  final int durationDays;
  @override
  @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
  final double? durationHours;
  @override
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @override
  @JsonKey(name: 'assigned_to')
  final int? assignedTo;
  @override
  @JsonKey(name: 'started_at')
  final String? startedAt;
  @override
  @JsonKey(name: 'resumed_at')
  final String? resumedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'pause_logs')
  final String? pauseLogs;
  @override
  @JsonKey(name: 'rejection_logs')
  final String? rejectionLogs;
  @override
  @JsonKey(name: 'work_log')
  final String? workLog;
  final List<PartUsedDto>? _partsUsed;
  @override
  @JsonKey(
      name: 'parts_used',
      fromJson: _partsUsedFromJson,
      toJson: _partsUsedToJson)
  List<PartUsedDto>? get partsUsed {
    final value = _partsUsed;
    if (value == null) return null;
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @override
  @JsonKey(name: 'createdBy')
  final UserDto? createdByUser;
  @override
  @JsonKey(name: 'assignedTo')
  final UserDto? assignedToUser;
  @override
  @JsonKey(name: 'serviceRequest')
  final ServiceRequestDto? serviceRequest;
// Optional fields that may not be in the API response
  @override
  final CustomerDto? customer;
  @override
  @JsonKey(name: 'location_details')
  final LocationDto? locationDetails;
  final List<WorkLogDto> _workLogs;
  @override
  @JsonKey()
  List<WorkLogDto> get workLogs {
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

  final List<PartDto>? _requiredParts;
  @override
  @JsonKey()
  @JsonArrayConverter<PartDto>()
  List<PartDto>? get requiredParts {
    final value = _requiredParts;
    if (value == null) return null;
    if (_requiredParts is EqualUnmodifiableListView) return _requiredParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderDtoCopyWith<_WorkOrderDto> get copyWith =>
      __$WorkOrderDtoCopyWithImpl<_WorkOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.woNumber, woNumber) ||
                other.woNumber == woNumber) &&
            (identical(other.srId, srId) || other.srId == srId) &&
            (identical(other.pauseCount, pauseCount) ||
                other.pauseCount == pauseCount) &&
            (identical(other.serviceRequestNumber, serviceRequestNumber) ||
                other.serviceRequestNumber == serviceRequestNumber) &&
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
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pauseLogs, pauseLogs) ||
                other.pauseLogs == pauseLogs) &&
            (identical(other.rejectionLogs, rejectionLogs) ||
                other.rejectionLogs == rejectionLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdByUser, createdByUser) ||
                other.createdByUser == createdByUser) &&
            (identical(other.assignedToUser, assignedToUser) ||
                other.assignedToUser == assignedToUser) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            const DeepCollectionEquality().equals(other._workLogs, _workLogs) &&
            const DeepCollectionEquality()
                .equals(other._requiredSkills, _requiredSkills) &&
            const DeepCollectionEquality()
                .equals(other._requiredParts, _requiredParts) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        woNumber,
        srId,
        pauseCount,
        serviceRequestNumber,
        summary,
        problemDescription,
        priority,
        visitDate,
        location,
        status,
        durationDays,
        durationHours,
        createdBy,
        assignedTo,
        startedAt,
        resumedAt,
        completedAt,
        pauseLogs,
        rejectionLogs,
        workLog,
        const DeepCollectionEquality().hash(_partsUsed),
        createdAt,
        updatedAt,
        createdByUser,
        assignedToUser,
        serviceRequest,
        customer,
        locationDetails,
        const DeepCollectionEquality().hash(_workLogs),
        const DeepCollectionEquality().hash(_requiredSkills),
        const DeepCollectionEquality().hash(_requiredParts),
        const DeepCollectionEquality().hash(_attachments),
        completionNotes,
        const DeepCollectionEquality().hash(_images)
      ]);

  @override
  String toString() {
    return 'WorkOrderDto(id: $id, woNumber: $woNumber, srId: $srId, pauseCount: $pauseCount, serviceRequestNumber: $serviceRequestNumber, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, durationHours: $durationHours, createdBy: $createdBy, assignedTo: $assignedTo, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, rejectionLogs: $rejectionLogs, workLog: $workLog, partsUsed: $partsUsed, createdAt: $createdAt, updatedAt: $updatedAt, createdByUser: $createdByUser, assignedToUser: $assignedToUser, serviceRequest: $serviceRequest, customer: $customer, locationDetails: $locationDetails, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, images: $images)';
  }
}

/// @nodoc
abstract mixin class _$WorkOrderDtoCopyWith<$Res>
    implements $WorkOrderDtoCopyWith<$Res> {
  factory _$WorkOrderDtoCopyWith(
          _WorkOrderDto value, $Res Function(_WorkOrderDto) _then) =
      __$WorkOrderDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      @JsonKey(name: 'pause_count') int pauseCount,
      @JsonKey(name: 'service_request_number') String? serviceRequestNumber,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      String priority,
      @JsonKey(name: 'visit_date') String visitDate,
      String location,
      String status,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'duration_hours', fromJson: _toDoubleNullable)
      double? durationHours,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'resumed_at') String? resumedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'pause_logs') String? pauseLogs,
      @JsonKey(name: 'rejection_logs') String? rejectionLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonKey(
          name: 'parts_used',
          fromJson: _partsUsedFromJson,
          toJson: _partsUsedToJson)
      List<PartUsedDto>? partsUsed,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'createdBy') UserDto? createdByUser,
      @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
      @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
      CustomerDto? customer,
      @JsonKey(name: 'location_details') LocationDto? locationDetails,
      List<WorkLogDto> workLogs,
      List<String> requiredSkills,
      @JsonArrayConverter<PartDto>() List<PartDto>? requiredParts,
      List<String> attachments,
      String? completionNotes,
      List<String> images});

  @override
  $UserDtoCopyWith<$Res>? get createdByUser;
  @override
  $UserDtoCopyWith<$Res>? get assignedToUser;
  @override
  $ServiceRequestDtoCopyWith<$Res>? get serviceRequest;
  @override
  $CustomerDtoCopyWith<$Res>? get customer;
  @override
  $LocationDtoCopyWith<$Res>? get locationDetails;
}

/// @nodoc
class __$WorkOrderDtoCopyWithImpl<$Res>
    implements _$WorkOrderDtoCopyWith<$Res> {
  __$WorkOrderDtoCopyWithImpl(this._self, this._then);

  final _WorkOrderDto _self;
  final $Res Function(_WorkOrderDto) _then;

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? woNumber = null,
    Object? srId = null,
    Object? pauseCount = null,
    Object? serviceRequestNumber = freezed,
    Object? summary = null,
    Object? problemDescription = null,
    Object? priority = null,
    Object? visitDate = null,
    Object? location = null,
    Object? status = null,
    Object? durationDays = null,
    Object? durationHours = freezed,
    Object? createdBy = freezed,
    Object? assignedTo = freezed,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? rejectionLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdByUser = freezed,
    Object? assignedToUser = freezed,
    Object? serviceRequest = freezed,
    Object? customer = freezed,
    Object? locationDetails = freezed,
    Object? workLogs = null,
    Object? requiredSkills = null,
    Object? requiredParts = freezed,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? images = null,
  }) {
    return _then(_WorkOrderDto(
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
      pauseCount: null == pauseCount
          ? _self.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequestNumber: freezed == serviceRequestNumber
          ? _self.serviceRequestNumber
          : serviceRequestNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      resumedAt: freezed == resumedAt
          ? _self.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseLogs: freezed == pauseLogs
          ? _self.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionLogs: freezed == rejectionLogs
          ? _self.rejectionLogs
          : rejectionLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: freezed == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedDto>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: freezed == createdByUser
          ? _self.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      assignedToUser: freezed == assignedToUser
          ? _self.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto?,
      locationDetails: freezed == locationDetails
          ? _self.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDto?,
      workLogs: null == workLogs
          ? _self._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogDto>,
      requiredSkills: null == requiredSkills
          ? _self._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: freezed == requiredParts
          ? _self._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>?,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.createdByUser!, (value) {
      return _then(_self.copyWith(createdByUser: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get assignedToUser {
    if (_self.assignedToUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.assignedToUser!, (value) {
      return _then(_self.copyWith(assignedToUser: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<$Res>? get serviceRequest {
    if (_self.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestDtoCopyWith<$Res>(_self.serviceRequest!, (value) {
      return _then(_self.copyWith(serviceRequest: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerDtoCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }

  /// Create a copy of WorkOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res>? get locationDetails {
    if (_self.locationDetails == null) {
      return null;
    }

    return $LocationDtoCopyWith<$Res>(_self.locationDetails!, (value) {
      return _then(_self.copyWith(locationDetails: value));
    });
  }
}

/// @nodoc
mixin _$UserDto {
  int get id;
  String get email;
  @JsonKey(name: 'first_name')
  String get firstName;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<UserDto> get copyWith =>
      _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName);

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, firstName: $firstName)';
  }
}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) =
      _$UserDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id, String email, @JsonKey(name: 'first_name') String firstName});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
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
    TResult Function(_UserDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDto() when $default != null:
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
    TResult Function(_UserDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDto():
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
    TResult? Function(_UserDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDto() when $default != null:
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
    TResult Function(int id, String email,
            @JsonKey(name: 'first_name') String firstName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDto() when $default != null:
        return $default(_that.id, _that.email, _that.firstName);
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
            int id, String email, @JsonKey(name: 'first_name') String firstName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDto():
        return $default(_that.id, _that.email, _that.firstName);
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
    TResult? Function(int id, String email,
            @JsonKey(name: 'first_name') String firstName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDto() when $default != null:
        return $default(_that.id, _that.email, _that.firstName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserDto implements UserDto {
  const _UserDto(
      {required this.id,
      required this.email,
      @JsonKey(name: 'first_name') required this.firstName});
  factory _UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName);

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, firstName: $firstName)';
  }
}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) =
      __$UserDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String email, @JsonKey(name: 'first_name') String firstName});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
  }) {
    return _then(_UserDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
