// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endUserPriceMeta =
      const VerificationMeta('endUserPrice');
  @override
  late final GeneratedColumn<double> endUserPrice = GeneratedColumn<double>(
      'end_user_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _mrpMeta = const VerificationMeta('mrp');
  @override
  late final GeneratedColumn<double> mrp = GeneratedColumn<double>(
      'mrp', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [model, name, description, endUserPrice, mrp, imagePath, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('end_user_price')) {
      context.handle(
          _endUserPriceMeta,
          endUserPrice.isAcceptableOrUnknown(
              data['end_user_price']!, _endUserPriceMeta));
    } else if (isInserting) {
      context.missing(_endUserPriceMeta);
    }
    if (data.containsKey('mrp')) {
      context.handle(
          _mrpMeta, mrp.isAcceptableOrUnknown(data['mrp']!, _mrpMeta));
    } else if (isInserting) {
      context.missing(_mrpMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {model};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      endUserPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_user_price'])!,
      mrp: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mrp'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String model;
  final String name;
  final String description;
  final double endUserPrice;
  final double mrp;
  final String imagePath;
  final String category;
  const Product(
      {required this.model,
      required this.name,
      required this.description,
      required this.endUserPrice,
      required this.mrp,
      required this.imagePath,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['model'] = Variable<String>(model);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['end_user_price'] = Variable<double>(endUserPrice);
    map['mrp'] = Variable<double>(mrp);
    map['image_path'] = Variable<String>(imagePath);
    map['category'] = Variable<String>(category);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      model: Value(model),
      name: Value(name),
      description: Value(description),
      endUserPrice: Value(endUserPrice),
      mrp: Value(mrp),
      imagePath: Value(imagePath),
      category: Value(category),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      model: serializer.fromJson<String>(json['model']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      endUserPrice: serializer.fromJson<double>(json['endUserPrice']),
      mrp: serializer.fromJson<double>(json['mrp']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'model': serializer.toJson<String>(model),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'endUserPrice': serializer.toJson<double>(endUserPrice),
      'mrp': serializer.toJson<double>(mrp),
      'imagePath': serializer.toJson<String>(imagePath),
      'category': serializer.toJson<String>(category),
    };
  }

  Product copyWith(
          {String? model,
          String? name,
          String? description,
          double? endUserPrice,
          double? mrp,
          String? imagePath,
          String? category}) =>
      Product(
        model: model ?? this.model,
        name: name ?? this.name,
        description: description ?? this.description,
        endUserPrice: endUserPrice ?? this.endUserPrice,
        mrp: mrp ?? this.mrp,
        imagePath: imagePath ?? this.imagePath,
        category: category ?? this.category,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      model: data.model.present ? data.model.value : this.model,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      endUserPrice: data.endUserPrice.present
          ? data.endUserPrice.value
          : this.endUserPrice,
      mrp: data.mrp.present ? data.mrp.value : this.mrp,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('model: $model, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('endUserPrice: $endUserPrice, ')
          ..write('mrp: $mrp, ')
          ..write('imagePath: $imagePath, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      model, name, description, endUserPrice, mrp, imagePath, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.model == this.model &&
          other.name == this.name &&
          other.description == this.description &&
          other.endUserPrice == this.endUserPrice &&
          other.mrp == this.mrp &&
          other.imagePath == this.imagePath &&
          other.category == this.category);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> model;
  final Value<String> name;
  final Value<String> description;
  final Value<double> endUserPrice;
  final Value<double> mrp;
  final Value<String> imagePath;
  final Value<String> category;
  final Value<int> rowid;
  const ProductsCompanion({
    this.model = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.endUserPrice = const Value.absent(),
    this.mrp = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String model,
    required String name,
    required String description,
    required double endUserPrice,
    required double mrp,
    required String imagePath,
    required String category,
    this.rowid = const Value.absent(),
  })  : model = Value(model),
        name = Value(name),
        description = Value(description),
        endUserPrice = Value(endUserPrice),
        mrp = Value(mrp),
        imagePath = Value(imagePath),
        category = Value(category);
  static Insertable<Product> custom({
    Expression<String>? model,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? endUserPrice,
    Expression<double>? mrp,
    Expression<String>? imagePath,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (model != null) 'model': model,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (endUserPrice != null) 'end_user_price': endUserPrice,
      if (mrp != null) 'mrp': mrp,
      if (imagePath != null) 'image_path': imagePath,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? model,
      Value<String>? name,
      Value<String>? description,
      Value<double>? endUserPrice,
      Value<double>? mrp,
      Value<String>? imagePath,
      Value<String>? category,
      Value<int>? rowid}) {
    return ProductsCompanion(
      model: model ?? this.model,
      name: name ?? this.name,
      description: description ?? this.description,
      endUserPrice: endUserPrice ?? this.endUserPrice,
      mrp: mrp ?? this.mrp,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (endUserPrice.present) {
      map['end_user_price'] = Variable<double>(endUserPrice.value);
    }
    if (mrp.present) {
      map['mrp'] = Variable<double>(mrp.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('model: $model, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('endUserPrice: $endUserPrice, ')
          ..write('mrp: $mrp, ')
          ..write('imagePath: $imagePath, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuotationsTable extends Quotations
    with TableInfo<$QuotationsTable, Quotation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gstNumberMeta =
      const VerificationMeta('gstNumber');
  @override
  late final GeneratedColumn<String> gstNumber = GeneratedColumn<String>(
      'gst_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _billingAddressMeta =
      const VerificationMeta('billingAddress');
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
      'billing_address', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _billingCityMeta =
      const VerificationMeta('billingCity');
  @override
  late final GeneratedColumn<String> billingCity = GeneratedColumn<String>(
      'billing_city', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _billingStateMeta =
      const VerificationMeta('billingState');
  @override
  late final GeneratedColumn<String> billingState = GeneratedColumn<String>(
      'billing_state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _billingPincodeMeta =
      const VerificationMeta('billingPincode');
  @override
  late final GeneratedColumn<String> billingPincode = GeneratedColumn<String>(
      'billing_pincode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _sameAsBillingMeta =
      const VerificationMeta('sameAsBilling');
  @override
  late final GeneratedColumn<bool> sameAsBilling = GeneratedColumn<bool>(
      'same_as_billing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("same_as_billing" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _shippingAddressMeta =
      const VerificationMeta('shippingAddress');
  @override
  late final GeneratedColumn<String> shippingAddress = GeneratedColumn<String>(
      'shipping_address', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _shippingCityMeta =
      const VerificationMeta('shippingCity');
  @override
  late final GeneratedColumn<String> shippingCity = GeneratedColumn<String>(
      'shipping_city', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _shippingStateMeta =
      const VerificationMeta('shippingState');
  @override
  late final GeneratedColumn<String> shippingState = GeneratedColumn<String>(
      'shipping_state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _shippingPincodeMeta =
      const VerificationMeta('shippingPincode');
  @override
  late final GeneratedColumn<String> shippingPincode = GeneratedColumn<String>(
      'shipping_pincode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>('discount_percentage', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  @override
  late final GeneratedColumnWithTypeConverter<QuotationStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<QuotationStatus>($QuotationsTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, int> syncStatus =
      GeneratedColumn<int>('sync_status', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<SyncStatus>($QuotationsTable.$convertersyncStatus);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        customerName,
        phoneNumber,
        email,
        gstNumber,
        companyName,
        billingAddress,
        billingCity,
        billingState,
        billingPincode,
        sameAsBilling,
        shippingAddress,
        shippingCity,
        shippingState,
        shippingPincode,
        notes,
        totalAmount,
        discountPercentage,
        status,
        syncStatus,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotations';
  @override
  VerificationContext validateIntegrity(Insertable<Quotation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('gst_number')) {
      context.handle(_gstNumberMeta,
          gstNumber.isAcceptableOrUnknown(data['gst_number']!, _gstNumberMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    }
    if (data.containsKey('billing_city')) {
      context.handle(
          _billingCityMeta,
          billingCity.isAcceptableOrUnknown(
              data['billing_city']!, _billingCityMeta));
    }
    if (data.containsKey('billing_state')) {
      context.handle(
          _billingStateMeta,
          billingState.isAcceptableOrUnknown(
              data['billing_state']!, _billingStateMeta));
    }
    if (data.containsKey('billing_pincode')) {
      context.handle(
          _billingPincodeMeta,
          billingPincode.isAcceptableOrUnknown(
              data['billing_pincode']!, _billingPincodeMeta));
    }
    if (data.containsKey('same_as_billing')) {
      context.handle(
          _sameAsBillingMeta,
          sameAsBilling.isAcceptableOrUnknown(
              data['same_as_billing']!, _sameAsBillingMeta));
    }
    if (data.containsKey('shipping_address')) {
      context.handle(
          _shippingAddressMeta,
          shippingAddress.isAcceptableOrUnknown(
              data['shipping_address']!, _shippingAddressMeta));
    }
    if (data.containsKey('shipping_city')) {
      context.handle(
          _shippingCityMeta,
          shippingCity.isAcceptableOrUnknown(
              data['shipping_city']!, _shippingCityMeta));
    }
    if (data.containsKey('shipping_state')) {
      context.handle(
          _shippingStateMeta,
          shippingState.isAcceptableOrUnknown(
              data['shipping_state']!, _shippingStateMeta));
    }
    if (data.containsKey('shipping_pincode')) {
      context.handle(
          _shippingPincodeMeta,
          shippingPincode.isAcceptableOrUnknown(
              data['shipping_pincode']!, _shippingPincodeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage']!, _discountPercentageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quotation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quotation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      gstNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gst_number']),
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      billingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_address'])!,
      billingCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_city'])!,
      billingState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_state'])!,
      billingPincode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_pincode'])!,
      sameAsBilling: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}same_as_billing'])!,
      shippingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shipping_address'])!,
      shippingCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipping_city'])!,
      shippingState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipping_state'])!,
      shippingPincode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shipping_pincode'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      discountPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}discount_percentage'])!,
      status: $QuotationsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      syncStatus: $QuotationsTable.$convertersyncStatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_status'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $QuotationsTable createAlias(String alias) {
    return $QuotationsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<QuotationStatus, int, int> $converterstatus =
      const EnumIndexConverter<QuotationStatus>(QuotationStatus.values);
  static JsonTypeConverter2<SyncStatus, int, int> $convertersyncStatus =
      const EnumIndexConverter<SyncStatus>(SyncStatus.values);
}

class Quotation extends DataClass implements Insertable<Quotation> {
  final String id;
  final String? remoteId;
  final String customerName;
  final String phoneNumber;
  final String? email;
  final String? gstNumber;
  final String companyName;
  final String billingAddress;
  final String billingCity;
  final String billingState;
  final String billingPincode;
  final bool sameAsBilling;
  final String shippingAddress;
  final String shippingCity;
  final String shippingState;
  final String shippingPincode;
  final String? notes;
  final double totalAmount;
  final double discountPercentage;
  final QuotationStatus status;
  final SyncStatus syncStatus;
  final DateTime createdAt;
  const Quotation(
      {required this.id,
      this.remoteId,
      required this.customerName,
      required this.phoneNumber,
      this.email,
      this.gstNumber,
      required this.companyName,
      required this.billingAddress,
      required this.billingCity,
      required this.billingState,
      required this.billingPincode,
      required this.sameAsBilling,
      required this.shippingAddress,
      required this.shippingCity,
      required this.shippingState,
      required this.shippingPincode,
      this.notes,
      required this.totalAmount,
      required this.discountPercentage,
      required this.status,
      required this.syncStatus,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['customer_name'] = Variable<String>(customerName);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || gstNumber != null) {
      map['gst_number'] = Variable<String>(gstNumber);
    }
    map['company_name'] = Variable<String>(companyName);
    map['billing_address'] = Variable<String>(billingAddress);
    map['billing_city'] = Variable<String>(billingCity);
    map['billing_state'] = Variable<String>(billingState);
    map['billing_pincode'] = Variable<String>(billingPincode);
    map['same_as_billing'] = Variable<bool>(sameAsBilling);
    map['shipping_address'] = Variable<String>(shippingAddress);
    map['shipping_city'] = Variable<String>(shippingCity);
    map['shipping_state'] = Variable<String>(shippingState);
    map['shipping_pincode'] = Variable<String>(shippingPincode);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['total_amount'] = Variable<double>(totalAmount);
    map['discount_percentage'] = Variable<double>(discountPercentage);
    {
      map['status'] =
          Variable<int>($QuotationsTable.$converterstatus.toSql(status));
    }
    {
      map['sync_status'] = Variable<int>(
          $QuotationsTable.$convertersyncStatus.toSql(syncStatus));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  QuotationsCompanion toCompanion(bool nullToAbsent) {
    return QuotationsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      customerName: Value(customerName),
      phoneNumber: Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      gstNumber: gstNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(gstNumber),
      companyName: Value(companyName),
      billingAddress: Value(billingAddress),
      billingCity: Value(billingCity),
      billingState: Value(billingState),
      billingPincode: Value(billingPincode),
      sameAsBilling: Value(sameAsBilling),
      shippingAddress: Value(shippingAddress),
      shippingCity: Value(shippingCity),
      shippingState: Value(shippingState),
      shippingPincode: Value(shippingPincode),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      totalAmount: Value(totalAmount),
      discountPercentage: Value(discountPercentage),
      status: Value(status),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
    );
  }

  factory Quotation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quotation(
      id: serializer.fromJson<String>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      customerName: serializer.fromJson<String>(json['customerName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      email: serializer.fromJson<String?>(json['email']),
      gstNumber: serializer.fromJson<String?>(json['gstNumber']),
      companyName: serializer.fromJson<String>(json['companyName']),
      billingAddress: serializer.fromJson<String>(json['billingAddress']),
      billingCity: serializer.fromJson<String>(json['billingCity']),
      billingState: serializer.fromJson<String>(json['billingState']),
      billingPincode: serializer.fromJson<String>(json['billingPincode']),
      sameAsBilling: serializer.fromJson<bool>(json['sameAsBilling']),
      shippingAddress: serializer.fromJson<String>(json['shippingAddress']),
      shippingCity: serializer.fromJson<String>(json['shippingCity']),
      shippingState: serializer.fromJson<String>(json['shippingState']),
      shippingPincode: serializer.fromJson<String>(json['shippingPincode']),
      notes: serializer.fromJson<String?>(json['notes']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      status: $QuotationsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      syncStatus: $QuotationsTable.$convertersyncStatus
          .fromJson(serializer.fromJson<int>(json['syncStatus'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'customerName': serializer.toJson<String>(customerName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'email': serializer.toJson<String?>(email),
      'gstNumber': serializer.toJson<String?>(gstNumber),
      'companyName': serializer.toJson<String>(companyName),
      'billingAddress': serializer.toJson<String>(billingAddress),
      'billingCity': serializer.toJson<String>(billingCity),
      'billingState': serializer.toJson<String>(billingState),
      'billingPincode': serializer.toJson<String>(billingPincode),
      'sameAsBilling': serializer.toJson<bool>(sameAsBilling),
      'shippingAddress': serializer.toJson<String>(shippingAddress),
      'shippingCity': serializer.toJson<String>(shippingCity),
      'shippingState': serializer.toJson<String>(shippingState),
      'shippingPincode': serializer.toJson<String>(shippingPincode),
      'notes': serializer.toJson<String?>(notes),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'status': serializer
          .toJson<int>($QuotationsTable.$converterstatus.toJson(status)),
      'syncStatus': serializer.toJson<int>(
          $QuotationsTable.$convertersyncStatus.toJson(syncStatus)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Quotation copyWith(
          {String? id,
          Value<String?> remoteId = const Value.absent(),
          String? customerName,
          String? phoneNumber,
          Value<String?> email = const Value.absent(),
          Value<String?> gstNumber = const Value.absent(),
          String? companyName,
          String? billingAddress,
          String? billingCity,
          String? billingState,
          String? billingPincode,
          bool? sameAsBilling,
          String? shippingAddress,
          String? shippingCity,
          String? shippingState,
          String? shippingPincode,
          Value<String?> notes = const Value.absent(),
          double? totalAmount,
          double? discountPercentage,
          QuotationStatus? status,
          SyncStatus? syncStatus,
          DateTime? createdAt}) =>
      Quotation(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        customerName: customerName ?? this.customerName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email.present ? email.value : this.email,
        gstNumber: gstNumber.present ? gstNumber.value : this.gstNumber,
        companyName: companyName ?? this.companyName,
        billingAddress: billingAddress ?? this.billingAddress,
        billingCity: billingCity ?? this.billingCity,
        billingState: billingState ?? this.billingState,
        billingPincode: billingPincode ?? this.billingPincode,
        sameAsBilling: sameAsBilling ?? this.sameAsBilling,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        shippingCity: shippingCity ?? this.shippingCity,
        shippingState: shippingState ?? this.shippingState,
        shippingPincode: shippingPincode ?? this.shippingPincode,
        notes: notes.present ? notes.value : this.notes,
        totalAmount: totalAmount ?? this.totalAmount,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        status: status ?? this.status,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
      );
  Quotation copyWithCompanion(QuotationsCompanion data) {
    return Quotation(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      email: data.email.present ? data.email.value : this.email,
      gstNumber: data.gstNumber.present ? data.gstNumber.value : this.gstNumber,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      billingCity:
          data.billingCity.present ? data.billingCity.value : this.billingCity,
      billingState: data.billingState.present
          ? data.billingState.value
          : this.billingState,
      billingPincode: data.billingPincode.present
          ? data.billingPincode.value
          : this.billingPincode,
      sameAsBilling: data.sameAsBilling.present
          ? data.sameAsBilling.value
          : this.sameAsBilling,
      shippingAddress: data.shippingAddress.present
          ? data.shippingAddress.value
          : this.shippingAddress,
      shippingCity: data.shippingCity.present
          ? data.shippingCity.value
          : this.shippingCity,
      shippingState: data.shippingState.present
          ? data.shippingState.value
          : this.shippingState,
      shippingPincode: data.shippingPincode.present
          ? data.shippingPincode.value
          : this.shippingPincode,
      notes: data.notes.present ? data.notes.value : this.notes,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      discountPercentage: data.discountPercentage.present
          ? data.discountPercentage.value
          : this.discountPercentage,
      status: data.status.present ? data.status.value : this.status,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quotation(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('customerName: $customerName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('gstNumber: $gstNumber, ')
          ..write('companyName: $companyName, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingState: $billingState, ')
          ..write('billingPincode: $billingPincode, ')
          ..write('sameAsBilling: $sameAsBilling, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('shippingCity: $shippingCity, ')
          ..write('shippingState: $shippingState, ')
          ..write('shippingPincode: $shippingPincode, ')
          ..write('notes: $notes, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        remoteId,
        customerName,
        phoneNumber,
        email,
        gstNumber,
        companyName,
        billingAddress,
        billingCity,
        billingState,
        billingPincode,
        sameAsBilling,
        shippingAddress,
        shippingCity,
        shippingState,
        shippingPincode,
        notes,
        totalAmount,
        discountPercentage,
        status,
        syncStatus,
        createdAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quotation &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.customerName == this.customerName &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.gstNumber == this.gstNumber &&
          other.companyName == this.companyName &&
          other.billingAddress == this.billingAddress &&
          other.billingCity == this.billingCity &&
          other.billingState == this.billingState &&
          other.billingPincode == this.billingPincode &&
          other.sameAsBilling == this.sameAsBilling &&
          other.shippingAddress == this.shippingAddress &&
          other.shippingCity == this.shippingCity &&
          other.shippingState == this.shippingState &&
          other.shippingPincode == this.shippingPincode &&
          other.notes == this.notes &&
          other.totalAmount == this.totalAmount &&
          other.discountPercentage == this.discountPercentage &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt);
}

class QuotationsCompanion extends UpdateCompanion<Quotation> {
  final Value<String> id;
  final Value<String?> remoteId;
  final Value<String> customerName;
  final Value<String> phoneNumber;
  final Value<String?> email;
  final Value<String?> gstNumber;
  final Value<String> companyName;
  final Value<String> billingAddress;
  final Value<String> billingCity;
  final Value<String> billingState;
  final Value<String> billingPincode;
  final Value<bool> sameAsBilling;
  final Value<String> shippingAddress;
  final Value<String> shippingCity;
  final Value<String> shippingState;
  final Value<String> shippingPincode;
  final Value<String?> notes;
  final Value<double> totalAmount;
  final Value<double> discountPercentage;
  final Value<QuotationStatus> status;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const QuotationsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.customerName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.gstNumber = const Value.absent(),
    this.companyName = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingState = const Value.absent(),
    this.billingPincode = const Value.absent(),
    this.sameAsBilling = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.shippingCity = const Value.absent(),
    this.shippingState = const Value.absent(),
    this.shippingPincode = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuotationsCompanion.insert({
    required String id,
    this.remoteId = const Value.absent(),
    required String customerName,
    required String phoneNumber,
    this.email = const Value.absent(),
    this.gstNumber = const Value.absent(),
    this.companyName = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingState = const Value.absent(),
    this.billingPincode = const Value.absent(),
    this.sameAsBilling = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.shippingCity = const Value.absent(),
    this.shippingState = const Value.absent(),
    this.shippingPincode = const Value.absent(),
    this.notes = const Value.absent(),
    required double totalAmount,
    this.discountPercentage = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        customerName = Value(customerName),
        phoneNumber = Value(phoneNumber),
        totalAmount = Value(totalAmount);
  static Insertable<Quotation> custom({
    Expression<String>? id,
    Expression<String>? remoteId,
    Expression<String>? customerName,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? gstNumber,
    Expression<String>? companyName,
    Expression<String>? billingAddress,
    Expression<String>? billingCity,
    Expression<String>? billingState,
    Expression<String>? billingPincode,
    Expression<bool>? sameAsBilling,
    Expression<String>? shippingAddress,
    Expression<String>? shippingCity,
    Expression<String>? shippingState,
    Expression<String>? shippingPincode,
    Expression<String>? notes,
    Expression<double>? totalAmount,
    Expression<double>? discountPercentage,
    Expression<int>? status,
    Expression<int>? syncStatus,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (customerName != null) 'customer_name': customerName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (gstNumber != null) 'gst_number': gstNumber,
      if (companyName != null) 'company_name': companyName,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (billingCity != null) 'billing_city': billingCity,
      if (billingState != null) 'billing_state': billingState,
      if (billingPincode != null) 'billing_pincode': billingPincode,
      if (sameAsBilling != null) 'same_as_billing': sameAsBilling,
      if (shippingAddress != null) 'shipping_address': shippingAddress,
      if (shippingCity != null) 'shipping_city': shippingCity,
      if (shippingState != null) 'shipping_state': shippingState,
      if (shippingPincode != null) 'shipping_pincode': shippingPincode,
      if (notes != null) 'notes': notes,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (status != null) 'status': status,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuotationsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? remoteId,
      Value<String>? customerName,
      Value<String>? phoneNumber,
      Value<String?>? email,
      Value<String?>? gstNumber,
      Value<String>? companyName,
      Value<String>? billingAddress,
      Value<String>? billingCity,
      Value<String>? billingState,
      Value<String>? billingPincode,
      Value<bool>? sameAsBilling,
      Value<String>? shippingAddress,
      Value<String>? shippingCity,
      Value<String>? shippingState,
      Value<String>? shippingPincode,
      Value<String?>? notes,
      Value<double>? totalAmount,
      Value<double>? discountPercentage,
      Value<QuotationStatus>? status,
      Value<SyncStatus>? syncStatus,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return QuotationsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gstNumber: gstNumber ?? this.gstNumber,
      companyName: companyName ?? this.companyName,
      billingAddress: billingAddress ?? this.billingAddress,
      billingCity: billingCity ?? this.billingCity,
      billingState: billingState ?? this.billingState,
      billingPincode: billingPincode ?? this.billingPincode,
      sameAsBilling: sameAsBilling ?? this.sameAsBilling,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      shippingCity: shippingCity ?? this.shippingCity,
      shippingState: shippingState ?? this.shippingState,
      shippingPincode: shippingPincode ?? this.shippingPincode,
      notes: notes ?? this.notes,
      totalAmount: totalAmount ?? this.totalAmount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gstNumber.present) {
      map['gst_number'] = Variable<String>(gstNumber.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (billingCity.present) {
      map['billing_city'] = Variable<String>(billingCity.value);
    }
    if (billingState.present) {
      map['billing_state'] = Variable<String>(billingState.value);
    }
    if (billingPincode.present) {
      map['billing_pincode'] = Variable<String>(billingPincode.value);
    }
    if (sameAsBilling.present) {
      map['same_as_billing'] = Variable<bool>(sameAsBilling.value);
    }
    if (shippingAddress.present) {
      map['shipping_address'] = Variable<String>(shippingAddress.value);
    }
    if (shippingCity.present) {
      map['shipping_city'] = Variable<String>(shippingCity.value);
    }
    if (shippingState.present) {
      map['shipping_state'] = Variable<String>(shippingState.value);
    }
    if (shippingPincode.present) {
      map['shipping_pincode'] = Variable<String>(shippingPincode.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (status.present) {
      map['status'] =
          Variable<int>($QuotationsTable.$converterstatus.toSql(status.value));
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<int>(
          $QuotationsTable.$convertersyncStatus.toSql(syncStatus.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotationsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('customerName: $customerName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('gstNumber: $gstNumber, ')
          ..write('companyName: $companyName, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingState: $billingState, ')
          ..write('billingPincode: $billingPincode, ')
          ..write('sameAsBilling: $sameAsBilling, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('shippingCity: $shippingCity, ')
          ..write('shippingState: $shippingState, ')
          ..write('shippingPincode: $shippingPincode, ')
          ..write('notes: $notes, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuotationItemsTable extends QuotationItems
    with TableInfo<$QuotationItemsTable, QuotationItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotationItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _quotationIdMeta =
      const VerificationMeta('quotationId');
  @override
  late final GeneratedColumn<String> quotationId = GeneratedColumn<String>(
      'quotation_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES quotations(id) ON DELETE CASCADE');
  static const VerificationMeta _productModelMeta =
      const VerificationMeta('productModel');
  @override
  late final GeneratedColumn<String> productModel = GeneratedColumn<String>(
      'product_model', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (model)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceAtTimeOfSaleMeta =
      const VerificationMeta('priceAtTimeOfSale');
  @override
  late final GeneratedColumn<double> priceAtTimeOfSale =
      GeneratedColumn<double>('price_at_time_of_sale', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [localId, quotationId, productModel, quantity, priceAtTimeOfSale];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotation_items';
  @override
  VerificationContext validateIntegrity(Insertable<QuotationItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('quotation_id')) {
      context.handle(
          _quotationIdMeta,
          quotationId.isAcceptableOrUnknown(
              data['quotation_id']!, _quotationIdMeta));
    } else if (isInserting) {
      context.missing(_quotationIdMeta);
    }
    if (data.containsKey('product_model')) {
      context.handle(
          _productModelMeta,
          productModel.isAcceptableOrUnknown(
              data['product_model']!, _productModelMeta));
    } else if (isInserting) {
      context.missing(_productModelMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price_at_time_of_sale')) {
      context.handle(
          _priceAtTimeOfSaleMeta,
          priceAtTimeOfSale.isAcceptableOrUnknown(
              data['price_at_time_of_sale']!, _priceAtTimeOfSaleMeta));
    } else if (isInserting) {
      context.missing(_priceAtTimeOfSaleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  QuotationItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuotationItem(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      quotationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quotation_id'])!,
      productModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_model'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      priceAtTimeOfSale: attachedDatabase.typeMapping.read(DriftSqlType.double,
          data['${effectivePrefix}price_at_time_of_sale'])!,
    );
  }

  @override
  $QuotationItemsTable createAlias(String alias) {
    return $QuotationItemsTable(attachedDatabase, alias);
  }
}

class QuotationItem extends DataClass implements Insertable<QuotationItem> {
  final int localId;
  final String quotationId;
  final String productModel;
  final int quantity;
  final double priceAtTimeOfSale;
  const QuotationItem(
      {required this.localId,
      required this.quotationId,
      required this.productModel,
      required this.quantity,
      required this.priceAtTimeOfSale});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['quotation_id'] = Variable<String>(quotationId);
    map['product_model'] = Variable<String>(productModel);
    map['quantity'] = Variable<int>(quantity);
    map['price_at_time_of_sale'] = Variable<double>(priceAtTimeOfSale);
    return map;
  }

  QuotationItemsCompanion toCompanion(bool nullToAbsent) {
    return QuotationItemsCompanion(
      localId: Value(localId),
      quotationId: Value(quotationId),
      productModel: Value(productModel),
      quantity: Value(quantity),
      priceAtTimeOfSale: Value(priceAtTimeOfSale),
    );
  }

  factory QuotationItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuotationItem(
      localId: serializer.fromJson<int>(json['localId']),
      quotationId: serializer.fromJson<String>(json['quotationId']),
      productModel: serializer.fromJson<String>(json['productModel']),
      quantity: serializer.fromJson<int>(json['quantity']),
      priceAtTimeOfSale: serializer.fromJson<double>(json['priceAtTimeOfSale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'quotationId': serializer.toJson<String>(quotationId),
      'productModel': serializer.toJson<String>(productModel),
      'quantity': serializer.toJson<int>(quantity),
      'priceAtTimeOfSale': serializer.toJson<double>(priceAtTimeOfSale),
    };
  }

  QuotationItem copyWith(
          {int? localId,
          String? quotationId,
          String? productModel,
          int? quantity,
          double? priceAtTimeOfSale}) =>
      QuotationItem(
        localId: localId ?? this.localId,
        quotationId: quotationId ?? this.quotationId,
        productModel: productModel ?? this.productModel,
        quantity: quantity ?? this.quantity,
        priceAtTimeOfSale: priceAtTimeOfSale ?? this.priceAtTimeOfSale,
      );
  QuotationItem copyWithCompanion(QuotationItemsCompanion data) {
    return QuotationItem(
      localId: data.localId.present ? data.localId.value : this.localId,
      quotationId:
          data.quotationId.present ? data.quotationId.value : this.quotationId,
      productModel: data.productModel.present
          ? data.productModel.value
          : this.productModel,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      priceAtTimeOfSale: data.priceAtTimeOfSale.present
          ? data.priceAtTimeOfSale.value
          : this.priceAtTimeOfSale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuotationItem(')
          ..write('localId: $localId, ')
          ..write('quotationId: $quotationId, ')
          ..write('productModel: $productModel, ')
          ..write('quantity: $quantity, ')
          ..write('priceAtTimeOfSale: $priceAtTimeOfSale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      localId, quotationId, productModel, quantity, priceAtTimeOfSale);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuotationItem &&
          other.localId == this.localId &&
          other.quotationId == this.quotationId &&
          other.productModel == this.productModel &&
          other.quantity == this.quantity &&
          other.priceAtTimeOfSale == this.priceAtTimeOfSale);
}

class QuotationItemsCompanion extends UpdateCompanion<QuotationItem> {
  final Value<int> localId;
  final Value<String> quotationId;
  final Value<String> productModel;
  final Value<int> quantity;
  final Value<double> priceAtTimeOfSale;
  const QuotationItemsCompanion({
    this.localId = const Value.absent(),
    this.quotationId = const Value.absent(),
    this.productModel = const Value.absent(),
    this.quantity = const Value.absent(),
    this.priceAtTimeOfSale = const Value.absent(),
  });
  QuotationItemsCompanion.insert({
    this.localId = const Value.absent(),
    required String quotationId,
    required String productModel,
    required int quantity,
    required double priceAtTimeOfSale,
  })  : quotationId = Value(quotationId),
        productModel = Value(productModel),
        quantity = Value(quantity),
        priceAtTimeOfSale = Value(priceAtTimeOfSale);
  static Insertable<QuotationItem> custom({
    Expression<int>? localId,
    Expression<String>? quotationId,
    Expression<String>? productModel,
    Expression<int>? quantity,
    Expression<double>? priceAtTimeOfSale,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (quotationId != null) 'quotation_id': quotationId,
      if (productModel != null) 'product_model': productModel,
      if (quantity != null) 'quantity': quantity,
      if (priceAtTimeOfSale != null) 'price_at_time_of_sale': priceAtTimeOfSale,
    });
  }

  QuotationItemsCompanion copyWith(
      {Value<int>? localId,
      Value<String>? quotationId,
      Value<String>? productModel,
      Value<int>? quantity,
      Value<double>? priceAtTimeOfSale}) {
    return QuotationItemsCompanion(
      localId: localId ?? this.localId,
      quotationId: quotationId ?? this.quotationId,
      productModel: productModel ?? this.productModel,
      quantity: quantity ?? this.quantity,
      priceAtTimeOfSale: priceAtTimeOfSale ?? this.priceAtTimeOfSale,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (quotationId.present) {
      map['quotation_id'] = Variable<String>(quotationId.value);
    }
    if (productModel.present) {
      map['product_model'] = Variable<String>(productModel.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (priceAtTimeOfSale.present) {
      map['price_at_time_of_sale'] = Variable<double>(priceAtTimeOfSale.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotationItemsCompanion(')
          ..write('localId: $localId, ')
          ..write('quotationId: $quotationId, ')
          ..write('productModel: $productModel, ')
          ..write('quantity: $quantity, ')
          ..write('priceAtTimeOfSale: $priceAtTimeOfSale')
          ..write(')'))
        .toString();
  }
}

class $DealerProfileTable extends DealerProfile
    with TableInfo<$DealerProfileTable, DealerProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DealerProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gstNumberMeta =
      const VerificationMeta('gstNumber');
  @override
  late final GeneratedColumn<String> gstNumber = GeneratedColumn<String>(
      'gst_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dealerIdMeta =
      const VerificationMeta('dealerId');
  @override
  late final GeneratedColumn<String> dealerId = GeneratedColumn<String>(
      'dealer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        phone,
        name,
        email,
        companyName,
        address,
        gstNumber,
        dealerId,
        profileImage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dealer_profile';
  @override
  VerificationContext validateIntegrity(Insertable<DealerProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('gst_number')) {
      context.handle(_gstNumberMeta,
          gstNumber.isAcceptableOrUnknown(data['gst_number']!, _gstNumberMeta));
    } else if (isInserting) {
      context.missing(_gstNumberMeta);
    }
    if (data.containsKey('dealer_id')) {
      context.handle(_dealerIdMeta,
          dealerId.isAcceptableOrUnknown(data['dealer_id']!, _dealerIdMeta));
    } else if (isInserting) {
      context.missing(_dealerIdMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {phone};
  @override
  DealerProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DealerProfileData(
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      gstNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gst_number'])!,
      dealerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dealer_id'])!,
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image']),
    );
  }

  @override
  $DealerProfileTable createAlias(String alias) {
    return $DealerProfileTable(attachedDatabase, alias);
  }
}

class DealerProfileData extends DataClass
    implements Insertable<DealerProfileData> {
  final String phone;
  final String name;
  final String email;
  final String companyName;
  final String address;
  final String gstNumber;
  final String dealerId;
  final String? profileImage;
  const DealerProfileData(
      {required this.phone,
      required this.name,
      required this.email,
      required this.companyName,
      required this.address,
      required this.gstNumber,
      required this.dealerId,
      this.profileImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['phone'] = Variable<String>(phone);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['company_name'] = Variable<String>(companyName);
    map['address'] = Variable<String>(address);
    map['gst_number'] = Variable<String>(gstNumber);
    map['dealer_id'] = Variable<String>(dealerId);
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    return map;
  }

  DealerProfileCompanion toCompanion(bool nullToAbsent) {
    return DealerProfileCompanion(
      phone: Value(phone),
      name: Value(name),
      email: Value(email),
      companyName: Value(companyName),
      address: Value(address),
      gstNumber: Value(gstNumber),
      dealerId: Value(dealerId),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
    );
  }

  factory DealerProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DealerProfileData(
      phone: serializer.fromJson<String>(json['phone']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      companyName: serializer.fromJson<String>(json['companyName']),
      address: serializer.fromJson<String>(json['address']),
      gstNumber: serializer.fromJson<String>(json['gstNumber']),
      dealerId: serializer.fromJson<String>(json['dealerId']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'phone': serializer.toJson<String>(phone),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'companyName': serializer.toJson<String>(companyName),
      'address': serializer.toJson<String>(address),
      'gstNumber': serializer.toJson<String>(gstNumber),
      'dealerId': serializer.toJson<String>(dealerId),
      'profileImage': serializer.toJson<String?>(profileImage),
    };
  }

  DealerProfileData copyWith(
          {String? phone,
          String? name,
          String? email,
          String? companyName,
          String? address,
          String? gstNumber,
          String? dealerId,
          Value<String?> profileImage = const Value.absent()}) =>
      DealerProfileData(
        phone: phone ?? this.phone,
        name: name ?? this.name,
        email: email ?? this.email,
        companyName: companyName ?? this.companyName,
        address: address ?? this.address,
        gstNumber: gstNumber ?? this.gstNumber,
        dealerId: dealerId ?? this.dealerId,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
      );
  DealerProfileData copyWithCompanion(DealerProfileCompanion data) {
    return DealerProfileData(
      phone: data.phone.present ? data.phone.value : this.phone,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      address: data.address.present ? data.address.value : this.address,
      gstNumber: data.gstNumber.present ? data.gstNumber.value : this.gstNumber,
      dealerId: data.dealerId.present ? data.dealerId.value : this.dealerId,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DealerProfileData(')
          ..write('phone: $phone, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('companyName: $companyName, ')
          ..write('address: $address, ')
          ..write('gstNumber: $gstNumber, ')
          ..write('dealerId: $dealerId, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(phone, name, email, companyName, address,
      gstNumber, dealerId, profileImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DealerProfileData &&
          other.phone == this.phone &&
          other.name == this.name &&
          other.email == this.email &&
          other.companyName == this.companyName &&
          other.address == this.address &&
          other.gstNumber == this.gstNumber &&
          other.dealerId == this.dealerId &&
          other.profileImage == this.profileImage);
}

class DealerProfileCompanion extends UpdateCompanion<DealerProfileData> {
  final Value<String> phone;
  final Value<String> name;
  final Value<String> email;
  final Value<String> companyName;
  final Value<String> address;
  final Value<String> gstNumber;
  final Value<String> dealerId;
  final Value<String?> profileImage;
  final Value<int> rowid;
  const DealerProfileCompanion({
    this.phone = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.companyName = const Value.absent(),
    this.address = const Value.absent(),
    this.gstNumber = const Value.absent(),
    this.dealerId = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DealerProfileCompanion.insert({
    required String phone,
    required String name,
    required String email,
    required String companyName,
    required String address,
    required String gstNumber,
    required String dealerId,
    this.profileImage = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : phone = Value(phone),
        name = Value(name),
        email = Value(email),
        companyName = Value(companyName),
        address = Value(address),
        gstNumber = Value(gstNumber),
        dealerId = Value(dealerId);
  static Insertable<DealerProfileData> custom({
    Expression<String>? phone,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? companyName,
    Expression<String>? address,
    Expression<String>? gstNumber,
    Expression<String>? dealerId,
    Expression<String>? profileImage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (companyName != null) 'company_name': companyName,
      if (address != null) 'address': address,
      if (gstNumber != null) 'gst_number': gstNumber,
      if (dealerId != null) 'dealer_id': dealerId,
      if (profileImage != null) 'profile_image': profileImage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DealerProfileCompanion copyWith(
      {Value<String>? phone,
      Value<String>? name,
      Value<String>? email,
      Value<String>? companyName,
      Value<String>? address,
      Value<String>? gstNumber,
      Value<String>? dealerId,
      Value<String?>? profileImage,
      Value<int>? rowid}) {
    return DealerProfileCompanion(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      gstNumber: gstNumber ?? this.gstNumber,
      dealerId: dealerId ?? this.dealerId,
      profileImage: profileImage ?? this.profileImage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (gstNumber.present) {
      map['gst_number'] = Variable<String>(gstNumber.value);
    }
    if (dealerId.present) {
      map['dealer_id'] = Variable<String>(dealerId.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DealerProfileCompanion(')
          ..write('phone: $phone, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('companyName: $companyName, ')
          ..write('address: $address, ')
          ..write('gstNumber: $gstNumber, ')
          ..write('dealerId: $dealerId, ')
          ..write('profileImage: $profileImage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $QuotationsTable quotations = $QuotationsTable(this);
  late final $QuotationItemsTable quotationItems = $QuotationItemsTable(this);
  late final $DealerProfileTable dealerProfile = $DealerProfileTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, quotations, quotationItems, dealerProfile];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('quotations',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quotation_items', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String model,
  required String name,
  required String description,
  required double endUserPrice,
  required double mrp,
  required String imagePath,
  required String category,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> model,
  Value<String> name,
  Value<String> description,
  Value<double> endUserPrice,
  Value<double> mrp,
  Value<String> imagePath,
  Value<String> category,
  Value<int> rowid,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuotationItemsTable, List<QuotationItem>>
      _quotationItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.quotationItems,
              aliasName: $_aliasNameGenerator(
                  db.products.model, db.quotationItems.productModel));

  $$QuotationItemsTableProcessedTableManager get quotationItemsRefs {
    final manager = $$QuotationItemsTableTableManager($_db, $_db.quotationItems)
        .filter((f) =>
            f.productModel.model.sqlEquals($_itemColumn<String>('model')!));

    final cache = $_typedResult.readTableOrNull(_quotationItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get endUserPrice => $composableBuilder(
      column: $table.endUserPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get mrp => $composableBuilder(
      column: $table.mrp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  Expression<bool> quotationItemsRefs(
      Expression<bool> Function($$QuotationItemsTableFilterComposer f) f) {
    final $$QuotationItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.model,
        referencedTable: $db.quotationItems,
        getReferencedColumn: (t) => t.productModel,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationItemsTableFilterComposer(
              $db: $db,
              $table: $db.quotationItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get endUserPrice => $composableBuilder(
      column: $table.endUserPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get mrp => $composableBuilder(
      column: $table.mrp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get endUserPrice => $composableBuilder(
      column: $table.endUserPrice, builder: (column) => column);

  GeneratedColumn<double> get mrp =>
      $composableBuilder(column: $table.mrp, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> quotationItemsRefs<T extends Object>(
      Expression<T> Function($$QuotationItemsTableAnnotationComposer a) f) {
    final $$QuotationItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.model,
        referencedTable: $db.quotationItems,
        getReferencedColumn: (t) => t.productModel,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.quotationItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool quotationItemsRefs})> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> model = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> endUserPrice = const Value.absent(),
            Value<double> mrp = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            model: model,
            name: name,
            description: description,
            endUserPrice: endUserPrice,
            mrp: mrp,
            imagePath: imagePath,
            category: category,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String model,
            required String name,
            required String description,
            required double endUserPrice,
            required double mrp,
            required String imagePath,
            required String category,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            model: model,
            name: name,
            description: description,
            endUserPrice: endUserPrice,
            mrp: mrp,
            imagePath: imagePath,
            category: category,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({quotationItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (quotationItemsRefs) db.quotationItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (quotationItemsRefs)
                    await $_getPrefetchedData<Product, $ProductsTable,
                            QuotationItem>(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._quotationItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .quotationItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productModel == item.model),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool quotationItemsRefs})>;
typedef $$QuotationsTableCreateCompanionBuilder = QuotationsCompanion Function({
  required String id,
  Value<String?> remoteId,
  required String customerName,
  required String phoneNumber,
  Value<String?> email,
  Value<String?> gstNumber,
  Value<String> companyName,
  Value<String> billingAddress,
  Value<String> billingCity,
  Value<String> billingState,
  Value<String> billingPincode,
  Value<bool> sameAsBilling,
  Value<String> shippingAddress,
  Value<String> shippingCity,
  Value<String> shippingState,
  Value<String> shippingPincode,
  Value<String?> notes,
  required double totalAmount,
  Value<double> discountPercentage,
  Value<QuotationStatus> status,
  Value<SyncStatus> syncStatus,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$QuotationsTableUpdateCompanionBuilder = QuotationsCompanion Function({
  Value<String> id,
  Value<String?> remoteId,
  Value<String> customerName,
  Value<String> phoneNumber,
  Value<String?> email,
  Value<String?> gstNumber,
  Value<String> companyName,
  Value<String> billingAddress,
  Value<String> billingCity,
  Value<String> billingState,
  Value<String> billingPincode,
  Value<bool> sameAsBilling,
  Value<String> shippingAddress,
  Value<String> shippingCity,
  Value<String> shippingState,
  Value<String> shippingPincode,
  Value<String?> notes,
  Value<double> totalAmount,
  Value<double> discountPercentage,
  Value<QuotationStatus> status,
  Value<SyncStatus> syncStatus,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$QuotationsTableReferences
    extends BaseReferences<_$AppDatabase, $QuotationsTable, Quotation> {
  $$QuotationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuotationItemsTable, List<QuotationItem>>
      _quotationItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.quotationItems,
              aliasName: $_aliasNameGenerator(
                  db.quotations.id, db.quotationItems.quotationId));

  $$QuotationItemsTableProcessedTableManager get quotationItemsRefs {
    final manager = $$QuotationItemsTableTableManager($_db, $_db.quotationItems)
        .filter((f) => f.quotationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_quotationItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuotationsTableFilterComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gstNumber => $composableBuilder(
      column: $table.gstNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingState => $composableBuilder(
      column: $table.billingState, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingPincode => $composableBuilder(
      column: $table.billingPincode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get sameAsBilling => $composableBuilder(
      column: $table.sameAsBilling, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingCity => $composableBuilder(
      column: $table.shippingCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingState => $composableBuilder(
      column: $table.shippingState, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingPincode => $composableBuilder(
      column: $table.shippingPincode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<QuotationStatus, QuotationStatus, int>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, int> get syncStatus =>
      $composableBuilder(
          column: $table.syncStatus,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> quotationItemsRefs(
      Expression<bool> Function($$QuotationItemsTableFilterComposer f) f) {
    final $$QuotationItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quotationItems,
        getReferencedColumn: (t) => t.quotationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationItemsTableFilterComposer(
              $db: $db,
              $table: $db.quotationItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuotationsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gstNumber => $composableBuilder(
      column: $table.gstNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingState => $composableBuilder(
      column: $table.billingState,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingPincode => $composableBuilder(
      column: $table.billingPincode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get sameAsBilling => $composableBuilder(
      column: $table.sameAsBilling,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingCity => $composableBuilder(
      column: $table.shippingCity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingState => $composableBuilder(
      column: $table.shippingState,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingPincode => $composableBuilder(
      column: $table.shippingPincode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$QuotationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gstNumber =>
      $composableBuilder(column: $table.gstNumber, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  GeneratedColumn<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => column);

  GeneratedColumn<String> get billingState => $composableBuilder(
      column: $table.billingState, builder: (column) => column);

  GeneratedColumn<String> get billingPincode => $composableBuilder(
      column: $table.billingPincode, builder: (column) => column);

  GeneratedColumn<bool> get sameAsBilling => $composableBuilder(
      column: $table.sameAsBilling, builder: (column) => column);

  GeneratedColumn<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress, builder: (column) => column);

  GeneratedColumn<String> get shippingCity => $composableBuilder(
      column: $table.shippingCity, builder: (column) => column);

  GeneratedColumn<String> get shippingState => $composableBuilder(
      column: $table.shippingState, builder: (column) => column);

  GeneratedColumn<String> get shippingPincode => $composableBuilder(
      column: $table.shippingPincode, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage, builder: (column) => column);

  GeneratedColumnWithTypeConverter<QuotationStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, int> get syncStatus =>
      $composableBuilder(
          column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> quotationItemsRefs<T extends Object>(
      Expression<T> Function($$QuotationItemsTableAnnotationComposer a) f) {
    final $$QuotationItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quotationItems,
        getReferencedColumn: (t) => t.quotationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.quotationItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuotationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuotationsTable,
    Quotation,
    $$QuotationsTableFilterComposer,
    $$QuotationsTableOrderingComposer,
    $$QuotationsTableAnnotationComposer,
    $$QuotationsTableCreateCompanionBuilder,
    $$QuotationsTableUpdateCompanionBuilder,
    (Quotation, $$QuotationsTableReferences),
    Quotation,
    PrefetchHooks Function({bool quotationItemsRefs})> {
  $$QuotationsTableTableManager(_$AppDatabase db, $QuotationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<String> customerName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> gstNumber = const Value.absent(),
            Value<String> companyName = const Value.absent(),
            Value<String> billingAddress = const Value.absent(),
            Value<String> billingCity = const Value.absent(),
            Value<String> billingState = const Value.absent(),
            Value<String> billingPincode = const Value.absent(),
            Value<bool> sameAsBilling = const Value.absent(),
            Value<String> shippingAddress = const Value.absent(),
            Value<String> shippingCity = const Value.absent(),
            Value<String> shippingState = const Value.absent(),
            Value<String> shippingPincode = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<double> discountPercentage = const Value.absent(),
            Value<QuotationStatus> status = const Value.absent(),
            Value<SyncStatus> syncStatus = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuotationsCompanion(
            id: id,
            remoteId: remoteId,
            customerName: customerName,
            phoneNumber: phoneNumber,
            email: email,
            gstNumber: gstNumber,
            companyName: companyName,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingState: billingState,
            billingPincode: billingPincode,
            sameAsBilling: sameAsBilling,
            shippingAddress: shippingAddress,
            shippingCity: shippingCity,
            shippingState: shippingState,
            shippingPincode: shippingPincode,
            notes: notes,
            totalAmount: totalAmount,
            discountPercentage: discountPercentage,
            status: status,
            syncStatus: syncStatus,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> remoteId = const Value.absent(),
            required String customerName,
            required String phoneNumber,
            Value<String?> email = const Value.absent(),
            Value<String?> gstNumber = const Value.absent(),
            Value<String> companyName = const Value.absent(),
            Value<String> billingAddress = const Value.absent(),
            Value<String> billingCity = const Value.absent(),
            Value<String> billingState = const Value.absent(),
            Value<String> billingPincode = const Value.absent(),
            Value<bool> sameAsBilling = const Value.absent(),
            Value<String> shippingAddress = const Value.absent(),
            Value<String> shippingCity = const Value.absent(),
            Value<String> shippingState = const Value.absent(),
            Value<String> shippingPincode = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required double totalAmount,
            Value<double> discountPercentage = const Value.absent(),
            Value<QuotationStatus> status = const Value.absent(),
            Value<SyncStatus> syncStatus = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuotationsCompanion.insert(
            id: id,
            remoteId: remoteId,
            customerName: customerName,
            phoneNumber: phoneNumber,
            email: email,
            gstNumber: gstNumber,
            companyName: companyName,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingState: billingState,
            billingPincode: billingPincode,
            sameAsBilling: sameAsBilling,
            shippingAddress: shippingAddress,
            shippingCity: shippingCity,
            shippingState: shippingState,
            shippingPincode: shippingPincode,
            notes: notes,
            totalAmount: totalAmount,
            discountPercentage: discountPercentage,
            status: status,
            syncStatus: syncStatus,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuotationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({quotationItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (quotationItemsRefs) db.quotationItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (quotationItemsRefs)
                    await $_getPrefetchedData<Quotation, $QuotationsTable,
                            QuotationItem>(
                        currentTable: table,
                        referencedTable: $$QuotationsTableReferences
                            ._quotationItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuotationsTableReferences(db, table, p0)
                                .quotationItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.quotationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuotationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuotationsTable,
    Quotation,
    $$QuotationsTableFilterComposer,
    $$QuotationsTableOrderingComposer,
    $$QuotationsTableAnnotationComposer,
    $$QuotationsTableCreateCompanionBuilder,
    $$QuotationsTableUpdateCompanionBuilder,
    (Quotation, $$QuotationsTableReferences),
    Quotation,
    PrefetchHooks Function({bool quotationItemsRefs})>;
typedef $$QuotationItemsTableCreateCompanionBuilder = QuotationItemsCompanion
    Function({
  Value<int> localId,
  required String quotationId,
  required String productModel,
  required int quantity,
  required double priceAtTimeOfSale,
});
typedef $$QuotationItemsTableUpdateCompanionBuilder = QuotationItemsCompanion
    Function({
  Value<int> localId,
  Value<String> quotationId,
  Value<String> productModel,
  Value<int> quantity,
  Value<double> priceAtTimeOfSale,
});

final class $$QuotationItemsTableReferences
    extends BaseReferences<_$AppDatabase, $QuotationItemsTable, QuotationItem> {
  $$QuotationItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $QuotationsTable _quotationIdTable(_$AppDatabase db) =>
      db.quotations.createAlias($_aliasNameGenerator(
          db.quotationItems.quotationId, db.quotations.id));

  $$QuotationsTableProcessedTableManager get quotationId {
    final $_column = $_itemColumn<String>('quotation_id')!;

    final manager = $$QuotationsTableTableManager($_db, $_db.quotations)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_quotationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductsTable _productModelTable(_$AppDatabase db) =>
      db.products.createAlias($_aliasNameGenerator(
          db.quotationItems.productModel, db.products.model));

  $$ProductsTableProcessedTableManager get productModel {
    final $_column = $_itemColumn<String>('product_model')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.model.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productModelTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$QuotationItemsTableFilterComposer
    extends Composer<_$AppDatabase, $QuotationItemsTable> {
  $$QuotationItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceAtTimeOfSale => $composableBuilder(
      column: $table.priceAtTimeOfSale,
      builder: (column) => ColumnFilters(column));

  $$QuotationsTableFilterComposer get quotationId {
    final $$QuotationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.quotationId,
        referencedTable: $db.quotations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationsTableFilterComposer(
              $db: $db,
              $table: $db.quotations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableFilterComposer get productModel {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productModel,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.model,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuotationItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotationItemsTable> {
  $$QuotationItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceAtTimeOfSale => $composableBuilder(
      column: $table.priceAtTimeOfSale,
      builder: (column) => ColumnOrderings(column));

  $$QuotationsTableOrderingComposer get quotationId {
    final $$QuotationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.quotationId,
        referencedTable: $db.quotations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationsTableOrderingComposer(
              $db: $db,
              $table: $db.quotations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableOrderingComposer get productModel {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productModel,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.model,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuotationItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotationItemsTable> {
  $$QuotationItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get priceAtTimeOfSale => $composableBuilder(
      column: $table.priceAtTimeOfSale, builder: (column) => column);

  $$QuotationsTableAnnotationComposer get quotationId {
    final $$QuotationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.quotationId,
        referencedTable: $db.quotations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuotationsTableAnnotationComposer(
              $db: $db,
              $table: $db.quotations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableAnnotationComposer get productModel {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productModel,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.model,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuotationItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuotationItemsTable,
    QuotationItem,
    $$QuotationItemsTableFilterComposer,
    $$QuotationItemsTableOrderingComposer,
    $$QuotationItemsTableAnnotationComposer,
    $$QuotationItemsTableCreateCompanionBuilder,
    $$QuotationItemsTableUpdateCompanionBuilder,
    (QuotationItem, $$QuotationItemsTableReferences),
    QuotationItem,
    PrefetchHooks Function({bool quotationId, bool productModel})> {
  $$QuotationItemsTableTableManager(
      _$AppDatabase db, $QuotationItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotationItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotationItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotationItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> quotationId = const Value.absent(),
            Value<String> productModel = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> priceAtTimeOfSale = const Value.absent(),
          }) =>
              QuotationItemsCompanion(
            localId: localId,
            quotationId: quotationId,
            productModel: productModel,
            quantity: quantity,
            priceAtTimeOfSale: priceAtTimeOfSale,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            required String quotationId,
            required String productModel,
            required int quantity,
            required double priceAtTimeOfSale,
          }) =>
              QuotationItemsCompanion.insert(
            localId: localId,
            quotationId: quotationId,
            productModel: productModel,
            quantity: quantity,
            priceAtTimeOfSale: priceAtTimeOfSale,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuotationItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({quotationId = false, productModel = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (quotationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.quotationId,
                    referencedTable:
                        $$QuotationItemsTableReferences._quotationIdTable(db),
                    referencedColumn: $$QuotationItemsTableReferences
                        ._quotationIdTable(db)
                        .id,
                  ) as T;
                }
                if (productModel) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productModel,
                    referencedTable:
                        $$QuotationItemsTableReferences._productModelTable(db),
                    referencedColumn: $$QuotationItemsTableReferences
                        ._productModelTable(db)
                        .model,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$QuotationItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuotationItemsTable,
    QuotationItem,
    $$QuotationItemsTableFilterComposer,
    $$QuotationItemsTableOrderingComposer,
    $$QuotationItemsTableAnnotationComposer,
    $$QuotationItemsTableCreateCompanionBuilder,
    $$QuotationItemsTableUpdateCompanionBuilder,
    (QuotationItem, $$QuotationItemsTableReferences),
    QuotationItem,
    PrefetchHooks Function({bool quotationId, bool productModel})>;
typedef $$DealerProfileTableCreateCompanionBuilder = DealerProfileCompanion
    Function({
  required String phone,
  required String name,
  required String email,
  required String companyName,
  required String address,
  required String gstNumber,
  required String dealerId,
  Value<String?> profileImage,
  Value<int> rowid,
});
typedef $$DealerProfileTableUpdateCompanionBuilder = DealerProfileCompanion
    Function({
  Value<String> phone,
  Value<String> name,
  Value<String> email,
  Value<String> companyName,
  Value<String> address,
  Value<String> gstNumber,
  Value<String> dealerId,
  Value<String?> profileImage,
  Value<int> rowid,
});

class $$DealerProfileTableFilterComposer
    extends Composer<_$AppDatabase, $DealerProfileTable> {
  $$DealerProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gstNumber => $composableBuilder(
      column: $table.gstNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dealerId => $composableBuilder(
      column: $table.dealerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));
}

class $$DealerProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $DealerProfileTable> {
  $$DealerProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gstNumber => $composableBuilder(
      column: $table.gstNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dealerId => $composableBuilder(
      column: $table.dealerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));
}

class $$DealerProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $DealerProfileTable> {
  $$DealerProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get gstNumber =>
      $composableBuilder(column: $table.gstNumber, builder: (column) => column);

  GeneratedColumn<String> get dealerId =>
      $composableBuilder(column: $table.dealerId, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);
}

class $$DealerProfileTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DealerProfileTable,
    DealerProfileData,
    $$DealerProfileTableFilterComposer,
    $$DealerProfileTableOrderingComposer,
    $$DealerProfileTableAnnotationComposer,
    $$DealerProfileTableCreateCompanionBuilder,
    $$DealerProfileTableUpdateCompanionBuilder,
    (
      DealerProfileData,
      BaseReferences<_$AppDatabase, $DealerProfileTable, DealerProfileData>
    ),
    DealerProfileData,
    PrefetchHooks Function()> {
  $$DealerProfileTableTableManager(_$AppDatabase db, $DealerProfileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DealerProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DealerProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DealerProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> phone = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> companyName = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> gstNumber = const Value.absent(),
            Value<String> dealerId = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DealerProfileCompanion(
            phone: phone,
            name: name,
            email: email,
            companyName: companyName,
            address: address,
            gstNumber: gstNumber,
            dealerId: dealerId,
            profileImage: profileImage,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String phone,
            required String name,
            required String email,
            required String companyName,
            required String address,
            required String gstNumber,
            required String dealerId,
            Value<String?> profileImage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DealerProfileCompanion.insert(
            phone: phone,
            name: name,
            email: email,
            companyName: companyName,
            address: address,
            gstNumber: gstNumber,
            dealerId: dealerId,
            profileImage: profileImage,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DealerProfileTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DealerProfileTable,
    DealerProfileData,
    $$DealerProfileTableFilterComposer,
    $$DealerProfileTableOrderingComposer,
    $$DealerProfileTableAnnotationComposer,
    $$DealerProfileTableCreateCompanionBuilder,
    $$DealerProfileTableUpdateCompanionBuilder,
    (
      DealerProfileData,
      BaseReferences<_$AppDatabase, $DealerProfileTable, DealerProfileData>
    ),
    DealerProfileData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$QuotationsTableTableManager get quotations =>
      $$QuotationsTableTableManager(_db, _db.quotations);
  $$QuotationItemsTableTableManager get quotationItems =>
      $$QuotationItemsTableTableManager(_db, _db.quotationItems);
  $$DealerProfileTableTableManager get dealerProfile =>
      $$DealerProfileTableTableManager(_db, _db.dealerProfile);
}
