import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/agenda_item/agenda_item_widget.dart';
import '/components/notification_dialog/notification_dialog_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.conferenceDate,
  }) : super(key: key);

  final DateTime? conferenceDate;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().firstTime == false) {
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
                onTap: () =>
                    FocusScope.of(context).requestFocus(_model.unfocusNode),
                child: NotificationDialogWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));

        FFAppState().firstTime = true;
      } else {
        setState(() {
          FFAppState().firstTime = true;
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, -1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  'Hi, ${currentUserDisplayName} 👋',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 17.0,
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                labelColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: Color(0xFF74279E),
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                borderColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                borderWidth: 2.0,
                                borderRadius: 20.0,
                                elevation: 0.0,
                                buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                tabs: [
                                  Tab(
                                    text: 'About',
                                  ),
                                  Tab(
                                    text: 'Agenda',
                                  ),
                                ],
                                controller: _model.tabBarController,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 85.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: FutureBuilder<
                                                List<ConferenceInfoRecord>>(
                                              future:
                                                  queryConferenceInfoRecordOnce(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0xFFAEB0FF),
                                                        size: 250.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ConferenceInfoRecord>
                                                    columnConferenceInfoRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnConferenceInfoRecord =
                                                    columnConferenceInfoRecordList
                                                            .isNotEmpty
                                                        ? columnConferenceInfoRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Text(
                                                                  'Conference',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Text(
                                                                dateTimeFormat(
                                                                    'relative',
                                                                    FFAppState()
                                                                        .conferenceDate),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        child:
                                                            LinearPercentIndicator(
                                                          percent: functions.getProgressBarForTime(
                                                              getCurrentTimestamp
                                                                  .microsecondsSinceEpoch,
                                                              columnConferenceInfoRecord!
                                                                  .date!
                                                                  .microsecondsSinceEpoch),
                                                          lineHeight: 7.0,
                                                          animation: true,
                                                          progressColor:
                                                              Color(0xFF74279E),
                                                          backgroundColor:
                                                              Color(0xFFEAECF0),
                                                          barRadius:
                                                              Radius.circular(
                                                                  30.0),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Text(
                                            'Conference Description',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FutureBuilder<
                                                    List<ConferenceInfoRecord>>(
                                                  future: FFAppState()
                                                      .descriptionCache(
                                                    requestFn: () =>
                                                        queryConferenceInfoRecordOnce(
                                                      singleRecord: true,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 250.0,
                                                          height: 250.0,
                                                          child: SpinKitRipple(
                                                            color: Color(
                                                                0xFFAEB0FF),
                                                            size: 250.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ConferenceInfoRecord>
                                                        containerConferenceInfoRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerConferenceInfoRecord =
                                                        containerConferenceInfoRecordList
                                                                .isNotEmpty
                                                            ? containerConferenceInfoRecordList
                                                                .first
                                                            : null;
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Text(
                                                            containerConferenceInfoRecord!
                                                                .description,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize:
                                                                      26.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .around(
                                                      SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) =>
                                        StreamBuilder<List<AgendaRecord>>(
                                      stream: queryAgendaRecord(
                                        queryBuilder: (agendaRecord) =>
                                            agendaRecord.orderBy('time'),
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
                                        List<AgendaRecord>
                                            listViewAgendaRecordList =
                                            snapshot.data!;
                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewAgendaRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewAgendaRecord =
                                                listViewAgendaRecordList[
                                                    listViewIndex];
                                            return AgendaItemWidget(
                                              key: Key(
                                                  'Key33e_${listViewIndex}_of_${listViewAgendaRecordList.length}'),
                                              topic: listViewAgendaRecord.topic,
                                              speaker: listViewAgendaRecord
                                                  .speakerName,
                                              presentationTime:
                                                  listViewAgendaRecord.time!,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
