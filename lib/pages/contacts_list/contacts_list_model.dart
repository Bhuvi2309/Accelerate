import '/backend/sqlite/sqlite_manager.dart';
import '/components/drawer_u_i/drawer_u_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contacts_list_widget.dart' show ContactsListWidget;
import 'package:flutter/material.dart';

class ContactsListModel extends FlutterFlowModel<ContactsListWidget> {
  ///  Local state fields for this page.

  bool isSearchFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DrawerUI component.
  late DrawerUIModel drawerUIModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - SQLite (SearchContacts)] action in TextField widget.
  List<SearchContactsRow>? searchResult;
  // Stores action output result for [Custom Action - generatePDF] action in Button widget.
  String? pdf;

  @override
  void initState(BuildContext context) {
    drawerUIModel = createModel(context, () => DrawerUIModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerUIModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
