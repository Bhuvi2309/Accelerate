import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../../custom_code/actions/store_attendee_list.dart';
import 'contacts_list_model.dart';

export 'contacts_list_model.dart';

class ContactsListWidget extends StatefulWidget {
  const ContactsListWidget({
    Key? key,
    required this.attendeeID,
  }) : super(key: key);

  final String? attendeeID;

  @override
  State<ContactsListWidget> createState() => _ContactsListWidgetState();
}

class _ContactsListWidgetState extends State<ContactsListWidget> {
  late ContactsListModel _model;
 

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactsListModel());
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ContactsList'});
       getAttendeeFields();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTACTS_LIST_ContactsList_ON_INIT_STATE');
      logFirebaseEvent('ContactsList_custom_action');

    });
  }
Future<void> getAttendeeFields() async {
  for (int i = 0; i < attendeeList.length; i++) {
    String firstName = attendeeList[i]['FirstName'];
    String lastName = attendeeList[i]['LastName'];
    // Access other values as needed
    print('First Name: $firstName, Last Name: $lastName');
  }
}


  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerUIModel,
            updateCallback: () => setState(() {}),
            child: DrawerUIWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFCC1F20),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            buttonSize: 40.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.menu_sharp,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CONTACTS_LIST_PAGE_menu_sharp_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
              logFirebaseEvent('IconButton_google_analytics_event');
              logFirebaseEvent('icon_button_ontap');
            },
          ),
          title: Text(
            'Contacts List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: [
                // Your ListView.builder
                ListView.builder(
                  itemCount: attendeeList.length,
                  itemBuilder: (context, index) {
                    final attendee = attendeeList[index];
                    return ListTile(
                      title: Text('${attendee['FirstName']} ${attendee['LastName']}'),
                      subtitle:Text('${attendee['Position']} ${attendee['Country']}'),
                      onTap: (){

      
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
