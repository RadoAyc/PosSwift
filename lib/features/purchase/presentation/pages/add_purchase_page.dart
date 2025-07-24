import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/product/domain/usecases/find_product_by_barcode_usecase.dart';
import 'package:myapp/features/product/domain/usecases/upsert_product_usecase.dart';
import 'package:myapp/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:myapp/features/purchase/domain/services/purchase_service.dart';
import 'package:myapp/features/purchase/presentation/providers/purchase_form_provider.dart';
import 'package:myapp/features/purchase/presentation/widgets/invoice_attachment_picker.dart';
import 'package:myapp/features/purchase/presentation/widgets/purchase_product_row.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddPurchasePage extends StatelessWidget {
  final PurchaseInvoiceEntity? purchase;

  const AddPurchasePage({Key? key, this.purchase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (context) => PurchaseFormProvider(
        GetIt.instance<PurchaseService>(),
        GetIt.instance<UpsertProductUseCase>(),
        GetIt.instance<FindProductByBarcodeUseCase>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.addPurchaseInvoiceTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<PurchaseFormProvider>(
            builder: (context, provider, _) {
              return Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: provider.invoiceNumberController,
                      decoration: InputDecoration(
                        labelText: local.invoiceNumberLabel,
                      ),
                      validator: (value) =>
                          provider.validateInvoiceNumber(value, local),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: provider.invoiceDateController,
                      decoration: InputDecoration(
                        labelText: local.invoiceDateLabel,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => provider.selectInvoiceDate(context),
                        ),
                      ),
                      readOnly: true,
                      validator: (value) =>
                          provider.validateInvoiceDate(value, local),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: provider.selectedSupplier,
                      items: provider.suppliers.map((s) {
                        return DropdownMenuItem(
                          value: s,
                          child: Text(s.name),
                        );
                      }).toList(),
                      onChanged: provider.setSelectedSupplier,
                      decoration: InputDecoration(
                        labelText: local.supplierLabel,
                      ),
                      validator: (value) =>
                          provider.validateSupplier(value, local),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      local.productsSectionTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    ...provider.productRows.map((productRow) {
                      return PurchaseProductRow(
                        productRow: productRow,
                        onRemove: () => provider.removeProductRow(productRow),
                        onProductSelected: (product) =>
                            provider.onProductSelected(productRow, product),
                        onBarcodeScanned: (barcode) => provider
                            .handleScannedBarcode(context, barcode, productRow),
                      );
                    }),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: provider.addProductRow,
                      icon: const Icon(Icons.add),
                      label: Text(local.addProductLineButtonLabel),
                    ),
                    const SizedBox(height: 24),
                    InvoiceAttachmentPicker(
                      attachment: provider.selectedAttachment,
                      onAttachmentPicked: provider.setSelectedAttachment,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: provider.totalAmountController,
                      decoration: InputDecoration(
                        labelText: local.grandTotalLabel,
                        prefixIcon: const Icon(Icons.attach_money),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          provider.validateTotalAmount(value, local),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: provider.notesController,
                      decoration: InputDecoration(
                        labelText: local.commentLabel,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                                final success = await provider.submit();
                                if (success) {
                                  Navigator.of(context).pop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(local.errorSavingInvoice("")),
                                    ),
                                  );
                                }
                              },
                        child: provider.isLoading
                            ? const CircularProgressIndicator()
                            : Text(local.saveInvoiceButtonLabel),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
