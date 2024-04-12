import '/flutter_flow/flutter_flow_util.dart';
import 'badge_page_widget.dart' show BadgePageWidget;
import 'package:flutter/material.dart';

class BadgePageModel extends FlutterFlowModel<BadgePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
