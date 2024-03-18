import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'leaderboard_page_model.dart';
export 'leaderboard_page_model.dart';

class LeaderboardPageWidget extends StatefulWidget {
  const LeaderboardPageWidget({super.key});

  @override
  State<LeaderboardPageWidget> createState() => _LeaderboardPageWidgetState();
}

class _LeaderboardPageWidgetState extends State<LeaderboardPageWidget> {
  late LeaderboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderboardPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'z4ashohh' /* Žebříček */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('LoginPage', context.mounted);
              },
              child: Container(
                width: 60.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(
              queryBuilder: (usersRecord) =>
                  usersRecord.orderBy('UziBody', descending: true),
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
              List<UsersRecord> containerUsersRecordList = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).tertiary,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            functions
                                                .getItemFromIndex(
                                                    containerUsersRecordList
                                                        .toList(),
                                                    1)
                                                .photoUrl,
                                            width: 100.0,
                                            height: 70.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .getItemFromIndex(
                                                    containerUsersRecordList
                                                        .toList(),
                                                    1)
                                                .displayName,
                                            'undefined',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  formatNumber(
                                                    functions
                                                        .getItemFromIndex(
                                                            containerUsersRecordList
                                                                .toList(),
                                                            1)
                                                        .uziBody,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '',
                                                    locale: '',
                                                  ),
                                                  'undefined',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mjn2637n' /*  B */,
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 55.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .gradientLeaderboardTop,
                                                FlutterFlowTheme.of(context)
                                                    .gradientLeaderboardBottom
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h9diujwt' /* 2 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontSize: 35.0,
                                                    fontWeight: FontWeight.w900,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                        'assets/images/crown.png',
                                        width: 100.0,
                                        height: 37.0,
                                        fit: BoxFit.contain,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          functions
                                              .getItemFromIndex(
                                                  containerUsersRecordList
                                                      .toList(),
                                                  0)
                                              .photoUrl,
                                          width: 100.0,
                                          height: 70.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .getItemFromIndex(
                                                    containerUsersRecordList
                                                        .toList(),
                                                    0)
                                                .displayName,
                                            'undefined',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  formatNumber(
                                                    functions
                                                        .getItemFromIndex(
                                                            containerUsersRecordList
                                                                .toList(),
                                                            0)
                                                        .uziBody,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '',
                                                    locale: '',
                                                  ),
                                                  'undefined',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nugp44d9' /*  B */,
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 2.0, 0.0),
                                        child: Container(
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFF78A3E9),
                                                FlutterFlowTheme.of(context)
                                                    .gradientLeaderboardBottom
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gbmgj6tb' /* 1 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontSize: 45.0,
                                                    fontWeight: FontWeight.w900,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            functions
                                                .getItemFromIndex(
                                                    containerUsersRecordList
                                                        .toList(),
                                                    2)
                                                .photoUrl,
                                            width: 100.0,
                                            height: 70.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .getItemFromIndex(
                                                    containerUsersRecordList
                                                        .toList(),
                                                    2)
                                                .displayName,
                                            'undefined',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  formatNumber(
                                                    functions
                                                        .getItemFromIndex(
                                                            containerUsersRecordList
                                                                .toList(),
                                                            2)
                                                        .uziBody,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '',
                                                    locale: '',
                                                  ),
                                                  'undefined',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'o7ngyap7' /*  B */,
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .gradientLeaderboardTop,
                                                FlutterFlowTheme.of(context)
                                                    .gradientLeaderboardBottom
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4an8xcwl' /* 3 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.w900,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
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
                      ),
                    ),
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).tertiary,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Builder(
                            builder: (context) {
                              final zebricek = functions
                                      .removeFirstItems(
                                          containerUsersRecordList.toList(), 3)
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: zebricek.length,
                                itemBuilder: (context, zebricekIndex) {
                                  final zebricekItem = zebricek[zebricekIndex];
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (zebricekItem.uziId !=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: functions
                                                                .renumerIndexInList(
                                                                    zebricekIndex)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '3tislpl4' /* . místo */,
                                                            ),
                                                            style: const TextStyle(
                                                              fontSize: 16.0,
                                                            ),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                if (zebricekItem.uziId ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: functions
                                                                .renumerIndexInList(
                                                                    zebricekIndex)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'a7orttoe' /* . místo */,
                                                            ),
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (zebricekItem.uziId ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        zebricekItem
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                if (zebricekItem.uziId !=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      zebricekItem.displayName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (zebricekItem.uziId !=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: formatNumber(
                                                              zebricekItem
                                                                  .uziBody,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'uw1gvwux' /*  B */,
                                                            ),
                                                            style: const TextStyle(
                                                              fontSize: 16.0,
                                                            ),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                if (zebricekItem.uziId ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.uziId,
                                                        0))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  formatNumber(
                                                                zebricekItem
                                                                    .uziBody,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '',
                                                                locale: '',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'j9pvqigq' /*  B */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
