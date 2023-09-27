import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => _model.firestoreRequestCompleter = null);
      await _model.waitForFirestoreRequestCompleted();
    });

    _model.textController2 ??= TextEditingController(text: currentUserEmail);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRecord>>(
      future:
          (_model.firestoreRequestCompleter ??= Completer<List<UsersRecord>>()
                ..complete(queryUsersRecordOnce(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('uid', isEqualTo: currentUserUid),
                  singleRecord: true,
                )))
              .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 250.0,
                height: 250.0,
                child: SpinKitRipple(
                  color: Color(0xFFAEB0FF),
                  size: 250.0,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> profileUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final profileUsersRecord = profileUsersRecordList.isNotEmpty
            ? profileUsersRecordList.first
            : null;
        return Scaffold(
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
                                context.pushNamed('HomePage');
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
                                      context.pushNamed('HomePage');
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
                                  'Profile',
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 100),
                                fadeOutDuration: Duration(milliseconds: 100),
                                imageUrl: valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjYmlp9JDeNMaFZzw9S3G1dVztGqF_2vq9nA&usqp=CAU',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: TextFormField(
                              controller: _model.textController1 ??=
                                  TextEditingController(
                                text: profileUsersRecord?.displayName,
                              ),
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Spline Sans',
                                      fontSize: 15.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
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
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: TextFormField(
                              controller: _model.textController2,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Spline Sans',
                                      fontSize: 15.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
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
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 74.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF453261),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('EditProfile');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Edit Profile',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Spline Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.navigate_next,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            'EditProfile',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .topToBottom,
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 74.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF453261),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('PasswordChange');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Change password',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Spline Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.navigate_next,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('PasswordChange');
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .around(SizedBox(height: 20.0)),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 50.0),
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
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'LoginOrSignup', context.mounted);
                                },
                                text: 'Log Out',
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
