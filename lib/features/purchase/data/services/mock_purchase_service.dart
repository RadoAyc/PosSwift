import 'package:myapp/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:myapp/features/purchase/domain/services/purchase_service.dart';

class MockPurchaseService implements PurchaseService {
  @override
  Future<void> addPurchaseInvoice(PurchaseInvoiceEntity invoice) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    print('--- MOCK SAVE ---');
    print('Invoice saved: ${invoice.invoiceNumber}');
    print('Supplier: ${invoice.supplier.name}');
    print('Total Items: ${invoice.items.length}');
    print('Grand Total: ${invoice.grandTotal}');
    print('-----------------');
    // In a real implementation, you would save this to a database or send to an API
  }
}
