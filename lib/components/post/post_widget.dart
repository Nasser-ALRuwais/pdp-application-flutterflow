import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    String? username,
    required this.timePosted,
    String? postText,
    required this.profilePicture,
    this.attachedImage,
  })  : this.username = username ?? 'Loading...',
        this.postText = postText ?? 'Loading...',
        super(key: key);

  final String username;
  final DateTime? timePosted;
  final String postText;
  final String? profilePicture;
  final String? attachedImage;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((widget.username != null && widget.username != '') &&
          (widget.timePosted != null) &&
          (widget.postText != null && widget.postText != ''))) {
        while (widget.username == null || widget.username == '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'loading',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }
    });
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 8.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 100),
                        fadeOutDuration: Duration(milliseconds: 100),
                        imageUrl: valueOrDefault<String>(
                          widget.profilePicture,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjYmlp9JDeNMaFZzw9S3G1dVztGqF_2vq9nA&usqp=CAU',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.username,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFFCA442),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      dateTimeFormat('relative', widget.timePosted),
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  widget.postText,
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
              ),
            ),
            if (widget.attachedImage != null && widget.attachedImage != '')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget.attachedImage!,
                            fit: BoxFit.contain,
                          ),
                          allowRotation: false,
                          tag: widget.attachedImage!,
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: widget.attachedImage!,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: widget.attachedImage!,
                        width: 150.0,
                        height: 65.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
          ],
        ),
      ),
    );
  }
}
