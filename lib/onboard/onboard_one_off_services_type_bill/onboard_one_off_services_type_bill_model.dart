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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProposalRecord? userProposal;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServicesRecord? serviceInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ClientsRecord? clientExist;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientsRecord? clientInfo;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientServicesRecord? clientService;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ServicesTaskRecord>? serviceTasks;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientServicesRecord? clientService2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ServicesTaskRecord>? serviceTasks2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProposalRecord? userProposal2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServicesRecord? serviceInfo2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ClientsRecord? clientExist2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientsRecord? clientInfo3;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientServicesRecord? clientService3;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ServicesTaskRecord>? serviceTasks3;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ClientServicesRecord? clientService4;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ServicesTaskRecord>? serviceTasks4;

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
