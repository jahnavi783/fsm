// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderDto _$WorkOrderDtoFromJson(Map<String, dynamic> json) {
  return _WorkOrderDto.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'wo_number')
  String get woNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'sr_id')
  int get srId => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'problem_description')
  String get problemDescription => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  String get visitDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_days')
  int get durationDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_to')
  int? get assignedTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'resumed_at')
  String? get resumedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'pause_logs')
  String? get pauseLogs => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_logs')
  String? get rejectionLogs => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_log')
  String? get workLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'parts_used')
  String? get partsUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  UserDto? get createdByUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignedTo')
  UserDto? get assignedToUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceRequest')
  ServiceRequestDto? get serviceRequest =>
      throw _privateConstructorUsedError; // Optional fields that may not be in the API response
  CustomerDto? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_details')
  LocationDto? get locationDetails => throw _privateConstructorUsedError;
  List<WorkLogDto> get workLogs => throw _privateConstructorUsedError;
  List<String> get requiredSkills => throw _privateConstructorUsedError;
  List<PartDto> get requiredParts => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOrderDtoCopyWith<WorkOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderDtoCopyWith<$Res> {
  factory $WorkOrderDtoCopyWith(
          WorkOrderDto value, $Res Function(WorkOrderDto) then) =
      _$WorkOrderDtoCopyWithImpl<$Res, WorkOrderDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      String priority,
      @JsonKey(name: 'visit_date') String visitDate,
      String location,
      String status,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'resumed_at') String? resumedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'pause_logs') String? pauseLogs,
      @JsonKey(name: 'rejection_logs') String? rejectionLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonKey(name: 'parts_used') String? partsUsed,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'createdBy') UserDto? createdByUser,
      @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
      @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
      CustomerDto? customer,
      @JsonKey(name: 'location_details') LocationDto? locationDetails,
      List<WorkLogDto> workLogs,
      List<String> requiredSkills,
      List<PartDto> requiredParts,
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
class _$WorkOrderDtoCopyWithImpl<$Res, $Val extends WorkOrderDto>
    implements $WorkOrderDtoCopyWith<$Res> {
  _$WorkOrderDtoCopyWithImpl(this._value, this._then);

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
    Object? durationDays = null,
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
    Object? requiredParts = null,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? images = null,
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
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      resumedAt: freezed == resumedAt
          ? _value.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseLogs: freezed == pauseLogs
          ? _value.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionLogs: freezed == rejectionLogs
          ? _value.rejectionLogs
          : rejectionLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: freezed == partsUsed
          ? _value.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: freezed == createdByUser
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      assignedToUser: freezed == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDto?,
      workLogs: null == workLogs
          ? _value.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogDto>,
      requiredSkills: null == requiredSkills
          ? _value.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get createdByUser {
    if (_value.createdByUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.createdByUser!, (value) {
      return _then(_value.copyWith(createdByUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get assignedToUser {
    if (_value.assignedToUser == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.assignedToUser!, (value) {
      return _then(_value.copyWith(assignedToUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestDtoCopyWith<$Res>? get serviceRequest {
    if (_value.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestDtoCopyWith<$Res>(_value.serviceRequest!, (value) {
      return _then(_value.copyWith(serviceRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerDtoCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res>? get locationDetails {
    if (_value.locationDetails == null) {
      return null;
    }

    return $LocationDtoCopyWith<$Res>(_value.locationDetails!, (value) {
      return _then(_value.copyWith(locationDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderDtoImplCopyWith<$Res>
    implements $WorkOrderDtoCopyWith<$Res> {
  factory _$$WorkOrderDtoImplCopyWith(
          _$WorkOrderDtoImpl value, $Res Function(_$WorkOrderDtoImpl) then) =
      __$$WorkOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wo_number') String woNumber,
      @JsonKey(name: 'sr_id') int srId,
      String summary,
      @JsonKey(name: 'problem_description') String problemDescription,
      String priority,
      @JsonKey(name: 'visit_date') String visitDate,
      String location,
      String status,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'resumed_at') String? resumedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'pause_logs') String? pauseLogs,
      @JsonKey(name: 'rejection_logs') String? rejectionLogs,
      @JsonKey(name: 'work_log') String? workLog,
      @JsonKey(name: 'parts_used') String? partsUsed,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'createdBy') UserDto? createdByUser,
      @JsonKey(name: 'assignedTo') UserDto? assignedToUser,
      @JsonKey(name: 'serviceRequest') ServiceRequestDto? serviceRequest,
      CustomerDto? customer,
      @JsonKey(name: 'location_details') LocationDto? locationDetails,
      List<WorkLogDto> workLogs,
      List<String> requiredSkills,
      List<PartDto> requiredParts,
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
class __$$WorkOrderDtoImplCopyWithImpl<$Res>
    extends _$WorkOrderDtoCopyWithImpl<$Res, _$WorkOrderDtoImpl>
    implements _$$WorkOrderDtoImplCopyWith<$Res> {
  __$$WorkOrderDtoImplCopyWithImpl(
      _$WorkOrderDtoImpl _value, $Res Function(_$WorkOrderDtoImpl) _then)
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
    Object? durationDays = null,
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
    Object? requiredParts = null,
    Object? attachments = null,
    Object? completionNotes = freezed,
    Object? images = null,
  }) {
    return _then(_$WorkOrderDtoImpl(
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
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      resumedAt: freezed == resumedAt
          ? _value.resumedAt
          : resumedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseLogs: freezed == pauseLogs
          ? _value.pauseLogs
          : pauseLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionLogs: freezed == rejectionLogs
          ? _value.rejectionLogs
          : rejectionLogs // ignore: cast_nullable_to_non_nullable
              as String?,
      workLog: freezed == workLog
          ? _value.workLog
          : workLog // ignore: cast_nullable_to_non_nullable
              as String?,
      partsUsed: freezed == partsUsed
          ? _value.partsUsed
          : partsUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: freezed == createdByUser
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      assignedToUser: freezed == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestDto?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDto?,
      workLogs: null == workLogs
          ? _value._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogDto>,
      requiredSkills: null == requiredSkills
          ? _value._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartDto>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOrderDtoImpl implements _WorkOrderDto {
  const _$WorkOrderDtoImpl(
      {required this.id,
      @JsonKey(name: 'wo_number') required this.woNumber,
      @JsonKey(name: 'sr_id') required this.srId,
      this.summary = '',
      @JsonKey(name: 'problem_description') this.problemDescription = '',
      required this.priority,
      @JsonKey(name: 'visit_date') required this.visitDate,
      this.location = '',
      required this.status,
      @JsonKey(name: 'duration_days') this.durationDays = 0,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'assigned_to') this.assignedTo,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'resumed_at') this.resumedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'pause_logs') this.pauseLogs,
      @JsonKey(name: 'rejection_logs') this.rejectionLogs,
      @JsonKey(name: 'work_log') this.workLog,
      @JsonKey(name: 'parts_used') this.partsUsed,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      @JsonKey(name: 'createdBy') this.createdByUser,
      @JsonKey(name: 'assignedTo') this.assignedToUser,
      @JsonKey(name: 'serviceRequest') this.serviceRequest,
      this.customer,
      @JsonKey(name: 'location_details') this.locationDetails,
      final List<WorkLogDto> workLogs = const [],
      final List<String> requiredSkills = const [],
      final List<PartDto> requiredParts = const [],
      final List<String> attachments = const [],
      this.completionNotes,
      final List<String> images = const []})
      : _workLogs = workLogs,
        _requiredSkills = requiredSkills,
        _requiredParts = requiredParts,
        _attachments = attachments,
        _images = images;

  factory _$WorkOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderDtoImplFromJson(json);

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
  @override
  @JsonKey(name: 'parts_used')
  final String? partsUsed;
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

  final List<PartDto> _requiredParts;
  @override
  @JsonKey()
  List<PartDto> get requiredParts {
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
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'WorkOrderDto(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, createdBy: $createdBy, assignedTo: $assignedTo, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, rejectionLogs: $rejectionLogs, workLog: $workLog, partsUsed: $partsUsed, createdAt: $createdAt, updatedAt: $updatedAt, createdByUser: $createdByUser, assignedToUser: $assignedToUser, serviceRequest: $serviceRequest, customer: $customer, locationDetails: $locationDetails, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderDtoImpl &&
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
            (identical(other.partsUsed, partsUsed) ||
                other.partsUsed == partsUsed) &&
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

  @JsonKey(ignore: true)
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
        createdBy,
        assignedTo,
        startedAt,
        resumedAt,
        completedAt,
        pauseLogs,
        rejectionLogs,
        workLog,
        partsUsed,
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderDtoImplCopyWith<_$WorkOrderDtoImpl> get copyWith =>
      __$$WorkOrderDtoImplCopyWithImpl<_$WorkOrderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderDto implements WorkOrderDto {
  const factory _WorkOrderDto(
      {required final int id,
      @JsonKey(name: 'wo_number') required final String woNumber,
      @JsonKey(name: 'sr_id') required final int srId,
      final String summary,
      @JsonKey(name: 'problem_description') final String problemDescription,
      required final String priority,
      @JsonKey(name: 'visit_date') required final String visitDate,
      final String location,
      required final String status,
      @JsonKey(name: 'duration_days') final int durationDays,
      @JsonKey(name: 'created_by') final int? createdBy,
      @JsonKey(name: 'assigned_to') final int? assignedTo,
      @JsonKey(name: 'started_at') final String? startedAt,
      @JsonKey(name: 'resumed_at') final String? resumedAt,
      @JsonKey(name: 'completed_at') final String? completedAt,
      @JsonKey(name: 'pause_logs') final String? pauseLogs,
      @JsonKey(name: 'rejection_logs') final String? rejectionLogs,
      @JsonKey(name: 'work_log') final String? workLog,
      @JsonKey(name: 'parts_used') final String? partsUsed,
      @JsonKey(name: 'createdAt') required final String createdAt,
      @JsonKey(name: 'updatedAt') required final String updatedAt,
      @JsonKey(name: 'createdBy') final UserDto? createdByUser,
      @JsonKey(name: 'assignedTo') final UserDto? assignedToUser,
      @JsonKey(name: 'serviceRequest') final ServiceRequestDto? serviceRequest,
      final CustomerDto? customer,
      @JsonKey(name: 'location_details') final LocationDto? locationDetails,
      final List<WorkLogDto> workLogs,
      final List<String> requiredSkills,
      final List<PartDto> requiredParts,
      final List<String> attachments,
      final String? completionNotes,
      final List<String> images}) = _$WorkOrderDtoImpl;

  factory _WorkOrderDto.fromJson(Map<String, dynamic> json) =
      _$WorkOrderDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'wo_number')
  String get woNumber;
  @override
  @JsonKey(name: 'sr_id')
  int get srId;
  @override
  String get summary;
  @override
  @JsonKey(name: 'problem_description')
  String get problemDescription;
  @override
  String get priority;
  @override
  @JsonKey(name: 'visit_date')
  String get visitDate;
  @override
  String get location;
  @override
  String get status;
  @override
  @JsonKey(name: 'duration_days')
  int get durationDays;
  @override
  @JsonKey(name: 'created_by')
  int? get createdBy;
  @override
  @JsonKey(name: 'assigned_to')
  int? get assignedTo;
  @override
  @JsonKey(name: 'started_at')
  String? get startedAt;
  @override
  @JsonKey(name: 'resumed_at')
  String? get resumedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'pause_logs')
  String? get pauseLogs;
  @override
  @JsonKey(name: 'rejection_logs')
  String? get rejectionLogs;
  @override
  @JsonKey(name: 'work_log')
  String? get workLog;
  @override
  @JsonKey(name: 'parts_used')
  String? get partsUsed;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedAt;
  @override
  @JsonKey(name: 'createdBy')
  UserDto? get createdByUser;
  @override
  @JsonKey(name: 'assignedTo')
  UserDto? get assignedToUser;
  @override
  @JsonKey(name: 'serviceRequest')
  ServiceRequestDto? get serviceRequest;
  @override // Optional fields that may not be in the API response
  CustomerDto? get customer;
  @override
  @JsonKey(name: 'location_details')
  LocationDto? get locationDetails;
  @override
  List<WorkLogDto> get workLogs;
  @override
  List<String> get requiredSkills;
  @override
  List<PartDto> get requiredParts;
  @override
  List<String> get attachments;
  @override
  String? get completionNotes;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$WorkOrderDtoImplCopyWith<_$WorkOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {int id, String email, @JsonKey(name: 'first_name') String firstName});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String email, @JsonKey(name: 'first_name') String firstName});
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
  }) {
    return _then(_$UserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  const _$UserDtoImpl(
      {required this.id,
      required this.email,
      @JsonKey(name: 'first_name') required this.firstName});

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, firstName: $firstName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
          {required final int id,
          required final String email,
          @JsonKey(name: 'first_name') required final String firstName}) =
      _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(ignore: true)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
