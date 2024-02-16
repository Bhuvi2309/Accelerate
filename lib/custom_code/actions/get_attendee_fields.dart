// Automatic FlutterFlow imports
import 'store_attendee_list.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
