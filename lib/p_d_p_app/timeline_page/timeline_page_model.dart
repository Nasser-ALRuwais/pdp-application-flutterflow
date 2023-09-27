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

class TimelinePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // Models for post dynamic component.
  late FlutterFlowDynamicModels<PostModel> postModels;
  // Model for messageBox component.
  late MessageBoxModel messageBoxModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    postModels = FlutterFlowDynamicModels(() => PostModel());
    messageBoxModel = createModel(context, () => MessageBoxModel());
  }

  void dispose() {
    unfocusNode.dispose();
    postModels.dispose();
    messageBoxModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
