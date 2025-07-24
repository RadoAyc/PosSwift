import 'package:myapp/features/product/domain/entities/supplier_entity.dart';
import 'package:myapp/features/product/domain/entities/warehouse_entity.dart';
import 'package:myapp/features/purchase/domain/entities/purchase_item_entity.dart';

class PurchaseInvoiceEntity {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final SupplierEntity supplier;
  final WarehouseEntity warehouse;
  final String status;
  final List<PurchaseItemEntity> items;
  final double subtotal;
  final double? totalTax;
  final double additionalCost;
  final double grandTotal;
  final String? comment;
  final String? attachmentPath;

  const PurchaseInvoiceEntity({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.supplier,
    required this.warehouse,
    required this.status,
    required this.items,
    required this.subtotal,
    this.totalTax,
    required this.additionalCost,
    required this.grandTotal,
    this.comment,
    this.attachmentPath,
  });
}
