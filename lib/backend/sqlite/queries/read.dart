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

  int? get attendeeId => data['AttendeeId'] as int?;
  String? get lastName => data['LastName'] as String?;
  String? get firstName => data['FirstName'] as String?;
  String? get position => data['Position'] as String?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get employeeEmail => data['EmployeeEmail'] as String?;
  String? get city => data['City'] as String?;
  String? get state => data['State'] as String?;
  String get country => data['Country'] as String;
  int? get phoneNumber => data['PhoneNumber'] as int?;
  String? get notes => data['Notes'] as String?;
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
  String? get phoneNumber => data['PhoneNumber'] as String?;
  String? get notes => data['Notes'] as String?;
  String? get state => data['State'] as String?;
  String? get country => data['Country'] as String?;
  int? get attendeeID => data['attendeeID'] as int?;
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
WHERE ((AttendeeId LIKE '%$searchQuery%')
OR (FirstName LIKE '%$searchQuery%')
OR (LastName LIKE '%$searchQuery%')
OR (EmployeeEmail LIKE '%$searchQuery%')
OR (State LIKE '%$searchQuery%')
OR (City LIKE '%$searchQuery%')
OR (Country LIKE '%$searchQuery%')
OR (ExpenditureOrg LIKE '%$searchQuery%')
OR (GeneralManager LIKE '%$searchQuery%')
OR (PhoneNumber LIKE '%$searchQuery%')
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
  int? get attendeeId => data['AttendeeId'] as int?;
  String? get expenditureOrg => data['ExpenditureOrg'] as String?;
  String? get position => data['Position'] as String?;
  String? get city => data['City'] as String?;
  String? get generalManager => data['GeneralManager'] as String?;
  String? get country => data['Country'] as String?;
  int? get phoneNumber => data['PhoneNumber'] as int?;
  String? get notes => data['Notes'] as String?;
}

/// END SEARCHCONTACTS

/// BEGIN DAY1ITERNARY
Future<List<Day1IternaryRow>> performDay1Iternary(
  Database database,
) {
  const query = '''
select Start,End,GrandABCD,GrandE,GrandFMills13,GrandGH,Parkview from Day1;
''';
  return _readQuery(database, query, (d) => Day1IternaryRow(d));
}

class Day1IternaryRow extends SqliteRow {
  Day1IternaryRow(super.data);

  String? get start => data['Start'] as String?;
  String? get end => data['End'] as String?;
  String? get grandABCD => data['GrandABCD'] as String?;
  String? get grandE => data['GrandE'] as String?;
  String? get grandFMills13 => data['GrandFMills13'] as String?;
  String? get grandGH => data['GrandGH'] as String?;
  String? get parkview => data['Parkview'] as String?;
}

/// END DAY1ITERNARY

/// BEGIN DAY2ITERNARY
Future<List<Day2IternaryRow>> performDay2Iternary(
  Database database,
) {
  const query = '''
select Start,End,GrandABCD,GrandE,GrandFMills13,GrandGH,Parkview from Day2;
''';
  return _readQuery(database, query, (d) => Day2IternaryRow(d));
}

class Day2IternaryRow extends SqliteRow {
  Day2IternaryRow(super.data);

  String? get start => data['Start'] as String?;
  String? get end => data['End'] as String?;
  String? get grandABCD => data['GrandABCD'] as String?;
  String? get grandE => data['GrandE'] as String?;
  String? get grandFMills13 => data['GrandFMills13'] as String?;
  String? get grangGH => data['GrangGH'] as String?;
  String? get parkview => data['Parkview'] as String?;
}

/// END DAY2ITERNARY
