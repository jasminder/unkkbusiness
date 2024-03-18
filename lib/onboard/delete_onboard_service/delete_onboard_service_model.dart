import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_onboard_service_widget.dart' show DeleteOnboardServiceWidget;
import 'package:flutter/material.dart';

class DeleteOnboardServiceModel
    extends FlutterFlowModel<DeleteOnboardServiceWidget> {
  ///  Local state fields for this component.

  DocumentReference? clientServiceRef;

  int loop = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ClientServicesRecord>? includedServices;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
