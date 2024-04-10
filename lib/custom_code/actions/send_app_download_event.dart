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

import 'dart:io';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// This code snippet is for illustrative purposes and might require adjustments.

// This code snippet is for illustrative purposes and might require adjustments.

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> sendAppDownloadEvent() async {
  await Firebase.initializeApp();

  // Get device information
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId;

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor!;
  } else {
    deviceId = "Unknown";
  }

  // Get current timestamp
  final DateTime now = DateTime.now();

  // Send custom event to Google Analytics
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await analytics.logEvent(
      name: 'app_download',
      parameters: {'timestamp': now.toString(), 'device_info': deviceId});
}
