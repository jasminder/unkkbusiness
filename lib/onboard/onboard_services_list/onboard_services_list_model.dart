import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_services_list_widget.dart' show OnboardServicesListWidget;
import 'package:flutter/material.dart';

class OnboardServicesListModel
    extends FlutterFlowModel<OnboardServicesListWidget> {
  ///  Local state fields for this page.

  int servicesLoopCount = 0;

  double serviceTotal = 0.0;

  DocumentReference? clientRef;

  int loop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in onboardServicesList widget.
  List<ClientServicesRecord>? clientServices;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<ClientServicesRecord>? clientServices3;

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
