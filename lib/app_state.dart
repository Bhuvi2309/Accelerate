import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  bool _isInteger = true;
  bool get isInteger => _isInteger;
  set isInteger(bool _value) {
    _isInteger = _value;
  }

  List<AttendeeDetailsStruct> _attendeeList = [];
  List<AttendeeDetailsStruct> get attendeeList => _attendeeList;
  set attendeeList(List<AttendeeDetailsStruct> _value) {
    _attendeeList = _value;
  }

  void addToAttendeeList(AttendeeDetailsStruct _value) {
    _attendeeList.add(_value);
  }

  void removeFromAttendeeList(AttendeeDetailsStruct _value) {
    _attendeeList.remove(_value);
  }

  void removeAtIndexFromAttendeeList(int _index) {
    _attendeeList.removeAt(_index);
  }

  void updateAttendeeListAtIndex(
    int _index,
    AttendeeDetailsStruct Function(AttendeeDetailsStruct) updateFn,
  ) {
    _attendeeList[_index] = updateFn(_attendeeList[_index]);
  }

  void insertAtIndexInAttendeeList(int _index, AttendeeDetailsStruct _value) {
    _attendeeList.insert(_index, _value);
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
