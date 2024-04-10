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

Future<int> strToIntConversion(String? attendeeID) async {
  if (attendeeID == null) {
    return Future.error("attendeeID cannot be null");
  }

  try {
    int id = int.parse(attendeeID);
    return id;
  } catch (e) {
    int unknown = 1;
    return unknown;
  }
}

// Future<String> strToIntConversion(String attendeeID) async {
//   if (attendeeID == null) {
//     throw ArgumentError("attendeeID cannot be null");
//   }

//   if (attendeeID is int) {
//     return "Integer"; // Return "Integer" if attendeeID is an integer
//   } else if (attendeeID is String) {
//     return "String"; // Return "String" if attendeeID is a string
//   } else {
//     return "Unknown"; // Return "Unknown" if attendeeID is neither an integer nor a string
//   }
// }
