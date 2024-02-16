import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _attendeeList = prefs
              .getStringList('ff_attendeeList')
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

  late SharedPreferences prefs;

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
    prefs.setStringList(
        'ff_attendeeList', value.map((x) => x.serialize()).toList());
  }

  void addToAttendeeList(AttendeeDetailsStruct value) {
    _attendeeList.add(value);
    prefs.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void removeFromAttendeeList(AttendeeDetailsStruct value) {
    _attendeeList.remove(value);
    prefs.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAttendeeList(int index) {
    _attendeeList.removeAt(index);
    prefs.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void updateAttendeeListAtIndex(
    int index,
    AttendeeDetailsStruct Function(AttendeeDetailsStruct) updateFn,
  ) {
    _attendeeList[index] = updateFn(_attendeeList[index]);
    prefs.setStringList(
        'ff_attendeeList', _attendeeList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAttendeeList(int index, AttendeeDetailsStruct value) {
    _attendeeList.insert(index, value);
    prefs.setStringList(
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
