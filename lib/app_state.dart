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
      _attendeeList = prefs.getStringList('ff_attendeeList') ?? _attendeeList;
    });
    _safeInit(() {
      _attendeeID = prefs.getInt('ff_attendeeID') ?? _attendeeID;
    });
    _safeInit(() {
      _FirstName = prefs.getStringList('ff_FirstName') ?? _FirstName;
    });
    _safeInit(() {
      _LastName = prefs.getStringList('ff_LastName') ?? _LastName;
    });
    _safeInit(() {
      _Position = prefs.getStringList('ff_Position') ?? _Position;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _attendeeList = ['FirstName', 'Last Name', 'Position', 'City'];
  List<String> get attendeeList => _attendeeList;
  set attendeeList(List<String> value) {
    _attendeeList = value;
    prefs.setStringList('ff_attendeeList', value);
  }

  void addToAttendeeList(String value) {
    _attendeeList.add(value);
    prefs.setStringList('ff_attendeeList', _attendeeList);
  }

  void removeFromAttendeeList(String value) {
    _attendeeList.remove(value);
    prefs.setStringList('ff_attendeeList', _attendeeList);
  }

  void removeAtIndexFromAttendeeList(int index) {
    _attendeeList.removeAt(index);
    prefs.setStringList('ff_attendeeList', _attendeeList);
  }

  void updateAttendeeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _attendeeList[index] = updateFn(_attendeeList[index]);
    prefs.setStringList('ff_attendeeList', _attendeeList);
  }

  void insertAtIndexInAttendeeList(int index, String value) {
    _attendeeList.insert(index, value);
    prefs.setStringList('ff_attendeeList', _attendeeList);
  }

  int _attendeeID = 0;
  int get attendeeID => _attendeeID;
  set attendeeID(int value) {
    _attendeeID = value;
    prefs.setInt('ff_attendeeID', value);
  }

  List<String> _FirstName = [];
  List<String> get FirstName => _FirstName;
  set FirstName(List<String> value) {
    _FirstName = value;
    prefs.setStringList('ff_FirstName', value);
  }

  void addToFirstName(String value) {
    _FirstName.add(value);
    prefs.setStringList('ff_FirstName', _FirstName);
  }

  void removeFromFirstName(String value) {
    _FirstName.remove(value);
    prefs.setStringList('ff_FirstName', _FirstName);
  }

  void removeAtIndexFromFirstName(int index) {
    _FirstName.removeAt(index);
    prefs.setStringList('ff_FirstName', _FirstName);
  }

  void updateFirstNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _FirstName[index] = updateFn(_FirstName[index]);
    prefs.setStringList('ff_FirstName', _FirstName);
  }

  void insertAtIndexInFirstName(int index, String value) {
    _FirstName.insert(index, value);
    prefs.setStringList('ff_FirstName', _FirstName);
  }

  List<String> _LastName = [];
  List<String> get LastName => _LastName;
  set LastName(List<String> value) {
    _LastName = value;
    prefs.setStringList('ff_LastName', value);
  }

  void addToLastName(String value) {
    _LastName.add(value);
    prefs.setStringList('ff_LastName', _LastName);
  }

  void removeFromLastName(String value) {
    _LastName.remove(value);
    prefs.setStringList('ff_LastName', _LastName);
  }

  void removeAtIndexFromLastName(int index) {
    _LastName.removeAt(index);
    prefs.setStringList('ff_LastName', _LastName);
  }

  void updateLastNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _LastName[index] = updateFn(_LastName[index]);
    prefs.setStringList('ff_LastName', _LastName);
  }

  void insertAtIndexInLastName(int index, String value) {
    _LastName.insert(index, value);
    prefs.setStringList('ff_LastName', _LastName);
  }

  List<String> _Position = [];
  List<String> get Position => _Position;
  set Position(List<String> value) {
    _Position = value;
    prefs.setStringList('ff_Position', value);
  }

  void addToPosition(String value) {
    _Position.add(value);
    prefs.setStringList('ff_Position', _Position);
  }

  void removeFromPosition(String value) {
    _Position.remove(value);
    prefs.setStringList('ff_Position', _Position);
  }

  void removeAtIndexFromPosition(int index) {
    _Position.removeAt(index);
    prefs.setStringList('ff_Position', _Position);
  }

  void updatePositionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Position[index] = updateFn(_Position[index]);
    prefs.setStringList('ff_Position', _Position);
  }

  void insertAtIndexInPosition(int index, String value) {
    _Position.insert(index, value);
    prefs.setStringList('ff_Position', _Position);
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  List<ContactStruct> _attendeeListUpdated = [];
  List<ContactStruct> get attendeeListUpdated => _attendeeListUpdated;
  set attendeeListUpdated(List<ContactStruct> value) {
    _attendeeListUpdated = value;
  }

  void addToAttendeeListUpdated(ContactStruct value) {
    _attendeeListUpdated.add(value);
  }

  void removeFromAttendeeListUpdated(ContactStruct value) {
    _attendeeListUpdated.remove(value);
  }

  void removeAtIndexFromAttendeeListUpdated(int index) {
    _attendeeListUpdated.removeAt(index);
  }

  void updateAttendeeListUpdatedAtIndex(
    int index,
    ContactStruct Function(ContactStruct) updateFn,
  ) {
    _attendeeListUpdated[index] = updateFn(_attendeeListUpdated[index]);
  }

  void insertAtIndexInAttendeeListUpdated(int index, ContactStruct value) {
    _attendeeListUpdated.insert(index, value);
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
