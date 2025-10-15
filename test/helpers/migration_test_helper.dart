import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../lib/core/constants/hive_boxes.dart';

/// Migration test helper class for data backup and validation during Hive CE migration
class MigrationTestHelper {
  static const String _backupDirectory = 'hive_migration_backup';
  static const String _backupFileName = 'hive_data_backup.json';
  static const String _metadataFileName = 'migration_metadata.json';

  /// Creates a complete backup of all existing Hive data before migration
  static Future<MigrationBackup> createPreMigrationBackup() async {
    final backup = MigrationBackup();

    try {
      // Backup all box data
      backup.boxData = await _backupAllBoxData();

      // Backup adapter registry information
      backup.adapterInfo = await _backupAdapterInfo();

      // Create metadata
      backup.metadata = MigrationMetadata(
        backupTimestamp: DateTime.now(),
        hiveVersion: await _getHiveVersion(),
        totalBoxes: backup.boxData.length,
        totalRecords: backup.boxData.values
            .map((box) => box.length)
            .fold(0, (sum, count) => sum + count),
      );

      // Save backup to file
      await _saveBackupToFile(backup);

      print('✅ Pre-migration backup created successfully');
      print(
          '📊 Backed up ${backup.metadata.totalBoxes} boxes with ${backup.metadata.totalRecords} total records');

      return backup;
    } catch (e) {
      print('❌ Failed to create pre-migration backup: $e');
      rethrow;
    }
  }

  /// Validates data integrity after migration by comparing with backup
  static Future<ValidationResult> validatePostMigrationData(
    MigrationBackup originalBackup,
  ) async {
    final result = ValidationResult();

    try {
      print('🔍 Starting post-migration data validation...');

      // Get current data state
      final currentData = await _backupAllBoxData();

      // Compare box counts
      result.boxCountMatch =
          originalBackup.boxData.length == currentData.length;

      // Validate each box
      for (final boxName in originalBackup.boxData.keys) {
        final boxValidation = await _validateBoxData(
          boxName,
          originalBackup.boxData[boxName]!,
          currentData[boxName] ?? [],
        );
        result.boxValidations[boxName] = boxValidation;
      }

      // Calculate overall success
      result.isValid = result.boxCountMatch &&
          result.boxValidations.values.every((v) => v.isValid);

      // Generate validation report
      result.validationReport = _generateValidationReport(result);

      if (result.isValid) {
        print('✅ Post-migration validation passed');
      } else {
        print('❌ Post-migration validation failed');
        print(result.validationReport);
      }

      return result;
    } catch (e) {
      result.isValid = false;
      result.validationReport = 'Validation failed with error: $e';
      print('❌ Validation error: $e');
      return result;
    }
  }

  /// Creates a snapshot of current data state for comparison
  static Future<DataSnapshot> createDataSnapshot() async {
    final snapshot = DataSnapshot();

    try {
      snapshot.timestamp = DateTime.now();
      snapshot.boxData = await _backupAllBoxData();
      snapshot.adapterInfo = await _backupAdapterInfo();

      // Calculate checksums for integrity verification
      snapshot.checksums = {};
      for (final entry in snapshot.boxData.entries) {
        snapshot.checksums[entry.key] = _calculateChecksum(entry.value);
      }

      return snapshot;
    } catch (e) {
      print('❌ Failed to create data snapshot: $e');
      rethrow;
    }
  }

  /// Implements rollback procedures for failed migrations
  static Future<RollbackResult> performRollback(
    MigrationBackup backup,
  ) async {
    final result = RollbackResult();

    try {
      print('🔄 Starting rollback procedure...');

      // Close all current boxes
      await _closeAllBoxes();

      // Clear current data directory
      await _clearHiveData();

      // Restore data from backup
      result.restoredBoxes = await _restoreFromBackup(backup);

      // Verify restoration
      final verificationSnapshot = await createDataSnapshot();
      result.verificationPassed =
          await _verifyRollback(backup, verificationSnapshot);

      result.isSuccessful = result.verificationPassed;
      result.message = result.isSuccessful
          ? 'Rollback completed successfully'
          : 'Rollback completed but verification failed';

      print(
          result.isSuccessful ? '✅ ${result.message}' : '❌ ${result.message}');

      return result;
    } catch (e) {
      result.isSuccessful = false;
      result.message = 'Rollback failed: $e';
      print('❌ Rollback error: $e');
      return result;
    }
  }

  /// Checks data integrity of specific box
  static Future<BoxValidation> validateBoxIntegrity(String boxName) async {
    final validation = BoxValidation();
    validation.boxName = boxName;

    try {
      if (!Hive.isBoxOpen(boxName)) {
        validation.isValid = false;
        validation.errors.add('Box $boxName is not open');
        return validation;
      }

      final box = Hive.box(boxName);
      validation.recordCount = box.length;

      // Try to read all records to check for corruption
      for (int i = 0; i < box.length; i++) {
        try {
          final value = box.getAt(i);
          if (value == null) {
            validation.errors.add('Null value found at index $i');
          }
        } catch (e) {
          validation.errors.add('Failed to read record at index $i: $e');
        }
      }

      validation.isValid = validation.errors.isEmpty;

      return validation;
    } catch (e) {
      validation.isValid = false;
      validation.errors.add('Box validation failed: $e');
      return validation;
    }
  }

  /// Verifies all registered adapters are working correctly
  static Future<AdapterValidation> validateAdapters() async {
    final validation = AdapterValidation();

    try {
      // Check all expected adapters are registered
      final expectedTypeIds = [
        HiveBoxes.userEntityTypeId,
        HiveBoxes.workOrderEntityTypeId,
        HiveBoxes.partUsedEntityTypeId,
        HiveBoxes.customerEntityTypeId,
        HiveBoxes.locationEntityTypeId,
        HiveBoxes.serviceRequestEntityTypeId,
        HiveBoxes.workLogEntityTypeId,
        HiveBoxes.partEntityTypeId,
        HiveBoxes.documentEntityTypeId,
        HiveBoxes.calendarEventEntityTypeId,
        HiveBoxes.profileEntityTypeId,
        HiveBoxes.profilePreferencesEntityTypeId,
      ];

      for (final typeId in expectedTypeIds) {
        if (Hive.isAdapterRegistered(typeId)) {
          validation.registeredAdapters.add(typeId);
        } else {
          validation.missingAdapters.add(typeId);
        }
      }

      validation.isValid = validation.missingAdapters.isEmpty;

      return validation;
    } catch (e) {
      validation.isValid = false;
      validation.errors.add('Adapter validation failed: $e');
      return validation;
    }
  }

  // Private helper methods

  static Future<Map<String, List<dynamic>>> _backupAllBoxData() async {
    final backup = <String, List<dynamic>>{};

    final boxNames = [
      HiveBoxes.authBox,
      HiveBoxes.workOrders,
      HiveBoxes.documents,
      HiveBoxes.parts,
      HiveBoxes.inventory,
      HiveBoxes.calendarEvents,
      HiveBoxes.calendarBox,
      HiveBoxes.profile,
      HiveBoxes.profilePreferences,
      HiveBoxes.settingsBox,
    ];

    for (final boxName in boxNames) {
      try {
        if (Hive.isBoxOpen(boxName)) {
          final box = Hive.box(boxName);
          backup[boxName] = box.values.toList();
        } else {
          // Try to open the box to check if it exists
          try {
            final box = await Hive.openBox(boxName);
            backup[boxName] = box.values.toList();
          } catch (e) {
            // Box doesn't exist or can't be opened
            backup[boxName] = [];
          }
        }
      } catch (e) {
        print('⚠️ Warning: Could not backup box $boxName: $e');
        backup[boxName] = [];
      }
    }

    return backup;
  }

  static Future<Map<int, String>> _backupAdapterInfo() async {
    final adapterInfo = <int, String>{};

    // Note: Hive doesn't provide a direct way to get registered adapters
    // This is a limitation we'll document
    final knownTypeIds = [
      HiveBoxes.userEntityTypeId,
      HiveBoxes.workOrderEntityTypeId,
      HiveBoxes.partUsedEntityTypeId,
      HiveBoxes.customerEntityTypeId,
      HiveBoxes.locationEntityTypeId,
      HiveBoxes.serviceRequestEntityTypeId,
      HiveBoxes.workLogEntityTypeId,
      HiveBoxes.partEntityTypeId,
      HiveBoxes.documentEntityTypeId,
      HiveBoxes.calendarEventEntityTypeId,
      HiveBoxes.profileEntityTypeId,
      HiveBoxes.profilePreferencesEntityTypeId,
    ];

    for (final typeId in knownTypeIds) {
      if (Hive.isAdapterRegistered(typeId)) {
        adapterInfo[typeId] = 'Registered';
      }
    }

    return adapterInfo;
  }

  static Future<String> _getHiveVersion() async {
    // This would need to be determined from pubspec.yaml or package info
    return '2.2.3'; // Current version from pubspec.yaml
  }

  static Future<void> _saveBackupToFile(MigrationBackup backup) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final backupDir = Directory('${directory.path}/$_backupDirectory');

      if (!await backupDir.exists()) {
        await backupDir.create(recursive: true);
      }

      final backupFile = File('${backupDir.path}/$_backupFileName');
      final metadataFile = File('${backupDir.path}/$_metadataFileName');

      // Save backup data
      await backupFile.writeAsString(jsonEncode(backup.toJson()));

      // Save metadata separately for quick access
      await metadataFile.writeAsString(jsonEncode(backup.metadata.toJson()));

      print('💾 Backup saved to: ${backupFile.path}');
    } catch (e) {
      print('❌ Failed to save backup to file: $e');
      rethrow;
    }
  }

  static Future<BoxValidation> _validateBoxData(
    String boxName,
    List<dynamic> originalData,
    List<dynamic> currentData,
  ) async {
    final validation = BoxValidation();
    validation.boxName = boxName;
    validation.recordCount = currentData.length;

    // Check record count
    if (originalData.length != currentData.length) {
      validation.errors.add(
        'Record count mismatch: expected ${originalData.length}, got ${currentData.length}',
      );
    }

    // Check data integrity (basic comparison)
    try {
      for (int i = 0; i < originalData.length && i < currentData.length; i++) {
        final original = originalData[i];
        final current = currentData[i];

        // Basic type and structure validation
        if (original.runtimeType != current.runtimeType) {
          validation.errors.add(
            'Type mismatch at index $i: expected ${original.runtimeType}, got ${current.runtimeType}',
          );
        }
      }
    } catch (e) {
      validation.errors.add('Data comparison failed: $e');
    }

    validation.isValid = validation.errors.isEmpty;
    return validation;
  }

  static String _generateValidationReport(ValidationResult result) {
    final buffer = StringBuffer();
    buffer.writeln('=== Migration Validation Report ===');
    buffer.writeln('Overall Status: ${result.isValid ? "PASSED" : "FAILED"}');
    buffer.writeln('Box Count Match: ${result.boxCountMatch ? "✅" : "❌"}');
    buffer.writeln();

    buffer.writeln('Box Validations:');
    for (final entry in result.boxValidations.entries) {
      final boxName = entry.key;
      final validation = entry.value;
      buffer.writeln(
          '  $boxName: ${validation.isValid ? "✅" : "❌"} (${validation.recordCount} records)');

      if (validation.errors.isNotEmpty) {
        for (final error in validation.errors) {
          buffer.writeln('    - $error');
        }
      }
    }

    return buffer.toString();
  }

  static String _calculateChecksum(List<dynamic> data) {
    // Simple checksum calculation based on data length and type
    final typeHash = data.map((item) => item.runtimeType.toString()).join('');
    return '${data.length}_${typeHash.hashCode}';
  }

  static Future<void> _closeAllBoxes() async {
    // Close all known boxes
    final boxNames = [
      HiveBoxes.authBox,
      HiveBoxes.workOrders,
      HiveBoxes.documents,
      HiveBoxes.parts,
      HiveBoxes.inventory,
      HiveBoxes.calendarEvents,
      HiveBoxes.calendarBox,
      HiveBoxes.profile,
      HiveBoxes.profilePreferences,
      HiveBoxes.settingsBox,
    ];

    for (final boxName in boxNames) {
      try {
        if (Hive.isBoxOpen(boxName)) {
          await Hive.box(boxName).close();
        }
      } catch (e) {
        print('⚠️ Warning: Could not close box $boxName: $e');
      }
    }
  }

  static Future<void> _clearHiveData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final hiveDir = Directory('${directory.path}/hive');

      if (await hiveDir.exists()) {
        await hiveDir.delete(recursive: true);
      }
    } catch (e) {
      print('⚠️ Warning: Could not clear Hive data directory: $e');
    }
  }

  static Future<List<String>> _restoreFromBackup(MigrationBackup backup) async {
    final restoredBoxes = <String>[];

    // This is a simplified restoration - in practice, this would need
    // to handle the specific data types and adapter registration
    for (final entry in backup.boxData.entries) {
      try {
        final boxName = entry.key;
        final data = entry.value;

        final box = await Hive.openBox(boxName);
        await box.clear();

        for (int i = 0; i < data.length; i++) {
          await box.add(data[i]);
        }

        restoredBoxes.add(boxName);
      } catch (e) {
        print('⚠️ Warning: Could not restore box ${entry.key}: $e');
      }
    }

    return restoredBoxes;
  }

  static Future<bool> _verifyRollback(
    MigrationBackup backup,
    DataSnapshot currentSnapshot,
  ) async {
    try {
      // Compare checksums
      for (final entry in backup.boxData.entries) {
        final boxName = entry.key;
        final originalChecksum = _calculateChecksum(entry.value);
        final currentData = currentSnapshot.boxData[boxName] ?? [];
        final currentChecksum = _calculateChecksum(currentData);

        if (originalChecksum != currentChecksum) {
          print('❌ Checksum mismatch for box $boxName');
          return false;
        }
      }

      return true;
    } catch (e) {
      print('❌ Rollback verification failed: $e');
      return false;
    }
  }
}

// Data classes for migration testing

class MigrationBackup {
  late Map<String, List<dynamic>> boxData;
  late Map<int, String> adapterInfo;
  late MigrationMetadata metadata;

  Map<String, dynamic> toJson() => {
        'boxData': boxData,
        'adapterInfo': adapterInfo.map((k, v) => MapEntry(k.toString(), v)),
        'metadata': metadata.toJson(),
      };

  factory MigrationBackup.fromJson(Map<String, dynamic> json) {
    final backup = MigrationBackup();
    backup.boxData = Map<String, List<dynamic>>.from(json['boxData']);
    backup.adapterInfo = (json['adapterInfo'] as Map<String, dynamic>)
        .map((k, v) => MapEntry(int.parse(k), v.toString()));
    backup.metadata = MigrationMetadata.fromJson(json['metadata']);
    return backup;
  }
}

class MigrationMetadata {
  final DateTime backupTimestamp;
  final String hiveVersion;
  final int totalBoxes;
  final int totalRecords;

  MigrationMetadata({
    required this.backupTimestamp,
    required this.hiveVersion,
    required this.totalBoxes,
    required this.totalRecords,
  });

  Map<String, dynamic> toJson() => {
        'backupTimestamp': backupTimestamp.toIso8601String(),
        'hiveVersion': hiveVersion,
        'totalBoxes': totalBoxes,
        'totalRecords': totalRecords,
      };

  factory MigrationMetadata.fromJson(Map<String, dynamic> json) {
    return MigrationMetadata(
      backupTimestamp: DateTime.parse(json['backupTimestamp']),
      hiveVersion: json['hiveVersion'],
      totalBoxes: json['totalBoxes'],
      totalRecords: json['totalRecords'],
    );
  }
}

class ValidationResult {
  bool isValid = false;
  bool boxCountMatch = false;
  Map<String, BoxValidation> boxValidations = {};
  String validationReport = '';
}

class BoxValidation {
  String boxName = '';
  int recordCount = 0;
  bool isValid = false;
  List<String> errors = [];
}

class DataSnapshot {
  late DateTime timestamp;
  late Map<String, List<dynamic>> boxData;
  late Map<int, String> adapterInfo;
  late Map<String, String> checksums;
}

class RollbackResult {
  bool isSuccessful = false;
  String message = '';
  List<String> restoredBoxes = [];
  bool verificationPassed = false;
}

class AdapterValidation {
  bool isValid = false;
  List<int> registeredAdapters = [];
  List<int> missingAdapters = [];
  List<String> errors = [];
}
