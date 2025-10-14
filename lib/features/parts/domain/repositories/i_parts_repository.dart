import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/part_entity.dart';

abstract class IPartsRepository {
  /// Get all parts from inventory
  Future<Either<Failure, List<PartEntity>>> getParts({
    String? category,
    PartStatus? status,
    String? searchQuery,
  });

  /// Check part availability using search query (part number or name)
  Future<Either<Failure, PartEntity>> checkPartAvailability(String query);

  /// Search parts using query
  Future<Either<Failure, List<PartEntity>>> searchParts({
    required String query,
  });

  /// Get parts with low stock levels
  Future<Either<Failure, List<PartEntity>>> getLowStockParts();

  /// Get all available part categories
  Future<Either<Failure, List<String>>> getPartCategories();
}
