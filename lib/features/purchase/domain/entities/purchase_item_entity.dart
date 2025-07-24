import 'package:myapp/features/product/domain/entities/product_entity.dart';

class PurchaseItemEntity {
  final ProductEntity? product;
  final int quantity;
  final double purchasePrice;
  final double? taxPercent;
  final double lineTotal;

  const PurchaseItemEntity({
    this.product,
    this.quantity = 1,
    this.purchasePrice = 0.0,
    this.taxPercent,
    this.lineTotal = 0.0,
  });

  PurchaseItemEntity copyWith({
    ProductEntity? product,
    int? quantity,
    double? purchasePrice,
    double? taxPercent,
    double? lineTotal,
  }) {
    return PurchaseItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      taxPercent: taxPercent ?? this.taxPercent,
      lineTotal: lineTotal ?? this.lineTotal,
    );
  }
}
