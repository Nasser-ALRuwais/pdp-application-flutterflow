import '/backend/backend.dart';
import '/components/message_box/message_box_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimelinePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for messageBox component.
  late MessageBoxModel messageBoxModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    messageBoxModel = createModel(context, () => MessageBoxModel());
  }

  void dispose() {
    unfocusNode.dispose();
    messageBoxModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
