import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';
import '../entities/inventory_entity.dart';

abstract class IPartsRepository {
  Future<Either<Failure, List<PartEntity>>> getParts({
    required int page,
    required int limit,
    String? category,
    PartStatus? status,
    String? searchQuery,
  });

  Future<Either<Failure, PartEntity>> getPartById(int id);

  Future<Either<Failure, List<PartEntity>>> searchParts({
    required String query,
    String? category,
    PartStatus? status,
  });

  Future<Either<Failure, List<PartEntity>>> getLowStockParts();

  Future<Either<Failure, List<String>>> getPartCategories();

  Future<Either<Failure, InventoryEntity>> getInventoryByPartId(int partId);

  Future<Either<Failure, List<InventoryEntity>>> getInventoryList({
    required int page,
    required int limit,
    bool? lowStockOnly,
  });

  Future<Either<Failure, void>> updateInventory({
    required int partId,
    required int quantityChange,
    required InventoryUpdateType type,
    required String reason,
    String? workOrderId,
    String? notes,
  });

  Future<Either<Failure, List<InventoryUpdateEntity>>> getInventoryHistory({
    required int partId,
    required int page,
    required int limit,
  });
}