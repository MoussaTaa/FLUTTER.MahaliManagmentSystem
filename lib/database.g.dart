// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 4,
      maxTextLength: 6,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    gender,
    isPinned,
    phoneNumber,
    totalAmount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String fullName;
  final String gender;
  final bool isPinned;
  final String? phoneNumber;
  final double totalAmount;
  final DateTime createdAt;
  const Customer({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.isPinned,
    this.phoneNumber,
    required this.totalAmount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['gender'] = Variable<String>(gender);
    map['is_pinned'] = Variable<bool>(isPinned);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['total_amount'] = Variable<double>(totalAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      gender: Value(gender),
      isPinned: Value(isPinned),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      totalAmount: Value(totalAmount),
      createdAt: Value(createdAt),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      gender: serializer.fromJson<String>(json['gender']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'gender': serializer.toJson<String>(gender),
      'isPinned': serializer.toJson<bool>(isPinned),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Customer copyWith({
    int? id,
    String? fullName,
    String? gender,
    bool? isPinned,
    Value<String?> phoneNumber = const Value.absent(),
    double? totalAmount,
    DateTime? createdAt,
  }) => Customer(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    gender: gender ?? this.gender,
    isPinned: isPinned ?? this.isPinned,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    totalAmount: totalAmount ?? this.totalAmount,
    createdAt: createdAt ?? this.createdAt,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      gender: data.gender.present ? data.gender.value : this.gender,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('isPinned: $isPinned, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    gender,
    isPinned,
    phoneNumber,
    totalAmount,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.gender == this.gender &&
          other.isPinned == this.isPinned &&
          other.phoneNumber == this.phoneNumber &&
          other.totalAmount == this.totalAmount &&
          other.createdAt == this.createdAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> gender;
  final Value<bool> isPinned;
  final Value<String?> phoneNumber;
  final Value<double> totalAmount;
  final Value<DateTime> createdAt;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.gender = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String gender,
    this.isPinned = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : fullName = Value(fullName),
       gender = Value(gender);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? gender,
    Expression<bool>? isPinned,
    Expression<String>? phoneNumber,
    Expression<double>? totalAmount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (gender != null) 'gender': gender,
      if (isPinned != null) 'is_pinned': isPinned,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<String>? gender,
    Value<bool>? isPinned,
    Value<String?>? phoneNumber,
    Value<double>? totalAmount,
    Value<DateTime>? createdAt,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      isPinned: isPinned ?? this.isPinned,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      totalAmount: totalAmount ?? this.totalAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('isPinned: $isPinned, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PackagesTable extends Packages with TableInfo<$PackagesTable, Package> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _packageDateMeta = const VerificationMeta(
    'packageDate',
  );
  @override
  late final GeneratedColumn<DateTime> packageDate = GeneratedColumn<DateTime>(
    'package_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _totalPaymentMeta = const VerificationMeta(
    'totalPayment',
  );
  @override
  late final GeneratedColumn<double> totalPayment = GeneratedColumn<double>(
    'total_payment',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('created'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    packageDate,
    totalPayment,
    totalAmount,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'packages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Package> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('package_date')) {
      context.handle(
        _packageDateMeta,
        packageDate.isAcceptableOrUnknown(
          data['package_date']!,
          _packageDateMeta,
        ),
      );
    }
    if (data.containsKey('total_payment')) {
      context.handle(
        _totalPaymentMeta,
        totalPayment.isAcceptableOrUnknown(
          data['total_payment']!,
          _totalPaymentMeta,
        ),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Package map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Package(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
      packageDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}package_date'],
      )!,
      totalPayment: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_payment'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PackagesTable createAlias(String alias) {
    return $PackagesTable(attachedDatabase, alias);
  }
}

class Package extends DataClass implements Insertable<Package> {
  final int id;
  final int customerId;
  final DateTime packageDate;
  final double totalPayment;
  final double totalAmount;
  final String status;
  const Package({
    required this.id,
    required this.customerId,
    required this.packageDate,
    required this.totalPayment,
    required this.totalAmount,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['package_date'] = Variable<DateTime>(packageDate);
    map['total_payment'] = Variable<double>(totalPayment);
    map['total_amount'] = Variable<double>(totalAmount);
    map['status'] = Variable<String>(status);
    return map;
  }

  PackagesCompanion toCompanion(bool nullToAbsent) {
    return PackagesCompanion(
      id: Value(id),
      customerId: Value(customerId),
      packageDate: Value(packageDate),
      totalPayment: Value(totalPayment),
      totalAmount: Value(totalAmount),
      status: Value(status),
    );
  }

  factory Package.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Package(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      packageDate: serializer.fromJson<DateTime>(json['packageDate']),
      totalPayment: serializer.fromJson<double>(json['totalPayment']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'packageDate': serializer.toJson<DateTime>(packageDate),
      'totalPayment': serializer.toJson<double>(totalPayment),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'status': serializer.toJson<String>(status),
    };
  }

  Package copyWith({
    int? id,
    int? customerId,
    DateTime? packageDate,
    double? totalPayment,
    double? totalAmount,
    String? status,
  }) => Package(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    packageDate: packageDate ?? this.packageDate,
    totalPayment: totalPayment ?? this.totalPayment,
    totalAmount: totalAmount ?? this.totalAmount,
    status: status ?? this.status,
  );
  Package copyWithCompanion(PackagesCompanion data) {
    return Package(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      packageDate: data.packageDate.present
          ? data.packageDate.value
          : this.packageDate,
      totalPayment: data.totalPayment.present
          ? data.totalPayment.value
          : this.totalPayment,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Package(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('packageDate: $packageDate, ')
          ..write('totalPayment: $totalPayment, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    customerId,
    packageDate,
    totalPayment,
    totalAmount,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Package &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.packageDate == this.packageDate &&
          other.totalPayment == this.totalPayment &&
          other.totalAmount == this.totalAmount &&
          other.status == this.status);
}

class PackagesCompanion extends UpdateCompanion<Package> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<DateTime> packageDate;
  final Value<double> totalPayment;
  final Value<double> totalAmount;
  final Value<String> status;
  const PackagesCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.packageDate = const Value.absent(),
    this.totalPayment = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.status = const Value.absent(),
  });
  PackagesCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    this.packageDate = const Value.absent(),
    this.totalPayment = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.status = const Value.absent(),
  }) : customerId = Value(customerId);
  static Insertable<Package> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<DateTime>? packageDate,
    Expression<double>? totalPayment,
    Expression<double>? totalAmount,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (packageDate != null) 'package_date': packageDate,
      if (totalPayment != null) 'total_payment': totalPayment,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (status != null) 'status': status,
    });
  }

  PackagesCompanion copyWith({
    Value<int>? id,
    Value<int>? customerId,
    Value<DateTime>? packageDate,
    Value<double>? totalPayment,
    Value<double>? totalAmount,
    Value<String>? status,
  }) {
    return PackagesCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      packageDate: packageDate ?? this.packageDate,
      totalPayment: totalPayment ?? this.totalPayment,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (packageDate.present) {
      map['package_date'] = Variable<DateTime>(packageDate.value);
    }
    if (totalPayment.present) {
      map['total_payment'] = Variable<double>(totalPayment.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackagesCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('packageDate: $packageDate, ')
          ..write('totalPayment: $totalPayment, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _packageIdMeta = const VerificationMeta(
    'packageId',
  );
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
    'package_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES packages (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unityMeta = const VerificationMeta('unity');
  @override
  late final GeneratedColumn<String> unity = GeneratedColumn<String>(
    'unity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageId,
    label,
    price,
    quantity,
    unity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<Item> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_id')) {
      context.handle(
        _packageIdMeta,
        packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packageIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unity')) {
      context.handle(
        _unityMeta,
        unity.isAcceptableOrUnknown(data['unity']!, _unityMeta),
      );
    } else if (isInserting) {
      context.missing(_unityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      packageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unity'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final int id;
  final int packageId;
  final String label;
  final double price;
  final int quantity;
  final String unity;
  const Item({
    required this.id,
    required this.packageId,
    required this.label,
    required this.price,
    required this.quantity,
    required this.unity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_id'] = Variable<int>(packageId);
    map['label'] = Variable<String>(label);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['unity'] = Variable<String>(unity);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      packageId: Value(packageId),
      label: Value(label),
      price: Value(price),
      quantity: Value(quantity),
      unity: Value(unity),
    );
  }

  factory Item.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      packageId: serializer.fromJson<int>(json['packageId']),
      label: serializer.fromJson<String>(json['label']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unity: serializer.fromJson<String>(json['unity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageId': serializer.toJson<int>(packageId),
      'label': serializer.toJson<String>(label),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'unity': serializer.toJson<String>(unity),
    };
  }

  Item copyWith({
    int? id,
    int? packageId,
    String? label,
    double? price,
    int? quantity,
    String? unity,
  }) => Item(
    id: id ?? this.id,
    packageId: packageId ?? this.packageId,
    label: label ?? this.label,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
    unity: unity ?? this.unity,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      packageId: data.packageId.present ? data.packageId.value : this.packageId,
      label: data.label.present ? data.label.value : this.label,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unity: data.unity.present ? data.unity.value : this.unity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('label: $label, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('unity: $unity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, packageId, label, price, quantity, unity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.packageId == this.packageId &&
          other.label == this.label &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.unity == this.unity);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<int> packageId;
  final Value<String> label;
  final Value<double> price;
  final Value<int> quantity;
  final Value<String> unity;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.packageId = const Value.absent(),
    this.label = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unity = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required int packageId,
    required String label,
    required double price,
    required int quantity,
    required String unity,
  }) : packageId = Value(packageId),
       label = Value(label),
       price = Value(price),
       quantity = Value(quantity),
       unity = Value(unity);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<int>? packageId,
    Expression<String>? label,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<String>? unity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageId != null) 'package_id': packageId,
      if (label != null) 'label': label,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (unity != null) 'unity': unity,
    });
  }

  ItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? packageId,
    Value<String>? label,
    Value<double>? price,
    Value<int>? quantity,
    Value<String>? unity,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      label: label ?? this.label,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      unity: unity ?? this.unity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unity.present) {
      map['unity'] = Variable<String>(unity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('label: $label, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('unity: $unity')
          ..write(')'))
        .toString();
  }
}

class $PackageHistoryTable extends PackageHistory
    with TableInfo<$PackageHistoryTable, PackageHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackageHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _packageIdMeta = const VerificationMeta(
    'packageId',
  );
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
    'package_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES packages (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDateMeta = const VerificationMeta(
    'actionDate',
  );
  @override
  late final GeneratedColumn<DateTime> actionDate = GeneratedColumn<DateTime>(
    'action_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageId,
    action,
    actionDate,
    details,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'package_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<PackageHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_id')) {
      context.handle(
        _packageIdMeta,
        packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packageIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('action_date')) {
      context.handle(
        _actionDateMeta,
        actionDate.isAcceptableOrUnknown(data['action_date']!, _actionDateMeta),
      );
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PackageHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackageHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      packageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      actionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}action_date'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
    );
  }

  @override
  $PackageHistoryTable createAlias(String alias) {
    return $PackageHistoryTable(attachedDatabase, alias);
  }
}

class PackageHistoryData extends DataClass
    implements Insertable<PackageHistoryData> {
  final int id;
  final int packageId;
  final String action;
  final DateTime actionDate;
  final String? details;
  const PackageHistoryData({
    required this.id,
    required this.packageId,
    required this.action,
    required this.actionDate,
    this.details,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_id'] = Variable<int>(packageId);
    map['action'] = Variable<String>(action);
    map['action_date'] = Variable<DateTime>(actionDate);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    return map;
  }

  PackageHistoryCompanion toCompanion(bool nullToAbsent) {
    return PackageHistoryCompanion(
      id: Value(id),
      packageId: Value(packageId),
      action: Value(action),
      actionDate: Value(actionDate),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
    );
  }

  factory PackageHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackageHistoryData(
      id: serializer.fromJson<int>(json['id']),
      packageId: serializer.fromJson<int>(json['packageId']),
      action: serializer.fromJson<String>(json['action']),
      actionDate: serializer.fromJson<DateTime>(json['actionDate']),
      details: serializer.fromJson<String?>(json['details']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageId': serializer.toJson<int>(packageId),
      'action': serializer.toJson<String>(action),
      'actionDate': serializer.toJson<DateTime>(actionDate),
      'details': serializer.toJson<String?>(details),
    };
  }

  PackageHistoryData copyWith({
    int? id,
    int? packageId,
    String? action,
    DateTime? actionDate,
    Value<String?> details = const Value.absent(),
  }) => PackageHistoryData(
    id: id ?? this.id,
    packageId: packageId ?? this.packageId,
    action: action ?? this.action,
    actionDate: actionDate ?? this.actionDate,
    details: details.present ? details.value : this.details,
  );
  PackageHistoryData copyWithCompanion(PackageHistoryCompanion data) {
    return PackageHistoryData(
      id: data.id.present ? data.id.value : this.id,
      packageId: data.packageId.present ? data.packageId.value : this.packageId,
      action: data.action.present ? data.action.value : this.action,
      actionDate: data.actionDate.present
          ? data.actionDate.value
          : this.actionDate,
      details: data.details.present ? data.details.value : this.details,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PackageHistoryData(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('action: $action, ')
          ..write('actionDate: $actionDate, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, packageId, action, actionDate, details);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackageHistoryData &&
          other.id == this.id &&
          other.packageId == this.packageId &&
          other.action == this.action &&
          other.actionDate == this.actionDate &&
          other.details == this.details);
}

class PackageHistoryCompanion extends UpdateCompanion<PackageHistoryData> {
  final Value<int> id;
  final Value<int> packageId;
  final Value<String> action;
  final Value<DateTime> actionDate;
  final Value<String?> details;
  const PackageHistoryCompanion({
    this.id = const Value.absent(),
    this.packageId = const Value.absent(),
    this.action = const Value.absent(),
    this.actionDate = const Value.absent(),
    this.details = const Value.absent(),
  });
  PackageHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int packageId,
    required String action,
    this.actionDate = const Value.absent(),
    this.details = const Value.absent(),
  }) : packageId = Value(packageId),
       action = Value(action);
  static Insertable<PackageHistoryData> custom({
    Expression<int>? id,
    Expression<int>? packageId,
    Expression<String>? action,
    Expression<DateTime>? actionDate,
    Expression<String>? details,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageId != null) 'package_id': packageId,
      if (action != null) 'action': action,
      if (actionDate != null) 'action_date': actionDate,
      if (details != null) 'details': details,
    });
  }

  PackageHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? packageId,
    Value<String>? action,
    Value<DateTime>? actionDate,
    Value<String?>? details,
  }) {
    return PackageHistoryCompanion(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      action: action ?? this.action,
      actionDate: actionDate ?? this.actionDate,
      details: details ?? this.details,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (actionDate.present) {
      map['action_date'] = Variable<DateTime>(actionDate.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackageHistoryCompanion(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('action: $action, ')
          ..write('actionDate: $actionDate, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $PackagesTable packages = $PackagesTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $PackageHistoryTable packageHistory = $PackageHistoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    customers,
    packages,
    items,
    packageHistory,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'customers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('packages', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'packages',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'packages',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('package_history', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      required String fullName,
      required String gender,
      Value<bool> isPinned,
      Value<String?> phoneNumber,
      Value<double> totalAmount,
      Value<DateTime> createdAt,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<String> gender,
      Value<bool> isPinned,
      Value<String?> phoneNumber,
      Value<double> totalAmount,
      Value<DateTime> createdAt,
    });

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PackagesTable, List<Package>> _packagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.packages,
    aliasName: $_aliasNameGenerator(db.customers.id, db.packages.customerId),
  );

  $$PackagesTableProcessedTableManager get packagesRefs {
    final manager = $$PackagesTableTableManager(
      $_db,
      $_db.packages,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_packagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> packagesRefs(
    Expression<bool> Function($$PackagesTableFilterComposer f) f,
  ) {
    final $$PackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableFilterComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> packagesRefs<T extends Object>(
    Expression<T> Function($$PackagesTableAnnotationComposer a) f,
  ) {
    final $$PackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, $$CustomersTableReferences),
          Customer,
          PrefetchHooks Function({bool packagesRefs})
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                fullName: fullName,
                gender: gender,
                isPinned: isPinned,
                phoneNumber: phoneNumber,
                totalAmount: totalAmount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required String gender,
                Value<bool> isPinned = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                fullName: fullName,
                gender: gender,
                isPinned: isPinned,
                phoneNumber: phoneNumber,
                totalAmount: totalAmount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({packagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (packagesRefs) db.packages],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (packagesRefs)
                    await $_getPrefetchedData<
                      Customer,
                      $CustomersTable,
                      Package
                    >(
                      currentTable: table,
                      referencedTable: $$CustomersTableReferences
                          ._packagesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CustomersTableReferences(
                            db,
                            table,
                            p0,
                          ).packagesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.customerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, $$CustomersTableReferences),
      Customer,
      PrefetchHooks Function({bool packagesRefs})
    >;
typedef $$PackagesTableCreateCompanionBuilder =
    PackagesCompanion Function({
      Value<int> id,
      required int customerId,
      Value<DateTime> packageDate,
      Value<double> totalPayment,
      Value<double> totalAmount,
      Value<String> status,
    });
typedef $$PackagesTableUpdateCompanionBuilder =
    PackagesCompanion Function({
      Value<int> id,
      Value<int> customerId,
      Value<DateTime> packageDate,
      Value<double> totalPayment,
      Value<double> totalAmount,
      Value<String> status,
    });

final class $$PackagesTableReferences
    extends BaseReferences<_$AppDatabase, $PackagesTable, Package> {
  $$PackagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
        $_aliasNameGenerator(db.packages.customerId, db.customers.id),
      );

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ItemsTable, List<Item>> _itemsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.items,
    aliasName: $_aliasNameGenerator(db.packages.id, db.items.packageId),
  );

  $$ItemsTableProcessedTableManager get itemsRefs {
    final manager = $$ItemsTableTableManager(
      $_db,
      $_db.items,
    ).filter((f) => f.packageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PackageHistoryTable, List<PackageHistoryData>>
  _packageHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.packageHistory,
    aliasName: $_aliasNameGenerator(
      db.packages.id,
      db.packageHistory.packageId,
    ),
  );

  $$PackageHistoryTableProcessedTableManager get packageHistoryRefs {
    final manager = $$PackageHistoryTableTableManager(
      $_db,
      $_db.packageHistory,
    ).filter((f) => f.packageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_packageHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PackagesTableFilterComposer
    extends Composer<_$AppDatabase, $PackagesTable> {
  $$PackagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get packageDate => $composableBuilder(
    column: $table.packageDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> itemsRefs(
    Expression<bool> Function($$ItemsTableFilterComposer f) f,
  ) {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> packageHistoryRefs(
    Expression<bool> Function($$PackageHistoryTableFilterComposer f) f,
  ) {
    final $$PackageHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.packageHistory,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackageHistoryTableFilterComposer(
            $db: $db,
            $table: $db.packageHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PackagesTableOrderingComposer
    extends Composer<_$AppDatabase, $PackagesTable> {
  $$PackagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get packageDate => $composableBuilder(
    column: $table.packageDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PackagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PackagesTable> {
  $$PackagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get packageDate => $composableBuilder(
    column: $table.packageDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> itemsRefs<T extends Object>(
    Expression<T> Function($$ItemsTableAnnotationComposer a) f,
  ) {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> packageHistoryRefs<T extends Object>(
    Expression<T> Function($$PackageHistoryTableAnnotationComposer a) f,
  ) {
    final $$PackageHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.packageHistory,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackageHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.packageHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PackagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PackagesTable,
          Package,
          $$PackagesTableFilterComposer,
          $$PackagesTableOrderingComposer,
          $$PackagesTableAnnotationComposer,
          $$PackagesTableCreateCompanionBuilder,
          $$PackagesTableUpdateCompanionBuilder,
          (Package, $$PackagesTableReferences),
          Package,
          PrefetchHooks Function({
            bool customerId,
            bool itemsRefs,
            bool packageHistoryRefs,
          })
        > {
  $$PackagesTableTableManager(_$AppDatabase db, $PackagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PackagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PackagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PackagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> customerId = const Value.absent(),
                Value<DateTime> packageDate = const Value.absent(),
                Value<double> totalPayment = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => PackagesCompanion(
                id: id,
                customerId: customerId,
                packageDate: packageDate,
                totalPayment: totalPayment,
                totalAmount: totalAmount,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int customerId,
                Value<DateTime> packageDate = const Value.absent(),
                Value<double> totalPayment = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => PackagesCompanion.insert(
                id: id,
                customerId: customerId,
                packageDate: packageDate,
                totalPayment: totalPayment,
                totalAmount: totalAmount,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PackagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                customerId = false,
                itemsRefs = false,
                packageHistoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (itemsRefs) db.items,
                    if (packageHistoryRefs) db.packageHistory,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (customerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customerId,
                                    referencedTable: $$PackagesTableReferences
                                        ._customerIdTable(db),
                                    referencedColumn: $$PackagesTableReferences
                                        ._customerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (itemsRefs)
                        await $_getPrefetchedData<
                          Package,
                          $PackagesTable,
                          Item
                        >(
                          currentTable: table,
                          referencedTable: $$PackagesTableReferences
                              ._itemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PackagesTableReferences(
                                db,
                                table,
                                p0,
                              ).itemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.packageId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (packageHistoryRefs)
                        await $_getPrefetchedData<
                          Package,
                          $PackagesTable,
                          PackageHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$PackagesTableReferences
                              ._packageHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PackagesTableReferences(
                                db,
                                table,
                                p0,
                              ).packageHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.packageId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PackagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PackagesTable,
      Package,
      $$PackagesTableFilterComposer,
      $$PackagesTableOrderingComposer,
      $$PackagesTableAnnotationComposer,
      $$PackagesTableCreateCompanionBuilder,
      $$PackagesTableUpdateCompanionBuilder,
      (Package, $$PackagesTableReferences),
      Package,
      PrefetchHooks Function({
        bool customerId,
        bool itemsRefs,
        bool packageHistoryRefs,
      })
    >;
typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      required int packageId,
      required String label,
      required double price,
      required int quantity,
      required String unity,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      Value<int> packageId,
      Value<String> label,
      Value<double> price,
      Value<int> quantity,
      Value<String> unity,
    });

final class $$ItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ItemsTable, Item> {
  $$ItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PackagesTable _packageIdTable(_$AppDatabase db) => db.packages
      .createAlias($_aliasNameGenerator(db.items.packageId, db.packages.id));

  $$PackagesTableProcessedTableManager get packageId {
    final $_column = $_itemColumn<int>('package_id')!;

    final manager = $$PackagesTableTableManager(
      $_db,
      $_db.packages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unity => $composableBuilder(
    column: $table.unity,
    builder: (column) => ColumnFilters(column),
  );

  $$PackagesTableFilterComposer get packageId {
    final $$PackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableFilterComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unity => $composableBuilder(
    column: $table.unity,
    builder: (column) => ColumnOrderings(column),
  );

  $$PackagesTableOrderingComposer get packageId {
    final $$PackagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableOrderingComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unity =>
      $composableBuilder(column: $table.unity, builder: (column) => column);

  $$PackagesTableAnnotationComposer get packageId {
    final $$PackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          Item,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (Item, $$ItemsTableReferences),
          Item,
          PrefetchHooks Function({bool packageId})
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> packageId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> unity = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                packageId: packageId,
                label: label,
                price: price,
                quantity: quantity,
                unity: unity,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int packageId,
                required String label,
                required double price,
                required int quantity,
                required String unity,
              }) => ItemsCompanion.insert(
                id: id,
                packageId: packageId,
                label: label,
                price: price,
                quantity: quantity,
                unity: unity,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ItemsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({packageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (packageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.packageId,
                                referencedTable: $$ItemsTableReferences
                                    ._packageIdTable(db),
                                referencedColumn: $$ItemsTableReferences
                                    ._packageIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      Item,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (Item, $$ItemsTableReferences),
      Item,
      PrefetchHooks Function({bool packageId})
    >;
typedef $$PackageHistoryTableCreateCompanionBuilder =
    PackageHistoryCompanion Function({
      Value<int> id,
      required int packageId,
      required String action,
      Value<DateTime> actionDate,
      Value<String?> details,
    });
typedef $$PackageHistoryTableUpdateCompanionBuilder =
    PackageHistoryCompanion Function({
      Value<int> id,
      Value<int> packageId,
      Value<String> action,
      Value<DateTime> actionDate,
      Value<String?> details,
    });

final class $$PackageHistoryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PackageHistoryTable,
          PackageHistoryData
        > {
  $$PackageHistoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PackagesTable _packageIdTable(_$AppDatabase db) =>
      db.packages.createAlias(
        $_aliasNameGenerator(db.packageHistory.packageId, db.packages.id),
      );

  $$PackagesTableProcessedTableManager get packageId {
    final $_column = $_itemColumn<int>('package_id')!;

    final manager = $$PackagesTableTableManager(
      $_db,
      $_db.packages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PackageHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $PackageHistoryTable> {
  $$PackageHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actionDate => $composableBuilder(
    column: $table.actionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  $$PackagesTableFilterComposer get packageId {
    final $$PackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableFilterComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PackageHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $PackageHistoryTable> {
  $$PackageHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actionDate => $composableBuilder(
    column: $table.actionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  $$PackagesTableOrderingComposer get packageId {
    final $$PackagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableOrderingComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PackageHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $PackageHistoryTable> {
  $$PackageHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<DateTime> get actionDate => $composableBuilder(
    column: $table.actionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  $$PackagesTableAnnotationComposer get packageId {
    final $$PackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.packages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.packages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PackageHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PackageHistoryTable,
          PackageHistoryData,
          $$PackageHistoryTableFilterComposer,
          $$PackageHistoryTableOrderingComposer,
          $$PackageHistoryTableAnnotationComposer,
          $$PackageHistoryTableCreateCompanionBuilder,
          $$PackageHistoryTableUpdateCompanionBuilder,
          (PackageHistoryData, $$PackageHistoryTableReferences),
          PackageHistoryData,
          PrefetchHooks Function({bool packageId})
        > {
  $$PackageHistoryTableTableManager(
    _$AppDatabase db,
    $PackageHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PackageHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PackageHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PackageHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> packageId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<DateTime> actionDate = const Value.absent(),
                Value<String?> details = const Value.absent(),
              }) => PackageHistoryCompanion(
                id: id,
                packageId: packageId,
                action: action,
                actionDate: actionDate,
                details: details,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int packageId,
                required String action,
                Value<DateTime> actionDate = const Value.absent(),
                Value<String?> details = const Value.absent(),
              }) => PackageHistoryCompanion.insert(
                id: id,
                packageId: packageId,
                action: action,
                actionDate: actionDate,
                details: details,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PackageHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({packageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (packageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.packageId,
                                referencedTable: $$PackageHistoryTableReferences
                                    ._packageIdTable(db),
                                referencedColumn:
                                    $$PackageHistoryTableReferences
                                        ._packageIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PackageHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PackageHistoryTable,
      PackageHistoryData,
      $$PackageHistoryTableFilterComposer,
      $$PackageHistoryTableOrderingComposer,
      $$PackageHistoryTableAnnotationComposer,
      $$PackageHistoryTableCreateCompanionBuilder,
      $$PackageHistoryTableUpdateCompanionBuilder,
      (PackageHistoryData, $$PackageHistoryTableReferences),
      PackageHistoryData,
      PrefetchHooks Function({bool packageId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$PackagesTableTableManager get packages =>
      $$PackagesTableTableManager(_db, _db.packages);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$PackageHistoryTableTableManager get packageHistory =>
      $$PackageHistoryTableTableManager(_db, _db.packageHistory);
}
