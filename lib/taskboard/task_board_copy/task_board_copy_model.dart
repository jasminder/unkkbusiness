import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'task_board_copy_widget.dart' show TaskBoardCopyWidget;
import 'package:flutter/material.dart';

class TaskBoardCopyModel extends FlutterFlowModel<TaskBoardCopyWidget> {
  ///  Local state fields for this page.

  DateTime? taskTillDate;

  int days = 0;

  String taskShowBy = 'day';

  int tasksCount = 0;

  DocumentReference? assigneeRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navigation component.
  late NavigationModel navigationModel;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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
