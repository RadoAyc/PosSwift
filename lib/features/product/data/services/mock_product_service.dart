import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/services/product_service.dart';

class MockProductService implements ProductService {
  @override
  Future<List<ProductEntity>> getProducts() async { // CORRECTED method name
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return a list of sample products
    return [
      ProductEntity(id: 1, name: "Premium Grade A Milk (1L)", price: 1.50, quantity: 150),
      ProductEntity(id: 2, name: "Organic Brown Bread", price: 2.20, quantity: 80),
      ProductEntity(id: 3, name: "Fresh Orange Juice (1.5L)", price: 3.00, quantity: 120),
      ProductEntity(id: 4, name: "Cheddar Cheese Block (250g)", price: 4.50, quantity: 200),
      ProductEntity(id: 5, name: "Free-Range Eggs (12-pack)", price: 3.75, quantity: 100),
    ];
  }
}
