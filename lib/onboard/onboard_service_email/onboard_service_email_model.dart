import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_service_email_widget.dart' show OnboardServiceEmailWidget;
import 'package:flutter/material.dart';

class OnboardServiceEmailModel
    extends FlutterFlowModel<OnboardServiceEmailWidget> {
  ///  Local state fields for this page.

  int loopCount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientsRecord? clientInfo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClientTrackRecord? clientTrack;

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
