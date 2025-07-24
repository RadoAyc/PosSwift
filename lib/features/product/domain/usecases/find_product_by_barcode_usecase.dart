import 'package:myapp/features/product/domain/entities/product_entity.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';

class FindProductByBarcodeUseCase {
  final ProductRepository _repository;

  FindProductByBarcodeUseCase(this._repository);

  Future<ProductEntity?> call(String barcode) {
    if (barcode.isEmpty) {
      return Future.value(null);
    }
    return _repository.findProductByBarcode(barcode);
  }
}
