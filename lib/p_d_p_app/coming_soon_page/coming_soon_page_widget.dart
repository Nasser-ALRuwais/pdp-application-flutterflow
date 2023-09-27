import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coming_soon_page_model.dart';
export 'coming_soon_page_model.dart';

class ComingSoonPageWidget extends StatefulWidget {
  const ComingSoonPageWidget({Key? key}) : super(key: key);

  @override
  _ComingSoonPageWidgetState createState() => _ComingSoonPageWidgetState();
}

class _ComingSoonPageWidgetState extends State<ComingSoonPageWidget> {
  late ComingSoonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed(
        'LoginOrSignup',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 20),
          ),
        },
      );
    });
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
                    height: 159.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Coming Soon!!\nNovmber 27th',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Spline Sans',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
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
