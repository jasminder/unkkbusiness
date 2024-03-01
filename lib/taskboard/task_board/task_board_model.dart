import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'task_board_widget.dart' show TaskBoardWidget;
import 'package:flutter/material.dart';

class TaskBoardModel extends FlutterFlowModel<TaskBoardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navigation component.
  late NavigationModel navigationModel;
  // Model for topbar component.
  late TopbarModel topbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
    topbarModel = createModel(context, () => TopbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
    topbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
