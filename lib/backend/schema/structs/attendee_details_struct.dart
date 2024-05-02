// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendeeDetailsStruct extends BaseStruct {
  AttendeeDetailsStruct({
    String? firstName,
    String? lastName,
    String? position,
    String? expenditureOrg,
    String? generalManager,
    String? employeeEmail,
    String? city,
    String? state,
    String? country,
    int? phoneNumber,
    String? notes,
    String? attendeeId,
  })  : _firstName = firstName,
        _lastName = lastName,
        _position = position,
        _expenditureOrg = expenditureOrg,
        _generalManager = generalManager,
        _employeeEmail = employeeEmail,
        _city = city,
        _state = state,
        _country = country,
        _phoneNumber = phoneNumber,
        _notes = notes,
        _attendeeId = attendeeId;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "Position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;
  bool hasPosition() => _position != null;

  // "ExpenditureOrg" field.
  String? _expenditureOrg;
  String get expenditureOrg => _expenditureOrg ?? '';
  set expenditureOrg(String? val) => _expenditureOrg = val;
  bool hasExpenditureOrg() => _expenditureOrg != null;

  // "GeneralManager" field.
  String? _generalManager;
  String get generalManager => _generalManager ?? '';
  set generalManager(String? val) => _generalManager = val;
  bool hasGeneralManager() => _generalManager != null;

  // "EmployeeEmail" field.
  String? _employeeEmail;
  String get employeeEmail => _employeeEmail ?? '';
  set employeeEmail(String? val) => _employeeEmail = val;
  bool hasEmployeeEmail() => _employeeEmail != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  set phoneNumber(int? val) => _phoneNumber = val;
  void incrementPhoneNumber(int amount) => _phoneNumber = phoneNumber + amount;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "attendeeId" field.
  String? _attendeeId;
  String get attendeeId => _attendeeId ?? '';
  set attendeeId(String? val) => _attendeeId = val;
  bool hasAttendeeId() => _attendeeId != null;

  static AttendeeDetailsStruct fromMap(Map<String, dynamic> data) =>
      AttendeeDetailsStruct(
        firstName: data['FirstName'] as String?,
        lastName: data['LastName'] as String?,
        position: data['Position'] as String?,
        expenditureOrg: data['ExpenditureOrg'] as String?,
        generalManager: data['GeneralManager'] as String?,
        employeeEmail: data['EmployeeEmail'] as String?,
        city: data['City'] as String?,
        state: data['State'] as String?,
        country: data['Country'] as String?,
        phoneNumber: castToType<int>(data['PhoneNumber']),
        notes: data['Notes'] as String?,
        attendeeId: data['attendeeId'] as String?,
      );

  static AttendeeDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? AttendeeDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'FirstName': _firstName,
        'LastName': _lastName,
        'Position': _position,
        'ExpenditureOrg': _expenditureOrg,
        'GeneralManager': _generalManager,
        'EmployeeEmail': _employeeEmail,
        'City': _city,
        'State': _state,
        'Country': _country,
        'PhoneNumber': _phoneNumber,
        'Notes': _notes,
        'attendeeId': _attendeeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FirstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'LastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'Position': serializeParam(
          _position,
          ParamType.String,
        ),
        'ExpenditureOrg': serializeParam(
          _expenditureOrg,
          ParamType.String,
        ),
        'GeneralManager': serializeParam(
          _generalManager,
          ParamType.String,
        ),
        'EmployeeEmail': serializeParam(
          _employeeEmail,
          ParamType.String,
        ),
        'City': serializeParam(
          _city,
          ParamType.String,
        ),
        'State': serializeParam(
          _state,
          ParamType.String,
        ),
        'Country': serializeParam(
          _country,
          ParamType.String,
        ),
        'PhoneNumber': serializeParam(
          _phoneNumber,
          ParamType.int,
        ),
        'Notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'attendeeId': serializeParam(
          _attendeeId,
          ParamType.String,
        ),
      }.withoutNulls;

  static AttendeeDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendeeDetailsStruct(
        firstName: deserializeParam(
          data['FirstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['LastName'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['Position'],
          ParamType.String,
          false,
        ),
        expenditureOrg: deserializeParam(
          data['ExpenditureOrg'],
          ParamType.String,
          false,
        ),
        generalManager: deserializeParam(
          data['GeneralManager'],
          ParamType.String,
          false,
        ),
        employeeEmail: deserializeParam(
          data['EmployeeEmail'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['City'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['State'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['Country'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['PhoneNumber'],
          ParamType.int,
          false,
        ),
        notes: deserializeParam(
          data['Notes'],
          ParamType.String,
          false,
        ),
        attendeeId: deserializeParam(
          data['attendeeId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AttendeeDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendeeDetailsStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        position == other.position &&
        expenditureOrg == other.expenditureOrg &&
        generalManager == other.generalManager &&
        employeeEmail == other.employeeEmail &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        phoneNumber == other.phoneNumber &&
        notes == other.notes &&
        attendeeId == other.attendeeId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        position,
        expenditureOrg,
        generalManager,
        employeeEmail,
        city,
        state,
        country,
        phoneNumber,
        notes,
        attendeeId
      ]);
}

AttendeeDetailsStruct createAttendeeDetailsStruct({
  String? firstName,
  String? lastName,
  String? position,
  String? expenditureOrg,
  String? generalManager,
  String? employeeEmail,
  String? city,
  String? state,
  String? country,
  int? phoneNumber,
  String? notes,
  String? attendeeId,
}) =>
    AttendeeDetailsStruct(
      firstName: firstName,
      lastName: lastName,
      position: position,
      expenditureOrg: expenditureOrg,
      generalManager: generalManager,
      employeeEmail: employeeEmail,
      city: city,
      state: state,
      country: country,
      phoneNumber: phoneNumber,
      notes: notes,
      attendeeId: attendeeId,
    );
