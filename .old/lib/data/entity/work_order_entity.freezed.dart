// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  @JsonKey(name: 'wo_number')
  String get woNumber;
  @JsonKey(name: 'sr_id')
  int get srId;
  String get summary;
  @JsonKey(name: 'problem_description')
  String get problemDescription;
  WorkOrderPriority get priority;
  @DateTimeConverter()
  @JsonKey(name: 'visit_date')
  DateTime? get visitDate;
  String get location;
  WorkOrderStatus get status;
  @JsonKey(name: 'duration')
  int get duration;
  @DateTimeConverter()
  @JsonKey(name: 'started_at')
  DateTime? get startedAt;
  @DateTimeConverter()
  @JsonKey(name: 'resumed_at')
  DateTime? get resumedAt;
  @DateTimeConverter()
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @JsonKey(name: 'pause_logs')
  dynamic get pauseLogs;
  @JsonKey(name: 'work_log')
  String? get workLog;
  @JsonDecoder()
  @JsonKey(name: 'parts_used')
  List<WoCompletePartsUsedRequest> get partsUsed;
  @JsonKey(name: 'images')
  List<String> get images;
  @DateTimeConverter()
  DateTime get createdAt;
  @DateTimeConverter()
  DateTime get updatedAt;
  UserEntity? get createdBy;
  UserEntity? get assignedTo;
  ServiceRequestEntity? get serviceRequest;

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<WorkOrderEntity> get copyWith =>
      _$WorkOrderEntityCopyWithImpl<WorkOrderEntity>(
          this as WorkOrderEntity, _$identity);

  /// Serializes this WorkOrderEntity to a JSON map.
  Map<String, dynamic> toJson();

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
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other.pauseLogs, pauseLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality().equals(other.partsUsed, partsUsed) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest));
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
        duration,
        startedAt,
        resumedAt,
        completedAt,
        const DeepCollectionEquality().hash(pauseLogs),
        workLog,
        const DeepCollectionEquality().hash(partsUsed),
        const DeepCollectionEquality().hash(images),
        createdAt,
        updatedAt,
        createdBy,
        assignedTo,
        serviceRequest
      ]);

  @override
  String toString() {
    return 'WorkOrderEntity(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, duration: $duration, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, assignedTo: $assignedTo, serviceRequest: $serviceRequest)';
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
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      WorkOrderPriority priority,
      @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
      String location,
      WorkOrderStatus status,
      @JsonKey(name: 'duration') int duration,
      @DateTimeConverter() @JsonKey(name: 'started_at') DateTime? startedAt,
      @DateTimeConverter() @JsonKey(name: 'resumed_at') DateTime? resumedAt,
      @DateTimeConverter() @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'pause_logs') dynamic pauseLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonDecoder()
      @JsonKey(name: 'parts_used')
      List<WoCompletePartsUsedRequest> partsUsed,
      @JsonKey(name: 'images') List<String> images,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt,
      UserEntity? createdBy,
      UserEntity? assignedTo,
      ServiceRequestEntity? serviceRequest});

  $UserEntityCopyWith<$Res>? get createdBy;
  $UserEntityCopyWith<$Res>? get assignedTo;
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
    Object? visitDate = freezed,
    Object? location = null,
    Object? status = null,
    Object? duration = null,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = freezed,
    Object? assignedTo = freezed,
    Object? serviceRequest = freezed,
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
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
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
              as dynamic,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<WoCompletePartsUsedRequest>,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
    ));
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.createdBy!, (value) {
      return _then(_self.copyWith(createdBy: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assignedTo {
    if (_self.assignedTo == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.assignedTo!, (value) {
      return _then(_self.copyWith(assignedTo: value));
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
@JsonSerializable()
class _WorkOrderEntity extends WorkOrderEntity {
  const _WorkOrderEntity(
      {required this.id,
      @JsonKey(name: 'wo_number') required this.woNumber,
      @JsonKey(name: 'sr_id') required this.srId,
      this.summary = '',
      @JsonKey(name: 'problem_description') this.problemDescription = '',
      required this.priority,
      @DateTimeConverter() @JsonKey(name: 'visit_date') this.visitDate,
      this.location = '',
      required this.status,
      @JsonKey(name: 'duration') this.duration = 30,
      @DateTimeConverter() @JsonKey(name: 'started_at') this.startedAt,
      @DateTimeConverter() @JsonKey(name: 'resumed_at') this.resumedAt,
      @DateTimeConverter() @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'pause_logs') this.pauseLogs,
      @JsonKey(name: 'work_log') this.workLog,
      @JsonDecoder()
      @JsonKey(name: 'parts_used')
      final List<WoCompletePartsUsedRequest> partsUsed = const [],
      @JsonKey(name: 'images') final List<String> images = const [],
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt,
      this.createdBy,
      this.assignedTo,
      this.serviceRequest})
      : _partsUsed = partsUsed,
        _images = images,
        super._();
  factory _WorkOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderEntityFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'wo_number')
  final String woNumber;
  @override
  @JsonKey(name: 'sr_id')
  final int srId;
  @override
  @JsonKey()
  final String summary;
  @override
  @JsonKey(name: 'problem_description')
  final String problemDescription;
  @override
  final WorkOrderPriority priority;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'visit_date')
  final DateTime? visitDate;
  @override
  @JsonKey()
  final String location;
  @override
  final WorkOrderStatus status;
  @override
  @JsonKey(name: 'duration')
  final int duration;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'resumed_at')
  final DateTime? resumedAt;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'pause_logs')
  final dynamic pauseLogs;
  @override
  @JsonKey(name: 'work_log')
  final String? workLog;
  final List<WoCompletePartsUsedRequest> _partsUsed;
  @override
  @JsonDecoder()
  @JsonKey(name: 'parts_used')
  List<WoCompletePartsUsedRequest> get partsUsed {
    if (_partsUsed is EqualUnmodifiableListView) return _partsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsUsed);
  }

  final List<String> _images;
  @override
  @JsonKey(name: 'images')
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @DateTimeConverter()
  final DateTime updatedAt;
  @override
  final UserEntity? createdBy;
  @override
  final UserEntity? assignedTo;
  @override
  final ServiceRequestEntity? serviceRequest;

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkOrderEntityCopyWith<_WorkOrderEntity> get copyWith =>
      __$WorkOrderEntityCopyWithImpl<_WorkOrderEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkOrderEntityToJson(
      this,
    );
  }

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
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other.pauseLogs, pauseLogs) &&
            (identical(other.workLog, workLog) || other.workLog == workLog) &&
            const DeepCollectionEquality()
                .equals(other._partsUsed, _partsUsed) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.serviceRequest, serviceRequest) ||
                other.serviceRequest == serviceRequest));
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
        duration,
        startedAt,
        resumedAt,
        completedAt,
        const DeepCollectionEquality().hash(pauseLogs),
        workLog,
        const DeepCollectionEquality().hash(_partsUsed),
        const DeepCollectionEquality().hash(_images),
        createdAt,
        updatedAt,
        createdBy,
        assignedTo,
        serviceRequest
      ]);

  @override
  String toString() {
    return 'WorkOrderEntity(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, duration: $duration, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, assignedTo: $assignedTo, serviceRequest: $serviceRequest)';
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
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      WorkOrderPriority priority,
      @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
      String location,
      WorkOrderStatus status,
      @JsonKey(name: 'duration') int duration,
      @DateTimeConverter() @JsonKey(name: 'started_at') DateTime? startedAt,
      @DateTimeConverter() @JsonKey(name: 'resumed_at') DateTime? resumedAt,
      @DateTimeConverter() @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'pause_logs') dynamic pauseLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonDecoder()
      @JsonKey(name: 'parts_used')
      List<WoCompletePartsUsedRequest> partsUsed,
      @JsonKey(name: 'images') List<String> images,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt,
      UserEntity? createdBy,
      UserEntity? assignedTo,
      ServiceRequestEntity? serviceRequest});

  @override
  $UserEntityCopyWith<$Res>? get createdBy;
  @override
  $UserEntityCopyWith<$Res>? get assignedTo;
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
    Object? visitDate = freezed,
    Object? location = null,
    Object? status = null,
    Object? duration = null,
    Object? startedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? pauseLogs = freezed,
    Object? workLog = freezed,
    Object? partsUsed = null,
    Object? images = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = freezed,
    Object? assignedTo = freezed,
    Object? serviceRequest = freezed,
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
      visitDate: freezed == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
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
              as dynamic,
      workLog: freezed == workLog
          ? _self.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _self._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<WoCompletePartsUsedRequest>,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      serviceRequest: freezed == serviceRequest
          ? _self.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
    ));
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.createdBy!, (value) {
      return _then(_self.copyWith(createdBy: value));
    });
  }

  /// Create a copy of WorkOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assignedTo {
    if (_self.assignedTo == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.assignedTo!, (value) {
      return _then(_self.copyWith(assignedTo: value));
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

// dart format on
