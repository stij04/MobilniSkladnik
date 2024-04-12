import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_notification_component_model.dart';
export 'no_notification_component_model.dart';

class NoNotificationComponentWidget extends StatefulWidget {
  const NoNotificationComponentWidget({super.key});

  @override
  State<NoNotificationComponentWidget> createState() =>
      _NoNotificationComponentWidgetState();
}

class _NoNotificationComponentWidgetState
    extends State<NoNotificationComponentWidget> {
  late NoNotificationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoNotificationComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Icon(
              Icons.notifications_none,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 60.0,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '9envknlb' /* Nemáte žádná upozornění */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
