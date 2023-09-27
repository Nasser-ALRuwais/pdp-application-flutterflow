import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_box_model.dart';
export 'message_box_model.dart';

class MessageBoxWidget extends StatefulWidget {
  const MessageBoxWidget({Key? key}) : super(key: key);

  @override
  _MessageBoxWidgetState createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {
  late MessageBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageBoxModel());

    _model.postTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 60.0,
      constraints: BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(0.0, -1.0),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_model.uploadedFileUrl != null && _model.uploadedFileUrl != '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 39.0,
                fillColor: FlutterFlowTheme.of(context).error,
                icon: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
                onPressed: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Delete Image'),
                            content: Text(
                                'Are you sure you want to delete the uploaded image?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    setState(() {
                      _model.isDataUploading = false;
                      _model.uploadedLocalFile =
                          FFUploadedFile(bytes: Uint8List.fromList([]));
                      _model.uploadedFileUrl = '';
                    });
                  }
                },
              ),
            ),
          if (_model.uploadedFileUrl == null || _model.uploadedFileUrl == '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                icon: Icon(
                  Icons.image_outlined,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
                onPressed: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    allowPhoto: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
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
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }
                },
              ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                controller: _model.postTextController,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Type here to post...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: 5,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                validator:
                    _model.postTextControllerValidator.asValidator(context),
              ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.send_rounded,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 30.0,
            ),
            onPressed: () async {
              if (_model.postTextController.text != null &&
                  _model.postTextController.text != '') {
                await PostsRecord.collection.doc().set({
                  ...createPostsRecordData(
                    postDescription: _model.postTextController.text,
                    postUsername: currentUserDisplayName,
                    uid: currentUserUid,
                    poster: currentUserReference,
                    profilePicture: currentUserPhoto,
                    attachedImage: _model.uploadedFileUrl,
                  ),
                  'time_posted': FieldValue.serverTimestamp(),
                });
                setState(() {
                  _model.postTextController?.clear();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Please type something',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
