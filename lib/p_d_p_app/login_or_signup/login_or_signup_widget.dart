import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_or_signup_model.dart';
export 'login_or_signup_model.dart';

class LoginOrSignupWidget extends StatefulWidget {
  const LoginOrSignupWidget({Key? key}) : super(key: key);

  @override
  _LoginOrSignupWidgetState createState() => _LoginOrSignupWidgetState();
}

class _LoginOrSignupWidgetState extends State<LoginOrSignupWidget> {
  late LoginOrSignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginOrSignupModel());
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
        backgroundColor: Color(0xFF351A33),
        body: Align(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/PDP_Conference_Brand_Image_(1)new.png',
                    width: 187.0,
                    height: 158.63,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'D&IT PDP \nEvent 2023',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 20.0),
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
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'SignUp',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 20),
                              ),
                            },
                          );
                        },
                        text: 'Sign up',
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
                                fontFamily: 'Spline Sans',
                                color: FlutterFlowTheme.of(context).tertiary,
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
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Login');
                      },
                      text: 'Log in',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 49.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Spline Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
