// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> cancelAction(String? attendeeID) async {
  final int parsedAttendeeID = int.tryParse(attendeeID!) ?? 0;

  if (parsedAttendeeID > 0) {
    return false;
  } else {
    return true; // Check if attendeeID is greater than 0
  }
}
