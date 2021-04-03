/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

import 'dart:io';
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointBasicTypes {
  Client client;
  _EndpointBasicTypes(this.client);

  Future<int?> testInt(int? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testInt', 'int', {
      'value':value,
    });
  }

  Future<double?> testDouble(double? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testDouble', 'double', {
      'value':value,
    });
  }

  Future<bool?> testBool(bool? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testBool', 'bool', {
      'value':value,
    });
  }

  Future<DateTime?> testDateTime(DateTime? dateTime,) async {
    return await client.callServerEndpoint('basicTypes', 'testDateTime', 'DateTime', {
      'dateTime':dateTime,
    });
  }

  Future<String?> testString(String? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testString', 'String', {
      'value':value,
    });
  }
}

class _EndpointBasicDatabase {
  Client client;
  _EndpointBasicDatabase(this.client);

  Future<int?> storeTypes(Types? types,) async {
    return await client.callServerEndpoint('basicDatabase', 'storeTypes', 'int', {
      'types':types,
    });
  }

  Future<Types?> getTypes(int? id,) async {
    return await client.callServerEndpoint('basicDatabase', 'getTypes', 'Types', {
      'id':id,
    });
  }

  Future<int?> getTypesRawQuery(int? id,) async {
    return await client.callServerEndpoint('basicDatabase', 'getTypesRawQuery', 'int', {
      'id':id,
    });
  }

  Future<int?> countTypesRows() async {
    return await client.callServerEndpoint('basicDatabase', 'countTypesRows', 'int', {
    });
  }

  Future<int?> deleteAllInTypes() async {
    return await client.callServerEndpoint('basicDatabase', 'deleteAllInTypes', 'int', {
    });
  }

  Future<void> createSimpleTestData(int? numRows,) async {
    return await client.callServerEndpoint('basicDatabase', 'createSimpleTestData', 'void', {
      'numRows':numRows,
    });
  }

  Future<int?> countSimpleData() async {
    return await client.callServerEndpoint('basicDatabase', 'countSimpleData', 'int', {
    });
  }

  Future<void> deleteAllSimpleTestData() async {
    return await client.callServerEndpoint('basicDatabase', 'deleteAllSimpleTestData', 'void', {
    });
  }

  Future<void> deleteSimpleTestDataLessThan(int? num,) async {
    return await client.callServerEndpoint('basicDatabase', 'deleteSimpleTestDataLessThan', 'void', {
      'num':num,
    });
  }

  Future<bool?> findAndDeleteSimpleTestData(int? num,) async {
    return await client.callServerEndpoint('basicDatabase', 'findAndDeleteSimpleTestData', 'bool', {
      'num':num,
    });
  }

  Future<SimpleDataList?> findSimpleDataRowsLessThan(int? num,int? offset,int? limit,bool? descending,) async {
    return await client.callServerEndpoint('basicDatabase', 'findSimpleDataRowsLessThan', 'SimpleDataList', {
      'num':num,
      'offset':offset,
      'limit':limit,
      'descending':descending,
    });
  }

  Future<bool?> updateSimpleDataRow(int? num,int? newNum,) async {
    return await client.callServerEndpoint('basicDatabase', 'updateSimpleDataRow', 'bool', {
      'num':num,
      'newNum':newNum,
    });
  }
}

class _EndpointSimple {
  Client client;
  _EndpointSimple(this.client);

  Future<void> setGlobalInt(int? value,[int? secondValue,]) async {
    return await client.callServerEndpoint('simple', 'setGlobalInt', 'void', {
      'value':value,
      'secondValue': secondValue,
    });
  }

  Future<void> addToGlobalInt() async {
    return await client.callServerEndpoint('simple', 'addToGlobalInt', 'void', {
    });
  }

  Future<int?> getGlobalInt() async {
    return await client.callServerEndpoint('simple', 'getGlobalInt', 'int', {
    });
  }
}

class Client extends ServerpodClient {
  late final _EndpointBasicTypes basicTypes;
  late final _EndpointBasicDatabase basicDatabase;
  late final _EndpointSimple simple;

  Client(host, {SecurityContext? context, ServerpodClientErrorCallback? errorHandler, AuthenticationKeyManager? authenticationKeyManager}) : super(host, Protocol.instance, context: context, errorHandler: errorHandler, authenticationKeyManager: authenticationKeyManager) {
    basicTypes = _EndpointBasicTypes(this);
    basicDatabase = _EndpointBasicDatabase(this);
    simple = _EndpointSimple(this);
  }
}
