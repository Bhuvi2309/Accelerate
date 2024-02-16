// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactStruct extends BaseStruct {
  ContactStruct({
    String? attendeeID,
    String? firstName,
    String? lastName,
    String? position,
    String? generalManager,
    String? expeditureOrganization,
    String? employeeEmail,
    String? city,
    String? state,
    String? country,
    String? phoneNumber,
    String? notes,
  })  : _attendeeID = attendeeID,
        _firstName = firstName,
        _lastName = lastName,
        _position = position,
        _generalManager = generalManager,
        _expeditureOrganization = expeditureOrganization,
        _employeeEmail = employeeEmail,
        _city = city,
        _state = state,
        _country = country,
        _phoneNumber = phoneNumber,
        _notes = notes;

  // "attendeeID" field.
  String? _attendeeID;
  String get attendeeID => _attendeeID ?? '';
  set attendeeID(String? val) => _attendeeID = val;
  bool hasAttendeeID() => _attendeeID != null;

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

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;
  bool hasPosition() => _position != null;

  // "GeneralManager" field.
  String? _generalManager;
  String get generalManager => _generalManager ?? '';
  set generalManager(String? val) => _generalManager = val;
  bool hasGeneralManager() => _generalManager != null;

  // "expediture_organization" field.
  String? _expeditureOrganization;
  String get expeditureOrganization => _expeditureOrganization ?? '';
  set expeditureOrganization(String? val) => _expeditureOrganization = val;
  bool hasExpeditureOrganization() => _expeditureOrganization != null;

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
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  static ContactStruct fromMap(Map<String, dynamic> data) => ContactStruct(
        attendeeID: data['attendeeID'] as String?,
        firstName: data['FirstName'] as String?,
        lastName: data['LastName'] as String?,
        position: data['position'] as String?,
        generalManager: data['GeneralManager'] as String?,
        expeditureOrganization: data['expediture_organization'] as String?,
        employeeEmail: data['EmployeeEmail'] as String?,
        city: data['City'] as String?,
        state: data['State'] as String?,
        country: data['Country'] as String?,
        phoneNumber: data['PhoneNumber'] as String?,
        notes: data['Notes'] as String?,
      );

  static ContactStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContactStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'attendeeID': _attendeeID,
        'FirstName': _firstName,
        'LastName': _lastName,
        'position': _position,
        'GeneralManager': _generalManager,
        'expediture_organization': _expeditureOrganization,
        'EmployeeEmail': _employeeEmail,
        'City': _city,
        'State': _state,
        'Country': _country,
        'PhoneNumber': _phoneNumber,
        'Notes': _notes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'attendeeID': serializeParam(
          _attendeeID,
          ParamType.String,
        ),
        'FirstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'LastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'GeneralManager': serializeParam(
          _generalManager,
          ParamType.String,
        ),
        'expediture_organization': serializeParam(
          _expeditureOrganization,
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
          ParamType.String,
        ),
        'Notes': serializeParam(
          _notes,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactStruct(
        attendeeID: deserializeParam(
          data['attendeeID'],
          ParamType.String,
          false,
        ),
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
          data['position'],
          ParamType.String,
          false,
        ),
        generalManager: deserializeParam(
          data['GeneralManager'],
          ParamType.String,
          false,
        ),
        expeditureOrganization: deserializeParam(
          data['expediture_organization'],
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
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['Notes'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactStruct &&
        attendeeID == other.attendeeID &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        position == other.position &&
        generalManager == other.generalManager &&
        expeditureOrganization == other.expeditureOrganization &&
        employeeEmail == other.employeeEmail &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        phoneNumber == other.phoneNumber &&
        notes == other.notes;
  }

  @override
  int get hashCode => const ListEquality().hash([
        attendeeID,
        firstName,
        lastName,
        position,
        generalManager,
        expeditureOrganization,
        employeeEmail,
        city,
        state,
        country,
        phoneNumber,
        notes
      ]);
}

ContactStruct createContactStruct({
  String? attendeeID,
  String? firstName,
  String? lastName,
  String? position,
  String? generalManager,
  String? expeditureOrganization,
  String? employeeEmail,
  String? city,
  String? state,
  String? country,
  String? phoneNumber,
  String? notes,
}) =>
    ContactStruct(
      attendeeID: attendeeID,
      firstName: firstName,
      lastName: lastName,
      position: position,
      generalManager: generalManager,
      expeditureOrganization: expeditureOrganization,
      employeeEmail: employeeEmail,
      city: city,
      state: state,
      country: country,
      phoneNumber: phoneNumber,
      notes: notes,
    );
