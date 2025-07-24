import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}