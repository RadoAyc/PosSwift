import 'package:drift/drift.dart';
import 'package:myapp/features/product/data/database.dart';
import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase _appDatabase;

  ProductRepositoryImpl(this._appDatabase);

  // Helper to map from the database model to the domain entity
  ProductEntity _mapProductToEntity(Product dbProduct) {
    return ProductEntity(
      id: dbProduct.id,
      name: dbProduct.name,
      price: dbProduct.price,
      quantity: dbProduct.quantity,
      barcodes: dbProduct.barcodes,
      description: dbProduct.description,
      purchasePrice: dbProduct.purchasePrice,
      sellingPrice: dbProduct.sellingPrice,
      alertQuantity: dbProduct.alertQuantity,
    );
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final productsFromDb = await _appDatabase.select(_appDatabase.products).get();
    return productsFromDb.map(_mapProductToEntity).toList();
  }

  @override
  Future<void> addProduct(ProductEntity product) async {
    await upsertProduct(product);
  }

  @override
  Future<void> updateStock({required int productId, required int quantityToAdd, double? newPrice}) async {
    final productToUpdate = await (_appDatabase.select(_appDatabase.products)
          ..where((p) => p.id.equals(productId)))
        .getSingle();

    final updatedQuantity = productToUpdate.quantity + quantityToAdd;
    
    final companion = productToUpdate.copyWith(
      quantity: updatedQuantity,
      price: newPrice ?? productToUpdate.price, 
    );

    await (_appDatabase.update(_appDatabase.products)..where((p) => p.id.equals(productId))).write(companion);
  }

  @override
  Future<void> upsertProduct(ProductEntity productFromInvoice) async {
    try {
      final existingProduct = await (_appDatabase.select(_appDatabase.products)
            ..where((t) => t.name.equals(productFromInvoice.name)))
          .getSingleOrNull();

      if (existingProduct != null) {
        final oldQuantity = existingProduct.quantity;
        final oldPrice = existingProduct.price;
        final newQuantityFromInvoice = productFromInvoice.quantity;
        final newPriceFromInvoice = productFromInvoice.price;

        final updatedQuantity = oldQuantity + newQuantityFromInvoice;
        
        final double newAveragePrice;
        if (updatedQuantity > 0) {
          newAveragePrice = ((oldQuantity * oldPrice) + (newQuantityFromInvoice * newPriceFromInvoice)) / updatedQuantity;
        } else {
          newAveragePrice = newPriceFromInvoice;
        }
        
        final companion = existingProduct.copyWith(
          quantity: updatedQuantity,
          price: newAveragePrice,
        );

        await (_appDatabase.update(_appDatabase.products)..where((t) => t.id.equals(existingProduct.id))).write(companion);

      } else {
        final companion = ProductsCompanion.insert(
          name: productFromInvoice.name,
          price: productFromInvoice.price,
          quantity: productFromInvoice.quantity,
          barcodes: Value(productFromInvoice.barcodes ?? []),
          description: Value(productFromInvoice.description),
          purchasePrice: Value(productFromInvoice.purchasePrice),
          sellingPrice: Value(productFromInvoice.sellingPrice),
          alertQuantity: Value(productFromInvoice.alertQuantity),
        );
        await _appDatabase.into(_appDatabase.products).insert(companion);
      }
    } catch (e) {
      print('Error during upsert operation: $e');
      rethrow;
    }
  }

  @override
  Future<ProductEntity?> findProductByBarcode(String barcode) async {
    // This query finds a product where the provided barcode is present in the 'barcodes' JSON list.
    // The `like` operator with '%' wildcards is a standard way to search within a text field.
    final query = _appDatabase.select(_appDatabase.products)
      ..where((p) => p.barcodes.like('%"$barcode"%'));

    final result = await query.get();

    if (result.isNotEmpty) {
      // It's possible multiple products share a barcode if data integrity isn't enforced.
      // We'll return the first one found.
      return _mapProductToEntity(result.first);
    }
    return null;
  }
}
