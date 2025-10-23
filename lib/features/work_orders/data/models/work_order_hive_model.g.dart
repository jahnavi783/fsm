// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkOrderHiveModelAdapter extends TypeAdapter<WorkOrderHiveModel> {
  @override
  final typeId = 1;

  @override
  WorkOrderHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkOrderHiveModel(
      id: (fields[0] as num).toInt(),
      woNumber: fields[1] as String,
      srId: (fields[2] as num).toInt(),
      summary: fields[3] as String,
      problemDescription: fields[4] as String,
      priority: (fields[5] as num).toInt(),
      visitDate: fields[6] as DateTime,
      location: fields[7] as String,
      status: (fields[8] as num).toInt(),
      durationDays: (fields[9] as num).toInt(),
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime,
      startedAt: fields[12] as DateTime?,
      resumedAt: fields[13] as DateTime?,
      completedAt: fields[14] as DateTime?,
      pauseLogs: fields[15] as String?,
      workLog: fields[16] as String?,
      partsUsed: fields[17] == null
          ? []
          : (fields[17] as List).cast<PartUsedHiveModel>(),
      images: fields[18] == null ? [] : (fields[18] as List).cast<String>(),
      customer: fields[19] as CustomerHiveModel?,
      locationDetails: fields[20] as LocationHiveModel?,
      serviceRequest: fields[21] as ServiceRequestHiveModel?,
      workLogs: fields[22] == null
          ? []
          : (fields[22] as List).cast<WorkLogHiveModel>(),
      requiredSkills:
          fields[23] == null ? [] : (fields[23] as List).cast<String>(),
      requiredParts:
          fields[24] == null ? [] : (fields[24] as List).cast<PartHiveModel>(),
      attachments:
          fields[25] == null ? [] : (fields[25] as List).cast<String>(),
      completionNotes: fields[26] as String?,
      cachedAt: fields[27] as DateTime,
      isPendingSync: fields[28] == null ? false : fields[28] as bool,
      pendingAction: fields[29] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkOrderHiveModel obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.woNumber)
      ..writeByte(2)
      ..write(obj.srId)
      ..writeByte(3)
      ..write(obj.summary)
      ..writeByte(4)
      ..write(obj.problemDescription)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.visitDate)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.durationDays)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.startedAt)
      ..writeByte(13)
      ..write(obj.resumedAt)
      ..writeByte(14)
      ..write(obj.completedAt)
      ..writeByte(15)
      ..write(obj.pauseLogs)
      ..writeByte(16)
      ..write(obj.workLog)
      ..writeByte(17)
      ..write(obj.partsUsed)
      ..writeByte(18)
      ..write(obj.images)
      ..writeByte(19)
      ..write(obj.customer)
      ..writeByte(20)
      ..write(obj.locationDetails)
      ..writeByte(21)
      ..write(obj.serviceRequest)
      ..writeByte(22)
      ..write(obj.workLogs)
      ..writeByte(23)
      ..write(obj.requiredSkills)
      ..writeByte(24)
      ..write(obj.requiredParts)
      ..writeByte(25)
      ..write(obj.attachments)
      ..writeByte(26)
      ..write(obj.completionNotes)
      ..writeByte(27)
      ..write(obj.cachedAt)
      ..writeByte(28)
      ..write(obj.isPendingSync)
      ..writeByte(29)
      ..write(obj.pendingAction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkOrderHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PartUsedHiveModelAdapter extends TypeAdapter<PartUsedHiveModel> {
  @override
  final typeId = 2;

  @override
  PartUsedHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartUsedHiveModel(
      partNumber: fields[0] as String,
      quantityUsed: (fields[1] as num).toInt(),
      partName: fields[2] as String?,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PartUsedHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.partNumber)
      ..writeByte(1)
      ..write(obj.quantityUsed)
      ..writeByte(2)
      ..write(obj.partName)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartUsedHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerHiveModelAdapter extends TypeAdapter<CustomerHiveModel> {
  @override
  final typeId = 3;

  @override
  CustomerHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerHiveModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String?,
      address: fields[4] as String?,
      city: fields[5] as String?,
      state: fields[6] as String?,
      postalCode: fields[7] as String?,
      country: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.postalCode)
      ..writeByte(8)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationHiveModelAdapter extends TypeAdapter<LocationHiveModel> {
  @override
  final typeId = 4;

  @override
  LocationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationHiveModel(
      latitude: (fields[0] as num).toDouble(),
      longitude: (fields[1] as num).toDouble(),
      address: fields[2] as String?,
      city: fields[3] as String?,
      state: fields[4] as String?,
      postalCode: fields[5] as String?,
      country: fields[6] as String?,
      landmark: fields[7] as String?,
      accuracy: (fields[8] as num?)?.toDouble(),
      capturedAt: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, LocationHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.postalCode)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.landmark)
      ..writeByte(8)
      ..write(obj.accuracy)
      ..writeByte(9)
      ..write(obj.capturedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ServiceRequestHiveModelAdapter
    extends TypeAdapter<ServiceRequestHiveModel> {
  @override
  final typeId = 5;

  @override
  ServiceRequestHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceRequestHiveModel(
      srNumber: fields[0] as String,
      srType: fields[1] as String,
      priority: fields[2] as String?,
      issueDescription: fields[3] as String?,
      machineSerial: fields[4] as String?,
      model: fields[5] as String?,
      customerName: fields[6] as String?,
      location: fields[7] as String?,
      postalCode: fields[8] as String?,
      underWarranty: fields[9] as String?,
      visitDate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceRequestHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.srNumber)
      ..writeByte(1)
      ..write(obj.srType)
      ..writeByte(2)
      ..write(obj.priority)
      ..writeByte(3)
      ..write(obj.issueDescription)
      ..writeByte(4)
      ..write(obj.machineSerial)
      ..writeByte(5)
      ..write(obj.model)
      ..writeByte(6)
      ..write(obj.customerName)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.postalCode)
      ..writeByte(9)
      ..write(obj.underWarranty)
      ..writeByte(10)
      ..write(obj.visitDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceRequestHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkLogHiveModelAdapter extends TypeAdapter<WorkLogHiveModel> {
  @override
  final typeId = 6;

  @override
  WorkLogHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkLogHiveModel(
      id: (fields[0] as num).toInt(),
      workOrderId: (fields[1] as num).toInt(),
      type: (fields[2] as num).toInt(),
      description: fields[3] as String,
      timestamp: fields[4] as DateTime,
      notes: fields[5] as String?,
      latitude: (fields[6] as num?)?.toDouble(),
      longitude: (fields[7] as num?)?.toDouble(),
      userId: fields[8] as String?,
      userName: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkLogHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.workOrderId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.timestamp)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.latitude)
      ..writeByte(7)
      ..write(obj.longitude)
      ..writeByte(8)
      ..write(obj.userId)
      ..writeByte(9)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkLogHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderHiveModel _$WorkOrderHiveModelFromJson(Map<String, dynamic> json) =>
    _WorkOrderHiveModel(
      id: (json['id'] as num).toInt(),
      woNumber: json['woNumber'] as String,
      srId: (json['srId'] as num).toInt(),
      summary: json['summary'] as String,
      problemDescription: json['problemDescription'] as String,
      priority: (json['priority'] as num).toInt(),
      visitDate: DateTime.parse(json['visitDate'] as String),
      location: json['location'] as String,
      status: (json['status'] as num).toInt(),
      durationDays: (json['durationDays'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      resumedAt: json['resumedAt'] == null
          ? null
          : DateTime.parse(json['resumedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      pauseLogs: json['pauseLogs'] as String?,
      workLog: json['workLog'] as String?,
      partsUsed: (json['partsUsed'] as List<dynamic>?)
              ?.map(
                  (e) => PartUsedHiveModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      customer: json['customer'] == null
          ? null
          : CustomerHiveModel.fromJson(
              json['customer'] as Map<String, dynamic>),
      locationDetails: json['locationDetails'] == null
          ? null
          : LocationHiveModel.fromJson(
              json['locationDetails'] as Map<String, dynamic>),
      serviceRequest: json['serviceRequest'] == null
          ? null
          : ServiceRequestHiveModel.fromJson(
              json['serviceRequest'] as Map<String, dynamic>),
      workLogs: (json['workLogs'] as List<dynamic>?)
              ?.map((e) => WorkLogHiveModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      requiredSkills: (json['requiredSkills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      requiredParts: (json['requiredParts'] as List<dynamic>?)
              ?.map((e) => PartHiveModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      completionNotes: json['completionNotes'] as String?,
      cachedAt: DateTime.parse(json['cachedAt'] as String),
      isPendingSync: json['isPendingSync'] as bool? ?? false,
      pendingAction: json['pendingAction'] as String?,
    );

Map<String, dynamic> _$WorkOrderHiveModelToJson(_WorkOrderHiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'woNumber': instance.woNumber,
      'srId': instance.srId,
      'summary': instance.summary,
      'problemDescription': instance.problemDescription,
      'priority': instance.priority,
      'visitDate': instance.visitDate.toIso8601String(),
      'location': instance.location,
      'status': instance.status,
      'durationDays': instance.durationDays,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'resumedAt': instance.resumedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'pauseLogs': instance.pauseLogs,
      'workLog': instance.workLog,
      'partsUsed': instance.partsUsed,
      'images': instance.images,
      'customer': instance.customer,
      'locationDetails': instance.locationDetails,
      'serviceRequest': instance.serviceRequest,
      'workLogs': instance.workLogs,
      'requiredSkills': instance.requiredSkills,
      'requiredParts': instance.requiredParts,
      'attachments': instance.attachments,
      'completionNotes': instance.completionNotes,
      'cachedAt': instance.cachedAt.toIso8601String(),
      'isPendingSync': instance.isPendingSync,
      'pendingAction': instance.pendingAction,
    };

_PartUsedHiveModel _$PartUsedHiveModelFromJson(Map<String, dynamic> json) =>
    _PartUsedHiveModel(
      partNumber: json['partNumber'] as String,
      quantityUsed: (json['quantityUsed'] as num).toInt(),
      partName: json['partName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PartUsedHiveModelToJson(_PartUsedHiveModel instance) =>
    <String, dynamic>{
      'partNumber': instance.partNumber,
      'quantityUsed': instance.quantityUsed,
      'partName': instance.partName,
      'description': instance.description,
    };

_CustomerHiveModel _$CustomerHiveModelFromJson(Map<String, dynamic> json) =>
    _CustomerHiveModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$CustomerHiveModelToJson(_CustomerHiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };

_LocationHiveModel _$LocationHiveModelFromJson(Map<String, dynamic> json) =>
    _LocationHiveModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      landmark: json['landmark'] as String?,
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      capturedAt: json['capturedAt'] == null
          ? null
          : DateTime.parse(json['capturedAt'] as String),
    );

Map<String, dynamic> _$LocationHiveModelToJson(_LocationHiveModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'landmark': instance.landmark,
      'accuracy': instance.accuracy,
      'capturedAt': instance.capturedAt?.toIso8601String(),
    };

_ServiceRequestHiveModel _$ServiceRequestHiveModelFromJson(
        Map<String, dynamic> json) =>
    _ServiceRequestHiveModel(
      srNumber: json['srNumber'] as String,
      srType: json['srType'] as String,
      priority: json['priority'] as String?,
      issueDescription: json['issueDescription'] as String?,
      machineSerial: json['machineSerial'] as String?,
      model: json['model'] as String?,
      customerName: json['customerName'] as String?,
      location: json['location'] as String?,
      postalCode: json['postalCode'] as String?,
      underWarranty: json['underWarranty'] as String?,
      visitDate: json['visitDate'] == null
          ? null
          : DateTime.parse(json['visitDate'] as String),
    );

Map<String, dynamic> _$ServiceRequestHiveModelToJson(
        _ServiceRequestHiveModel instance) =>
    <String, dynamic>{
      'srNumber': instance.srNumber,
      'srType': instance.srType,
      'priority': instance.priority,
      'issueDescription': instance.issueDescription,
      'machineSerial': instance.machineSerial,
      'model': instance.model,
      'customerName': instance.customerName,
      'location': instance.location,
      'postalCode': instance.postalCode,
      'underWarranty': instance.underWarranty,
      'visitDate': instance.visitDate?.toIso8601String(),
    };

_WorkLogHiveModel _$WorkLogHiveModelFromJson(Map<String, dynamic> json) =>
    _WorkLogHiveModel(
      id: (json['id'] as num).toInt(),
      workOrderId: (json['workOrderId'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      notes: json['notes'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$WorkLogHiveModelToJson(_WorkLogHiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workOrderId': instance.workOrderId,
      'type': instance.type,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'userId': instance.userId,
      'userName': instance.userName,
    };
