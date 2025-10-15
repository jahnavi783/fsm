// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderHiveModel _$WorkOrderHiveModelFromJson(Map<String, dynamic> json) {
  return _WorkOrderHiveModel.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get woNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  int get srId => throw _privateConstructorUsedError;
  @HiveField(3)
  String get summary => throw _privateConstructorUsedError;
  @HiveField(4)
  String get problemDescription => throw _privateConstructorUsedError;
  @HiveField(5)
  int get priority =>
      throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(6)
  DateTime get visitDate => throw _privateConstructorUsedError;
  @HiveField(7)
  String get location => throw _privateConstructorUsedError;
  @HiveField(8)
  int get status => throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(9)
  int get durationDays => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @HiveField(13)
  DateTime? get resumedAt => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get pauseLogs => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get workLog => throw _privateConstructorUsedError;
  @HiveField(17)
  List<PartUsedHiveModel> get partsUsed => throw _privateConstructorUsedError;
  @HiveField(18)
  List<String> get images => throw _privateConstructorUsedError;
  @HiveField(19)
  CustomerHiveModel? get customer => throw _privateConstructorUsedError;
  @HiveField(20)
  LocationHiveModel? get locationDetails => throw _privateConstructorUsedError;
  @HiveField(21)
  ServiceRequestHiveModel? get serviceRequest =>
      throw _privateConstructorUsedError;
  @HiveField(22)
  List<WorkLogHiveModel> get workLogs => throw _privateConstructorUsedError;
  @HiveField(23)
  List<String> get requiredSkills => throw _privateConstructorUsedError;
  @HiveField(24)
  List<PartHiveModel> get requiredParts => throw _privateConstructorUsedError;
  @HiveField(25)
  List<String> get attachments => throw _privateConstructorUsedError;
  @HiveField(26)
  String? get completionNotes => throw _privateConstructorUsedError;
  @HiveField(27)
  DateTime get cachedAt => throw _privateConstructorUsedError;
  @HiveField(28)
  bool get isPendingSync => throw _privateConstructorUsedError;
  @HiveField(29)
  String? get pendingAction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOrderHiveModelCopyWith<WorkOrderHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderHiveModelCopyWith<$Res> {
  factory $WorkOrderHiveModelCopyWith(
          WorkOrderHiveModel value, $Res Function(WorkOrderHiveModel) then) =
      _$WorkOrderHiveModelCopyWithImpl<$Res, WorkOrderHiveModel>;
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
class _$WorkOrderHiveModelCopyWithImpl<$Res, $Val extends WorkOrderHiveModel>
    implements $WorkOrderHiveModelCopyWith<$Res> {
  _$WorkOrderHiveModelCopyWithImpl(this._value, this._then);

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
              as int,
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
              as int,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
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
              as List<PartUsedHiveModel>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerHiveModel?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationHiveModel?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestHiveModel?,
      workLogs: null == workLogs
          ? _value.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogHiveModel>,
      requiredSkills: null == requiredSkills
          ? _value.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value.requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartHiveModel>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _value.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _value.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerHiveModelCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerHiveModelCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationHiveModelCopyWith<$Res>? get locationDetails {
    if (_value.locationDetails == null) {
      return null;
    }

    return $LocationHiveModelCopyWith<$Res>(_value.locationDetails!, (value) {
      return _then(_value.copyWith(locationDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestHiveModelCopyWith<$Res>? get serviceRequest {
    if (_value.serviceRequest == null) {
      return null;
    }

    return $ServiceRequestHiveModelCopyWith<$Res>(_value.serviceRequest!,
        (value) {
      return _then(_value.copyWith(serviceRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderHiveModelImplCopyWith<$Res>
    implements $WorkOrderHiveModelCopyWith<$Res> {
  factory _$$WorkOrderHiveModelImplCopyWith(_$WorkOrderHiveModelImpl value,
          $Res Function(_$WorkOrderHiveModelImpl) then) =
      __$$WorkOrderHiveModelImplCopyWithImpl<$Res>;
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
class __$$WorkOrderHiveModelImplCopyWithImpl<$Res>
    extends _$WorkOrderHiveModelCopyWithImpl<$Res, _$WorkOrderHiveModelImpl>
    implements _$$WorkOrderHiveModelImplCopyWith<$Res> {
  __$$WorkOrderHiveModelImplCopyWithImpl(_$WorkOrderHiveModelImpl _value,
      $Res Function(_$WorkOrderHiveModelImpl) _then)
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
    return _then(_$WorkOrderHiveModelImpl(
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
              as int,
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
              as int,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
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
              as List<PartUsedHiveModel>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerHiveModel?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationHiveModel?,
      serviceRequest: freezed == serviceRequest
          ? _value.serviceRequest
          : serviceRequest // ignore: cast_nullable_to_non_nullable
              as ServiceRequestHiveModel?,
      workLogs: null == workLogs
          ? _value._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLogHiveModel>,
      requiredSkills: null == requiredSkills
          ? _value._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiredParts: null == requiredParts
          ? _value._requiredParts
          : requiredParts // ignore: cast_nullable_to_non_nullable
              as List<PartHiveModel>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPendingSync: null == isPendingSync
          ? _value.isPendingSync
          : isPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingAction: freezed == pendingAction
          ? _value.pendingAction
          : pendingAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOrderHiveModelImpl implements _WorkOrderHiveModel {
  const _$WorkOrderHiveModelImpl(
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

  factory _$WorkOrderHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'WorkOrderHiveModel(id: $id, woNumber: $woNumber, srId: $srId, summary: $summary, problemDescription: $problemDescription, priority: $priority, visitDate: $visitDate, location: $location, status: $status, durationDays: $durationDays, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, resumedAt: $resumedAt, completedAt: $completedAt, pauseLogs: $pauseLogs, workLog: $workLog, partsUsed: $partsUsed, images: $images, customer: $customer, locationDetails: $locationDetails, serviceRequest: $serviceRequest, workLogs: $workLogs, requiredSkills: $requiredSkills, requiredParts: $requiredParts, attachments: $attachments, completionNotes: $completionNotes, cachedAt: $cachedAt, isPendingSync: $isPendingSync, pendingAction: $pendingAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderHiveModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderHiveModelImplCopyWith<_$WorkOrderHiveModelImpl> get copyWith =>
      __$$WorkOrderHiveModelImplCopyWithImpl<_$WorkOrderHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderHiveModelImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderHiveModel implements WorkOrderHiveModel {
  const factory _WorkOrderHiveModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String woNumber,
      @HiveField(2) required final int srId,
      @HiveField(3) required final String summary,
      @HiveField(4) required final String problemDescription,
      @HiveField(5) required final int priority,
      @HiveField(6) required final DateTime visitDate,
      @HiveField(7) required final String location,
      @HiveField(8) required final int status,
      @HiveField(9) required final int durationDays,
      @HiveField(10) required final DateTime createdAt,
      @HiveField(11) required final DateTime updatedAt,
      @HiveField(12) final DateTime? startedAt,
      @HiveField(13) final DateTime? resumedAt,
      @HiveField(14) final DateTime? completedAt,
      @HiveField(15) final String? pauseLogs,
      @HiveField(16) final String? workLog,
      @HiveField(17) final List<PartUsedHiveModel> partsUsed,
      @HiveField(18) final List<String> images,
      @HiveField(19) final CustomerHiveModel? customer,
      @HiveField(20) final LocationHiveModel? locationDetails,
      @HiveField(21) final ServiceRequestHiveModel? serviceRequest,
      @HiveField(22) final List<WorkLogHiveModel> workLogs,
      @HiveField(23) final List<String> requiredSkills,
      @HiveField(24) final List<PartHiveModel> requiredParts,
      @HiveField(25) final List<String> attachments,
      @HiveField(26) final String? completionNotes,
      @HiveField(27) required final DateTime cachedAt,
      @HiveField(28) final bool isPendingSync,
      @HiveField(29) final String? pendingAction}) = _$WorkOrderHiveModelImpl;

  factory _WorkOrderHiveModel.fromJson(Map<String, dynamic> json) =
      _$WorkOrderHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get woNumber;
  @override
  @HiveField(2)
  int get srId;
  @override
  @HiveField(3)
  String get summary;
  @override
  @HiveField(4)
  String get problemDescription;
  @override
  @HiveField(5)
  int get priority;
  @override // Store as int for enum
  @HiveField(6)
  DateTime get visitDate;
  @override
  @HiveField(7)
  String get location;
  @override
  @HiveField(8)
  int get status;
  @override // Store as int for enum
  @HiveField(9)
  int get durationDays;
  @override
  @HiveField(10)
  DateTime get createdAt;
  @override
  @HiveField(11)
  DateTime get updatedAt;
  @override
  @HiveField(12)
  DateTime? get startedAt;
  @override
  @HiveField(13)
  DateTime? get resumedAt;
  @override
  @HiveField(14)
  DateTime? get completedAt;
  @override
  @HiveField(15)
  String? get pauseLogs;
  @override
  @HiveField(16)
  String? get workLog;
  @override
  @HiveField(17)
  List<PartUsedHiveModel> get partsUsed;
  @override
  @HiveField(18)
  List<String> get images;
  @override
  @HiveField(19)
  CustomerHiveModel? get customer;
  @override
  @HiveField(20)
  LocationHiveModel? get locationDetails;
  @override
  @HiveField(21)
  ServiceRequestHiveModel? get serviceRequest;
  @override
  @HiveField(22)
  List<WorkLogHiveModel> get workLogs;
  @override
  @HiveField(23)
  List<String> get requiredSkills;
  @override
  @HiveField(24)
  List<PartHiveModel> get requiredParts;
  @override
  @HiveField(25)
  List<String> get attachments;
  @override
  @HiveField(26)
  String? get completionNotes;
  @override
  @HiveField(27)
  DateTime get cachedAt;
  @override
  @HiveField(28)
  bool get isPendingSync;
  @override
  @HiveField(29)
  String? get pendingAction;
  @override
  @JsonKey(ignore: true)
  _$$WorkOrderHiveModelImplCopyWith<_$WorkOrderHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartUsedHiveModel _$PartUsedHiveModelFromJson(Map<String, dynamic> json) {
  return _PartUsedHiveModel.fromJson(json);
}

/// @nodoc
mixin _$PartUsedHiveModel {
  @HiveField(0)
  String get partNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  int get quantityUsed => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get partName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartUsedHiveModelCopyWith<PartUsedHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartUsedHiveModelCopyWith<$Res> {
  factory $PartUsedHiveModelCopyWith(
          PartUsedHiveModel value, $Res Function(PartUsedHiveModel) then) =
      _$PartUsedHiveModelCopyWithImpl<$Res, PartUsedHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantityUsed,
      @HiveField(2) String? partName,
      @HiveField(3) String? description});
}

/// @nodoc
class _$PartUsedHiveModelCopyWithImpl<$Res, $Val extends PartUsedHiveModel>
    implements $PartUsedHiveModelCopyWith<$Res> {
  _$PartUsedHiveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PartUsedHiveModelImplCopyWith<$Res>
    implements $PartUsedHiveModelCopyWith<$Res> {
  factory _$$PartUsedHiveModelImplCopyWith(_$PartUsedHiveModelImpl value,
          $Res Function(_$PartUsedHiveModelImpl) then) =
      __$$PartUsedHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String partNumber,
      @HiveField(1) int quantityUsed,
      @HiveField(2) String? partName,
      @HiveField(3) String? description});
}

/// @nodoc
class __$$PartUsedHiveModelImplCopyWithImpl<$Res>
    extends _$PartUsedHiveModelCopyWithImpl<$Res, _$PartUsedHiveModelImpl>
    implements _$$PartUsedHiveModelImplCopyWith<$Res> {
  __$$PartUsedHiveModelImplCopyWithImpl(_$PartUsedHiveModelImpl _value,
      $Res Function(_$PartUsedHiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partNumber = null,
    Object? quantityUsed = null,
    Object? partName = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PartUsedHiveModelImpl(
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
@JsonSerializable()
class _$PartUsedHiveModelImpl implements _PartUsedHiveModel {
  const _$PartUsedHiveModelImpl(
      {@HiveField(0) required this.partNumber,
      @HiveField(1) required this.quantityUsed,
      @HiveField(2) this.partName,
      @HiveField(3) this.description});

  factory _$PartUsedHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartUsedHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PartUsedHiveModel(partNumber: $partNumber, quantityUsed: $quantityUsed, partName: $partName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartUsedHiveModelImpl &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.quantityUsed, quantityUsed) ||
                other.quantityUsed == quantityUsed) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partNumber, quantityUsed, partName, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartUsedHiveModelImplCopyWith<_$PartUsedHiveModelImpl> get copyWith =>
      __$$PartUsedHiveModelImplCopyWithImpl<_$PartUsedHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartUsedHiveModelImplToJson(
      this,
    );
  }
}

abstract class _PartUsedHiveModel implements PartUsedHiveModel {
  const factory _PartUsedHiveModel(
      {@HiveField(0) required final String partNumber,
      @HiveField(1) required final int quantityUsed,
      @HiveField(2) final String? partName,
      @HiveField(3) final String? description}) = _$PartUsedHiveModelImpl;

  factory _PartUsedHiveModel.fromJson(Map<String, dynamic> json) =
      _$PartUsedHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  String get partNumber;
  @override
  @HiveField(1)
  int get quantityUsed;
  @override
  @HiveField(2)
  String? get partName;
  @override
  @HiveField(3)
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PartUsedHiveModelImplCopyWith<_$PartUsedHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerHiveModel _$CustomerHiveModelFromJson(Map<String, dynamic> json) {
  return _CustomerHiveModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get city => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get state => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get postalCode => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerHiveModelCopyWith<CustomerHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerHiveModelCopyWith<$Res> {
  factory $CustomerHiveModelCopyWith(
          CustomerHiveModel value, $Res Function(CustomerHiveModel) then) =
      _$CustomerHiveModelCopyWithImpl<$Res, CustomerHiveModel>;
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
class _$CustomerHiveModelCopyWithImpl<$Res, $Val extends CustomerHiveModel>
    implements $CustomerHiveModelCopyWith<$Res> {
  _$CustomerHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerHiveModelImplCopyWith<$Res>
    implements $CustomerHiveModelCopyWith<$Res> {
  factory _$$CustomerHiveModelImplCopyWith(_$CustomerHiveModelImpl value,
          $Res Function(_$CustomerHiveModelImpl) then) =
      __$$CustomerHiveModelImplCopyWithImpl<$Res>;
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
class __$$CustomerHiveModelImplCopyWithImpl<$Res>
    extends _$CustomerHiveModelCopyWithImpl<$Res, _$CustomerHiveModelImpl>
    implements _$$CustomerHiveModelImplCopyWith<$Res> {
  __$$CustomerHiveModelImplCopyWithImpl(_$CustomerHiveModelImpl _value,
      $Res Function(_$CustomerHiveModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerHiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerHiveModelImpl implements _CustomerHiveModel {
  const _$CustomerHiveModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.email,
      @HiveField(3) this.phone,
      @HiveField(4) this.address,
      @HiveField(5) this.city,
      @HiveField(6) this.state,
      @HiveField(7) this.postalCode,
      @HiveField(8) this.country});

  factory _$CustomerHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerHiveModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerHiveModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, address,
      city, state, postalCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerHiveModelImplCopyWith<_$CustomerHiveModelImpl> get copyWith =>
      __$$CustomerHiveModelImplCopyWithImpl<_$CustomerHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerHiveModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerHiveModel implements CustomerHiveModel {
  const factory _CustomerHiveModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String email,
      @HiveField(3) final String? phone,
      @HiveField(4) final String? address,
      @HiveField(5) final String? city,
      @HiveField(6) final String? state,
      @HiveField(7) final String? postalCode,
      @HiveField(8) final String? country}) = _$CustomerHiveModelImpl;

  factory _CustomerHiveModel.fromJson(Map<String, dynamic> json) =
      _$CustomerHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String? get phone;
  @override
  @HiveField(4)
  String? get address;
  @override
  @HiveField(5)
  String? get city;
  @override
  @HiveField(6)
  String? get state;
  @override
  @HiveField(7)
  String? get postalCode;
  @override
  @HiveField(8)
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$CustomerHiveModelImplCopyWith<_$CustomerHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationHiveModel _$LocationHiveModelFromJson(Map<String, dynamic> json) {
  return _LocationHiveModel.fromJson(json);
}

/// @nodoc
mixin _$LocationHiveModel {
  @HiveField(0)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(1)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get city => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get state => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get postalCode => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get country => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get landmark => throw _privateConstructorUsedError;
  @HiveField(8)
  double? get accuracy => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime? get capturedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationHiveModelCopyWith<LocationHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationHiveModelCopyWith<$Res> {
  factory $LocationHiveModelCopyWith(
          LocationHiveModel value, $Res Function(LocationHiveModel) then) =
      _$LocationHiveModelCopyWithImpl<$Res, LocationHiveModel>;
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
class _$LocationHiveModelCopyWithImpl<$Res, $Val extends LocationHiveModel>
    implements $LocationHiveModelCopyWith<$Res> {
  _$LocationHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationHiveModelImplCopyWith<$Res>
    implements $LocationHiveModelCopyWith<$Res> {
  factory _$$LocationHiveModelImplCopyWith(_$LocationHiveModelImpl value,
          $Res Function(_$LocationHiveModelImpl) then) =
      __$$LocationHiveModelImplCopyWithImpl<$Res>;
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
class __$$LocationHiveModelImplCopyWithImpl<$Res>
    extends _$LocationHiveModelCopyWithImpl<$Res, _$LocationHiveModelImpl>
    implements _$$LocationHiveModelImplCopyWith<$Res> {
  __$$LocationHiveModelImplCopyWithImpl(_$LocationHiveModelImpl _value,
      $Res Function(_$LocationHiveModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$LocationHiveModelImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationHiveModelImpl implements _LocationHiveModel {
  const _$LocationHiveModelImpl(
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

  factory _$LocationHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'LocationHiveModel(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, landmark: $landmark, accuracy: $accuracy, capturedAt: $capturedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationHiveModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, postalCode, country, landmark, accuracy, capturedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationHiveModelImplCopyWith<_$LocationHiveModelImpl> get copyWith =>
      __$$LocationHiveModelImplCopyWithImpl<_$LocationHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationHiveModelImplToJson(
      this,
    );
  }
}

abstract class _LocationHiveModel implements LocationHiveModel {
  const factory _LocationHiveModel(
      {@HiveField(0) required final double latitude,
      @HiveField(1) required final double longitude,
      @HiveField(2) final String? address,
      @HiveField(3) final String? city,
      @HiveField(4) final String? state,
      @HiveField(5) final String? postalCode,
      @HiveField(6) final String? country,
      @HiveField(7) final String? landmark,
      @HiveField(8) final double? accuracy,
      @HiveField(9) final DateTime? capturedAt}) = _$LocationHiveModelImpl;

  factory _LocationHiveModel.fromJson(Map<String, dynamic> json) =
      _$LocationHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  double get latitude;
  @override
  @HiveField(1)
  double get longitude;
  @override
  @HiveField(2)
  String? get address;
  @override
  @HiveField(3)
  String? get city;
  @override
  @HiveField(4)
  String? get state;
  @override
  @HiveField(5)
  String? get postalCode;
  @override
  @HiveField(6)
  String? get country;
  @override
  @HiveField(7)
  String? get landmark;
  @override
  @HiveField(8)
  double? get accuracy;
  @override
  @HiveField(9)
  DateTime? get capturedAt;
  @override
  @JsonKey(ignore: true)
  _$$LocationHiveModelImplCopyWith<_$LocationHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceRequestHiveModel _$ServiceRequestHiveModelFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestHiveModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestHiveModel {
  @HiveField(0)
  String get srNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  String get srType => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get priority => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get issueDescription => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get machineSerial => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get model => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get customerName => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get location => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get postalCode => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get underWarranty => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get visitDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestHiveModelCopyWith<ServiceRequestHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestHiveModelCopyWith<$Res> {
  factory $ServiceRequestHiveModelCopyWith(ServiceRequestHiveModel value,
          $Res Function(ServiceRequestHiveModel) then) =
      _$ServiceRequestHiveModelCopyWithImpl<$Res, ServiceRequestHiveModel>;
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
class _$ServiceRequestHiveModelCopyWithImpl<$Res,
        $Val extends ServiceRequestHiveModel>
    implements $ServiceRequestHiveModelCopyWith<$Res> {
  _$ServiceRequestHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      srNumber: null == srNumber
          ? _value.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _value.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _value.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _value.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRequestHiveModelImplCopyWith<$Res>
    implements $ServiceRequestHiveModelCopyWith<$Res> {
  factory _$$ServiceRequestHiveModelImplCopyWith(
          _$ServiceRequestHiveModelImpl value,
          $Res Function(_$ServiceRequestHiveModelImpl) then) =
      __$$ServiceRequestHiveModelImplCopyWithImpl<$Res>;
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
class __$$ServiceRequestHiveModelImplCopyWithImpl<$Res>
    extends _$ServiceRequestHiveModelCopyWithImpl<$Res,
        _$ServiceRequestHiveModelImpl>
    implements _$$ServiceRequestHiveModelImplCopyWith<$Res> {
  __$$ServiceRequestHiveModelImplCopyWithImpl(
      _$ServiceRequestHiveModelImpl _value,
      $Res Function(_$ServiceRequestHiveModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServiceRequestHiveModelImpl(
      srNumber: null == srNumber
          ? _value.srNumber
          : srNumber // ignore: cast_nullable_to_non_nullable
              as String,
      srType: null == srType
          ? _value.srType
          : srType // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      machineSerial: freezed == machineSerial
          ? _value.machineSerial
          : machineSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      underWarranty: freezed == underWarranty
          ? _value.underWarranty
          : underWarranty // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequestHiveModelImpl implements _ServiceRequestHiveModel {
  const _$ServiceRequestHiveModelImpl(
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

  factory _$ServiceRequestHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequestHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceRequestHiveModel(srNumber: $srNumber, srType: $srType, priority: $priority, issueDescription: $issueDescription, machineSerial: $machineSerial, model: $model, customerName: $customerName, location: $location, postalCode: $postalCode, underWarranty: $underWarranty, visitDate: $visitDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequestHiveModelImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequestHiveModelImplCopyWith<_$ServiceRequestHiveModelImpl>
      get copyWith => __$$ServiceRequestHiveModelImplCopyWithImpl<
          _$ServiceRequestHiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequestHiveModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceRequestHiveModel implements ServiceRequestHiveModel {
  const factory _ServiceRequestHiveModel(
          {@HiveField(0) required final String srNumber,
          @HiveField(1) required final String srType,
          @HiveField(2) final String? priority,
          @HiveField(3) final String? issueDescription,
          @HiveField(4) final String? machineSerial,
          @HiveField(5) final String? model,
          @HiveField(6) final String? customerName,
          @HiveField(7) final String? location,
          @HiveField(8) final String? postalCode,
          @HiveField(9) final String? underWarranty,
          @HiveField(10) final DateTime? visitDate}) =
      _$ServiceRequestHiveModelImpl;

  factory _ServiceRequestHiveModel.fromJson(Map<String, dynamic> json) =
      _$ServiceRequestHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  String get srNumber;
  @override
  @HiveField(1)
  String get srType;
  @override
  @HiveField(2)
  String? get priority;
  @override
  @HiveField(3)
  String? get issueDescription;
  @override
  @HiveField(4)
  String? get machineSerial;
  @override
  @HiveField(5)
  String? get model;
  @override
  @HiveField(6)
  String? get customerName;
  @override
  @HiveField(7)
  String? get location;
  @override
  @HiveField(8)
  String? get postalCode;
  @override
  @HiveField(9)
  String? get underWarranty;
  @override
  @HiveField(10)
  DateTime? get visitDate;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRequestHiveModelImplCopyWith<_$ServiceRequestHiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkLogHiveModel _$WorkLogHiveModelFromJson(Map<String, dynamic> json) {
  return _WorkLogHiveModel.fromJson(json);
}

/// @nodoc
mixin _$WorkLogHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get workOrderId => throw _privateConstructorUsedError;
  @HiveField(2)
  int get type => throw _privateConstructorUsedError; // Store as int for enum
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(6)
  double? get latitude => throw _privateConstructorUsedError;
  @HiveField(7)
  double? get longitude => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkLogHiveModelCopyWith<WorkLogHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLogHiveModelCopyWith<$Res> {
  factory $WorkLogHiveModelCopyWith(
          WorkLogHiveModel value, $Res Function(WorkLogHiveModel) then) =
      _$WorkLogHiveModelCopyWithImpl<$Res, WorkLogHiveModel>;
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
class _$WorkLogHiveModelCopyWithImpl<$Res, $Val extends WorkLogHiveModel>
    implements $WorkLogHiveModelCopyWith<$Res> {
  _$WorkLogHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkLogHiveModelImplCopyWith<$Res>
    implements $WorkLogHiveModelCopyWith<$Res> {
  factory _$$WorkLogHiveModelImplCopyWith(_$WorkLogHiveModelImpl value,
          $Res Function(_$WorkLogHiveModelImpl) then) =
      __$$WorkLogHiveModelImplCopyWithImpl<$Res>;
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
class __$$WorkLogHiveModelImplCopyWithImpl<$Res>
    extends _$WorkLogHiveModelCopyWithImpl<$Res, _$WorkLogHiveModelImpl>
    implements _$$WorkLogHiveModelImplCopyWith<$Res> {
  __$$WorkLogHiveModelImplCopyWithImpl(_$WorkLogHiveModelImpl _value,
      $Res Function(_$WorkLogHiveModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$WorkLogHiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workOrderId: null == workOrderId
          ? _value.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkLogHiveModelImpl implements _WorkLogHiveModel {
  const _$WorkLogHiveModelImpl(
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

  factory _$WorkLogHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkLogHiveModelImplFromJson(json);

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

  @override
  String toString() {
    return 'WorkLogHiveModel(id: $id, workOrderId: $workOrderId, type: $type, description: $description, timestamp: $timestamp, notes: $notes, latitude: $latitude, longitude: $longitude, userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLogHiveModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, workOrderId, type,
      description, timestamp, notes, latitude, longitude, userId, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLogHiveModelImplCopyWith<_$WorkLogHiveModelImpl> get copyWith =>
      __$$WorkLogHiveModelImplCopyWithImpl<_$WorkLogHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkLogHiveModelImplToJson(
      this,
    );
  }
}

abstract class _WorkLogHiveModel implements WorkLogHiveModel {
  const factory _WorkLogHiveModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final int workOrderId,
      @HiveField(2) required final int type,
      @HiveField(3) required final String description,
      @HiveField(4) required final DateTime timestamp,
      @HiveField(5) final String? notes,
      @HiveField(6) final double? latitude,
      @HiveField(7) final double? longitude,
      @HiveField(8) final String? userId,
      @HiveField(9) final String? userName}) = _$WorkLogHiveModelImpl;

  factory _WorkLogHiveModel.fromJson(Map<String, dynamic> json) =
      _$WorkLogHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  int get workOrderId;
  @override
  @HiveField(2)
  int get type;
  @override // Store as int for enum
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  DateTime get timestamp;
  @override
  @HiveField(5)
  String? get notes;
  @override
  @HiveField(6)
  double? get latitude;
  @override
  @HiveField(7)
  double? get longitude;
  @override
  @HiveField(8)
  String? get userId;
  @override
  @HiveField(9)
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$WorkLogHiveModelImplCopyWith<_$WorkLogHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
