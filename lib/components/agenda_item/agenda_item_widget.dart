import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'agenda_item_model.dart';
export 'agenda_item_model.dart';

class AgendaItemWidget extends StatefulWidget {
  const AgendaItemWidget({
    Key? key,
    required this.topic,
    required this.presentationTime,
    required this.speaker,
  }) : super(key: key);

  final String? topic;
  final DateTime? presentationTime;
  final String? speaker;

  @override
  _AgendaItemWidgetState createState() => _AgendaItemWidgetState();
}

class _AgendaItemWidgetState extends State<AgendaItemWidget> {
  late AgendaItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Container(
        width: double.infinity,
        height: 85.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.clock,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Text(
                            widget.topic!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Text(
                          dateTimeFormat('relative', widget.presentationTime),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        Text(
                          functions
                              .getProgressBarForTimeInMinutes(
                                  getCurrentTimestamp.microsecondsSinceEpoch,
                                  widget
                                      .presentationTime!.microsecondsSinceEpoch)
                              .toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 6.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Text(
                      widget.speaker!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: LinearPercentIndicator(
                  percent: functions.getProgressBarForTimeInMinutes(
                      getCurrentTimestamp.microsecondsSinceEpoch,
                      widget.presentationTime!.microsecondsSinceEpoch),
                  lineHeight: 7.0,
                  animation: true,
                  progressColor: Color(0xFF74279E),
                  backgroundColor: Color(0xFFEAECF0),
                  barRadius: Radius.circular(30.0),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
