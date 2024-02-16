import '/components/add_note_alert/add_note_alert_widget.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'contact_scan_widget.dart' show ContactScanWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactScanModel extends FlutterFlowModel<ContactScanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;
  var attendeeID = '';
  // Stores action output result for [Custom Action - validateAttendeeID] action in Button widget.
  bool? opatttendeed;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerUIModel = createModel(context, () => DrawerUIModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerUIModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
