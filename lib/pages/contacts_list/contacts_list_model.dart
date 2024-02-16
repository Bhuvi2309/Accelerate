import '/backend/sqlite/sqlite_manager.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contacts_list_widget.dart' show ContactsListWidget;
import 'package:flutter/material.dart';

class ContactsListModel extends FlutterFlowModel<ContactsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (Select contacts by AttendeeId)] action in ContactsList widget.
  List<SelectContactsByAttendeeIdRow>? atttendeeeIddddd;
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerUIModel = createModel(context, () => DrawerUIModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerUIModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
