import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'itinerary_widget.dart' show ItineraryWidget;
import 'package:flutter/material.dart';

class ItineraryModel extends FlutterFlowModel<ItineraryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    drawerUIModel = createModel(context, () => DrawerUIModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerUIModel.dispose();
    tabBarController?.dispose();
  }
}
