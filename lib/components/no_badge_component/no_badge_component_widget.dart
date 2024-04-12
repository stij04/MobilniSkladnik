import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'no_badge_component_model.dart';
export 'no_badge_component_model.dart';

class NoBadgeComponentWidget extends StatefulWidget {
  const NoBadgeComponentWidget({super.key});

  @override
  State<NoBadgeComponentWidget> createState() => _NoBadgeComponentWidgetState();
}

class _NoBadgeComponentWidgetState extends State<NoBadgeComponentWidget> {
  late NoBadgeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoBadgeComponentModel());
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
            child: FaIcon(
              FontAwesomeIcons.award,
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
                '44nj10ck' /* Zatím jste nezískal žádné odzn... */,
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
