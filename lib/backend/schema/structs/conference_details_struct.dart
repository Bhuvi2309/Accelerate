// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConferenceDetailsStruct extends BaseStruct {
  ConferenceDetailsStruct({
    String? startTime,
    String? endTime,
  })  : _startTime = startTime,
        _endTime = endTime;

  // "StartTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  static ConferenceDetailsStruct fromMap(Map<String, dynamic> data) =>
      ConferenceDetailsStruct(
        startTime: data['StartTime'] as String?,
        endTime: data['EndTime'] as String?,
      );

  static ConferenceDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ConferenceDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'StartTime': _startTime,
        'EndTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'StartTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'EndTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConferenceDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConferenceDetailsStruct(
        startTime: deserializeParam(
          data['StartTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['EndTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConferenceDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConferenceDetailsStruct &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime, endTime]);
}

ConferenceDetailsStruct createConferenceDetailsStruct({
  String? startTime,
  String? endTime,
}) =>
    ConferenceDetailsStruct(
      startTime: startTime,
      endTime: endTime,
    );
