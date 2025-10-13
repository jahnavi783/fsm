// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkOrderEntity {
  int get id => throw _privateConstructorUsedError;
  String get woNumber => throw _privateConstructorUsedError;
  int get srId => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get problemDescription => throw _privateConstructorUsedError;
  WorkOrderPriority get priority => throw _privateConstructorUsedError;
  DateTime get visitDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  WorkOrderStatus get status => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get resumedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get pauseLogs => throw _privateConstructorUsedError;
  String? get workLog => throw _privateConstructorUsedError;
  List<PartUsedEntity> get partsUsed => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  CustomerEntity? get customer => throw _privateConstructorUsedError;
  LocationEntity? get locationDetails => throw _privateConstructorUsedError;
  ServiceRequestEntity? get serviceRequest =>
      throw _privateConstructorUsedError;
  List<WorkLogEntity> get workLogs => throw _privateConstructorUsedError;
  List<String> get requiredSkills => throw _privateConstructorUsedError;
  List<PartEntity> get requiredParts => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkOrderEntityCopyWith<WorkOrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderEntityCopyWith<$Res> {
  factory $WorkOrderEntityCopyWith(
          WorkOrderEntity value, $Res Function(WorkOrderEntity) then) =
      _$WorkOrderEntityCopyWithImpl<$Res, WorkOrderEntity>;
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
      int duration,
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
      String? completionNotes});

  $CustomerEntityCopyWith<$Res>? get customer;
  $LocationEntityCopyWith<$Res>? get locationDetails;
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class _$WorkOrderEntityCopyWithImpl<$Res, $Val extends WorkOrderEntity>
    implements $WorkOrderEntityCopyWith<$Res> {
  _$WorkOrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? duration = null,
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      woNumber: null == woNumber
          ? _value.woNumber
          : woNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srId: null == srId
          ? _value.srId
          : srId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      problemDescription: null == problemDescription
          ? _value.problemDescription
          : problemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedAt: freezed == resumedAt
          ? _value.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseLogs: freezed == pauseLogs
          ? _value.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _value.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedEntity>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
      workLogs: null == workLogs
          ? _value.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogEntity>,
      requiredSkills: null == requiredSkills
          ? _value.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerEntityCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get locationDetails {
    if (_value.locationDetails == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_value.locationDetails!, (value) {
      return _then(_value.copyWith(locationDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest {
    if (_value.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestEntityCopyWith<$Res>(_value.serviceRequest!, (value) {
      return _then(_value.copyWith(serviceRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderEntityImplCopyWith<$Res>
    implements $WorkOrderEntityCopyWith<$Res> {
  factory _$$WorkOrderEntityImplCopyWith(_$WorkOrderEntityImpl value,
          $Res Function(_$WorkOrderEntityImpl) then) =
      __$$WorkOrderEntityImplCopyWithImpl<$Res>;
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
      int duration,
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
      String? completionNotes});

  @override
  $CustomerEntityCopyWith<$Res>? get customer;
  @override
  $LocationEntityCopyWith<$Res>? get locationDetails;
  @override
  $ServiceRequestEntityCopyWith<$Res>? get serviceRequest;
}

/// @nodoc
class __$$WorkOrderEntityImplCopyWithImpl<$Res>
    extends _$WorkOrderEntityCopyWithImpl<$Res, _$WorkOrderEntityImpl>
    implements _$$WorkOrderEntityImplCopyWith<$Res> {
  __$$WorkOrderEntityImplCopyWithImpl(
      _$WorkOrderEntityImpl _value, $Res Function(_$WorkOrderEntityImpl) _then)
      : super(_value, _then);

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
    Object? duration = null,
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
  }) {
    return _then(_$WorkOrderEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      woNumber: null == woNumber
          ? _value.woNumber
          : woNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srId: null == srId
          ? _value.srId
          : srId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      problemDescription: null == problemDescription
          ? _value.problemDescription
          : problemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedAt: freezed == resumedAt
          ? _value.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseLogs: freezed == pauseLogs
          ? _value.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: null == partsUsed
          ? _value._partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as List<PartUsedEntity>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestEntity?,
      workLogs: null == workLogs
          ? _value._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogEntity>,
      requiredSkills: null == requiredSkills
          ? _value._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartEntity>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WorkOrderEntityImpl extends _WorkOrderEntity {
  const _$WorkOrderEntityImpl(
      {required this.id,
      required this.woNumber,
      required this.srId,
      required this.summary,
      required this.problemDescription,
      required this.priority,
      required this.visitDate,
      required this.location,
      required this.status,
      required this.duration,
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
      this.completionNotes})
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
  final int duration;
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
  String toString() {
    return 'WorkOrderEntity(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, duration: $duration, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderEntityImpl &&
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
                other.completionNotes == completionNotes));
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
        duration,
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
        completionNotes
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderEntityImplCopyWith<_$WorkOrderEntityImpl> get copyWith =>
      __$$WorkOrderEntityImplCopyWithImpl<_$WorkOrderEntityImpl>(
          this, _$identity);
}

abstract class _WorkOrderEntity extends WorkOrderEntity {
  const factory _WorkOrderEntity(
      {required final int id,
      required final String woNumber,
      required final int srId,
      required final String summary,
      required final String problemDescription,
      required final WorkOrderPriority priority,
      required final DateTime visitDate,
      required final String location,
      required final WorkOrderStatus status,
      required final int duration,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? startedAt,
      final DateTime? resumedAt,
      final DateTime? completedAt,
      final String? pauseLogs,
      final String? workLog,
      final List<PartUsedEntity> partsUsed,
      final List<String> images,
      final CustomerEntity? customer,
      final LocationEntity? locationDetails,
      final ServiceRequestEntity? serviceRequest,
      final List<WorkLogEntity> workLogs,
      final List<String> requiredSkills,
      final List<PartEntity> requiredParts,
      final List<String> attachments,
      final String? completionNotes}) = _$WorkOrderEntityImpl;
  const _WorkOrderEntity._() : super._();

  @override
  int get id;
  @override
  String get woNumber;
  @override
  int get srId;
  @override
  String get summary;
  @override
  String get problemDescription;
  @override
  WorkOrderPriority get priority;
  @override
  DateTime get visitDate;
  @override
  String get location;
  @override
  WorkOrderStatus get status;
  @override
  int get duration;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get resumedAt;
  @override
  DateTime? get completedAt;
  @override
  String? get pauseLogs;
  @override
  String? get workLog;
  @override
  List<PartUsedEntity> get partsUsed;
  @override
  List<String> get images;
  @override
  CustomerEntity? get customer;
  @override
  LocationEntity? get locationDetails;
  @override
  ServiceRequestEntity? get serviceRequest;
  @override
  List<WorkLogEntity> get workLogs;
  @override
  List<String> get requiredSkills;
  @override
  List<PartEntity> get requiredParts;
  @override
  List<String> get attachments;
  @override
  String? get completionNotes;
  @override
  @JsonKey(ignore: true)
  _$$WorkOrderEntityImplCopyWith<_$WorkOrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PartUsedEntity {
  String get partNumber => throw _privateConstructorUsedError;
  int get quantityUsed => throw _privateConstructorUsedError;
  String? get partName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartUsedEntityCopyWith<PartUsedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartUsedEntityCopyWith<$Res> {
  factory $PartUsedEntityCopyWith(
          PartUsedEntity value, $Res Function(PartUsedEntity) then) =
      _$PartUsedEntityCopyWithImpl<$Res, PartUsedEntity>;
  @useResult
  $Res call(
      {String partNumber,
      int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class _$PartUsedEntityCopyWithImpl<$Res, $Val extends PartUsedEntity>
    implements $PartUsedEntityCopyWith<$Res> {
  _$PartUsedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _value.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartUsedEntityImplCopyWith<$Res>
    implements $PartUsedEntityCopyWith<$Res> {
  factory _$$PartUsedEntityImplCopyWith(_$PartUsedEntityImpl value,
          $Res Function(_$PartUsedEntityImpl) then) =
      __$$PartUsedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String partNumber,
      int quantityUsed,
      String? partName,
      String? description});
}

/// @nodoc
class __$$PartUsedEntityImplCopyWithImpl<$Res>
    extends _$PartUsedEntityCopyWithImpl<$Res, _$PartUsedEntityImpl>
    implements _$$PartUsedEntityImplCopyWith<$Res> {
  __$$PartUsedEntityImplCopyWithImpl(
      _$PartUsedEntityImpl _value, $Res Function(_$PartUsedEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PartUsedEntityImpl(
      partNumber: null == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityUsed: null == quantityUsed
          ? _value.quantityUsed
          : quantityUsed // ignore: cast_nullable_to_non_nullable
              as int,
      partName: freezed == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PartUsedEntityImpl implements _PartUsedEntity {
  const _$PartUsedEntityImpl(
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

  @override
  String toString() {
    return 'PartUsedEntity(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartUsedEntityImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartUsedEntityImplCopyWith<_$PartUsedEntityImpl> get copyWith =>
      __$$PartUsedEntityImplCopyWithImpl<_$PartUsedEntityImpl>(
          this, _$identity);
}

abstract class _PartUsedEntity implements PartUsedEntity {
  const factory _PartUsedEntity(
      {required final String partNumber,
      required final int quantityUsed,
      final String? partName,
      final String? description}) = _$PartUsedEntityImpl;

  @override
  String get partNumber;
  @override
  int get quantityUsed;
  @override
  String? get partName;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PartUsedEntityImplCopyWith<_$PartUsedEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
