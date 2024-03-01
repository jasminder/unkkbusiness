import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'services_list_widget.dart' show ServicesListWidget;
import 'package:flutter/material.dart';

class ServicesListModel extends FlutterFlowModel<ServicesListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navigation component.
  late NavigationModel navigationModel;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.

  Map<ServicesRecord, bool> checkboxValueMap2 = {};
  List<ServicesRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

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
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
