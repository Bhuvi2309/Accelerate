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

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Map<String, dynamic>> attendeeList = [];

Future<void> storeAttendeeList(String attendeeID) async {
  try {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'contacts.db');

    // Open the database
    Database database = await openDatabase(path, version: 1);

    // Query database based on attendeeID
    List<Map<String, dynamic>> results = await database.query(
      'Contacts',
      where: 'attendeeID = ?',
      whereArgs: [attendeeID],
    );

    if (results.isNotEmpty) {
      Map<String, dynamic> attendeeData = results.first;

      // Create an AttendeeDetailsStruct object
      AttendeeDetailsStruct attendee = AttendeeDetailsStruct(
          attendeeId: attendeeData['attendeeID'],
          firstName: attendeeData['FirstName'],
          lastName: attendeeData['LastName'],
          position: attendeeData['Position'],
          expenditureOrg: attendeeData['ExpenditureOrg'],
          generalManager: attendeeData['GeneralManager'],
          employeeEmail: attendeeData['EmployeeEmail'],
          city: attendeeData['City'],
          state: attendeeData['State'],
          country: attendeeData['Country'],
          phoneNumber: (attendeeData['PhoneNumber'] != null)
              ? int.tryParse(attendeeData['PhoneNumber'])
              : null,
          notes: attendeeData['Notes']);

      // Store the AttendeeDetailsStruct object in the app state list
      FFAppState().attendeeList.add(attendee);

      print('Attendee details stored successfully: $attendee');
    } else {
      print('Attendee not found in database.');
      // Handle attendee not found scenario (e.g., display message, initialize list)
    }
  } catch (e) {
    print('Error: $e');
    // Handle database errors (e.g., display error message, log the error)
  }
}
