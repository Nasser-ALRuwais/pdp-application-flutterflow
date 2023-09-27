import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_dialog_model.dart';
export 'alert_dialog_model.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  late AlertDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.22,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.longArrowAltDown,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 40.0,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                        child: Text(
                          'Pull down the screen to refresh the content',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Got it!!',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF74279E),
                          textStyle: FlutterFlowTheme.of(context).titleSmall,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
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
    );
  }
}
