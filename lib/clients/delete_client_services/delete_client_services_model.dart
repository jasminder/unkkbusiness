import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_client_services_widget.dart' show DeleteClientServicesWidget;
import 'package:flutter/material.dart';

class DeleteClientServicesModel
    extends FlutterFlowModel<DeleteClientServicesWidget> {
  ///  Local state fields for this component.

  int loop = 0;

  int tasksLoop = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ClientServicesRecord>? includedServices;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TasksRecord>? tasksInfo;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
