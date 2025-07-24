// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Supermarket POS';

  @override
  String get addProductTitle => 'Add Product';

  @override
  String get productNameLabel => 'Product Name';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get categoryLabel => 'Category';

  @override
  String get supplierLabel => 'Supplier';

  @override
  String get warehouseLabel => 'Warehouse';

  @override
  String get purchasePriceLabel => 'Purchase Price';

  @override
  String get taxRateLabel => 'Tax Rate (%)';

  @override
  String get sellingPriceLabel => 'Selling Price';

  @override
  String get alertQuantityLabel => 'Alert Quantity';

  @override
  String get barcodesLabel => 'Barcodes';

  @override
  String get addBarcodeButtonLabel => 'Add Barcode';

  @override
  String get addPackageBarcodeToggleLabel => 'Add Package Barcode';

  @override
  String get unitsPerCaseLabel => 'Units per Case';

  @override
  String get saveButtonLabel => 'Save';

  @override
  String get resetButtonLabel => 'Reset';

  @override
  String get sellingPriceValidation => 'Selling price must be >= Purchase Price';

  @override
  String get formValidationFailed => 'Please correct the errors in the form.';

  @override
  String get atLeastOneBarcodeRequired => 'At least one barcode is required.';

  @override
  String get duplicateBarcodesFound => 'Duplicate barcodes found.';

  @override
  String get productAddedSuccessfully => 'Product added successfully!';

  @override
  String errorSavingProduct(String error) {
    return 'Error saving product: $error';
  }

  @override
  String get barcodeLabel => 'Barcode';

  @override
  String get deleteBarcodeButtonTooltip => 'Delete Barcode';

  @override
  String get productImageLabel => 'Product Image';

  @override
  String get chooseImageButtonLabel => 'Choose Image';

  @override
  String get productNameRequired => 'Product Name is required';

  @override
  String get productNameMax100Chars => 'Product Name must be max 100 characters';

  @override
  String get descriptionMax255Chars => 'Description must be max 255 characters';

  @override
  String get categoryRequired => 'Category is required';

  @override
  String get warehouseRequired => 'Warehouse is required';

  @override
  String get purchasePriceRequired => 'Purchase Price is required';

  @override
  String get purchasePriceInvalid => 'Please enter a valid price (>= 0)';

  @override
  String get taxRateInvalid => 'Please enter a valid tax rate (0-100)';

  @override
  String get sellingPriceRequired => 'Selling Price is required';

  @override
  String get sellingPriceInvalid => 'Please enter a valid price (>= 0)';

  @override
  String get alertQuantityInvalid => 'Please enter a valid quantity (>= 0)';

  @override
  String get unitsPerCaseInvalid => 'Please enter a valid number of units (>= 0)';

  @override
  String get productListTitle => 'Product List';

  @override
  String productPriceAndQuantity(String price, int quantity) {
    return 'Price: $price - Quantity: $quantity';
  }

  @override
  String get addProductButtonTooltip => 'Add Product';

  @override
  String get addPurchaseInvoiceTitle => 'Add Purchase Invoice';

  @override
  String get invoiceNumberLabel => 'Invoice Number';

  @override
  String get invoiceDateLabel => 'Invoice Date';

  @override
  String get purchaseStatusLabel => 'Purchase Status';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusReceived => 'Received';

  @override
  String get statusPartiallyReceived => 'Partially Received';

  @override
  String get productsSectionTitle => 'Products';

  @override
  String get productLabel => 'Product';

  @override
  String get quantityLabel => 'Quantity';

  @override
  String get taxLabel => 'Tax (%)';

  @override
  String get lineTotalLabel => 'Line Total';

  @override
  String get addProductLineButtonLabel => 'Add Product Line';

  @override
  String get totalsSectionTitle => 'Totals';

  @override
  String get subtotalLabel => 'Subtotal';

  @override
  String get additionalCostsLabel => 'Additional Costs';

  @override
  String get grandTotalLabel => 'Grand Total';

  @override
  String get invoiceAttachmentLabel => 'Invoice Attachment';

  @override
  String get addAttachmentButtonLabel => 'Add Attachment';

  @override
  String get commentLabel => 'Comment';

  @override
  String get saveInvoiceButtonLabel => 'Save Invoice';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get deleteItemTooltip => 'Delete Item';

  @override
  String get atLeastOneProductRequired => 'At least one product line is required.';

  @override
  String get invoiceSavedSuccessfully => 'Purchase Invoice saved successfully!';

  @override
  String errorSavingInvoice(String error) {
    return 'Error saving invoice: $error';
  }

  @override
  String get supplierRequired => 'Supplier is required';

  @override
  String get productRequired => 'Product is required';

  @override
  String get quantityRequired => 'Quantity is required';

  @override
  String get quantityInvalid => 'Please enter a valid quantity (>= 1)';
}
