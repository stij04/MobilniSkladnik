import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'edit_nickname_page_model.dart';
export 'edit_nickname_page_model.dart';

class EditNicknamePageWidget extends StatefulWidget {
  const EditNicknamePageWidget({super.key});

  @override
  State<EditNicknamePageWidget> createState() => _EditNicknamePageWidgetState();
}

class _EditNicknamePageWidgetState extends State<EditNicknamePageWidget> {
  late EditNicknamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditNicknamePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditNicknamePage'});
    _model.nicknameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nicknameFocusNode ??= FocusNode();
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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('EDIT_NICKNAME_Container_ap909kcz_ON_TAP');
              logFirebaseEvent('Container_navigate_back');
              context.safePop();
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'ih0tj89d' /* Upravit přezdívku */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(),
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
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'x1tkz7fe' /* Zde můžete upravit svou přezdí... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            if (!_model.isNicknameUnique)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '9gdol40f' /* Tuto přezdívku již používá jin... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.nicknameController,
                                    focusNode: _model.nicknameFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.nicknameController',
                                      const Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'EDIT_NICKNAME_nickname_ON_TEXTFIELD_SUBM');
                                      if (functions.isNicknameUnique(
                                          _model.nicknameController.text,
                                          containerUsersRecordList.toList())) {
                                        logFirebaseEvent(
                                            'nickname_update_page_state');
                                        setState(() {
                                          _model.isNicknameUnique = true;
                                        });
                                      } else {
                                        if (currentUserDisplayName ==
                                            _model.nicknameController.text) {
                                          logFirebaseEvent(
                                              'nickname_update_page_state');
                                          setState(() {
                                            _model.isNicknameUnique = true;
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'nickname_update_page_state');
                                          setState(() {
                                            _model.isNicknameUnique = false;
                                          });
                                        }
                                      }
                                    },
                                    autofocus: true,
                                    autofillHints: const [AutofillHints.username],
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '3vn6cp4g' /* Zvolte si přezdívku... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      suffixIcon: _model.nicknameController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.nicknameController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    keyboardType: TextInputType.name,
                                    validator: _model
                                        .nicknameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_NICKNAME_ULOŽIT_BTN_ON_TAP');
                                if (functions.isNicknameUnique(
                                    _model.nicknameController.text,
                                    containerUsersRecordList.toList())) {
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    displayName: _model.nicknameController.text,
                                  ));
                                  logFirebaseEvent('Button_navigate_back');
                                  context.safePop();
                                } else {
                                  if (currentUserDisplayName ==
                                      _model.nicknameController.text) {
                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                  } else {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.isNicknameUnique = false;
                                    });
                                  }
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                'bbzdfh9z' /* Uložit */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .buttonBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ],
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
