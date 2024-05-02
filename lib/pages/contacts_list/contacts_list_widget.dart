import '/backend/sqlite/sqlite_manager.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contacts_list_model.dart';
export 'contacts_list_model.dart';

class ContactsListWidget extends StatefulWidget {
  const ContactsListWidget({super.key});

  @override
  State<ContactsListWidget> createState() => _ContactsListWidgetState();
}

class _ContactsListWidgetState extends State<ContactsListWidget> {
  late ContactsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactsListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ContactsList'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTACTS_LIST_ContactsList_ON_INIT_STATE');
      logFirebaseEvent('ContactsList_update_app_state');
      setState(() {
        FFAppState().isKeyBoardVisible = true;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).gray7,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerUIModel,
            updateCallback: () => setState(() {}),
            child: const DrawerUIWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.menu_sharp,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CONTACTS_LIST_PAGE_menu_sharp_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
              logFirebaseEvent('IconButton_google_analytics_event');
              logFirebaseEvent('menu_button_ontap');
            },
          ),
          title: Text(
            'Contact List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().hasScannedQR == true) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * 0.95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/backgroundImage.png',
                      ).image,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 32.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          const Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'CONTACTS_LIST_TextField_3effb7ax_ON_TEXT');
                                            logFirebaseEvent(
                                                'TextField_backend_call');
                                            _model.searchResult =
                                                await SQLiteManager.instance
                                                    .searchContacts(
                                              searchQuery:
                                                  _model.textController.text,
                                            );
                                            logFirebaseEvent(
                                                'TextField_update_page_state');
                                            setState(() {
                                              _model.isSearchFullList = false;
                                            });

                                            setState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Search.....',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CONTACTS_LIST_PAGE_Icon_waw1wnjg_ON_TAP');
                                        logFirebaseEvent(
                                            'Icon_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        setState(() {
                                          FFAppState().isScanned = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 32.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.isSearchFullList) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 80.0, 8.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      elevation: 10.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FutureBuilder<List<IsScannedRow>>(
                                        future:
                                            SQLiteManager.instance.isScanned(
                                          isScanned: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final contactListIsScannedRowList =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  contactListIsScannedRowList
                                                      .length,
                                                  (contactListIndex) {
                                                final contactListIsScannedRow =
                                                    contactListIsScannedRowList[
                                                        contactListIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color:
                                                                  Colors.white,
                                                              elevation: 8.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            8.0,
                                                                            32.0,
                                                                            8.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Text(
                                                                                '${contactListIsScannedRow.firstName}${contactListIsScannedRow.lastName}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                contactListIsScannedRow.position,
                                                                                'email',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('CONTACTS_LIST_contact_edit_button_ON_TAP');
                                                                            logFirebaseEvent('contact_edit_button_navigate_to');

                                                                            context.pushNamed(
                                                                              'ContactInfo',
                                                                              queryParameters: {
                                                                                'firstname': serializeParam(
                                                                                  contactListIsScannedRow.firstName,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'lastname': serializeParam(
                                                                                  contactListIsScannedRow.lastName,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'position': serializeParam(
                                                                                  contactListIsScannedRow.position,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'city': serializeParam(
                                                                                  contactListIsScannedRow.city,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'state': serializeParam(
                                                                                  contactListIsScannedRow.state,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'email': serializeParam(
                                                                                  contactListIsScannedRow.employeeEmail,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'generalmanager': serializeParam(
                                                                                  contactListIsScannedRow.generalManager,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'expenditureorg': serializeParam(
                                                                                  contactListIsScannedRow.expenditureOrg,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'notes': serializeParam(
                                                                                  contactListIsScannedRow.notes,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'country': serializeParam(
                                                                                  contactListIsScannedRow.colombiauntry,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'vicePresident': serializeParam(
                                                                                  contactListIsScannedRow.vicePresident,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            logFirebaseEvent('contact_edit_button_google_analytics_eve');
                                                                            logFirebaseEvent('contact_edit_button_ontap');
                                                                          },
                                                                          text:
                                                                              '',
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.arrow_forward_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.2,
                                                                            height:
                                                                                40.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(20.0),
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(20.0),
                                                                            ),
                                                                          ),
                                                                          showLoadingIndicator:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 80.0, 8.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      elevation: 10.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FutureBuilder<
                                          List<SearchContactsRow>>(
                                        future: SQLiteManager.instance
                                            .searchContacts(
                                          searchQuery:
                                              _model.textController.text,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final contactListSearchContactsRowList =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                contactListSearchContactsRowList
                                                    .length,
                                                (contactListIndex) {
                                              final contactListSearchContactsRow =
                                                  contactListSearchContactsRowList[
                                                      contactListIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 16.0),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          32.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          '${contactListSearchContactsRow.firstName}${contactListSearchContactsRow.lastName}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            contactListSearchContactsRow.position,
                                                                            'Position',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CONTACTS_LIST_contact_edit_button_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'contact_edit_button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'ContactInfo',
                                                                        queryParameters:
                                                                            {
                                                                          'firstname':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.firstName,
                                                                            ParamType.String,
                                                                          ),
                                                                          'lastname':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.lastName,
                                                                            ParamType.String,
                                                                          ),
                                                                          'position':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.position,
                                                                            ParamType.String,
                                                                          ),
                                                                          'city':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.city,
                                                                            ParamType.String,
                                                                          ),
                                                                          'state':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.state,
                                                                            ParamType.String,
                                                                          ),
                                                                          'email':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.employeeEmail,
                                                                            ParamType.String,
                                                                          ),
                                                                          'generalmanager':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.generalManager,
                                                                            ParamType.String,
                                                                          ),
                                                                          'expenditureorg':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.expenditureOrg,
                                                                            ParamType.String,
                                                                          ),
                                                                          'notes':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.notes,
                                                                            ParamType.String,
                                                                          ),
                                                                          'vicePresident':
                                                                              serializeParam(
                                                                            contactListSearchContactsRow.vicePresident,
                                                                            ParamType.String,
                                                                          ),
                                                                          'country':
                                                                              serializeParam(
                                                                            '',
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'contact_edit_button_google_analytics_eve');
                                                                      logFirebaseEvent(
                                                                          'contact_edit_button_ontap');
                                                                    },
                                                                    text: '',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.2,
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                          const EdgeInsets.all(
                                                                              0.0),
                                                                      color: Colors
                                                                          .white,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                    showLoadingIndicator:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CONTACTS_LIST_DOWNLOAD_CONTACT_BTN_ON_TA');
                              logFirebaseEvent('Button_custom_action');
                              _model.pdf = await actions.generatePDF();
                              logFirebaseEvent('Button_send_email');
                              await launchUrl(Uri(
                                  scheme: 'mailto',
                                  path: 'test@gmail.com',
                                  query: {
                                    'subject':
                                        'Accelerate Connect 2024 Attendee Details',
                                    'body': _model.pdf!,
                                  }
                                      .entries
                                      .map((MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&')));
                              logFirebaseEvent('Button_google_analytics_event');
                              logFirebaseEvent('email_contact_button_ontap');

                              setState(() {});
                            },
                            text: 'Download contact',
                            options: FFButtonOptions(
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'No Contacts Available',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
