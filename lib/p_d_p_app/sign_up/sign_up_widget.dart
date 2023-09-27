import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController1 ??= TextEditingController();
    _model.emailTextController ??= TextEditingController();
    _model.passwordTextController ??= TextEditingController();
    _model.confirmPasswordTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: double.infinity,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF351A33),
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                shape: BoxShape.rectangle,
              ),
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Color(0x001A1531),
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x004B39EF),
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('LoginOrSignup');
                              },
                            ),
                            if (false)
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('LoginOrSignup');
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Registration',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Spline Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController1,
                                autofocus: true,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.name,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: TextFormField(
                              controller: _model.emailTextController,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Spline Sans',
                                      fontSize: 15.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.emailTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: TextFormField(
                              controller: _model.passwordTextController,
                              textInputAction: TextInputAction.next,
                              obscureText: !_model.passwordVisibility1,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Spline Sans',
                                      fontSize: 15.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility1 =
                                        !_model.passwordVisibility1,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              textAlign: TextAlign.start,
                              validator: _model.passwordTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.confirmPasswordTextController,
                                textInputAction: TextInputAction.go,
                                obscureText: !_model.passwordVisibility2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Spline Sans',
                                        fontSize: 15.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.passwordVisibility2 =
                                          !_model.passwordVisibility2,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility2
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.start,
                                validator: _model
                                    .confirmPasswordTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .around(SizedBox(height: 20.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 200.0, 16.0, 50.0),
                      child: Container(
                        width: double.infinity,
                        height: 49.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF7538A3),
                              Color(0xFF7C9EC9),
                              Color(0xFF7538A3)
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: AlignmentDirectional(1.0, -0.87),
                            end: AlignmentDirectional(-1.0, 0.87),
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              if (_model.passwordTextController.text !=
                                  _model.confirmPasswordTextController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user =
                                  await authManager.createAccountWithEmail(
                                context,
                                _model.emailTextController.text,
                                _model.passwordTextController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(createUsersRecordData(
                                    displayName: _model.textController1.text,
                                    attended: false,
                                  ));

                              context.pushNamedAuth(
                                'Login',
                                context.mounted,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                    duration: Duration(milliseconds: 10),
                                  ),
                                },
                              );
                            },
                            text: 'Register',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 49.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
