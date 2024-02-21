// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<void> validateAttendeeID(String attendeeID) async {
  try {
    // Open the database
    final database = await openDatabase('contacts.db');

    // Query for existing record with scanned value 1
    final existingRecord = await database.query(
      'Contacts',
      where: 'attendeeID = ? AND scanned = 1',
      whereArgs: [attendeeID],
    );

    // If a record already exists with scanned = 1, throw an error
    if (existingRecord.isNotEmpty) {
      throw Exception('Attendee already scanned');
    } else {
      print('Attendee can be scanned ');
    }
  } catch (error) {
    if (error is Exception && error.toString() == 'Attendee already scanned') {
      print('Attendee already scanned!');
    } else {
      print('Error adding or updating row: $error');
    }
  }
}
