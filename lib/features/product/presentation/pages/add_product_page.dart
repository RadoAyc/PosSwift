import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/services/category_service.dart';
import 'package:myapp/features/product/domain/services/supplier_service.dart';
import 'package:myapp/features/product/domain/services/warehouse_service.dart';
import 'package:myapp/features/product/domain/usecases/add_product_usecase.dart';
import 'package:myapp/features/product/presentation/providers/product_form_provider.dart';
import 'package:myapp/features/product/presentation/widgets/barcode_input_row.dart';
import 'package:myapp/features/product/presentation/widgets/product_image_picker.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  final ProductEntity? product;
  final VoidCallback? onProductSaved;
  const AddProductPage({super.key, this.product, this.onProductSaved});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(
        GetIt.instance<AddProductUseCase>(),
        GetIt.instance<CategoryService>(),
        GetIt.instance<SupplierService>(),
        GetIt.instance<WarehouseService>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.addProductTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ProductFormProvider>(
            builder: (context, provider, _) {
              return Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BarcodeInputRow(
                      initialValue: provider.barcodeController.text,
                      onChanged: (value) {
                        provider.barcodeController.text = value;
                      },
                      onDelete: () {
                        provider.barcodeController.clear();
                      },
                      validator: (value) => provider.validateBarcode(value, local),
                    ),
                    TextFormField(
                      controller: provider.nameController,
                      decoration: InputDecoration(
                        labelText: local.productNameLabel,
                      ),
                      validator: (value) => provider.validateName(value, local),
                    ),
                    TextFormField(
                      controller: provider.descriptionController,
                      decoration: InputDecoration(
                        labelText: local.descriptionLabel,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: provider.priceController,
                            decoration: InputDecoration(
                              labelText: local.sellingPriceLabel,
                              prefixIcon: const Icon(Icons.attach_money),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                provider.validatePrice(value, local),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: provider.quantityController,
                            decoration: InputDecoration(
                              labelText: local.alertQuantityLabel,
                              prefixIcon: const Icon(Icons.inventory_2),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                provider.validateQuantity(value, local),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: provider.selectedCategory,
                      items: provider.categories.map((c) {
                        return DropdownMenuItem(
                          value: c,
                          child: Text(c.name),
                        );
                      }).toList(),
                      onChanged: provider.setSelectedCategory,
                      decoration: InputDecoration(
                        labelText: local.categoryLabel,
                      ),
                      validator: (value) =>
                          provider.validateCategory(value, local),
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
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: provider.selectedWarehouse,
                      items: provider.warehouses.map((w) {
                        return DropdownMenuItem(
                          value: w,
                          child: Text(w.name),
                        );
                      }).toList(),
                      onChanged: provider.setSelectedWarehouse,
                      decoration: InputDecoration(
                        labelText: local.warehouseLabel,
                      ),
                      validator: (value) =>
                          provider.validateWarehouse(value, local),
                    ),
                    const SizedBox(height: 24),
                    ProductImagePicker(
                      imageBytes: provider.selectedImage,
                      onImageSelected: provider.setSelectedImage,
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
                                  onProductSaved?.call();
                                  Navigator.of(context).pop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(local.errorSavingProduct(provider.barcodeController.text)),
                                    ),
                                  );
                                }
                              },
                        child: provider.isLoading
                            ? const CircularProgressIndicator()
                            : Text(local.saveButtonLabel),
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
