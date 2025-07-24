import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Supermarket POS'**
  String get appTitle;

  /// No description provided for @addProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProductTitle;

  /// No description provided for @productNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productNameLabel;

  /// No description provided for @descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @supplierLabel.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get supplierLabel;

  /// No description provided for @warehouseLabel.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouseLabel;

  /// No description provided for @purchasePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get purchasePriceLabel;

  /// No description provided for @taxRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate (%)'**
  String get taxRateLabel;

  /// No description provided for @sellingPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get sellingPriceLabel;

  /// No description provided for @alertQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Alert Quantity'**
  String get alertQuantityLabel;

  /// No description provided for @barcodesLabel.
  ///
  /// In en, this message translates to:
  /// **'Barcodes'**
  String get barcodesLabel;

  /// No description provided for @addBarcodeButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Add Barcode'**
  String get addBarcodeButtonLabel;

  /// No description provided for @addPackageBarcodeToggleLabel.
  ///
  /// In en, this message translates to:
  /// **'Add Package Barcode'**
  String get addPackageBarcodeToggleLabel;

  /// No description provided for @unitsPerCaseLabel.
  ///
  /// In en, this message translates to:
  /// **'Units per Case'**
  String get unitsPerCaseLabel;

  /// No description provided for @saveButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonLabel;

  /// No description provided for @resetButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButtonLabel;

  /// No description provided for @sellingPriceValidation.
  ///
  /// In en, this message translates to:
  /// **'Selling price must be >= Purchase Price'**
  String get sellingPriceValidation;

  /// No description provided for @formValidationFailed.
  ///
  /// In en, this message translates to:
  /// **'Please correct the errors in the form.'**
  String get formValidationFailed;

  /// No description provided for @atLeastOneBarcodeRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one barcode is required.'**
  String get atLeastOneBarcodeRequired;

  /// No description provided for @duplicateBarcodesFound.
  ///
  /// In en, this message translates to:
  /// **'Duplicate barcodes found.'**
  String get duplicateBarcodesFound;

  /// No description provided for @productAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product added successfully!'**
  String get productAddedSuccessfully;

  /// No description provided for @errorSavingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error saving product: {error}'**
  String errorSavingProduct(String error);

  /// No description provided for @barcodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcodeLabel;

  /// No description provided for @deleteBarcodeButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Barcode'**
  String get deleteBarcodeButtonTooltip;

  /// No description provided for @productImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Product Image'**
  String get productImageLabel;

  /// No description provided for @chooseImageButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get chooseImageButtonLabel;

  /// No description provided for @productNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Product Name is required'**
  String get productNameRequired;

  /// No description provided for @productNameMax100Chars.
  ///
  /// In en, this message translates to:
  /// **'Product Name must be max 100 characters'**
  String get productNameMax100Chars;

  /// No description provided for @descriptionMax255Chars.
  ///
  /// In en, this message translates to:
  /// **'Description must be max 255 characters'**
  String get descriptionMax255Chars;

  /// No description provided for @categoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Category is required'**
  String get categoryRequired;

  /// No description provided for @warehouseRequired.
  ///
  /// In en, this message translates to:
  /// **'Warehouse is required'**
  String get warehouseRequired;

  /// No description provided for @purchasePriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price is required'**
  String get purchasePriceRequired;

  /// No description provided for @purchasePriceInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid price (>= 0)'**
  String get purchasePriceInvalid;

  /// No description provided for @taxRateInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid tax rate (0-100)'**
  String get taxRateInvalid;

  /// No description provided for @sellingPriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Selling Price is required'**
  String get sellingPriceRequired;

  /// No description provided for @sellingPriceInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid price (>= 0)'**
  String get sellingPriceInvalid;

  /// No description provided for @alertQuantityInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid quantity (>= 0)'**
  String get alertQuantityInvalid;

  /// No description provided for @unitsPerCaseInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number of units (>= 0)'**
  String get unitsPerCaseInvalid;

  /// No description provided for @productListTitle.
  ///
  /// In en, this message translates to:
  /// **'Product List'**
  String get productListTitle;

  /// No description provided for @productPriceAndQuantity.
  ///
  /// In en, this message translates to:
  /// **'Price: {price} - Quantity: {quantity}'**
  String productPriceAndQuantity(String price, int quantity);

  /// No description provided for @addProductButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProductButtonTooltip;

  /// No description provided for @addPurchaseInvoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Purchase Invoice'**
  String get addPurchaseInvoiceTitle;

  /// No description provided for @invoiceNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number'**
  String get invoiceNumberLabel;

  /// No description provided for @invoiceDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Invoice Date'**
  String get invoiceDateLabel;

  /// No description provided for @purchaseStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Purchase Status'**
  String get purchaseStatusLabel;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get statusReceived;

  /// No description provided for @statusPartiallyReceived.
  ///
  /// In en, this message translates to:
  /// **'Partially Received'**
  String get statusPartiallyReceived;

  /// No description provided for @productsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsSectionTitle;

  /// No description provided for @productLabel.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productLabel;

  /// No description provided for @quantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantityLabel;

  /// No description provided for @taxLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax (%)'**
  String get taxLabel;

  /// No description provided for @lineTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Line Total'**
  String get lineTotalLabel;

  /// No description provided for @addProductLineButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Add Product Line'**
  String get addProductLineButtonLabel;

  /// No description provided for @totalsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Totals'**
  String get totalsSectionTitle;

  /// No description provided for @subtotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotalLabel;

  /// No description provided for @additionalCostsLabel.
  ///
  /// In en, this message translates to:
  /// **'Additional Costs'**
  String get additionalCostsLabel;

  /// No description provided for @grandTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get grandTotalLabel;

  /// No description provided for @invoiceAttachmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Invoice Attachment'**
  String get invoiceAttachmentLabel;

  /// No description provided for @addAttachmentButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Add Attachment'**
  String get addAttachmentButtonLabel;

  /// No description provided for @commentLabel.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get commentLabel;

  /// No description provided for @saveInvoiceButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Save Invoice'**
  String get saveInvoiceButtonLabel;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;

  /// No description provided for @deleteItemTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItemTooltip;

  /// No description provided for @atLeastOneProductRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one product line is required.'**
  String get atLeastOneProductRequired;

  /// No description provided for @invoiceSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Purchase Invoice saved successfully!'**
  String get invoiceSavedSuccessfully;

  /// No description provided for @errorSavingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Error saving invoice: {error}'**
  String errorSavingInvoice(String error);

  /// No description provided for @supplierRequired.
  ///
  /// In en, this message translates to:
  /// **'Supplier is required'**
  String get supplierRequired;

  /// No description provided for @productRequired.
  ///
  /// In en, this message translates to:
  /// **'Product is required'**
  String get productRequired;

  /// No description provided for @quantityRequired.
  ///
  /// In en, this message translates to:
  /// **'Quantity is required'**
  String get quantityRequired;

  /// No description provided for @quantityInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid quantity (>= 1)'**
  String get quantityInvalid;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
