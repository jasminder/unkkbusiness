import '/flutter_flow/flutter_flow_util.dart';
import 'client_task_detail_widget.dart' show ClientTaskDetailWidget;
import 'package:flutter/material.dart';

class ClientTaskDetailModel extends FlutterFlowModel<ClientTaskDetailWidget> {
  ///  Local state fields for this page.

  int tableRows = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
