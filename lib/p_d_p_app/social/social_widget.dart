import '/backend/backend.dart';
import '/components/alert_dialog/alert_dialog_widget.dart';
import '/components/message_box/message_box_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_model.dart';
export 'social_model.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({Key? key}) : super(key: key);

  @override
  _SocialWidgetState createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  late SocialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().firstTimeSocial == false) {
        await showAlignedDialog(
          context: context,
          isGlobal: true,
          avoidOverflow: false,
          targetAnchor: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          followerAnchor: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          builder: (dialogContext) {
            return Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: AlertDialogWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));

        FFAppState().firstTimeSocial = true;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
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
                  shape: BoxShape.rectangle,
                ),
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 148.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/PDP_Conference_Brand_Image_(1)new.png',
                                      width: 70.0,
                                      height: 61.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'D&IT PDP \nEvent 2023',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Icon(
                                        Icons.nfc,
                                        color: Color(0xFF3276E6),
                                        size: 25.0,
                                      ),
                                    ),
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('profile');
                                        },
                                        child: Icon(
                                          Icons.perm_identity,
                                          color: Color(0xFF7E7D7D),
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: FutureBuilder<List<PostsRecord>>(
                          future: FFAppState().socialCache(
                            requestFn: () => queryPostsRecordOnce(
                              queryBuilder: (postsRecord) => postsRecord
                                  .orderBy('time_posted', descending: true),
                            ).then((result) {
                              _model.firestoreRequestCompleted = true;
                              return result;
                            }),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 250.0,
                                  height: 250.0,
                                  child: SpinKitRipple(
                                    color: Color(0xFFAEB0FF),
                                    size: 250.0,
                                  ),
                                ),
                              );
                            }
                            List<PostsRecord> columnPostsRecordList =
                                snapshot.data!;
                            return RefreshIndicator(
                              color: Colors.black,
                              backgroundColor: Color(0xFFFCA442),
                              strokeWidth: 4.0,
                              onRefresh: () async {
                                setState(() {
                                  FFAppState().clearSocialCacheCache();
                                  _model.firestoreRequestCompleted = false;
                                });
                                await _model.waitForFirestoreRequestCompleted();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  key: ValueKey('timelineList'),
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPostsRecordList.length,
                                      (columnIndex) {
                                    final columnPostsRecord =
                                        columnPostsRecordList[columnIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 7.0, 4.0),
                                      child: FutureBuilder<UsersRecord>(
                                        future: FFAppState().postCache(
                                          uniqueQueryKey:
                                              columnPostsRecord.reference.id,
                                          requestFn: () =>
                                              UsersRecord.getDocumentOnce(
                                                  columnPostsRecord.poster!),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 250.0,
                                                height: 250.0,
                                                child: SpinKitRipple(
                                                  color: Color(0xFFAEB0FF),
                                                  size: 250.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final containerUsersRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            constraints: BoxConstraints(
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: wrapWithModel(
                                              model: _model.postModels.getModel(
                                                columnPostsRecord.uid,
                                                columnIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PostWidget(
                                                key: Key(
                                                  'Keylpu_${columnPostsRecord.uid}',
                                                ),
                                                username: containerUsersRecord
                                                    .displayName,
                                                postText: columnPostsRecord
                                                    .postDescription,
                                                timePosted: columnPostsRecord
                                                    .timePosted!,
                                                profilePicture:
                                                    containerUsersRecord
                                                        .photoUrl,
                                                attachedImage: columnPostsRecord
                                                    .attachedImage,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: wrapWithModel(
                        model: _model.messageBoxModel,
                        updateCallback: () => setState(() {}),
                        child: MessageBoxWidget(),
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
