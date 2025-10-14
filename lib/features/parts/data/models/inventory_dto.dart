import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/inventory_entity.dart';
import 'part_dto.dart';

part 'inventory_dto.freezed.dart';
part 'inventory_dto.g.dart';

@freezed
class InventoryDto with _$InventoryDto {
  const factory InventoryDto({
    @JsonKey(name: 'part_id') required int partId,
    @JsonKey(name: 'part_number') required String partNumber,
    required int quantity,
    @JsonKey(name: 'min_quantity') required int minQuantity,
    @JsonKey(name: 'max_quantity') required int maxQuantity,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    required String location,
    String? notes,
  }) = _InventoryDto;

  factory InventoryDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryDtoFromJson(json);
}

@freezed
class InventoryUpdateDto with _$InventoryUpdateDto {
  const factory InventoryUpdateDto({
    @JsonKey(name: 'part_id') required int partId,
    @JsonKey(name: 'quantity_change') required int quantityChange,
    required String type,
    required String reason,
    required String timestamp,
    @JsonKey(name: 'work_order_id') String? workOrderId,
    String? notes,
  }) = _InventoryUpdateDto;

  factory InventoryUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryUpdateDtoFromJson(json);
}

@freezed
class InventoryUpdateRequest with _$InventoryUpdateRequest {
  const factory InventoryUpdateRequest({
    @JsonKey(name: 'quantity_change') required int quantityChange,
    required String type,
    required String reason,
    @JsonKey(name: 'work_order_id') String? workOrderId,
    String? notes,
  }) = _InventoryUpdateRequest;

  factory InventoryUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$InventoryUpdateRequestFromJson(json);
}

@freezed
class PartsResponse with _$PartsResponse {
  const factory PartsResponse({
    required List<PartDto> parts,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _PartsResponse;

  factory PartsResponse.fromJson(Map<String, dynamic> json) =>
      _$PartsResponseFromJson(json);
}

@freezed
class InventoryResponse with _$InventoryResponse {
  const factory InventoryResponse({
    required List<InventoryDto> inventory,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _InventoryResponse;

  factory InventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryResponseFromJson(json);
}

extension InventoryDtoX on InventoryDto {
  InventoryEntity toEntity() {
    return InventoryEntity(
      partId: partId,
      partNumber: partNumber,
      quantity: quantity,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      lastUpdated: DateTime.parse(lastUpdated),
      location: location,
      notes: notes,
    );
  }
}

extension InventoryUpdateDtoX on InventoryUpdateDto {
  InventoryUpdateEntity toEntity() {
    return InventoryUpdateEntity(
      partId: partId,
      quantityChange: quantityChange,
      type: InventoryUpdateType.values.firstWhere(
        (e) => e.name.toLowerCase() == type.toLowerCase(),
        orElse: () => InventoryUpdateType.adjustment,
      ),
      reason: reason,
      timestamp: DateTime.parse(timestamp),
      workOrderId: workOrderId,
      notes: notes,
    );
  }
}