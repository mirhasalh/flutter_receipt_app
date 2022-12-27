// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSupplierCollection on Isar {
  IsarCollection<Supplier> get suppliers => this.collection();
}

const SupplierSchema = CollectionSchema(
  name: r'Supplier',
  id: -3022359166140243741,
  properties: {
    r'supplierName': PropertySchema(
      id: 0,
      name: r'supplierName',
      type: IsarType.string,
    )
  },
  estimateSize: _supplierEstimateSize,
  serialize: _supplierSerialize,
  deserialize: _supplierDeserialize,
  deserializeProp: _supplierDeserializeProp,
  idName: r'id',
  indexes: {
    r'supplierName': IndexSchema(
      id: -5059668524112742578,
      name: r'supplierName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'supplierName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _supplierGetId,
  getLinks: _supplierGetLinks,
  attach: _supplierAttach,
  version: '3.0.5',
);

int _supplierEstimateSize(
  Supplier object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.supplierName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _supplierSerialize(
  Supplier object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.supplierName);
}

Supplier _supplierDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Supplier();
  object.id = id;
  object.supplierName = reader.readStringOrNull(offsets[0]);
  return object;
}

P _supplierDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _supplierGetId(Supplier object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _supplierGetLinks(Supplier object) {
  return [];
}

void _supplierAttach(IsarCollection<dynamic> col, Id id, Supplier object) {
  object.id = id;
}

extension SupplierByIndex on IsarCollection<Supplier> {
  Future<Supplier?> getBySupplierName(String? supplierName) {
    return getByIndex(r'supplierName', [supplierName]);
  }

  Supplier? getBySupplierNameSync(String? supplierName) {
    return getByIndexSync(r'supplierName', [supplierName]);
  }

  Future<bool> deleteBySupplierName(String? supplierName) {
    return deleteByIndex(r'supplierName', [supplierName]);
  }

  bool deleteBySupplierNameSync(String? supplierName) {
    return deleteByIndexSync(r'supplierName', [supplierName]);
  }

  Future<List<Supplier?>> getAllBySupplierName(
      List<String?> supplierNameValues) {
    final values = supplierNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'supplierName', values);
  }

  List<Supplier?> getAllBySupplierNameSync(List<String?> supplierNameValues) {
    final values = supplierNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'supplierName', values);
  }

  Future<int> deleteAllBySupplierName(List<String?> supplierNameValues) {
    final values = supplierNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'supplierName', values);
  }

  int deleteAllBySupplierNameSync(List<String?> supplierNameValues) {
    final values = supplierNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'supplierName', values);
  }

  Future<Id> putBySupplierName(Supplier object) {
    return putByIndex(r'supplierName', object);
  }

  Id putBySupplierNameSync(Supplier object, {bool saveLinks = true}) {
    return putByIndexSync(r'supplierName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySupplierName(List<Supplier> objects) {
    return putAllByIndex(r'supplierName', objects);
  }

  List<Id> putAllBySupplierNameSync(List<Supplier> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'supplierName', objects, saveLinks: saveLinks);
  }
}

extension SupplierQueryWhereSort on QueryBuilder<Supplier, Supplier, QWhere> {
  QueryBuilder<Supplier, Supplier, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SupplierQueryWhere on QueryBuilder<Supplier, Supplier, QWhereClause> {
  QueryBuilder<Supplier, Supplier, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> idBetween(
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

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> supplierNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supplierName',
        value: [null],
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> supplierNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'supplierName',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> supplierNameEqualTo(
      String? supplierName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supplierName',
        value: [supplierName],
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterWhereClause> supplierNameNotEqualTo(
      String? supplierName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierName',
              lower: [],
              upper: [supplierName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierName',
              lower: [supplierName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierName',
              lower: [supplierName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierName',
              lower: [],
              upper: [supplierName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SupplierQueryFilter
    on QueryBuilder<Supplier, Supplier, QFilterCondition> {
  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supplierName',
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition>
      supplierNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supplierName',
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition>
      supplierNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition>
      supplierNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition> supplierNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supplierName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition>
      supplierNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierName',
        value: '',
      ));
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterFilterCondition>
      supplierNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supplierName',
        value: '',
      ));
    });
  }
}

extension SupplierQueryObject
    on QueryBuilder<Supplier, Supplier, QFilterCondition> {}

extension SupplierQueryLinks
    on QueryBuilder<Supplier, Supplier, QFilterCondition> {}

extension SupplierQuerySortBy on QueryBuilder<Supplier, Supplier, QSortBy> {
  QueryBuilder<Supplier, Supplier, QAfterSortBy> sortBySupplierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.asc);
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterSortBy> sortBySupplierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.desc);
    });
  }
}

extension SupplierQuerySortThenBy
    on QueryBuilder<Supplier, Supplier, QSortThenBy> {
  QueryBuilder<Supplier, Supplier, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterSortBy> thenBySupplierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.asc);
    });
  }

  QueryBuilder<Supplier, Supplier, QAfterSortBy> thenBySupplierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.desc);
    });
  }
}

extension SupplierQueryWhereDistinct
    on QueryBuilder<Supplier, Supplier, QDistinct> {
  QueryBuilder<Supplier, Supplier, QDistinct> distinctBySupplierName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierName', caseSensitive: caseSensitive);
    });
  }
}

extension SupplierQueryProperty
    on QueryBuilder<Supplier, Supplier, QQueryProperty> {
  QueryBuilder<Supplier, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Supplier, String?, QQueryOperations> supplierNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierName');
    });
  }
}
