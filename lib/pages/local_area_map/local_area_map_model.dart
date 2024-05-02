import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'local_area_map_widget.dart' show LocalAreaMapWidget;
import 'package:flutter/material.dart';

class LocalAreaMapModel extends FlutterFlowModel<LocalAreaMapWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;

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
