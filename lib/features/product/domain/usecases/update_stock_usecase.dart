
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

class UpdateStockUseCase {
  final ProductRepository _repository;

  UpdateStockUseCase(this._repository);

  Future<void> call({required int productId, required int quantityToAdd}) {
    return _repository.updateStock(productId: productId, quantityToAdd: quantityToAdd);
  }
}
