// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:accelerate/custom_code/actions/store_attendee_list.dart';

import 'index.dart'; // Imports other custom actions

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<void> getAttendeeFields() async {
  for (int i = 0; i < attendeeList.length; i++) {
    String firstName = attendeeList[i]['FirstName'];
    String lastName = attendeeList[i]['LastName'];
    // Access other values as needed
    print('First Name: $firstName, Last Name: $lastName');
  }
}
