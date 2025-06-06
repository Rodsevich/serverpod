import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

Future<void> _createTestDatabase(Session session) async {
  await Types.db.insert(session, [
    Types(aString: 'one'),
    Types(aString: 'two'),
    Types(aString: null),
  ]);
}

Future<void> _deleteAll(Session session) async {
  await Types.db.deleteWhere(session, where: (t) => Constant.bool(true));
}

void main() async {
  var session = await IntegrationTestServer().session();

  setUpAll(() async => await _createTestDatabase(session));
  tearDownAll(() async => await _deleteAll(session));

  group('Given string column in database', () {
    test('when fetching all then all rows are returned.', () async {
      var result = await Types.db.find(
        session,
        where: (_) => Constant.bool(true),
      );

      expect(result.length, 3);
    });

    test('when filtering using equals then matching row is returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.equals('one'),
      );

      expect(result.first.aString, 'one');
    });

    test('when filtering using equals with null then matching row is returned.',
        () async {
      var result = await await Types.db.find(
        session,
        where: (t) => t.aString.equals(null),
      );

      expect(result.first.aString, isNull);
    });

    test('when filtering using notEquals then matching rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notEquals('one'),
      );

      expect(result.length, 2);
    });

    test(
        'when filtering using notEquals with null then matching rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notEquals(null),
      );

      expect(result.length, 2);
    });

    test('when filtering using inSet then matching rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.inSet({'one', 'two'}),
      );

      expect(result.length, 2);
    });

    test('when filtering using empty inSet then no rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.inSet({}),
      );

      expect(result, isEmpty);
    });

    test('when filtering using notInSet then matching row is returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notInSet({'one'}),
      );

      expect(result.length, 2);
    });

    test('when filtering using empty notInSet then all rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notInSet({}),
      );

      expect(result.length, 3);
    });

    test('when filtering using like then matching row is returned.', () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.like('on%'),
      );

      expect(result.length, 1);
      expect(result.first.aString, 'one');
    });

    test('when filtering using like then matching row is returned.', () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notLike('on%'),
      );

      expect(result, hasLength(2));
    });

    test('when filtering using ilike then matching row is returned.', () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.ilike('On%'),
      );

      expect(result.length, 1);
      expect(result.first.aString, 'one');
    });

    test('when filtering using ilike then matching row is returned.', () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString.notIlike('On%'),
      );

      expect(result, hasLength(2));
    });

    test(
        'when filtering using "greater than" then lexicographically posterior rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString > 'one',
      );

      expect(result.length, 1);
      expect(result.first.aString, 'two');
    });

    test(
        'when filtering using "greater or equal than" then equal and lexicographically posterior rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString >= 'one',
      );

      expect(result.length, 2);
      expect(result.map((e) => e.aString).toSet(), {'one', 'two'});
    });

    test(
        'when filtering using "less than" then lexicographically preceding rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString < 'two',
      );

      expect(result.length, 1);
      expect(result.first.aString, 'one');
    });

    test(
        'when filtering using "less or equal than" then equal and lexicographically preceding rows are returned.',
        () async {
      var result = await Types.db.find(
        session,
        where: (t) => t.aString <= 'two',
      );

      expect(result.length, 2);
      expect(result.map((e) => e.aString).toSet(), {'one', 'two'});
    });
  });
}
