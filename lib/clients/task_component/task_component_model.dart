import '/flutter_flow/flutter_flow_util.dart';
import 'task_component_widget.dart' show TaskComponentWidget;
import 'package:flutter/material.dart';

class TaskComponentModel extends FlutterFlowModel<TaskComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskController;
  String? Function(BuildContext, String?)? taskControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
