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

Future insertingRow(String attendeeID, String note) async {
  try {
    // Open the database
    final database = await openDatabase('contacts.db');

    // Check if the 'Notes' column exists
    final columns = await database.rawQuery(
      '''
      PRAGMA table_info("Contacts")
      ''',
    );

    final hasNotesColumn = columns.any((row) => row['name'] == 'Notes');

    // Add the 'Notes' column if it doesn't exist
    if (!hasNotesColumn) {
      await database.execute('''
        ALTER TABLE Contacts ADD COLUMN Notes TEXT
      ''');
    }

    // Insert the note value into the 'Notes' column
    final result = await database.rawInsert('''
      UPDATE contacts SET Notes = ? WHERE attendeeID = ?
    ''', [note, attendeeID]);

    print('Note added successfully! Rows updated: $result');
  } catch (error) {
    print('Error adding note: $error');
  }
}
