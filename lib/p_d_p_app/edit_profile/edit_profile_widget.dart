import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.textController ??=
        TextEditingController(text: currentUserDisplayName);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('profile');
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
                                  context.pushNamed('profile');
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
                              'Edit Profile',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Spline Sans',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        FFButtonWidget(
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            await currentUserReference!
                                .update(createUsersRecordData(
                              photoUrl: _model.uploadedFileUrl,
                            ));
                          },
                          text: 'Upload Image',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF453261),
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Edit Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              hintText: 'Edit Name',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
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
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
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
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                photoUrl: currentUserPhoto,
                                displayName: _model.textController.text,
                              ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Updated'),
                                    content: Text('Changes are saved'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              context.pushNamed('profile');
                            },
                            text: 'Save',
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
  }
}
