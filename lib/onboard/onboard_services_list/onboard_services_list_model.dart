import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_services_list_widget.dart' show OnboardServicesListWidget;
import 'package:flutter/material.dart';

class OnboardServicesListModel
    extends FlutterFlowModel<OnboardServicesListWidget> {
  ///  Local state fields for this page.

  int servicesLoopCount = 0;

  double oneOffServiceTotal = 0.0;

  DocumentReference? clientRef;

  int loop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<ClientServicesRecord>? clientServices2;
  // Stores action output result for [Custom Action - createSubTotal] action in Text widget.
  double? serviceTotal2;

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
