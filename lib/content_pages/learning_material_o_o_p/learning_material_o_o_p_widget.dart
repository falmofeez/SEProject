import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/quiz_sets_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/lectures/lecture/lecture_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_material_o_o_p_model.dart';
export 'learning_material_o_o_p_model.dart';

class LearningMaterialOOPWidget extends StatefulWidget {
  const LearningMaterialOOPWidget({Key? key}) : super(key: key);

  @override
  _LearningMaterialOOPWidgetState createState() =>
      _LearningMaterialOOPWidgetState();
}

class _LearningMaterialOOPWidgetState extends State<LearningMaterialOOPWidget>
    with TickerProviderStateMixin {
  late LearningMaterialOOPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningMaterialOOPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().intialSearchJOP != null &&
          FFAppState().intialSearchJOP != '') {
        _model.apiResultijg = await YoutubeSearchCall.call(
          apiQ: FFAppState().intialSearchJOP,
        );
        if ((_model.apiResultijg?.succeeded ?? true)) {
          setState(() {
            FFAppState().SearchResults = YoutubeSearchCall.video(
              (_model.apiResultijg?.jsonBody ?? ''),
            )!
                .toList()
                .cast<dynamic>();
          });
        }
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.searchBarController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();
    _model.searchBarFocusNode!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFF247A96),
            automaticallyImplyLeading: true,
            leading: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 26.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'cg1pbtio' /* Object Oriented Programming */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 22.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).labelSmall,
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '0woixpv2' /* Videos */,
                              ),
                              icon: Icon(
                                Icons.videocam_sharp,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'szdsqfqk' /* Library */,
                              ),
                              icon: Icon(
                                Icons.library_books,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'zl1f235x' /* Quizzez */,
                              ),
                              icon: Icon(
                                Icons.quiz,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Icon(
                                                      Icons.search_rounded,
                                                      color: Color(0xFF8B9BA8),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .searchBarController,
                                                        focusNode: _model
                                                            .searchBarFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.searchBarController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => setState(() {}),
                                                        ),
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          _model.apiResultxt8 =
                                                              await YoutubeSearchCall
                                                                  .call(
                                                            apiQ: _model
                                                                .searchBarController
                                                                .text,
                                                          );
                                                          if ((_model
                                                                  .apiResultxt8
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .SearchResults =
                                                                  YoutubeSearchCall
                                                                          .video(
                                                                (_model.apiResultxt8
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .searchBarController
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'search result error',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '4wifwsut' /* Search... */,
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        validator: _model
                                                            .searchBarControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final videos =
                                          FFAppState().SearchResults.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: videos.length,
                                        itemBuilder: (context, videosIndex) {
                                          final videosItem =
                                              videos[videosIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowYoutubePlayer(
                                                          url:
                                                              'https://www.youtube.com/watch?v=${getJsonField(
                                                            videosItem,
                                                            r'''$.videoId''',
                                                          ).toString()}',
                                                          autoPlay: false,
                                                          looping: true,
                                                          mute: false,
                                                          showControls: true,
                                                          showFullScreen: true,
                                                          strictRelatedVideos:
                                                              false,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  videosItem,
                                                                  r'''$.title''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                getJsonField(
                                                                  videosItem,
                                                                  r'''$.author.title''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'fhldmoea' /* 4.25 */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('C201');
                                          },
                                          child: wrapWithModel(
                                            model: _model.lectureModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LectureWidget(
                                              title: '1 Introduction to OOP',
                                              description:
                                                  'introduces OOP covering key concepts like \nclasses, objects, inheritance, and encapsulation \nfor building modular and reusable code.',
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('C202');
                                          },
                                          child: wrapWithModel(
                                            model: _model.lectureModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LectureWidget(
                                              title: '2 Methods in Java',
                                              description:
                                                  'explores the syntax and functionality of\nmethods, including parameters, return types, \nand code reuse for effective programming.',
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('C203');
                                          },
                                          child: wrapWithModel(
                                            model: _model.lectureModel3,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LectureWidget(
                                              title: '3 Classes and Objects',
                                              description:
                                                  'provides the concept of classes and objects in \nprogramming, covering their definition, \nand instantiation for creating modular systems.',
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('C204');
                                          },
                                          child: wrapWithModel(
                                            model: _model.lectureModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LectureWidget(
                                              title:
                                                  '4 Classes and other Concepts',
                                              description:
                                                  'introduces essential concepts in programming, \nincluding objects, inheritance,and polymorphism \nenabling students to build flexible applications.',
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('C205');
                                          },
                                          child: wrapWithModel(
                                            model: _model.lectureModel5,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LectureWidget(
                                              title:
                                                  '5 Relationships among Classes',
                                              description:
                                                  'explores aggregations, compositions, and \ninheritance, shows how these relationships \nenhance code and system design in OOP.',
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 15.0))
                                          .around(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<QuizSetRecord>>(
                                      stream: queryQuizSetRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<QuizSetRecord>
                                            listViewQuizSetRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewQuizSetRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewQuizSetRecord =
                                                listViewQuizSetRecordList[
                                                    listViewIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'quizPage',
                                                      queryParameters: {
                                                        'quizSetRef':
                                                            serializeParam(
                                                          listViewQuizSetRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'quizDuration':
                                                            serializeParam(
                                                          listViewQuizSetRecord
                                                              .duration,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    FFAppState().update(() {
                                                      FFAppState().scoore = 0;
                                                    });
                                                  },
                                                  child: QuizSetsWidget(
                                                    key: Key(
                                                        'Key1ry_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                                                    title: listViewQuizSetRecord
                                                        .quizName,
                                                    description: '',
                                                    duration:
                                                        listViewQuizSetRecord
                                                                .duration /
                                                            6000,
                                                    totalQ:
                                                        listViewQuizSetRecord
                                                            .totalQuestions,
                                                    isFav: FFAppState()
                                                        .savedToFav
                                                        .contains(
                                                            listViewQuizSetRecord
                                                                .reference),
                                                    cratedTime:
                                                        getCurrentTimestamp,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 25.0,
                                            borderWidth: 1.0,
                                            buttonSize: 50.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            icon: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed('createQuiz');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]
                                      .divide(SizedBox(height: 15.0))
                                      .around(SizedBox(height: 15.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
