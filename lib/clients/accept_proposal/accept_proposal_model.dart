import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accept_proposal_widget.dart' show AcceptProposalWidget;
import 'package:flutter/material.dart';

class AcceptProposalModel extends FlutterFlowModel<AcceptProposalWidget> {
  ///  Local state fields for this component.

  int loop = 0;

  int tasksLoop = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in acceptProposal widget.
  ClientTrackRecord? trackInfo;
  // Stores action output result for [Backend Call - Read Document] action in acceptProposal widget.
  ClientServicesRecord? serviceInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in acceptProposal widget.
  List<ServicesTaskRecord>? serviceTasks;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
