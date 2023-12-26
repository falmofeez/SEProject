import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_option_model.dart';
export 'quiz_option_model.dart';

class QuizOptionWidget extends StatefulWidget {
  const QuizOptionWidget({
    Key? key,
    required this.queNum,
    required this.queName,
    required this.isTrue,
  }) : super(key: key);

  final String? queNum;
  final String? queName;
  final bool? isTrue;

  @override
  _QuizOptionWidgetState createState() => _QuizOptionWidgetState();
}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  late QuizOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isTrue!) {
          if (_model.isAnswerd != null) {
            setState(() {
              _model.isAnswerd = null;
            });
            setState(() {
              FFAppState().completedQue = FFAppState().completedQue + -1;
            });
            setState(() {
              FFAppState().scoore = FFAppState().scoore + -1;
            });
          } else {
            setState(() {
              _model.isAnswerd = true;
            });
            setState(() {
              FFAppState().completedQue = FFAppState().completedQue + 1;
            });
            setState(() {
              FFAppState().scoore = FFAppState().scoore + 1;
            });
          }
        } else {
          if (_model.isAnswerd != null) {
            setState(() {
              _model.isAnswerd = null;
            });
            setState(() {
              FFAppState().completedQue = FFAppState().completedQue + -1;
            });
          } else {
            setState(() {
              _model.isAnswerd = false;
            });
            setState(() {
              FFAppState().completedQue = FFAppState().completedQue + 1;
            });
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (_model.isAnswerd == true) {
                return Color(0x78249689);
              } else if (_model.isAnswerd == false) {
                return Color(0x88FF5963);
              } else {
                return Colors.transparent;
              }
            }(),
            Colors.transparent,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          border: Border.all(
            color: valueOrDefault<Color>(
              () {
                if (_model.isAnswerd == true) {
                  return FlutterFlowTheme.of(context).success;
                } else if (_model.isAnswerd == false) {
                  return FlutterFlowTheme.of(context).error;
                } else {
                  return FlutterFlowTheme.of(context).alternate;
                }
              }(),
              FlutterFlowTheme.of(context).alternate,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (_model.isAnswerd == true) {
                        return Color(0x78249689);
                      } else if (_model.isAnswerd == false) {
                        return Color(0x88FF5963);
                      } else {
                        return Colors.transparent;
                      }
                    }(),
                    Colors.transparent,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      () {
                        if (_model.isAnswerd == true) {
                          return FlutterFlowTheme.of(context).success;
                        } else if (_model.isAnswerd == false) {
                          return FlutterFlowTheme.of(context).error;
                        } else {
                          return FlutterFlowTheme.of(context).alternate;
                        }
                      }(),
                      FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.queNum,
                      'A',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 15.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.queName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
