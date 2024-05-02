import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _attendeeList = (await secureStorage.getStringList('ff_attendeeList'))
              ?.map((x) {
                try {
                  return AttendeeDetailsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _attendeeList;
    });
    await _safeInitAsync(() async {
      _Conference =
          await secureStorage.getStringList('ff_Conference') ?? _Conference;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  List<AttendeeDetailsStruct> _attendeeList = [
    AttendeeDetailsStruct.fromSerializableMap(jsonDecode(
        '{\"FirstName\":\"Hello World\",\"LastName\":\"fsdfsdf\",\"Position\":\"Hello World\",\"ExpenditureOrg\":\"vxcvxcvxc\",\"GeneralManager\":\"Hello World\",\"EmployeeEmail\":\"Hello World\",\"City\":\"Hello World\",\"State\":\"Hello World\",\"Country\":\"Hello World\",\"PhoneNumber\":\"0\",\"Notes\":\"Hello World\"}'))
  ];
  List<AttendeeDetailsStruct> get attendeeList => _attendeeList;
  set attendeeList(List<AttendeeDetailsStruct> value) {
    _attendeeList = value;
    secureStorage.setStringList(
        'ff_attendeeList', value.map((x) => x.serialize()).toList());
  }

  void deleteAttendeeList() {
    secureStorage.delete(key: 'ff_attendeeList');
  }

  void addToAttendeeList(AttendeeDetailsStruct value) {
    _attendeeList.add(value);
    secureStorage.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void removeFromAttendeeList(AttendeeDetailsStruct value) {
    _attendeeList.remove(value);
    secureStorage.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAttendeeList(int index) {
    _attendeeList.removeAt(index);
    secureStorage.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void updateAttendeeListAtIndex(
    int index,
    AttendeeDetailsStruct Function(AttendeeDetailsStruct) updateFn,
  ) {
    _attendeeList[index] = updateFn(_attendeeList[index]);
    secureStorage.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAttendeeList(int index, AttendeeDetailsStruct value) {
    _attendeeList.insert(index, value);
    secureStorage.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  int _isInt = 0;
  int get isInt => _isInt;
  set isInt(int value) {
    _isInt = value;
  }

  bool _isInteger = false;
  bool get isInteger => _isInteger;
  set isInteger(bool value) {
    _isInteger = value;
  }

  bool _isScanned = false;
  bool get isScanned => _isScanned;
  set isScanned(bool value) {
    _isScanned = value;
  }

  bool _isKeyBoardVisible = false;
  bool get isKeyBoardVisible => _isKeyBoardVisible;
  set isKeyBoardVisible(bool value) {
    _isKeyBoardVisible = value;
  }

  List<ConferenceDetailsStruct> _conferenceSchedule = [
    ConferenceDetailsStruct.fromSerializableMap(
        jsonDecode('{\"StartTime\":\"7.30 A.M\",\"EndTime\":\"6.00 P.M\"}')),
    ConferenceDetailsStruct.fromSerializableMap(
        jsonDecode('{\"StartTime\":\"5.00 A.M\",\"EndTime\":\"6.00 P.M\"}')),
    ConferenceDetailsStruct.fromSerializableMap(
        jsonDecode('{\"StartTime\":\"8.00A.M\",\"EndTime\":\"6.00 P.M\"}'))
  ];
  List<ConferenceDetailsStruct> get conferenceSchedule => _conferenceSchedule;
  set conferenceSchedule(List<ConferenceDetailsStruct> value) {
    _conferenceSchedule = value;
  }

  void addToConferenceSchedule(ConferenceDetailsStruct value) {
    _conferenceSchedule.add(value);
  }

  void removeFromConferenceSchedule(ConferenceDetailsStruct value) {
    _conferenceSchedule.remove(value);
  }

  void removeAtIndexFromConferenceSchedule(int index) {
    _conferenceSchedule.removeAt(index);
  }

  void updateConferenceScheduleAtIndex(
    int index,
    ConferenceDetailsStruct Function(ConferenceDetailsStruct) updateFn,
  ) {
    _conferenceSchedule[index] = updateFn(_conferenceSchedule[index]);
  }

  void insertAtIndexInConferenceSchedule(
      int index, ConferenceDetailsStruct value) {
    _conferenceSchedule.insert(index, value);
  }

  List<String> _Conference = ['Start', 'End'];
  List<String> get Conference => _Conference;
  set Conference(List<String> value) {
    _Conference = value;
    secureStorage.setStringList('ff_Conference', value);
  }

  void deleteConference() {
    secureStorage.delete(key: 'ff_Conference');
  }

  void addToConference(String value) {
    _Conference.add(value);
    secureStorage.setStringList('ff_Conference', _Conference);
  }

  void removeFromConference(String value) {
    _Conference.remove(value);
    secureStorage.setStringList('ff_Conference', _Conference);
  }

  void removeAtIndexFromConference(int index) {
    _Conference.removeAt(index);
    secureStorage.setStringList('ff_Conference', _Conference);
  }

  void updateConferenceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Conference[index] = updateFn(_Conference[index]);
    secureStorage.setStringList('ff_Conference', _Conference);
  }

  void insertAtIndexInConference(int index, String value) {
    _Conference.insert(index, value);
    secureStorage.setStringList('ff_Conference', _Conference);
  }

  List<LatLng> _Locations = [
    const LatLng(35.929673, -78.948237),
    const LatLng(38.88951, -77.032),
    const LatLng(0, 0),
    const LatLng(36.37945, -75.83029),
    const LatLng(0, 0),
    const LatLng(0, 0),
    const LatLng(35.929673, 0),
    const LatLng(0, 0)
  ];
  List<LatLng> get Locations => _Locations;
  set Locations(List<LatLng> value) {
    _Locations = value;
  }

  void addToLocations(LatLng value) {
    _Locations.add(value);
  }

  void removeFromLocations(LatLng value) {
    _Locations.remove(value);
  }

  void removeAtIndexFromLocations(int index) {
    _Locations.removeAt(index);
  }

  void updateLocationsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _Locations[index] = updateFn(_Locations[index]);
  }

  void insertAtIndexInLocations(int index, LatLng value) {
    _Locations.insert(index, value);
  }

  bool _hasScannedQR = false;
  bool get hasScannedQR => _hasScannedQR;
  set hasScannedQR(bool value) {
    _hasScannedQR = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
