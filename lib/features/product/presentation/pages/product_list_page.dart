import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/usecases/get_products_usecase.dart';
import 'package:myapp/features/product/presentation/pages/add_product_page.dart';
import 'package:myapp/l10n/app_localizations.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<ProductEntity>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _productsFuture = GetIt.instance<GetProductsUseCase>()();
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.productListTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: local.addProductButtonTooltip,
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddProductPage(
                    onProductSaved: _loadProducts,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ProductEntity>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(local.productAddedSuccessfully));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                    local.productPriceAndQuantity(
                      product.price.toString(),
                      product.quantity,
                    ),
                  ),
                  onTap: () {
                    // Handle product tap for editing
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
