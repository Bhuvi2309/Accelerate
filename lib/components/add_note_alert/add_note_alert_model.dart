import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'add_note_alert_widget.dart' show AddNoteAlertWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNoteAlertModel extends FlutterFlowModel<AddNoteAlertWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (Select contacts by AttendeeId)] action in AddNoteAlert widget.
  List<SelectContactsByAttendeeIdRow>? attendeeId;
  // State field(s) for add_notes_alert_input widget.
  FocusNode? addNotesAlertInputFocusNode;
  TextEditingController? addNotesAlertInputController;
  String? Function(BuildContext, String?)?
      addNotesAlertInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    addNotesAlertInputFocusNode?.dispose();
    addNotesAlertInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
