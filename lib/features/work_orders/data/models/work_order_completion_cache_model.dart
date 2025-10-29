import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';

part 'work_order_completion_cache_model.freezed.dart';
part 'work_order_completion_cache_model.g.dart';

/// Hive model for caching work order completion form data
/// Allows users to continue filling out the form if interrupted
@freezed
@HiveType(typeId: HiveBoxes.workOrderCompletionCacheTypeId)
abstract class WorkOrderCompletionCacheModel with _$WorkOrderCompletionCacheModel {
  const factory WorkOrderCompletionCacheModel({
    /// Work order ID this cache is for
    @HiveField(0) required int workOrderId,

    /// Current step in the multi-step form (0-2)
    @HiveField(1) @Default(0) int currentStep,

    /// Step 1: Basic Info - Customer name
    @HiveField(2) String? customerName,

    /// Step 1: Basic Info - Work log description
    @HiveField(3) String? workLog,

    /// Step 2: Resources - Parts used
    @HiveField(4) @Default([]) List<CachedPartUsedModel> partsUsed,

    /// Step 2: Resources - Image file paths
    @HiveField(5) @Default([]) List<String> images,

    /// Step 3: Verification - Signature file path
    @HiveField(6) String? signaturePath,

    /// Step 3: Verification - Completion notes
    @HiveField(7) String? completionNotes,

    /// Timestamp when cache was last updated
    @HiveField(8) required DateTime lastUpdated,
  }) = _WorkOrderCompletionCacheModel;

  factory WorkOrderCompletionCacheModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderCompletionCacheModelFromJson(json);
}

/// Model for cached part used information
@freezed
@HiveType(typeId: HiveBoxes.cachedPartUsedTypeId)
abstract class CachedPartUsedModel with _$CachedPartUsedModel {
  const factory CachedPartUsedModel({
    @HiveField(0) required String partNumber,
    @HiveField(1) required int quantity,
    @HiveField(2) required String partName,
    @HiveField(3) required String category,
    @HiveField(4) required int quantityAvailable,
    @HiveField(5) required double unitPrice,
    @HiveField(6) required String status, // Store as string for PartStatus enum
  }) = _CachedPartUsedModel;

  factory CachedPartUsedModel.fromJson(Map<String, dynamic> json) =>
      _$CachedPartUsedModelFromJson(json);
}
