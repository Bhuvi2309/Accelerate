import '/backend/schema/structs/index.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contacts_list_copy_model.dart';
export 'contacts_list_copy_model.dart';

class ContactsListCopyWidget extends StatefulWidget {
  const ContactsListCopyWidget({
    super.key,
    required this.attendeeID,
  });

  final String? attendeeID;

  @override
  State<ContactsListCopyWidget> createState() => _ContactsListCopyWidgetState();
}

class _ContactsListCopyWidgetState extends State<ContactsListCopyWidget> {
  late ContactsListCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactsListCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ContactsListCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTACTS_LIST_COPY_ContactsListCopy_ON_I');
      // loading_indicator
      logFirebaseEvent('ContactsListCopy_loading_indicator');
      setState(() {
        FFAppState().isLoading = true;
      });
      logFirebaseEvent('ContactsListCopy_update_app_state');
      setState(() {
        FFAppState().attendeeList =
            FFAppState().attendeeList.toList().cast<AttendeeDetailsStruct>();
      });
      logFirebaseEvent('ContactsListCopy_update_app_state');
      setState(() {
        FFAppState().isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerUIModel,
            updateCallback: () => setState(() {}),
            child: const DrawerUIWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFFCC1F20),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            buttonSize: 40.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.menu_sharp,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CONTACTS_LIST_COPY_menu_sharp_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
              logFirebaseEvent('IconButton_google_analytics_event');
              logFirebaseEvent('icon_button_ontap');
            },
          ),
          title: Text(
            'Contacts List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: double.infinity,
            ),
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                if (FFAppState().isLoading == false)
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final appstate =
                                        FFAppState().attendeeList.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: appstate.length,
                                      itemBuilder: (context, appstateIndex) {
                                        final appstateItem =
                                            appstate[appstateIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            appstateItem
                                                                .firstName,
                                                            'fname',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            appstateItem
                                                                .position,
                                                            'appstateposition',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            appstateItem
                                                                .lastName,
                                                            'appstatelastname',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            appstateItem.state,
                                                            'appstatestate',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'CONTACTS_LIST_COPY_contact_edit_button_O');
                                                          logFirebaseEvent(
                                                              'contact_edit_button_google_analytics_eve');
                                                          logFirebaseEvent(
                                                              'contact_edit_button_ontap');
                                                          logFirebaseEvent(
                                                              'contact_edit_button_navigate_to');

                                                          context.pushNamed(
                                                            'ContactInfo',
                                                            queryParameters: {
                                                              'attendeeID':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  appstateItem
                                                                      .attendeeId,
                                                                  123,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'firstname':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  appstateItem
                                                                      .firstName,
                                                                  'appstatefname',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'emailid':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  appstateItem
                                                                      .employeeEmail,
                                                                  'appstateemail',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'gm':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  appstateItem
                                                                      .generalManager,
                                                                  'appstategm',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'phoneno':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  appstateItem
                                                                      .phoneNumber,
                                                                  1213344,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'country':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  appstateItem
                                                                      .country,
                                                                  'appstatecountry',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text: '',
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsets.all(
                                                                  0.0),
                                                          color: Colors.white,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CONTACTS_LIST_COPY_emiail_contact_list_b');
                                    logFirebaseEvent(
                                        'emiail_contact_list_button_send_email');
                                    await launchUrl(Uri(
                                        scheme: 'mailto',
                                        path: 'n',
                                        query: {
                                          'subject': 'Accelerate Contact List',
                                        }
                                            .entries
                                            .map((MapEntry<String, String> e) =>
                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                            .join('&')));
                                    logFirebaseEvent(
                                        'emiail_contact_list_button_google_analyt');
                                    logFirebaseEvent(
                                        'email_contact_button_ontap');
                                  },
                                  text: 'Email Contact List',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (FFAppState().isLoading == true)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Lottie.network(
                          'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
                          width: 407.0,
                          height: 161.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
