/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names

import 'package:serverpod_client/serverpod_client.dart';
// ignore: unused_import
import 'protocol.dart';

class RuntimeSettings extends SerializableEntity {
  @override
  String get className => 'RuntimeSettings';

  int? id;
  late bool logAllCalls;
  late bool logAllQueries;
  late bool logSlowCalls;
  late bool logSlowQueries;
  late bool logFailedCalls;
  late bool logFailedQueries;
  late bool logMalformedCalls;
  late bool logServiceCalls;
  late int logLevel;
  late double slowQueryDuration;
  late double slowCallDuration;

  RuntimeSettings({
    this.id,
    required this.logAllCalls,
    required this.logAllQueries,
    required this.logSlowCalls,
    required this.logSlowQueries,
    required this.logFailedCalls,
    required this.logFailedQueries,
    required this.logMalformedCalls,
    required this.logServiceCalls,
    required this.logLevel,
    required this.slowQueryDuration,
    required this.slowCallDuration,
});

  RuntimeSettings.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    logAllCalls = _data['logAllCalls']!;
    logAllQueries = _data['logAllQueries']!;
    logSlowCalls = _data['logSlowCalls']!;
    logSlowQueries = _data['logSlowQueries']!;
    logFailedCalls = _data['logFailedCalls']!;
    logFailedQueries = _data['logFailedQueries']!;
    logMalformedCalls = _data['logMalformedCalls']!;
    logServiceCalls = _data['logServiceCalls']!;
    logLevel = _data['logLevel']!;
    slowQueryDuration = _data['slowQueryDuration']!;
    slowCallDuration = _data['slowCallDuration']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'logAllCalls': logAllCalls,
      'logAllQueries': logAllQueries,
      'logSlowCalls': logSlowCalls,
      'logSlowQueries': logSlowQueries,
      'logFailedCalls': logFailedCalls,
      'logFailedQueries': logFailedQueries,
      'logMalformedCalls': logMalformedCalls,
      'logServiceCalls': logServiceCalls,
      'logLevel': logLevel,
      'slowQueryDuration': slowQueryDuration,
      'slowCallDuration': slowCallDuration,
    });
  }
}
