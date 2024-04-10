import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_scan_widget.dart' show ContactScanWidget;
import 'package:flutter/material.dart';

class ContactScanModel extends FlutterFlowModel<ContactScanWidget> {
  ///  Local state fields for this page.

  bool? isInteger = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;
  var attendeeID = '';
  // Stores action output result for [Custom Action - validateAttendeeID] action in Button widget.
  bool? validateAttendee;

  @override
  void initState(BuildContext context) {
    drawerUIModel = createModel(context, () => DrawerUIModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerUIModel.dispose();
  }
}
