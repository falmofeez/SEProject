import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_quiz_widget.dart' show AddQuizWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddQuizModel extends FlutterFlowModel<AddQuizWidget> {
  ///  Local state fields for this page.

  bool optionA = false;

  bool optionB = false;

  bool optionC = false;

  bool optionD = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for qestionText widget.
  FocusNode? qestionTextFocusNode;
  TextEditingController? qestionTextController;
  String? Function(BuildContext, String?)? qestionTextControllerValidator;
  // State field(s) for optionOne widget.
  FocusNode? optionOneFocusNode;
  TextEditingController? optionOneController;
  String? Function(BuildContext, String?)? optionOneControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for optionTwo widget.
  FocusNode? optionTwoFocusNode;
  TextEditingController? optionTwoController;
  String? Function(BuildContext, String?)? optionTwoControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for optionThree widget.
  FocusNode? optionThreeFocusNode;
  TextEditingController? optionThreeController;
  String? Function(BuildContext, String?)? optionThreeControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for optionFour widget.
  FocusNode? optionFourFocusNode;
  TextEditingController? optionFourController;
  String? Function(BuildContext, String?)? optionFourControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuizRecord? quizCreatedResponce;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    qestionTextFocusNode?.dispose();
    qestionTextController?.dispose();

    optionOneFocusNode?.dispose();
    optionOneController?.dispose();

    optionTwoFocusNode?.dispose();
    optionTwoController?.dispose();

    optionThreeFocusNode?.dispose();
    optionThreeController?.dispose();

    optionFourFocusNode?.dispose();
    optionFourController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
