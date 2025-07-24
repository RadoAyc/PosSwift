import 'package:myapp/features/product/domain/entities/supplier_entity.dart';

abstract class SupplierService {
  Future<List<SupplierEntity>> getSuppliers();
}
