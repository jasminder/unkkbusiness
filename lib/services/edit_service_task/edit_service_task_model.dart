import '/flutter_flow/flutter_flow_util.dart';
import 'edit_service_task_widget.dart' show EditServiceTaskWidget;
import 'package:flutter/material.dart';

class EditServiceTaskModel extends FlutterFlowModel<EditServiceTaskWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  String? _taskNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    taskNameControllerValidator = _taskNameControllerValidator;
  }

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
