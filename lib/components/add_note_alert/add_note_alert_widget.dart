import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'add_note_alert_model.dart';
export 'add_note_alert_model.dart';

class AddNoteAlertWidget extends StatefulWidget {
  const AddNoteAlertWidget({
    super.key,
    required this.attendeeID,
  });

  final int? attendeeID;

  @override
  State<AddNoteAlertWidget> createState() => _AddNoteAlertWidgetState();
}

class _AddNoteAlertWidgetState extends State<AddNoteAlertWidget> {
  late AddNoteAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNoteAlertModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_NOTE_ALERT_AddNoteAlert_ON_INIT_STAT');
      logFirebaseEvent('AddNoteAlert_backend_call');
      _model.attendeeId =
          await SQLiteManager.instance.selectContactsByAttendeeId(
        attendeeID: widget.attendeeID!.toString(),
      );
      logFirebaseEvent('AddNoteAlert_backend_call');
      _model.isScanned = await SQLiteManager.instance.isScanned(
        isScanned: true,
      );
    });

    _model.addNotesAlertInputTextController ??= TextEditingController();
    _model.addNotesAlertInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Container(
          width: 284.0,
          height: 332.0,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.white,
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                        child: Text(
                          'You\'ve Added',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Lato',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    FutureBuilder<List<SelectContactsByAttendeeIdRow>>(
                      future: SQLiteManager.instance.selectContactsByAttendeeId(
                        attendeeID: widget.attendeeID!.toString(),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final columnSelectContactsByAttendeeIdRowList =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnSelectContactsByAttendeeIdRowList.length,
                              (columnIndex) {
                            final columnSelectContactsByAttendeeIdRow =
                                columnSelectContactsByAttendeeIdRowList[
                                    columnIndex];
                            return ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      '${columnSelectContactsByAttendeeIdRow.firstName}${columnSelectContactsByAttendeeIdRow.lastName}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: TextFormField(
                    controller: _model.addNotesAlertInputTextController,
                    focusNode: _model.addNotesAlertInputFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Add Notes',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Lato',
                                letterSpacing: 0.0,
                              ),
                      alignLabelWithHint: true,
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          letterSpacing: 0.0,
                        ),
                    maxLines: 4,
                    validator: _model.addNotesAlertInputTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_NOTE_ALERT_add_notes_alert_save_note');
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_close_');
                          Navigator.pop(context);
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_custom');
                          await actions.insertingRow(
                            valueOrDefault<String>(
                              widget.attendeeID?.toString(),
                              'noteattendeeid',
                            ),
                            valueOrDefault<String>(
                              _model.addNotesAlertInputTextController.text,
                              'note',
                            ),
                          );
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_update');
                          setState(() {
                            FFAppState().hasScannedQR = true;
                          });
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_naviga');

                          context.pushNamed('ContactsList');
                        },
                        text: 'Save Notes',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
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
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_NOTE_ALERT_add_notes_alert_save_note');
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_naviga');

                          context.pushNamed(
                            'AddContact',
                            queryParameters: {
                              'isInt': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Scan Next Badge',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
