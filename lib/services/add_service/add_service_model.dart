import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_service_widget.dart' show AddServiceWidget;
import 'package:flutter/material.dart';

class AddServiceModel extends FlutterFlowModel<AddServiceWidget> {
  ///  Local state fields for this page.

  int tableRows = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for service widget.
  FocusNode? serviceFocusNode1;
  TextEditingController? serviceController1;
  String? Function(BuildContext, String?)? serviceController1Validator;
  String? _serviceController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for service widget.
  FocusNode? serviceFocusNode2;
  TextEditingController? serviceController2;
  String? Function(BuildContext, String?)? serviceController2Validator;
  String? _serviceController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  String? _priceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for taxRate widget.
  String? taxRateValue;
  FormFieldController<String>? taxRateValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ServicesRecord? createdService;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    serviceController1Validator = _serviceController1Validator;
    serviceController2Validator = _serviceController2Validator;
    priceControllerValidator = _priceControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    serviceFocusNode1?.dispose();
    serviceController1?.dispose();

    serviceFocusNode2?.dispose();
    serviceController2?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
