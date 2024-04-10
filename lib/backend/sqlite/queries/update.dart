import 'package:sqflite/sqflite.dart';

/// BEGIN UPDATELIST
Future performUpdateList(
  Database database, {
  String? attendeeID,
}) {
  final query = '''
SELECT *
FROM Contacts
WHERE attendeeId = $attendeeID AND isScanned = true;

''';
  return database.rawQuery(query);
}

/// END UPDATELIST
