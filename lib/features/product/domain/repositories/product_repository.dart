import 'package:myapp/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity product);
  Future<List<ProductEntity>> getProducts();
  Future<void> updateStock({required int productId, required int quantityToAdd, double? newPrice}); // CORRECTED: added 'required'
  Future<void> upsertProduct(ProductEntity product);
  Future<ProductEntity?> findProductByBarcode(String barcode);
}
