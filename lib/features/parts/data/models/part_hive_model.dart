import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/part_entity.dart';

part 'part_hive_model.freezed.dart';
part 'part_hive_model.g.dart';

@freezed
@HiveType(typeId: 4)
class PartHiveModel with _$PartHiveModel {
  const factory PartHiveModel({
    @HiveField(0) required String partNumber,
    @HiveField(1) required String partName,
    @HiveField(2) required String category,
    @HiveField(3) required int quantityAvailable,
    @HiveField(4) required double unitPrice,
    @HiveField(5) required int status, // Store as int for enum
    @HiveField(6) required DateTime cachedAt,
  }) = _PartHiveModel;

  factory PartHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartHiveModelFromJson(json);
}

extension PartHiveModelX on PartHiveModel {
  PartEntity toEntity() {
    return PartEntity(
      partNumber: partNumber,
      partName: partName,
      category: category,
      quantityAvailable: quantityAvailable,
      unitPrice: unitPrice,
      status: PartStatus.values[status],
    );
  }

  static PartHiveModel fromEntity(PartEntity entity) {
    return PartHiveModel(
      partNumber: entity.partNumber,
      partName: entity.partName,
      category: entity.category,
      quantityAvailable: entity.quantityAvailable,
      unitPrice: entity.unitPrice,
      status: entity.status.index,
      cachedAt: DateTime.now(),
    );
  }
}
