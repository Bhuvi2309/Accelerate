import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'show_room_map_widget.dart' show ShowRoomMapWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ShowRoomMapModel extends FlutterFlowModel<ShowRoomMapWidget> {
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
