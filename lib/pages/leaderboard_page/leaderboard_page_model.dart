import '/flutter_flow/flutter_flow_util.dart';
import 'leaderboard_page_widget.dart' show LeaderboardPageWidget;
import 'package:flutter/material.dart';

class LeaderboardPageModel extends FlutterFlowModel<LeaderboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
