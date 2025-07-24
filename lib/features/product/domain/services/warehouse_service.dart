import 'package:myapp/features/product/domain/entities/warehouse_entity.dart';

abstract class WarehouseService {
  Future<List<WarehouseEntity>> getWarehouses();
}
