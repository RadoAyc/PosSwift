import 'package:myapp/features/product/domain/entities/warehouse_entity.dart';
import 'package:myapp/features/product/domain/services/warehouse_service.dart';

class WarehouseServiceImpl implements WarehouseService {
  @override
  Future<List<WarehouseEntity>> getWarehouses() async {
    // Mock data
    return Future.value([
      WarehouseEntity(id: 1, name: 'Main Warehouse'),
      WarehouseEntity(id: 2, name: 'Branch A Warehouse'),
      WarehouseEntity(id: 3, name: 'Online Fulfillment Center'),
    ]);
  }
}