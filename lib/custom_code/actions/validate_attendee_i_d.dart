// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:accelerate/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/src/widgets/framework.dart';

Future<bool?> validateAttendeeID(String attendeeID) async {
  final regex = RegExp(r'^[0-9\-]+$');

  // Check if attendeeID matches the regex
  if (!regex.hasMatch(attendeeID)) {
    try {
      int.parse(attendeeID); // Attempt to parse as an integer
    } catch (e) {
      // If parsing fails, throw an error
      throw Exception(
          'Invalid attendeeID: $attendeeID must be an integer or a string containing only numbers');
    }
  }

  return true;
}
