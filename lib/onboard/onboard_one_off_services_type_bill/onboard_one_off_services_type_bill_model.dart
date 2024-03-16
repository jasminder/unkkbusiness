import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_one_off_services_type_bill_widget.dart'
    show OnboardOneOffServicesTypeBillWidget;
import 'package:flutter/material.dart';

class OnboardOneOffServicesTypeBillModel
    extends FlutterFlowModel<OnboardOneOffServicesTypeBillWidget> {
  ///  Local state fields for this page.

  bool borderAcceptance = false;

  bool borderCompletion = false;

  int loopCount = 0;

  DocumentReference? clientRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProposalRecord? propsalInfo;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServicesRecord? serviceDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ClientsRecord? clientExists;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientsRecord? createdClient;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProposalRecord? propsalInfo2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServicesRecord? serviceDetails2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ClientsRecord? clientExists2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientsRecord? createdClient2;

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
