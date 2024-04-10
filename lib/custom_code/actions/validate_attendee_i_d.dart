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

Future<bool> validateAttendeeID(int attendeeID) async {
  try {
    final database = await openDatabase('contacts.db');

    // Check if the attendee has already scanned
    final result = await database.rawQuery('''
      SELECT isScanned FROM Contacts WHERE attendeeID = ?
    ''', [attendeeID]);

    final isScanned = result.isNotEmpty && result.first['isScanned'] == 'true';

    if (isScanned) {
      return false; // Indicate already scanned
    } else {
      // Mark as scanned in the database
      await database.rawUpdate('''
        UPDATE Contacts SET isScanned = 'true' WHERE attendeeID = ?
      ''', [attendeeID]);

      return true; // Indicate valid scan
    }
  } catch (error) {
    print('Error validating attendee ID: $error');
    return false; // Return false on error to prevent incorrect scanning
  }
}
