import 'package:drift/drift.dart';

// Status tracking for server migration
enum SyncStatus { localOnly, syncing, synced, failed }
enum QuotationStatus { draft, sent, accepted, rejected }

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
  TextColumn get remoteId => text().nullable()();

  // Customer Data
  TextColumn get customerName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get email => text().nullable()();
  TextColumn get gstNumber => text().nullable()();
  TextColumn get companyName => text().withDefault(const Constant(''))();

  // Address Fields
  TextColumn get billingAddress => text().withDefault(const Constant(''))();
  TextColumn get billingCity => text().withDefault(const Constant(''))();
  TextColumn get billingState => text().withDefault(const Constant(''))();
  TextColumn get billingPincode => text().withDefault(const Constant(''))();

  BoolColumn get sameAsBilling => boolean().withDefault(const Constant(true))();

  TextColumn get shippingAddress => text().withDefault(const Constant(''))();
  TextColumn get shippingCity => text().withDefault(const Constant(''))();
  TextColumn get shippingState => text().withDefault(const Constant(''))();
  TextColumn get shippingPincode => text().withDefault(const Constant(''))();
  TextColumn get notes => text().nullable()();

  // Financial Summary
  RealColumn get totalAmount => real()();
  RealColumn get discountPercentage => real().withDefault(const Constant(0.0))();

  // Logic & State
  IntColumn get status => intEnum<QuotationStatus>().withDefault(const Constant(0))();
  IntColumn get syncStatus => intEnum<SyncStatus>().withDefault(const Constant(0))();

  // Added default value to prevent null-check errors on existing rows
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// QuotationItems: Links products to quotes with price snapshots
class QuotationItems extends Table {
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get quotationId => text().customConstraint('NOT NULL REFERENCES quotations(id) ON DELETE CASCADE')();
  TextColumn get productModel => text().references(Products, #model)();
  IntColumn get quantity => integer()();
  RealColumn get priceAtTimeOfSale => real()();
}

class DealerProfile extends Table {
  TextColumn get phone => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get companyName => text()();
  TextColumn get address => text()();
  TextColumn get gstNumber => text()();
  TextColumn get dealerId => text()();
  TextColumn get profileImage => text().nullable()();
  @override
  Set<Column> get primaryKey => {phone};
}