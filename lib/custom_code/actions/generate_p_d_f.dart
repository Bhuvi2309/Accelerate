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

import 'index.dart'; // Imports other custom actions

// Imports other custom actions

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:external_path/external_path.dart';
import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';

List<String> attachments = [];
Future<String> generateUniqueFilename(String baseFilename) async {
  final directory = await getStorageDirectory(); // Using the common function

  if (directory != null) {
    throw Exception('Failed to get storage directory');
  }

  int counter = 1;
  while (File('${directory}/$baseFilename').existsSync()) {
    baseFilename =
        '${baseFilename.split('.').first}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    // If we prefer a number increment:
    // baseFilename = '${baseFilename.split('.').first}($counter).pdf';
    //counter++;
  }
  return baseFilename;
}

Future<String?> getStorageDirectory() async {
  // Determine storage path based on platform
  String? directory;
  if (Platform.isAndroid) {
    directory = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS,
    );
  } else if (Platform.isIOS) {
    directory = (await getApplicationDocumentsDirectory()) as String?;
  } else {
    print('Unsupported platform');
  }
  return directory;
}

Future<String?> generatePDF() async {
  final pdf = pw.Document();
  final database = await openDatabase('contacts.db');
  final attendeeDetails = await database.rawQuery(
    '''
    SELECT * FROM Contacts WHERE isScanned = 'true'
    ''',
  );

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Text('Attendee Information'),
          for (var attendee in attendeeDetails)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('${attendee['FirstName']} ${attendee['LastName']}'),
                pw.Text('${attendee['Position']}'),
                pw.Text('${attendee['State']}'),
                pw.Divider(),
              ],
            )
        ]);
      },
    ),
  );

  final status = await Permission.storage.request();
  if (!status.isGranted) {
    print('Storage permission not granted.');
  }

  String? directoryPath;
  if (Platform.isAndroid) {
    directoryPath = (await getExternalStorageDirectory())?.path;
  } else if (Platform.isIOS) {
    directoryPath = (await getApplicationDocumentsDirectory()).path;
  } else {
    print('Unsupported platform');
  }

  if (directoryPath == null) {
    print('Failed to obtain directory path.');
  }

  final filePath = '$directoryPath/attendeeDetails.pdf';
  final file = File(filePath);

  try {
    await file.writeAsBytes(await pdf.save());
    print('PDF successfully saved to: $filePath');

    if (await file.exists()) {
      final Email email = Email(
        body: 'Please find the attachment for all the attendee details',
        subject: 'Attendee details',
        recipients: ['kpbhuv@gmail.com'],
        attachmentPaths: [filePath],
        isHTML: false,
      );

      try {
        await FlutterEmailSender.send(email);
        print('Email sent successfully.');
      } catch (error) {
        print('Failed to send email: $error');
        // Handle email sending error (e.g., display a message to the user)
      }
    } else {
      print('PDF file not found at: $filePath');
    }
  } catch (e) {
    print('Failed to save PDF or send email: $e');
  }
}
