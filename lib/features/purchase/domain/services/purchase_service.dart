import 'package:myapp/features/purchase/domain/entities/purchase_invoice_entity.dart';

abstract class PurchaseService {
  Future<void> addPurchaseInvoice(PurchaseInvoiceEntity invoice);
}
