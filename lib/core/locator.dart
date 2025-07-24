import 'package:get_it/get_it.dart';
import 'package:myapp/features/product/data/database.dart';
import 'package:myapp/features/product/data/repositories/product_repository_impl.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';
import 'package:myapp/features/product/domain/usecases/add_product_usecase.dart';
import 'package:myapp/features/product/domain/usecases/get_products_usecase.dart';
import 'package:myapp/features/product/presentation/providers/product_form_provider.dart';

// Product-related Services (using mock implementations for now)
import 'package:myapp/features/product/domain/services/category_service.dart';
import 'package:myapp/features/product/data/services/mock_category_service.dart';
import 'package:myapp/features/product/domain/services/supplier_service.dart';
import 'package:myapp/features/product/data/services/mock_supplier_service.dart';
import 'package:myapp/features/product/domain/services/warehouse_service.dart';
import 'package:myapp/features/product/data/services/mock_warehouse_service.dart';
import 'package:myapp/features/product/domain/services/product_service.dart';
import 'package:myapp/features/product/data/services/mock_product_service.dart';

// Purchase-related Services
import 'package:myapp/features/purchase/domain/services/purchase_service.dart';
import 'package:myapp/features/purchase/data/services/mock_purchase_service.dart';
import 'package:myapp/features/purchase/presentation/providers/purchase_form_provider.dart';
import 'package:myapp/features/product/domain/usecases/update_stock_usecase.dart';
import 'package:myapp/features/product/domain/usecases/upsert_product_usecase.dart'; 
import 'package:myapp/features/product/domain/usecases/find_product_by_barcode_usecase.dart'; 


final locator = GetIt.instance;

void setupLocator() {
  // === SINGLETONS (App-wide services) ===
  locator.registerSingleton<AppDatabase>(AppDatabase());

  // === REPOSITORIES ===
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator<AppDatabase>()),
  );

  // === USECASES ===
  locator.registerLazySingleton<AddProductUseCase>(
    () => AddProductUseCase(locator<ProductRepository>()),
  );
  locator.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(locator<ProductRepository>()),
  );
  locator.registerLazySingleton<UpdateStockUseCase>(
    () => UpdateStockUseCase(locator<ProductRepository>()),
  );
  locator.registerLazySingleton<FindProductByBarcodeUseCase>( 
    () => FindProductByBarcodeUseCase(locator<ProductRepository>()),
  );
  locator.registerLazySingleton<UpsertProductUseCase>( 
    () => UpsertProductUseCase(locator<ProductRepository>()),
  );


  // === SERVICES (Mock Implementations) ===
  locator.registerLazySingleton<CategoryService>(() => MockCategoryService());
  locator.registerLazySingleton<SupplierService>(() => MockSupplierService());
  locator.registerLazySingleton<WarehouseService>(() => MockWarehouseService());
  locator.registerLazySingleton<PurchaseService>(() => MockPurchaseService());
  locator.registerLazySingleton<ProductService>(() => MockProductService()); 

  // === PROVIDERS ===
  locator.registerFactory<ProductFormProvider>(
    () => ProductFormProvider(
      locator<AddProductUseCase>(),
      locator<CategoryService>(),
      locator<SupplierService>(),
      locator<WarehouseService>(),
    ),
  );
    
  locator.registerFactory<PurchaseFormProvider>(
    () => PurchaseFormProvider(
      locator<PurchaseService>(),
      locator<UpsertProductUseCase>(),
    ),
  );
}
