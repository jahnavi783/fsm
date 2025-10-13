import 'package:fsm_flutter/data/entity/spare_part.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_response.g.dart';

@JsonSerializable()
class InventoryResponse {
  final List<SparePartEntity> parts;

  InventoryResponse({required this.parts});

  factory InventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryResponseToJson(this);
}
