import '/flutter_flow/flutter_flow_util.dart';
import 'task_component_widget.dart' show TaskComponentWidget;
import 'package:flutter/material.dart';

class TaskComponentModel extends FlutterFlowModel<TaskComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskController;
  String? Function(BuildContext, String?)? taskControllerValidator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  String? Function(BuildContext, String?)? dateControllerValidator;
  // State field(s) for assignee widget.
  FocusNode? assigneeFocusNode;
  TextEditingController? assigneeController;
  String? Function(BuildContext, String?)? assigneeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskController?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    assigneeFocusNode?.dispose();
    assigneeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
