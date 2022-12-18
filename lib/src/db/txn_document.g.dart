// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txn_document.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTxnDocumentCollection on Isar {
  IsarCollection<TxnDocument> get txnDocuments => this.collection();
}

const TxnDocumentSchema = CollectionSchema(
  name: r'TxnDocument',
  id: 8548798648919783966,
  properties: {
    r'changes': PropertySchema(
      id: 0,
      name: r'changes',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'idItems': PropertySchema(
      id: 2,
      name: r'idItems',
      type: IsarType.stringList,
    ),
    r'paid': PropertySchema(
      id: 3,
      name: r'paid',
      type: IsarType.bool,
    ),
    r'payment': PropertySchema(
      id: 4,
      name: r'payment',
      type: IsarType.double,
    ),
    r'to': PropertySchema(
      id: 5,
      name: r'to',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 6,
      name: r'total',
      type: IsarType.double,
    ),
    r'txnType': PropertySchema(
      id: 7,
      name: r'txnType',
      type: IsarType.long,
    )
  },
  estimateSize: _txnDocumentEstimateSize,
  serialize: _txnDocumentSerialize,
  deserialize: _txnDocumentDeserialize,
  deserializeProp: _txnDocumentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _txnDocumentGetId,
  getLinks: _txnDocumentGetLinks,
  attach: _txnDocumentAttach,
  version: '3.0.5',
);

int _txnDocumentEstimateSize(
  TxnDocument object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.idItems;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.to;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _txnDocumentSerialize(
  TxnDocument object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.changes);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeStringList(offsets[2], object.idItems);
  writer.writeBool(offsets[3], object.paid);
  writer.writeDouble(offsets[4], object.payment);
  writer.writeString(offsets[5], object.to);
  writer.writeDouble(offsets[6], object.total);
  writer.writeLong(offsets[7], object.txnType);
}

TxnDocument _txnDocumentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TxnDocument();
  object.changes = reader.readDoubleOrNull(offsets[0]);
  object.createdAt = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.idItems = reader.readStringList(offsets[2]);
  object.paid = reader.readBoolOrNull(offsets[3]);
  object.payment = reader.readDoubleOrNull(offsets[4]);
  object.to = reader.readStringOrNull(offsets[5]);
  object.total = reader.readDoubleOrNull(offsets[6]);
  object.txnType = reader.readLongOrNull(offsets[7]);
  return object;
}

P _txnDocumentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _txnDocumentGetId(TxnDocument object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _txnDocumentGetLinks(TxnDocument object) {
  return [];
}

void _txnDocumentAttach(
    IsarCollection<dynamic> col, Id id, TxnDocument object) {
  object.id = id;
}

extension TxnDocumentQueryWhereSort
    on QueryBuilder<TxnDocument, TxnDocument, QWhere> {
  QueryBuilder<TxnDocument, TxnDocument, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TxnDocumentQueryWhere
    on QueryBuilder<TxnDocument, TxnDocument, QWhereClause> {
  QueryBuilder<TxnDocument, TxnDocument, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TxnDocumentQueryFilter
    on QueryBuilder<TxnDocument, TxnDocument, QFilterCondition> {
  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      changesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'changes',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      changesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'changes',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> changesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      changesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'changes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> changesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'changes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> changesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'changes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idItems',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idItems',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItems',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idItems',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      idItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'idItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> paidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paid',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      paidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paid',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> paidEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paid',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      paymentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payment',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      paymentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payment',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> paymentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      paymentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> paymentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> paymentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'to',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> toIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'to',
        value: '',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> totalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      totalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> totalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> totalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      txnTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'txnType',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      txnTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'txnType',
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> txnTypeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition>
      txnTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> txnTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterFilterCondition> txnTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'txnType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TxnDocumentQueryObject
    on QueryBuilder<TxnDocument, TxnDocument, QFilterCondition> {}

extension TxnDocumentQueryLinks
    on QueryBuilder<TxnDocument, TxnDocument, QFilterCondition> {}

extension TxnDocumentQuerySortBy
    on QueryBuilder<TxnDocument, TxnDocument, QSortBy> {
  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByChanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changes', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByChangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changes', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payment', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByPaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payment', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> sortByTxnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.desc);
    });
  }
}

extension TxnDocumentQuerySortThenBy
    on QueryBuilder<TxnDocument, TxnDocument, QSortThenBy> {
  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByChanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changes', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByChangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changes', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payment', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByPaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payment', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.asc);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QAfterSortBy> thenByTxnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.desc);
    });
  }
}

extension TxnDocumentQueryWhereDistinct
    on QueryBuilder<TxnDocument, TxnDocument, QDistinct> {
  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByChanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changes');
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByIdItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idItems');
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paid');
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payment');
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByTo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<TxnDocument, TxnDocument, QDistinct> distinctByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'txnType');
    });
  }
}

extension TxnDocumentQueryProperty
    on QueryBuilder<TxnDocument, TxnDocument, QQueryProperty> {
  QueryBuilder<TxnDocument, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TxnDocument, double?, QQueryOperations> changesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changes');
    });
  }

  QueryBuilder<TxnDocument, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TxnDocument, List<String>?, QQueryOperations> idItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idItems');
    });
  }

  QueryBuilder<TxnDocument, bool?, QQueryOperations> paidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paid');
    });
  }

  QueryBuilder<TxnDocument, double?, QQueryOperations> paymentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payment');
    });
  }

  QueryBuilder<TxnDocument, String?, QQueryOperations> toProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to');
    });
  }

  QueryBuilder<TxnDocument, double?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<TxnDocument, int?, QQueryOperations> txnTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'txnType');
    });
  }
}
