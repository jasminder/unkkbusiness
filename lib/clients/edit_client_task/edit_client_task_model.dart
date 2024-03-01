import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_client_task_widget.dart' show EditClientTaskWidget;
import 'package:flutter/material.dart';

class EditClientTaskModel extends FlutterFlowModel<EditClientTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for taskDescription widget.
  FocusNode? taskDescriptionFocusNode;
  TextEditingController? taskDescriptionController;
  String? Function(BuildContext, String?)? taskDescriptionControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    taskDescriptionFocusNode?.dispose();
    taskDescriptionController?.dispose();

    dueDateFocusNode?.dispose();
    dueDateController?.dispose();

    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
