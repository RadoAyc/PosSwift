import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

/// This use case handles the logic for creating a new product or updating an existing one.
/// It acts as a bridge between the presentation layer (providers) and the data layer (repository).
class UpsertProductUseCase {
  final ProductRepository _repository;

  UpsertProductUseCase(this._repository);

  /// Executes the upsert operation.
  /// Takes a [ProductEntity] which contains the data from an invoice line item.
  Future<void> call(ProductEntity product) {
    return _repository.upsertProduct(product);
  }
}
