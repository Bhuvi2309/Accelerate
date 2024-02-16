// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:accelerate/app_state.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Map<String, dynamic>> attendeeList = [];

Future<void> storeAttendeeID(String attendeeID) async {
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
      print('FirstName: ${attendeeData['FirstName']}');
      print('LastName: ${attendeeData['LastName']}');
      print('Position: ${attendeeData['Position']}');
      // Extract all columns as needed
      String firstName = attendeeData['FirstName'];
      String lastName = attendeeData['LastName'];
      String position = attendeeData['Position'];
      String expenditureOrg = attendeeData['ExpenditureOrg'];
      String generalManager = attendeeData['GeneralManager'];
      String employeeEmail = attendeeData['EmployeeEmail'];
      String city = attendeeData['City'];
      String state = attendeeData['State'];
      String country = attendeeData['Country'];
      String phoneNumber = attendeeData['PhoneNumber'];

      // Store data in app state list
      attendeeList.add({
        'FirstName': firstName,
        'LastName': lastName,
        'Position': position,
        'ExpenditureOrg': expenditureOrg,
        'GeneralManager': generalManager,
        'EmployeeEmail': employeeEmail,
        'City': city,
        'State': state,
        'Country': country,
        'PhoneNumber': phoneNumber,
      });

      FFAppState().notifyListeners();
      print('attendeeList  found in database$attendeeList.');
    } else {
      print('Attendee not found in database.');
      // Handle attendee not found scenario
    }
  } catch (e) {
    print('Error: $e');
    // Handle database query errors
  }
}
