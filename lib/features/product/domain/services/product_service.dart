import 'package:myapp/features/product/domain/entities/product_entity.dart';

abstract class ProductService {
  Future<List<ProductEntity>> getProducts();
  // In the future, you could add:
  // Future<List<ProductEntity>> searchProducts(String query);
}
