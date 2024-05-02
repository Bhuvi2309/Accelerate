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
SELECT * FROM contacts WHERE attendeeId = '$attendeeID'
''';
  return _readQuery(database, query, (d) => SelectContactsByAttendeeIdRow(d));
}

class SelectContactsByAttendeeIdRow extends SqliteRow {
  SelectContactsByAttendeeIdRow(super.data);

  int? get attendeeid => data['Attendeeid'] as int?;
  String? get lastName => data['LastName'] as String?;
  String? get firstName => data['FirstName'] as String?;
  String? get position => data['Position'] as String?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  String? get city => data['City'] as String?;
  String? get state => data['State'] as String?;
  String? get notes => data['Notes'] as String?;
  String? get colombiauntry => data['Colombiauntry'] as String?;
  String? get vicePresident => data['VicePresident'] as String?;
}

/// END SELECT CONTACTS BY ATTENDEEID

/// BEGIN ISSCANNED
Future<List<IsScannedRow>> performIsScanned(
  Database database, {
  bool? isScanned,
}) {
  const query = '''
SELECT * FROM Contacts WHERE isScanned = 'true';
''';
  return _readQuery(database, query, (d) => IsScannedRow(d));
}

class IsScannedRow extends SqliteRow {
  IsScannedRow(super.data);

  String? get firstName => data['FirstName'] as String?;
  String? get lastName => data['LastName'] as String?;
  String? get city => data['City'] as String?;
  String? get position => data['Position'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get notes => data['Notes'] as String?;
  String? get state => data['State'] as String?;
  int? get attendeeID => data['AttendeeID'] as int?;
  String? get vicePresident => data['VicePresident'] as String?;
  String? get colombiauntry => data['Colombiauntry'] as String?;
}

/// END ISSCANNED

/// BEGIN SEARCHCONTACTS
Future<List<SearchContactsRow>> performSearchContacts(
  Database database, {
  String? searchQuery,
}) {
  final query = '''
SELECT *
FROM Contacts
WHERE ((AttendeeID LIKE '%$searchQuery%')
OR (FirstName LIKE '%$searchQuery%')
OR (LastName LIKE '%$searchQuery%')
OR (EmployeeEmail LIKE '%$searchQuery%')
OR (State LIKE '%$searchQuery%')
OR (City LIKE '%$searchQuery%')
OR (State LIKE '%$searchQuery%')
OR (Country LIKE '%$searchQuery%')
OR (ExpenditureOrg LIKE '%$searchQuery%')
OR (GeneralManager LIKE '%$searchQuery%')
OR (VicePresident LIKE '%$searchQuery%')
OR (Notes LIKE '%$searchQuery%')
OR (Position LIKE '%$searchQuery%'))
AND isScanned = 'true';
''';
  return _readQuery(database, query, (d) => SearchContactsRow(d));
}

class SearchContactsRow extends SqliteRow {
  SearchContactsRow(super.data);

  String? get firstName => data['FirstName'] as String?;
  String? get lastName => data['LastName'] as String?;
  String? get state => data['State'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  int? get attendeeID => data['AttendeeID'] as int?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get position => data['Position'] as String?;
  String? get city => data['City'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get notes => data['Notes'] as String?;
  String? get vicePresident => data['VicePresident'] as String?;
  String? get country => data['Country'] as String?;
}

/// END SEARCHCONTACTS

/// BEGIN THURSDAY
Future<List<ThursdayRow>> performThursday(
  Database database,
) {
  const query = '''
select Timing,Location,Events from Thursday;
''';
  return _readQuery(database, query, (d) => ThursdayRow(d));
}

class ThursdayRow extends SqliteRow {
  ThursdayRow(super.data);

  String get timing => data['Timing'] as String;
  String get location => data['Location'] as String;
  String get events => data['Events'] as String;
}

/// END THURSDAY

/// BEGIN FRIDAY
Future<List<FridayRow>> performFriday(
  Database database,
) {
  const query = '''
select Timing,Location,Events from Friday;
''';
  return _readQuery(database, query, (d) => FridayRow(d));
}

class FridayRow extends SqliteRow {
  FridayRow(super.data);

  String get timing => data['Timing'] as String;
  String get location => data['Location'] as String;
  String get events => data['Events'] as String;
}

/// END FRIDAY

/// BEGIN SELECT NAME BY ATTENDEEID
Future<List<SelectNameByAttendeeIDRow>> performSelectNameByAttendeeID(
  Database database, {
  String? attendeeID,
}) {
  const query = '''
SELECT FirstName, LastName
FROM contacts
WHERE attendeeId = AttendeeID

''';
  return _readQuery(database, query, (d) => SelectNameByAttendeeIDRow(d));
}

class SelectNameByAttendeeIDRow extends SqliteRow {
  SelectNameByAttendeeIDRow(super.data);

  int? get attendeeid => data['attendeeid'] as int?;
  String? get lastName => data['LastName'] as String?;
  String? get firstName => data['FirstName'] as String?;
  String? get position => data['Position'] as String?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  String? get city => data['City'] as String?;
  String? get state => data['State'] as String?;
  String? get notes => data['Notes'] as String?;
  String? get colombiauntry => data['Colombiauntry'] as String?;
  String? get vicePresident => data['VicePresident'] as String?;
}

/// END SELECT NAME BY ATTENDEEID
