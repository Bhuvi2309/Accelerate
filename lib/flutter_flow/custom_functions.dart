import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';

bool? validateAttendeeDetails(String? attendeeID) {
  if (attendeeID == null || attendeeID.isEmpty) {
    return false;
  } else {
    return true;
  }
}

int? strToInt(String? attendeeIDInput) {
  return int.parse(attendeeIDInput!);
}

List<LatLng>? mapLocation(FFPlace? location) {
  if (location == null) {
    return null;
  }

  final latLngList = <LatLng>[];
  latLngList.add(location.latLng);
  latLngList.add(LatLng(37.7749, -122.4194));
  latLngList.add(LatLng(48.8566, 2.3522));
  return latLngList;
}
