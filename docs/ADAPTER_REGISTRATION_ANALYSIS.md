# Hive Adapter Registration Analysis

## Current State Analysis

### HiveService Adapter Registration Status

**File:** `lib/core/storage/hive_service.dart`

**Current Implementation:**
```dart
void _registerAdapters() {
  // TODO: Register Work Orders adapters when Hive models are implemented
  // Work Orders adapters
  // if (!Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId)) {
  //   Hive.registerAdapter(WorkOrderHiveModelAdapter());
  // }

  // TODO: Add other feature adapters when available
  // Documents, Parts, Calendar, Profile adapters will be added here
}
```

**Status:** ❌ NO ADAPTERS ARE CURRENTLY REGISTERED

## Required Adapter Registrations

### Complete Adapter Registration Implementation

```dart
void _registerAdapters() {
  // Register adapters in dependency order to avoid conflicts
  
  // Independent models first
  if (!Hive.isAdapterRegistered(HiveBoxes.customerEntityTypeId)) {
    Hive.registerAdapter(CustomerHiveModelAdapter());
  }
  
  if (!Hive.isAdapterRegistered(HiveBoxes.locationEntityTypeId)) {
    Hive.registerAdapter(LocationHiveModelAdapter());
  }
  
  if (!Hive.isAdapterRegistered(HiveBoxes.serviceRequestEntityTypeId)) {
    Hive.registerAdapter(ServiceRequestHiveModelAdapter());
  }
  
  if (!Hive.isAdapterRegistered(HiveBoxes.partUsedEntityTypeId)) {
    Hive.registerAdapter(PartUsedHiveModelAdapter());
  }
  
  if (!Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId)) {
    Hive.registerAdapter(WorkLogHiveModelAdapter());
  }
  
  // Profile preferences (independent)
  if (!Hive.isAdapterRegistered(HiveBoxes.profilePreferencesEntityTypeId)) {
    Hive.registerAdapter(ProfilePreferencesHiveModelAdapter());
  }
  
  // Document model (independent)
  if (!Hive.isAdapterRegistered(HiveBoxes.documentEntityTypeId)) {
    Hive.registerAdapter(DocumentHiveModelAdapter());
  }
  
  // Calendar model (independent)
  if (!Hive.isAdapterRegistered(HiveBoxes.calendarEventEntityTypeId)) {
    Hive.registerAdapter(CalendarEventHiveModelAdapter());
  }
  
  // Part model (CONFLICT - needs resolution)
  if (!Hive.isAdapterRegistered(HiveBoxes.partEntityTypeId)) {
    Hive.registerAdapter(PartHiveModelAdapter());
  }
  
  // Profile model (depends on ProfilePreferencesHiveModel)
  if (!Hive.isAdapterRegistered(HiveBoxes.profileEntityTypeId)) {
    Hive.registerAdapter(ProfileHiveModelAdapter());
  }
  
  // Work order model (depends on multiple models - register last)
  if (!Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId)) {
    Hive.registerAdapter(WorkOrderHiveModelAdapter());
  }
}
```

## Adapter Generation Status

### Generated Adapter Files (.g.dart)

Based on the model files, the following adapter files should be generated:

1. **work_order_hive_model.g.dart**
   - WorkOrderHiveModelAdapter
   - PartUsedHiveModelAdapter
   - CustomerHiveModelAdapter
   - LocationHiveModelAdapter
   - ServiceRequestHiveModelAdapter
   - WorkLogHiveModelAdapter
   - PartHiveModelAdapter (Version B)

2. **part_hive_model.g.dart**
   - PartHiveModelAdapter (Version A) ⚠️ CONFLICT

3. **document_dto.g.dart**
   - DocumentHiveModelAdapter

4. **calendar_event_hive_model.g.dart**
   - CalendarEventHiveModelAdapter

5. **profile_hive_model.g.dart**
   - ProfileHiveModelAdapter
   - ProfilePreferencesHiveModelAdapter

### Current Generation Status

To check if adapters are currently generated, we need to verify the existence of .g.dart files:

```bash
# Check for generated files
find lib -name "*.g.dart" -type f
```

## Import Requirements for Adapter Registration

### Required Imports in HiveService

```dart
// Work Orders models
import '../../features/work_orders/data/models/work_order_hive_model.dart';

// Parts models (after conflict resolution)
import '../../features/parts/data/models/part_hive_model.dart';

// Documents models
import '../../features/documents/data/models/document_dto.dart';

// Calendar models
import '../../features/calendar/data/models/calendar_event_hive_model.dart';

// Profile models
import '../../features/profile/data/models/profile_hive_model.dart';
```

## Dependency Registration Order

### Critical Registration Sequence

The adapters must be registered in the correct order to handle dependencies:

1. **Level 1 - Independent Models:**
   - CustomerHiveModelAdapter (Type ID: 3)
   - LocationHiveModelAdapter (Type ID: 4)
   - ServiceRequestHiveModelAdapter (Type ID: 5)
   - PartUsedHiveModelAdapter (Type ID: 2)
   - WorkLogHiveModelAdapter (Type ID: 6)
   - ProfilePreferencesHiveModelAdapter (Type ID: 11)
   - DocumentHiveModelAdapter (Type ID: 8)
   - CalendarEventHiveModelAdapter (Type ID: 9)

2. **Level 2 - Simple Dependencies:**
   - PartHiveModelAdapter (Type ID: 7) - after conflict resolution
   - ProfileHiveModelAdapter (Type ID: 10) - depends on ProfilePreferencesHiveModel

3. **Level 3 - Complex Dependencies:**
   - WorkOrderHiveModelAdapter (Type ID: 1) - depends on multiple Level 1 models

## Conflict Resolution Required

### PartHiveModel Type ID Conflict

**Current Situation:**
- Two different PartHiveModel definitions both use Type ID: 7
- Different field structures and purposes
- Cannot register both adapters with same type ID

**Resolution Options:**

#### Option 1: Rename Parts Feature Model
```dart
// Change parts feature model to use Type ID 12
@HiveType(typeId: 12) // Was 7
class PartInventoryHiveModel { // Renamed from PartHiveModel
  // Keep existing fields (0-6)
}
```

#### Option 2: Rename Work Orders Feature Model
```dart
// Change work orders feature model to use Type ID 12
@HiveType(typeId: 12) // Was 7
class WorkOrderPartHiveModel { // Renamed from PartHiveModel
  // Keep existing fields (0-10)
}
```

**Recommendation:** Option 1 - Rename the parts feature model since it's simpler and has fewer dependencies.

## Testing Adapter Registration

### Validation Script

```dart
// test/core/storage/adapter_registration_test.dart
void main() {
  group('Adapter Registration Tests', () {
    setUpAll(() async {
      await TestHelpers.setupTestEnvironment();
    });

    test('should register all required adapters', () async {
      // Initialize HiveService
      final hiveService = await HiveService.create();
      
      // Verify all adapters are registered
      expect(Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.partUsedEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.customerEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.locationEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.serviceRequestEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.partEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.documentEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.calendarEventEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.profileEntityTypeId), isTrue);
      expect(Hive.isAdapterRegistered(HiveBoxes.profilePreferencesEntityTypeId), isTrue);
    });

    test('should handle duplicate registration gracefully', () async {
      // Test that registering adapters multiple times doesn't cause issues
      final hiveService1 = await HiveService.create();
      final hiveService2 = await HiveService.create();
      
      // Should not throw exceptions
      expect(() => hiveService1, returnsNormally);
      expect(() => hiveService2, returnsNormally);
    });
  });
}
```

## Migration Impact Assessment

### Current State Impact
- **Severity:** HIGH
- **Risk:** Data cannot be stored or retrieved for complex models
- **Affected Features:** Work Orders, Documents, Calendar, Profile, Parts

### Post-Registration Impact
- **Benefit:** All models can be properly serialized/deserialized
- **Risk Mitigation:** Proper error handling for adapter conflicts
- **Performance:** Improved storage operations

## Action Items for Migration

### Immediate Actions Required
1. **Resolve PartHiveModel conflict** - Assign new type ID to one of the models
2. **Generate all adapter files** - Run `dart run build_runner build`
3. **Complete adapter registration** - Update HiveService._registerAdapters()
4. **Add required imports** - Import all model files in HiveService
5. **Test adapter functionality** - Create comprehensive tests

### Pre-Migration Checklist
- [ ] PartHiveModel conflict resolved
- [ ] All .g.dart files generated successfully
- [ ] All adapters registered in correct order
- [ ] Adapter registration tests pass
- [ ] No type ID conflicts remain

### Migration Validation
- [ ] All existing data can be read after migration
- [ ] New data can be written with Hive CE
- [ ] Cross-model relationships work correctly
- [ ] Performance is maintained or improved

---

**Analysis Date:** $(date)  
**Critical Priority:** Resolve PartHiveModel conflict and complete adapter registration before Hive CE migration