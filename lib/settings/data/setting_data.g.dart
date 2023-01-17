// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppSettingsCWProxy {
  AppSettings id(int? id);

  AppSettings common(CommonSettingsSectionData? common);

  AppSettings display(DisplaySettingsSectionData? display);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AppSettings call({
    int? id,
    CommonSettingsSectionData? common,
    DisplaySettingsSectionData? display,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppSettings.copyWith.fieldName(...)`
class _$AppSettingsCWProxyImpl implements _$AppSettingsCWProxy {
  const _$AppSettingsCWProxyImpl(this._value);

  final AppSettings _value;

  @override
  AppSettings id(int? id) => this(id: id);

  @override
  AppSettings common(CommonSettingsSectionData? common) => this(common: common);

  @override
  AppSettings display(DisplaySettingsSectionData? display) =>
      this(display: display);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AppSettings call({
    Object? id = const $CopyWithPlaceholder(),
    Object? common = const $CopyWithPlaceholder(),
    Object? display = const $CopyWithPlaceholder(),
  }) {
    return AppSettings(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      common: common == const $CopyWithPlaceholder()
          ? _value.common
          // ignore: cast_nullable_to_non_nullable
          : common as CommonSettingsSectionData?,
      display: display == const $CopyWithPlaceholder()
          ? _value.display
          // ignore: cast_nullable_to_non_nullable
          : display as DisplaySettingsSectionData?,
    );
  }
}

extension $AppSettingsCopyWith on AppSettings {
  /// Returns a callable class that can be used as follows: `instanceOfAppSettings.copyWith(...)` or like so:`instanceOfAppSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppSettingsCWProxy get copyWith => _$AppSettingsCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAppSettingsCollection on Isar {
  IsarCollection<AppSettings> get appSettings => this.collection();
}

const AppSettingsSchema = CollectionSchema(
  name: r'AppSettings',
  id: -5633561779022347008,
  properties: {
    r'common': PropertySchema(
      id: 0,
      name: r'common',
      type: IsarType.object,
      target: r'CommonSettingsSectionData',
    ),
    r'display': PropertySchema(
      id: 1,
      name: r'display',
      type: IsarType.object,
      target: r'DisplaySettingsSectionData',
    )
  },
  estimateSize: _appSettingsEstimateSize,
  serialize: _appSettingsSerialize,
  deserialize: _appSettingsDeserialize,
  deserializeProp: _appSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'CommonSettingsSectionData': CommonSettingsSectionDataSchema,
    r'DisplaySettingsSectionData': DisplaySettingsSectionDataSchema
  },
  getId: _appSettingsGetId,
  getLinks: _appSettingsGetLinks,
  attach: _appSettingsAttach,
  version: '3.0.5',
);

int _appSettingsEstimateSize(
  AppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.common;
    if (value != null) {
      bytesCount += 3 +
          CommonSettingsSectionDataSchema.estimateSize(
              value, allOffsets[CommonSettingsSectionData]!, allOffsets);
    }
  }
  {
    final value = object.display;
    if (value != null) {
      bytesCount += 3 +
          DisplaySettingsSectionDataSchema.estimateSize(
              value, allOffsets[DisplaySettingsSectionData]!, allOffsets);
    }
  }
  return bytesCount;
}

void _appSettingsSerialize(
  AppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CommonSettingsSectionData>(
    offsets[0],
    allOffsets,
    CommonSettingsSectionDataSchema.serialize,
    object.common,
  );
  writer.writeObject<DisplaySettingsSectionData>(
    offsets[1],
    allOffsets,
    DisplaySettingsSectionDataSchema.serialize,
    object.display,
  );
}

AppSettings _appSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettings(
    common: reader.readObjectOrNull<CommonSettingsSectionData>(
      offsets[0],
      CommonSettingsSectionDataSchema.deserialize,
      allOffsets,
    ),
    display: reader.readObjectOrNull<DisplaySettingsSectionData>(
      offsets[1],
      DisplaySettingsSectionDataSchema.deserialize,
      allOffsets,
    ),
    id: id,
  );
  return object;
}

P _appSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CommonSettingsSectionData>(
        offset,
        CommonSettingsSectionDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<DisplaySettingsSectionData>(
        offset,
        DisplaySettingsSectionDataSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appSettingsGetId(AppSettings object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _appSettingsGetLinks(AppSettings object) {
  return [];
}

void _appSettingsAttach(
    IsarCollection<dynamic> col, Id id, AppSettings object) {}

extension AppSettingsQueryWhereSort
    on QueryBuilder<AppSettings, AppSettings, QWhere> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsQueryWhere
    on QueryBuilder<AppSettings, AppSettings, QWhereClause> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idBetween(
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

extension AppSettingsQueryFilter
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> commonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'common',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      commonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'common',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      displayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'display',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      displayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'display',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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
}

extension AppSettingsQueryObject
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> common(
      FilterQuery<CommonSettingsSectionData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'common');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> display(
      FilterQuery<DisplaySettingsSectionData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'display');
    });
  }
}

extension AppSettingsQueryLinks
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQuerySortBy
    on QueryBuilder<AppSettings, AppSettings, QSortBy> {}

extension AppSettingsQuerySortThenBy
    on QueryBuilder<AppSettings, AppSettings, QSortThenBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AppSettingsQueryWhereDistinct
    on QueryBuilder<AppSettings, AppSettings, QDistinct> {}

extension AppSettingsQueryProperty
    on QueryBuilder<AppSettings, AppSettings, QQueryProperty> {
  QueryBuilder<AppSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppSettings, CommonSettingsSectionData?, QQueryOperations>
      commonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'common');
    });
  }

  QueryBuilder<AppSettings, DisplaySettingsSectionData?, QQueryOperations>
      displayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'display');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const CommonSettingsSectionDataSchema = Schema(
  name: r'CommonSettingsSectionData',
  id: 441854950318065257,
  properties: {
    r'notification': PropertySchema(
      id: 0,
      name: r'notification',
      type: IsarType.bool,
    )
  },
  estimateSize: _commonSettingsSectionDataEstimateSize,
  serialize: _commonSettingsSectionDataSerialize,
  deserialize: _commonSettingsSectionDataDeserialize,
  deserializeProp: _commonSettingsSectionDataDeserializeProp,
);

int _commonSettingsSectionDataEstimateSize(
  CommonSettingsSectionData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _commonSettingsSectionDataSerialize(
  CommonSettingsSectionData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.notification);
}

CommonSettingsSectionData _commonSettingsSectionDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CommonSettingsSectionData(
    notification: reader.readBoolOrNull(offsets[0]),
  );
  return object;
}

P _commonSettingsSectionDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CommonSettingsSectionDataQueryFilter on QueryBuilder<
    CommonSettingsSectionData, CommonSettingsSectionData, QFilterCondition> {
  QueryBuilder<CommonSettingsSectionData, CommonSettingsSectionData,
      QAfterFilterCondition> notificationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notification',
      ));
    });
  }

  QueryBuilder<CommonSettingsSectionData, CommonSettingsSectionData,
      QAfterFilterCondition> notificationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notification',
      ));
    });
  }

  QueryBuilder<CommonSettingsSectionData, CommonSettingsSectionData,
      QAfterFilterCondition> notificationEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notification',
        value: value,
      ));
    });
  }
}

extension CommonSettingsSectionDataQueryObject on QueryBuilder<
    CommonSettingsSectionData, CommonSettingsSectionData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DisplaySettingsSectionDataSchema = Schema(
  name: r'DisplaySettingsSectionData',
  id: 8171369626893486327,
  properties: {
    r'darkTheme': PropertySchema(
      id: 0,
      name: r'darkTheme',
      type: IsarType.byte,
      enumMap: _DisplaySettingsSectionDatadarkThemeEnumValueMap,
    ),
    r'fontsize': PropertySchema(
      id: 1,
      name: r'fontsize',
      type: IsarType.byte,
      enumMap: _DisplaySettingsSectionDatafontsizeEnumValueMap,
    ),
    r'language': PropertySchema(
      id: 2,
      name: r'language',
      type: IsarType.string,
    )
  },
  estimateSize: _displaySettingsSectionDataEstimateSize,
  serialize: _displaySettingsSectionDataSerialize,
  deserialize: _displaySettingsSectionDataDeserialize,
  deserializeProp: _displaySettingsSectionDataDeserializeProp,
);

int _displaySettingsSectionDataEstimateSize(
  DisplaySettingsSectionData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _displaySettingsSectionDataSerialize(
  DisplaySettingsSectionData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.darkTheme.index);
  writer.writeByte(offsets[1], object.fontsize.index);
  writer.writeString(offsets[2], object.language);
}

DisplaySettingsSectionData _displaySettingsSectionDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DisplaySettingsSectionData(
    language: reader.readStringOrNull(offsets[2]),
  );
  object.darkTheme = _DisplaySettingsSectionDatadarkThemeValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      DarkThemeSetting.light;
  object.fontsize = _DisplaySettingsSectionDatafontsizeValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      FontSizeSetting.small;
  return object;
}

P _displaySettingsSectionDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DisplaySettingsSectionDatadarkThemeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DarkThemeSetting.light) as P;
    case 1:
      return (_DisplaySettingsSectionDatafontsizeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          FontSizeSetting.small) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DisplaySettingsSectionDatadarkThemeEnumValueMap = {
  'light': 0,
  'dark': 1,
  'phone': 2,
};
const _DisplaySettingsSectionDatadarkThemeValueEnumMap = {
  0: DarkThemeSetting.light,
  1: DarkThemeSetting.dark,
  2: DarkThemeSetting.phone,
};
const _DisplaySettingsSectionDatafontsizeEnumValueMap = {
  'small': 0,
  'medium': 1,
  'large': 2,
};
const _DisplaySettingsSectionDatafontsizeValueEnumMap = {
  0: FontSizeSetting.small,
  1: FontSizeSetting.medium,
  2: FontSizeSetting.large,
};

extension DisplaySettingsSectionDataQueryFilter on QueryBuilder<
    DisplaySettingsSectionData, DisplaySettingsSectionData, QFilterCondition> {
  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> darkThemeEqualTo(DarkThemeSetting value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkTheme',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> darkThemeGreaterThan(
    DarkThemeSetting value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'darkTheme',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> darkThemeLessThan(
    DarkThemeSetting value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'darkTheme',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> darkThemeBetween(
    DarkThemeSetting lower,
    DarkThemeSetting upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'darkTheme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> fontsizeEqualTo(FontSizeSetting value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontsize',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> fontsizeGreaterThan(
    FontSizeSetting value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontsize',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> fontsizeLessThan(
    FontSizeSetting value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontsize',
        value: value,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> fontsizeBetween(
    FontSizeSetting lower,
    FontSizeSetting upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontsize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
          QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
          QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<DisplaySettingsSectionData, DisplaySettingsSectionData,
      QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }
}

extension DisplaySettingsSectionDataQueryObject on QueryBuilder<
    DisplaySettingsSectionData, DisplaySettingsSectionData, QFilterCondition> {}
