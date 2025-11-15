import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

/* --------------------- Tables --------------------- */

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get gender => text().withLength(min: 4, max: 6)();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  TextColumn get phoneNumber => text().nullable()();
  RealColumn get totalAmount => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Packages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get packageDate => dateTime().withDefault(currentDateAndTime)();
  RealColumn get totalPayment => real().withDefault(const Constant(0))();
  RealColumn get totalAmount => real().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('created'))();
}

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get packageId => integer().references(Packages, #id, onDelete: KeyAction.cascade)();
  TextColumn get label => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
  TextColumn get unity => text()();
}

class PackageHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get packageId => integer().references(Packages, #id, onDelete: KeyAction.cascade)();
  TextColumn get action => text()();
  DateTimeColumn get actionDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get details => text().nullable()();
}

@DriftDatabase(tables: [Customers, Packages, Items, PackageHistory])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Customers
  Future<int> createCustomer(CustomersCompanion entry) => into(customers).insert(entry);
  Future<List<Customer>> getAllCustomers() => select(customers).get();

  // Packages
  Future<int> createPackage(PackagesCompanion entry) => into(packages).insert(entry);
  Future<List<Package>> getPackagesForCustomer(int customerId) => (select(packages)..where((p) => p.customerId.equals(customerId))).get();

  // Items
  Future<int> createItem(ItemsCompanion entry) => into(items).insert(entry);

  // Package history
  Future<int> addPackageHistory(PackageHistoryCompanion entry) => into(packageHistory).insert(entry);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final folder = Directory(dbFolder.path);
    if (!await folder.exists()) await folder.create(recursive: true);
    final file = File(p.join(dbFolder.path, 'mahali_ms.sqlite'));
    return NativeDatabase(file);
  });
}

// A single shared instance for the app to use. Import `appDb` from UI code.
final AppDatabase appDb = AppDatabase();
