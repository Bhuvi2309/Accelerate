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

Future<void> validateDuplication(String attendeeID) async {
  try {
    // Open the database
    final database = await openDatabase('contacts.db');

    // Check if the 'scanned' column exists
    final columns = await database.rawQuery(
      '''
      PRAGMA table_info("Contacts")
      ''',
    );

    final hasScannedColumn = columns.any((row) => row['name'] == 'scanned');

    // Add the 'scanned' column if it doesn't exist
    if (!hasScannedColumn) {
      await database.execute('''
        ALTER TABLE Contacts ADD COLUMN scanned BOOLEAN DEFAULT 0
      ''');
    }

    // Update the database using named parameters for clarity and security
    final result = await database.insert(
      'Contacts',
      {
        'attendeeID': attendeeID,
        'scanned': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Row inserted or updated successfully! Rows affected: $result');
  } catch (error) {
    print('Error adding or updating row: $error');
  }
}
