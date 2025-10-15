# Hive Models Field Inventory

## Overview

This document provides a detailed field-by-field inventory of all Hive models in the FSM application. This inventory is critical for ensuring data compatibility during the Hive CE migration.

**CRITICAL:** All type IDs and field indices MUST remain unchanged during migration to maintain data compatibility.

## Model Definitions

### 1. WorkOrderHiveModel (Type ID: 1)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 1)
class WorkOrderHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String woNumber,
  @HiveField(2) required int srId,
  @HiveField(3) required String summary,
  @HiveField(4) required String problemDescription,
  @HiveField(5) required int priority, // Store as int for enum
  @HiveField(6) required DateTime visitDate,
  @HiveField(7) required String location,
  @HiveField(8) required int status, // Store as int for enum
  @HiveField(9) required int durationDays,
  @HiveField(10) required DateTime createdAt,
  @HiveField(11) required DateTime updatedAt,
  @HiveField(12) DateTime? startedAt,
  @HiveField(13) DateTime? resumedAt,
  @HiveField(14) DateTime? completedAt,
  @HiveField(15) String? pauseLogs,
  @HiveField(16) String? workLog,
  @HiveField(17) @Default([]) List<PartUsedHiveModel> partsUsed,
  @HiveField(18) @Default([]) List<String> images,
  @HiveField(19) CustomerHiveModel? customer,
  @HiveField(20) LocationHiveModel? locationDetails,
  @HiveField(21) ServiceRequestHiveModel? serviceRequest,
  @HiveField(22) @Default([]) List<WorkLogHiveModel> workLogs,
  @HiveField(23) @Default([]) List<String> requiredSkills,
  @HiveField(24) @Default([]) List<PartHiveModel> requiredParts,
  @HiveField(25) @Default([]) List<String> attachments,
  @HiveField(26) String? completionNotes,
  @HiveField(27) required DateTime cachedAt,
  @HiveField(28) @Default(false) bool isPendingSync,
  @HiveField(29) String? pendingAction,
}
```

**Dependencies:** PartUsedHiveModel, CustomerHiveModel, LocationHiveModel, ServiceRequestHiveModel, WorkLogHiveModel, PartHiveModel

### 2. PartUsedHiveModel (Type ID: 2)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 2)
class PartUsedHiveModel {
  @HiveField(0) required String partNumber,
  @HiveField(1) required int quantityUsed,
  @HiveField(2) String? partName,
  @HiveField(3) String? description,
}
```

### 3. CustomerHiveModel (Type ID: 3)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 3)
class CustomerHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String name,
  @HiveField(2) required String email,
  @HiveField(3) String? phone,
  @HiveField(4) String? address,
  @HiveField(5) String? city,
  @HiveField(6) String? state,
  @HiveField(7) String? postalCode,
  @HiveField(8) String? country,
}
```

### 4. LocationHiveModel (Type ID: 4)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 4)
class LocationHiveModel {
  @HiveField(0) required double latitude,
  @HiveField(1) required double longitude,
  @HiveField(2) String? address,
  @HiveField(3) String? city,
  @HiveField(4) String? state,
  @HiveField(5) String? postalCode,
  @HiveField(6) String? country,
  @HiveField(7) String? landmark,
  @HiveField(8) double? accuracy,
  @HiveField(9) DateTime? capturedAt,
}
```

### 5. ServiceRequestHiveModel (Type ID: 5)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 5)
class ServiceRequestHiveModel {
  @HiveField(0) required String srNumber,
  @HiveField(1) required String srType,
  @HiveField(2) String? priority,
  @HiveField(3) String? issueDescription,
  @HiveField(4) String? machineSerial,
  @HiveField(5) String? model,
  @HiveField(6) String? customerName,
  @HiveField(7) String? location,
  @HiveField(8) String? postalCode,
  @HiveField(9) String? underWarranty,
  @HiveField(10) DateTime? visitDate,
}
```

### 6. WorkLogHiveModel (Type ID: 6)

**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 6)
class WorkLogHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required int workOrderId,
  @HiveField(2) required int type, // Store as int for enum
  @HiveField(3) required String description,
  @HiveField(4) required DateTime timestamp,
  @HiveField(5) String? notes,
  @HiveField(6) double? latitude,
  @HiveField(7) double? longitude,
  @HiveField(8) String? userId,
  @HiveField(9) String? userName,
}
```

### 7. PartHiveModel (Type ID: 7) - DUPLICATE DEFINITIONS FOUND

#### Definition A (Parts Feature)
**File:** `lib/features/parts/data/models/part_hive_model.dart`

```dart
@HiveType(typeId: 7)
class PartHiveModel {
  @HiveField(0) required String partNumber,
  @HiveField(1) required String partName,
  @HiveField(2) required String category,
  @HiveField(3) required int quantityAvailable,
  @HiveField(4) required double unitPrice,
  @HiveField(5) required int status, // Store as int for enum
  @HiveField(6) required DateTime cachedAt,
}
```

#### Definition B (Work Orders Feature)
**File:** `lib/features/work_orders/data/models/work_order_hive_model.dart`

```dart
@HiveType(typeId: 7)
class PartHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String partNumber,
  @HiveField(2) required String name,
  @HiveField(3) required String description,
  @HiveField(4) required String category,
  @HiveField(5) required double price,
  @HiveField(6) required int stockQuantity,
  @HiveField(7) required String unit,
  @HiveField(8) @Default([]) List<String> compatibleModels,
  @HiveField(9) String? imageUrl,
  @HiveField(10) String? specifications,
}
```

**⚠️ CRITICAL ISSUE:** Two different models with the same type ID (7) and different field structures. This MUST be resolved before migration.

### 8. DocumentHiveModel (Type ID: 8)

**File:** `lib/features/documents/data/models/document_dto.dart`

```dart
@HiveType(typeId: 8)
class DocumentHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String title,
  @HiveField(2) required String description,
  @HiveField(3) required String fileUrl,
  @HiveField(4) required String fileType,
  @HiveField(5) required int fileSize,
  @HiveField(6) required String category,
  @HiveField(7) String? relatedModel,
  @HiveField(8) String? keywords,
  @HiveField(9) int? uploadedBy,
  @HiveField(10) required DateTime createdAt,
  @HiveField(11) required DateTime updatedAt,
  @HiveField(12) @Default([]) List<String> tags,
  @HiveField(13) @Default([]) List<String> categories,
  @HiveField(14) required DateTime cachedAt,
  @HiveField(15) bool? isDownloaded,
  @HiveField(16) String? localPath,
}
```

### 9. CalendarEventHiveModel (Type ID: 9)

**File:** `lib/features/calendar/data/models/calendar_event_hive_model.dart`

```dart
@HiveType(typeId: 9)
class CalendarEventHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String title,
  @HiveField(2) required DateTime startTime,
  @HiveField(3) required DateTime endTime,
  @HiveField(4) required int type, // Store as int for enum
  @HiveField(5) required String description,
  @HiveField(6) int? workOrderId,
  @HiveField(7) String? location,
  @HiveField(8) @Default(false) bool isAllDay,
  @HiveField(9) String? color,
  @HiveField(10) Map<String, dynamic>? metadata,
  @HiveField(11) required DateTime cachedAt,
  @HiveField(12) @Default(false) bool isPendingSync,
  @HiveField(13) String? pendingAction,
}
```

### 10. ProfileHiveModel (Type ID: 10)

**File:** `lib/features/profile/data/models/profile_hive_model.dart`

```dart
@HiveType(typeId: 10)
class ProfileHiveModel {
  @HiveField(0) required int id,
  @HiveField(1) required String firstName,
  @HiveField(2) required String lastName,
  @HiveField(3) required String email,
  @HiveField(4) String? phone,
  @HiveField(5) String? role,
  @HiveField(6) String? city,
  @HiveField(7) DateTime? dob,
  @HiveField(8) String? profileImageUrl,
  @HiveField(9) required ProfilePreferencesHiveModel preferences,
  @HiveField(10) required DateTime cachedAt,
}
```

**Dependencies:** ProfilePreferencesHiveModel

### 11. ProfilePreferencesHiveModel (Type ID: 11)

**File:** `lib/features/profile/data/models/profile_hive_model.dart`

```dart
@HiveType(typeId: 11)
class ProfilePreferencesHiveModel {
  @HiveField(0) @Default(true) bool notificationsEnabled,
  @HiveField(1) @Default(true) bool pushNotificationsEnabled,
  @HiveField(2) @Default(true) bool emailNotificationsEnabled,
  @HiveField(3) @Default(true) bool locationTrackingEnabled,
  @HiveField(4) @Default('en') String language,
  @HiveField(5) @Default(false) bool darkModeEnabled,
  @HiveField(6) @Default(true) bool offlineSyncEnabled,
  @HiveField(7) @Default(30) int syncIntervalMinutes,
  @HiveField(8) @Default(true) bool autoLogoutEnabled,
  @HiveField(9) @Default(60) int autoLogoutMinutes,
}
```

## Reserved Type IDs

### Type ID 0: UserEntity
- **Status:** Reserved but not implemented
- **Purpose:** User authentication entity
- **File:** Not created yet

### Type ID 12: WorkOrderPartEntity
- **Status:** Reserved but not implemented
- **Purpose:** Work order part relationship
- **File:** Not created yet

## Model Dependencies Graph

```
WorkOrderHiveModel (1)
├── PartUsedHiveModel (2)
├── CustomerHiveModel (3)
├── LocationHiveModel (4)
├── ServiceRequestHiveModel (5)
├── WorkLogHiveModel (6)
└── PartHiveModel (7) ⚠️ CONFLICT

ProfileHiveModel (10)
└── ProfilePreferencesHiveModel (11)

DocumentHiveModel (8) - Independent
CalendarEventHiveModel (9) - Independent
```

## Critical Issues Requiring Resolution

### 1. PartHiveModel Conflict (Type ID: 7)

**Problem:** Two different models with the same type ID but different field structures.

**Impact:** 
- Data corruption during migration
- Adapter registration conflicts
- Serialization/deserialization errors

**Resolution Required:**
1. Determine which definition is the authoritative one
2. Assign a new type ID to the conflicting model
3. Update all references and dependencies
4. Migrate existing data if necessary

### 2. Missing Adapter Registration

**Problem:** HiveService doesn't register any adapters despite having model definitions.

**Impact:**
- Models cannot be serialized/deserialized
- Runtime errors when accessing typed boxes
- Data cannot be stored or retrieved

**Resolution Required:**
1. Complete adapter registration in HiveService._registerAdapters()
2. Register adapters in dependency order
3. Test adapter functionality

## Migration Checklist

### Pre-Migration Validation
- [ ] Resolve PartHiveModel type ID conflict
- [ ] Verify all field indices are sequential and unique within each model
- [ ] Confirm all dependencies are properly defined
- [ ] Test current adapter registration (if any)

### Migration Compatibility
- [ ] Preserve all type IDs (0-12)
- [ ] Preserve all field indices within each model
- [ ] Maintain field data types
- [ ] Keep model dependencies intact

### Post-Migration Validation
- [ ] Verify all models can be serialized/deserialized
- [ ] Test data integrity with existing stored data
- [ ] Confirm adapter registration works correctly
- [ ] Validate cross-model relationships

## Recommended Migration Order

1. **Independent Models First:**
   - CustomerHiveModel (3)
   - LocationHiveModel (4)
   - ServiceRequestHiveModel (5)
   - ProfilePreferencesHiveModel (11)

2. **Simple Dependent Models:**
   - PartUsedHiveModel (2)
   - WorkLogHiveModel (6)
   - DocumentHiveModel (8)
   - CalendarEventHiveModel (9)

3. **Resolve Conflicts:**
   - Fix PartHiveModel conflict (7)

4. **Complex Models Last:**
   - ProfileHiveModel (10) - depends on ProfilePreferencesHiveModel
   - WorkOrderHiveModel (1) - depends on multiple models

---

**Document Version:** 1.0  
**Last Updated:** $(date)  
**Critical Action Required:** Resolve PartHiveModel type ID conflict before proceeding with migration