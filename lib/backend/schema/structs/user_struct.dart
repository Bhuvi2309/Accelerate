// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    String? position,
    String? generalManager,
    String? expeditureOrganization,
    String? email,
    String? city,
    String? state,
    String? country,
    String? phoneNumber,
  })  : _firstName = firstName,
        _lastName = lastName,
        _position = position,
        _generalManager = generalManager,
        _expeditureOrganization = expeditureOrganization,
        _email = email,
        _city = city,
        _state = state,
        _country = country,
        _phoneNumber = phoneNumber;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;
  bool hasPosition() => _position != null;

  // "general_manager" field.
  String? _generalManager;
  String get generalManager => _generalManager ?? '';
  set generalManager(String? val) => _generalManager = val;
  bool hasGeneralManager() => _generalManager != null;

  // "expediture_organization" field.
  String? _expeditureOrganization;
  String get expeditureOrganization => _expeditureOrganization ?? '';
  set expeditureOrganization(String? val) => _expeditureOrganization = val;
  bool hasExpeditureOrganization() => _expeditureOrganization != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        position: data['position'] as String?,
        generalManager: data['general_manager'] as String?,
        expeditureOrganization: data['expediture_organization'] as String?,
        email: data['email'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        phoneNumber: data['phone_number'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'position': _position,
        'general_manager': _generalManager,
        'expediture_organization': _expeditureOrganization,
        'email': _email,
        'city': _city,
        'state': _state,
        'country': _country,
        'phone_number': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'general_manager': serializeParam(
          _generalManager,
          ParamType.String,
        ),
        'expediture_organization': serializeParam(
          _expeditureOrganization,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.String,
          false,
        ),
        generalManager: deserializeParam(
          data['general_manager'],
          ParamType.String,
          false,
        ),
        expeditureOrganization: deserializeParam(
          data['expediture_organization'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        position == other.position &&
        generalManager == other.generalManager &&
        expeditureOrganization == other.expeditureOrganization &&
        email == other.email &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        position,
        generalManager,
        expeditureOrganization,
        email,
        city,
        state,
        country,
        phoneNumber
      ]);
}

UserStruct createUserStruct({
  String? firstName,
  String? lastName,
  String? position,
  String? generalManager,
  String? expeditureOrganization,
  String? email,
  String? city,
  String? state,
  String? country,
  String? phoneNumber,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      position: position,
      generalManager: generalManager,
      expeditureOrganization: expeditureOrganization,
      email: email,
      city: city,
      state: state,
      country: country,
      phoneNumber: phoneNumber,
    );
