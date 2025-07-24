import 'package:myapp/features/product/domain/entities/supplier_entity.dart';
import 'package:myapp/features/product/domain/services/supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  @override
  Future<List<SupplierEntity>> getSuppliers() async {
    // TODO: Replace with actual data fetching logic (API, database, etc.)
    // Returning a mock list of suppliers
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate network delay
    return [
      SupplierEntity(id: 1, name: 'Supplier A'),
      SupplierEntity(id: 2, name: 'Supplier B'),
      SupplierEntity(id: 3, name: 'Supplier C'),
    ];
  }
}