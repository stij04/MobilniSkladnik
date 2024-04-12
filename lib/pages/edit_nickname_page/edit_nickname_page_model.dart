import '/flutter_flow/flutter_flow_util.dart';
import 'edit_nickname_page_widget.dart' show EditNicknamePageWidget;
import 'package:flutter/material.dart';

class EditNicknamePageModel extends FlutterFlowModel<EditNicknamePageWidget> {
  ///  Local state fields for this page.

  bool isNicknameUnique = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameController;
  String? Function(BuildContext, String?)? nicknameControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nicknameFocusNode?.dispose();
    nicknameController?.dispose();
  }
}
