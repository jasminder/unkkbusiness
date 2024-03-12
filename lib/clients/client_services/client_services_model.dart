import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'client_services_widget.dart' show ClientServicesWidget;
import 'package:flutter/material.dart';

class ClientServicesModel extends FlutterFlowModel<ClientServicesWidget> {
  ///  Local state fields for this page.

  DateTime? taskTillDate;

  int days = 0;

  String taskShowBy = 'day';

  int tasksCount = 0;

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
