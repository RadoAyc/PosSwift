import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository productRepository;

  AddProductUseCase(this.productRepository) {
    print('[AddProductUseCase] Constructor called');
  }

  Future<void> call(ProductEntity product) async {
    print('[AddProductUseCase] call() called');
    await productRepository.addProduct(product);
  }
}