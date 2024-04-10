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

import 'package:sqflite/sqflite.dart';

List attendeeList = [];

Future<List> fetchAttendeeDetails(int? attendeeID) async {
  try {
    final database = await openDatabase('contacts.db');
    final columns = await database.rawQuery(
      '''
      PRAGMA table_info("Contacts")
      ''',
    );

    final attendeeDetails = await database.rawQuery(
      '''
      SELECT * FROM Contacts WHERE isScanned = 'true'
      ''',
    );

    // Clear the attendeeList for new data
    // attendeeList.clear();

    // Add each row's data to the list
    attendeeDetails.forEach((row) => attendeeList.add(row));

    print('Got all the attendee details: $attendeeList');
  } catch (error) {
    print('Error pulling the attendee details: $error');
  }

  return attendeeList;
}
