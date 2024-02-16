import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_info_widget.dart' show ContactInfoWidget;
import 'package:flutter/material.dart';

class ContactInfoModel extends FlutterFlowModel<ContactInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (Select contacts by AttendeeId)] action in ContactInfo widget.
  List<SelectContactsByAttendeeIdRow>? testtttt;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
