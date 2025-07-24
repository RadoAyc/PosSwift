import 'package:myapp/features/product/domain/entities/supplier_entity.dart';
import 'package:myapp/features/product/domain/services/supplier_service.dart';

class MockSupplierService implements SupplierService {
  @override
  Future<List<SupplierEntity>> getSuppliers() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return sample supplier data
    return [
      const SupplierEntity(id: 1, name: 'Supplier A'),
      const SupplierEntity(id: 2, name: 'Supplier B'),
      const SupplierEntity(id: 3, name: 'Supplier C'),
    ];
  }
}