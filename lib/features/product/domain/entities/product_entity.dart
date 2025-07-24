import 'package:myapp/features/product/domain/entities/category_entity.dart';
import 'package:myapp/features/product/domain/entities/supplier_entity.dart';
import 'package:myapp/features/product/domain/entities/warehouse_entity.dart';

class ProductEntity {
  final String id;
  final String barcode;
  final String name;
  final String? description;
  final double price;
  final int quantity;
  final CategoryEntity? category;
  final SupplierEntity? supplier;
  final WarehouseEntity? warehouse;
  final String? image;

  ProductEntity({
    required this.id,
    required this.barcode,
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
    this.category,
    this.supplier,
    this.warehouse,
    this.image,
  });
}
