import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboard/one_off_service_comp/one_off_service_comp_widget.dart';
import 'onboard_one_off_services_list_widget.dart'
    show OnboardOneOffServicesListWidget;
import 'package:flutter/material.dart';

class OnboardOneOffServicesListModel
    extends FlutterFlowModel<OnboardOneOffServicesListWidget> {
  ///  Local state fields for this page.

  int servicesLoopCount = 0;

  double oneOffServiceTotal = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in onboardOneOffServicesList widget.
  List<ClientServicesRecord>? clientServices;
  // Stores action output result for [Custom Action - createSubTotal] action in onboardOneOffServicesList widget.
  double? serviceTotal;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<ClientServicesRecord>? clientServices2;
  // Stores action output result for [Custom Action - createSubTotal] action in Text widget.
  double? serviceTotal2;
  // Models for oneOffServiceComp dynamic component.
  late FlutterFlowDynamicModels<OneOffServiceCompModel> oneOffServiceCompModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    oneOffServiceCompModels =
        FlutterFlowDynamicModels(() => OneOffServiceCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oneOffServiceCompModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
