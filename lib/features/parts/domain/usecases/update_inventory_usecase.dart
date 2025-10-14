import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/inventory_entity.dart';
import '../repositories/i_parts_repository.dart';

@injectable
class UpdateInventoryUseCase {
  final IPartsRepository _repository;

  UpdateInventoryUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required int partId,
    required int quantityChange,
    required InventoryUpdateType type,
    required String reason,
    String? workOrderId,
    String? notes,
  }) async {
    // Validate inputs
    if (partId <= 0) {
      return const Left(ValidationFailure(
        message: 'Invalid part ID',
      ));
    }

    if (quantityChange == 0) {
      return const Left(ValidationFailure(
        message: 'Quantity change cannot be zero',
      ));
    }

    if (reason.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Reason is required for inventory updates',
      ));
    }

    // For usage and damaged items, quantity should be negative
    if ((type == InventoryUpdateType.usage || 
         type == InventoryUpdateType.damaged || 
         type == InventoryUpdateType.lost) && 
        quantityChange > 0) {
      return const Left(ValidationFailure(
        message: 'Quantity change should be negative for usage, damaged, or lost items',
      ));
    }

    // For restock and returned items, quantity should be positive
    if ((type == InventoryUpdateType.restock || 
         type == InventoryUpdateType.returned) && 
        quantityChange < 0) {
      return const Left(ValidationFailure(
        message: 'Quantity change should be positive for restock or returned items',
      ));
    }

    return await _repository.updateInventory(
      partId: partId,
      quantityChange: quantityChange,
      type: type,
      reason: reason.trim(),
      workOrderId: workOrderId,
      notes: notes?.trim(),
    );
  }
}