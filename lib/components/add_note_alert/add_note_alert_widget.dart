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
    required this.attendeeId,
  });

  final int? attendeeId;

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
        attendeeID: widget.attendeeId!.toString(),
      );
      logFirebaseEvent('AddNoteAlert_backend_call');
      await SQLiteManager.instance.isScanned(
        isScanned: true,
      );
    });

    _model.addNotesAlertInputController ??= TextEditingController();
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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
                offset: const Offset(
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
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'Success!  You\'ve Added',
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
                    Builder(
                      builder: (context) {
                        final sqliterow = _model.attendeeId?.toList() ?? [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: sqliterow.length,
                          itemBuilder: (context, sqliterowIndex) {
                            final sqliterowItem = sqliterow[sqliterowIndex];
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    sqliterowItem.firstName,
                                    'firstname',
                                  )} ${valueOrDefault<String>(
                                    sqliterowItem.lastName,
                                    'lastname',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: TextFormField(
                  controller: _model.addNotesAlertInputController,
                  focusNode: _model.addNotesAlertInputFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Add Notes',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Lato',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Lato',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                  maxLines: 4,
                  minLines: null,
                  validator: _model.addNotesAlertInputControllerValidator
                      .asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
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
                              widget.attendeeId?.toString(),
                              'noteattendeeid',
                            ),
                            valueOrDefault<String>(
                              _model.addNotesAlertInputController.text,
                              'notenote',
                            ),
                          );
                          logFirebaseEvent(
                              'add_notes_alert_save_notes_button_naviga');

                          context.pushNamed('ContactsList');
                        },
                        text: 'Save Notes',
                        options: FFButtonOptions(
                          width: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_NOTE_ALERT_add_notes_alert_scan_anot');
                          logFirebaseEvent(
                              'add_notes_alert_scan_another_button_navi');

                          context.pushNamed('ContactScan');
                        },
                        text: 'Scan Next Badge',
                        options: FFButtonOptions(
                          width: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 24.0, 8.0, 24.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
