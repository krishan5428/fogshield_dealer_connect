import 'package:drift/drift.dart';

// Status tracking for server migration
enum SyncStatus { localOnly, syncing, synced, failed }
enum QuotationStatus { draft, sent, accepted, rejected }

/// Dealer Profile: Persisted locally for offline quotation metadata attachment
class DealerProfile extends Table {
  TextColumn get phone => text()(); // Primary Key
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get companyName => text()();
  TextColumn get address => text()();
  TextColumn get gstNumber => text()();
  TextColumn get dealerId => text()(); // The SECDLRXXX code
  TextColumn get profileImage => text().nullable()();

  @override
  Set<Column> get primaryKey => {phone};
}

/// Products Table: Master price list loaded locally
class Products extends Table {
  TextColumn get model => text()(); // Primary SKU
  TextColumn get name => text()();
  TextColumn get description => text()();
  RealColumn get endUserPrice => real()();
  RealColumn get mrp => real()();
  TextColumn get imagePath => text()();
  TextColumn get category => text()();

  @override
  Set<Column> get primaryKey => {model};
}

/// Quotations Table: Single source of truth for History Page
class Quotations extends Table {
  TextColumn get id => text()(); // Local UUID/Unique ID
  TextColumn get remoteId => text().nullable()(); // Server-assigned ID (Future-proof)

  // Customer Data
  TextColumn get customerName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get email => text().nullable()();
  TextColumn get gstNumber => text().nullable()();

  // Financial Summary (Cached for performance)
  RealColumn get totalAmount => real()();
  RealColumn get discountPercentage => real().withDefault(const Constant(0.0))();

  // Logic & State
  IntColumn get status => intEnum<QuotationStatus>()();
  IntColumn get syncStatus => intEnum<SyncStatus>().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// QuotationItems: Links products to quotes with price snapshots
class QuotationItems extends Table {
  IntColumn get localId => integer().autoIncrement()();

  // Fixed: Added NOT NULL to custom constraint to resolve Drift warning
  TextColumn get quotationId => text().customConstraint('NOT NULL REFERENCES quotations(id) ON DELETE CASCADE')();

  TextColumn get productModel => text().references(Products, #model)();
  IntColumn get quantity => integer()();
  RealColumn get priceAtTimeOfSale => real()();
}