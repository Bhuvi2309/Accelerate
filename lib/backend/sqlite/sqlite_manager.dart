import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'contacts',
      'contacts.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<SelectContactsByAttendeeIdRow>> selectContactsByAttendeeId({
    String? attendeeID,
  }) =>
      performSelectContactsByAttendeeId(
        _database,
        attendeeID: attendeeID,
      );

  Future<List<IsScannedRow>> isScanned({
    bool? isScanned,
  }) =>
      performIsScanned(
        _database,
        isScanned: isScanned,
      );

  Future<List<SearchContactsRow>> searchContacts({
    String? searchQuery,
  }) =>
      performSearchContacts(
        _database,
        searchQuery: searchQuery,
      );

  Future<List<Day1IternaryRow>> day1Iternary() => performDay1Iternary(
        _database,
      );

  Future<List<Day2IternaryRow>> day2Iternary() => performDay2Iternary(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future updateList({
    String? attendeeID,
  }) =>
      performUpdateList(
        _database,
        attendeeID: attendeeID,
      );

  /// END UPDATE QUERY CALLS
}
