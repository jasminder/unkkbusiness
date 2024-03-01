import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'onboard_add_services_widget.dart' show OnboardAddServicesWidget;
import 'package:flutter/material.dart';

class OnboardAddServicesModel
    extends FlutterFlowModel<OnboardAddServicesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientsRecord? clientExist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? clientServiceCount;

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
