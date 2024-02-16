import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'drawer_u_i_model.dart';
export 'drawer_u_i_model.dart';

class DrawerUIWidget extends StatefulWidget {
  const DrawerUIWidget({super.key});

  @override
  State<DrawerUIWidget> createState() => _DrawerUIWidgetState();
}

class _DrawerUIWidgetState extends State<DrawerUIWidget> {
  late DrawerUIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerUIModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          title: Text(
            'Menu',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
          tileColor: FlutterFlowTheme.of(context).perficientRed,
          dense: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DRAWER_U_I_COMP_scan_qr_list_tile_ON_TAP');
            logFirebaseEvent('scan_qr_list_tile_navigate_to');

            context.goNamed('ContactScan');
          },
          child: ListTile(
            leading: Icon(
              Icons.qr_code_2_sharp,
              color: FlutterFlowTheme.of(context).perficientRed,
            ),
            title: Text(
              'Scan Badge',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).perficientRed,
              size: 20.0,
            ),
            tileColor: FlutterFlowTheme.of(context).gray7,
            dense: false,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DRAWER_U_I_contacts_list_tile_ON_TAP');
            logFirebaseEvent('contacts_list_tile_navigate_to');

            context.goNamed(
              'ContactsList',
              queryParameters: {
                'attendeeID': serializeParam(
                  '',
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          },
          child: ListTile(
            leading: Icon(
              Icons.import_contacts,
              color: FlutterFlowTheme.of(context).perficientRed,
            ),
            title: Text(
              'Contacts List',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).perficientRed,
              size: 20.0,
            ),
            tileColor: FlutterFlowTheme.of(context).gray7,
            dense: false,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DRAWER_U_I_test_debug_list_tile_ON_TAP');
            logFirebaseEvent('test_debug_list_tile_navigate_to');

            context.goNamed('Itinerary');
          },
          child: ListTile(
            leading: FaIcon(
              FontAwesomeIcons.checkDouble,
              color: FlutterFlowTheme.of(context).perficientRed,
            ),
            title: Text(
              'Itinerary',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).perficientRed,
              size: 20.0,
            ),
            tileColor: FlutterFlowTheme.of(context).gray7,
            dense: false,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DRAWER_U_I_show_map_list_tile_ON_TAP');
            logFirebaseEvent('show_map_list_tile_navigate_to');

            context.goNamed('ShowRoomMap');
          },
          child: ListTile(
            leading: Icon(
              Icons.map_outlined,
              color: FlutterFlowTheme.of(context).perficientRed,
            ),
            title: Text(
              'Show Room Map',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).perficientRed,
              size: 20.0,
            ),
            tileColor: FlutterFlowTheme.of(context).gray7,
            dense: false,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DRAWER_U_I_hotel_map_list_tile_ON_TAP');
            logFirebaseEvent('hotel_map_list_tile_navigate_to');

            context.goNamed('HotelMap');
          },
          child: ListTile(
            leading: Icon(
              Icons.maps_home_work_outlined,
              color: FlutterFlowTheme.of(context).perficientRed,
            ),
            title: Text(
              'Hotel Map',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).perficientRed,
              size: 20.0,
            ),
            tileColor: FlutterFlowTheme.of(context).gray7,
            dense: false,
          ),
        ),
      ],
    );
  }
}
