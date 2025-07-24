import 'package:myapp/features/product/domain/entities/warehouse_entity.dart';
import 'package:myapp/features/product/domain/services/warehouse_service.dart';

class MockWarehouseService implements WarehouseService {
  @override
  Future<List<WarehouseEntity>> getWarehouses() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return [
       WarehouseEntity(id: 1, name: 'Main Warehouse'),
       WarehouseEntity(id: 2, name: 'Warehouse B'),
       WarehouseEntity(id: 3, name: 'Warehouse C'),
    ];
  }
}