import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

// Type converter for storing a list of barcodes as a JSON string
class BarcodesConverter extends TypeConverter<List<String>, String> {
  const BarcodesConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    final List<dynamic> json = jsonDecode(fromDb);
    return json.cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

@DataClassName('Product')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
  
  // New column for barcodes, using the type converter
  TextColumn get barcodes => text().map(const BarcodesConverter()).nullable()();
  
  // It's good practice to add other fields from the entity here as well
  // so they can be persisted.
  TextColumn get description => text().nullable()();
  RealColumn get purchasePrice => real().nullable()();
  RealColumn get sellingPrice => real().nullable()();
  IntColumn get alertQuantity => integer().nullable()();
}

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // BUMP the schema version because we added a column

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Migration logic to add the new columns to the existing table
        await m.addColumn(products, products.barcodes);
        await m.addColumn(products, products.description);
        await m.addColumn(products, products.purchasePrice);
        await m.addColumn(products, products.sellingPrice);
        await m.addColumn(products, products.alertQuantity);
      }
    },
  );

  Future<List<Product>> getAllProducts() => select(products).get();
  Future<int> insertProduct(ProductsCompanion product) =>
      into(products).insert(product);
  Future<bool> updateProduct(Product product) => update(products).replace(product);
  Future<int> deleteProduct(Product product) => delete(products).delete(product);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
