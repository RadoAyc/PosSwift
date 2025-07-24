import 'package:flutter/material.dart';
import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/purchase/presentation/providers/purchase_form_provider.dart';

class PurchaseProductRow extends StatelessWidget {
  final PurchaseProductRowProvider productRow;
  final VoidCallback onRemove;
  final ValueChanged<ProductEntity?> onProductSelected;
  final ValueChanged<String> onBarcodeScanned;

  const PurchaseProductRow({
    super.key,
    required this.productRow,
    required this.onRemove,
    required this.onProductSelected,
    required this.onBarcodeScanned,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Barcode'),
            onChanged: onBarcodeScanned,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<ProductEntity>(
            value: productRow.selectedProduct,
            items: [], // This should be populated with a list of products
            onChanged: onProductSelected,
            decoration: const InputDecoration(labelText: 'Product'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: productRow.quantityController,
            decoration: const InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: productRow.priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ],
    );
  }
}
