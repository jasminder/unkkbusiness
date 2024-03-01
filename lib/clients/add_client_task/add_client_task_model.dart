import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_client_task_widget.dart' show AddClientTaskWidget;
import 'package:flutter/material.dart';

class AddClientTaskModel extends FlutterFlowModel<AddClientTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for assignee widget.
  String? assigneeValue;
  FormFieldController<String>? assigneeValueController;
  // State field(s) for dueDate widget.
  FocusNode? dueDateFocusNode;
  TextEditingController? dueDateController;
  String? Function(BuildContext, String?)? dueDateControllerValidator;
  DateTime? datePicked;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? taskInfo;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    dueDateFocusNode?.dispose();
    dueDateController?.dispose();

    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
