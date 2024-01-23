import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/quiz_sets_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/lectures/lecture/lecture_widget.dart';
import 'learning_material_o_o_p_widget.dart' show LearningMaterialOOPWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LearningMaterialOOPModel
    extends FlutterFlowModel<LearningMaterialOOPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (youtubeSearch)] action in learningMaterialOOP widget.
  ApiCallResponse? apiResultijg;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // Stores action output result for [Backend Call - API (youtubeSearch)] action in searchBar widget.
  ApiCallResponse? apiResultxt8;
  // Model for Lecture component.
  late LectureModel lectureModel1;
  // Model for Lecture component.
  late LectureModel lectureModel2;
  // Model for Lecture component.
  late LectureModel lectureModel3;
  // Model for Lecture component.
  late LectureModel lectureModel4;
  // Model for Lecture component.
  late LectureModel lectureModel5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    lectureModel1 = createModel(context, () => LectureModel());
    lectureModel2 = createModel(context, () => LectureModel());
    lectureModel3 = createModel(context, () => LectureModel());
    lectureModel4 = createModel(context, () => LectureModel());
    lectureModel5 = createModel(context, () => LectureModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();

    lectureModel1.dispose();
    lectureModel2.dispose();
    lectureModel3.dispose();
    lectureModel4.dispose();
    lectureModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
