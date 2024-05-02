import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_note_alert_widget.dart' show AddNoteAlertWidget;
import 'package:flutter/material.dart';

class AddNoteAlertModel extends FlutterFlowModel<AddNoteAlertWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (Select contacts by AttendeeId)] action in AddNoteAlert widget.
  List<SelectContactsByAttendeeIdRow>? attendeeId;
  // Stores action output result for [Backend Call - SQLite (isScanned)] action in AddNoteAlert widget.
  List<IsScannedRow>? isScanned;
  // State field(s) for add_notes_alert_input widget.
  FocusNode? addNotesAlertInputFocusNode;
  TextEditingController? addNotesAlertInputTextController;
  String? Function(BuildContext, String?)?
      addNotesAlertInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addNotesAlertInputFocusNode?.dispose();
    addNotesAlertInputTextController?.dispose();
  }
}
