import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';
import '../repositories/i_parts_repository.dart';

@injectable
class GetLowStockPartsUseCase {
  final IPartsRepository _repository;

  GetLowStockPartsUseCase(this._repository);

  Future<Either<Failure, List<PartEntity>>> call() async {
    return await _repository.getLowStockParts();
  }

  Future<Either<Failure, int>> getLowStockCount() async {
    final result = await _repository.getLowStockParts();
    return result.fold(
      (failure) => Left(failure),
      (parts) => Right(parts.length),
    );
  }

  Future<Either<Failure, List<PartEntity>>> getCriticalStockParts() async {
    final result = await _repository.getLowStockParts();
    return result.fold(
      (failure) => Left(failure),
      (parts) => Right(
        parts.where((part) => part.isOutOfStock || part.quantityAvailable <= (part.minQuantity * 0.5)).toList(),
      ),
    );
  }
}