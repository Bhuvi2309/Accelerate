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

  bool _isInteger = true;
  bool get isInteger => _isInteger;
  set isInteger(bool value) {
    _isInteger = value;
  }

  List<AttendeeDetailsStruct> _attendeeList = [];
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
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
