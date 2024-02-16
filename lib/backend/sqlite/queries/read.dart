import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN SELECT CONTACTS BY ATTENDEEID
Future<List<SelectContactsByAttendeeIdRow>> performSelectContactsByAttendeeId(
  Database database, {
  String? attendeeID,
}) {
  final query = '''
SELECT * FROM contacts WHERE attendeeId = $attendeeID
''';
  return _readQuery(database, query, (d) => SelectContactsByAttendeeIdRow(d));
}

class SelectContactsByAttendeeIdRow extends SqliteRow {
  SelectContactsByAttendeeIdRow(super.data);

  String get attendeeId => data['AttendeeId'] as String;
  String? get lastName => data['LastName'] as String?;
  String? get firstName => data['FirstName'] as String?;
  String? get position => data['Position'] as String?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  String? get city => data['City'] as String?;
  String? get state => data['State'] as String?;
  String? get country => data['Country'] as String?;
  String? get phoneNumber => data['PhoneNumber'] as String?;
}

/// END SELECT CONTACTS BY ATTENDEEID
