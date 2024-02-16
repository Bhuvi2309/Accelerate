import '/backend/schema/structs/index.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'contacts_list_copy_widget.dart' show ContactsListCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsListCopyModel extends FlutterFlowModel<ContactsListCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;

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
