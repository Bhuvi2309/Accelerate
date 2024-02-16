import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_scan_widget.dart' show ContactScanWidget;
import 'package:flutter/material.dart';

class ContactScanModel extends FlutterFlowModel<ContactScanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;
  var attendeeID = '';
  // Stores action output result for [Custom Action - validateAttendeeID] action in Button widget.
  bool? validateAttendeeIDResult;

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
