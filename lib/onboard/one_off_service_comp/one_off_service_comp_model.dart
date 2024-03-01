import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/onboard/delete_onboard_service/delete_onboard_service_widget.dart';
import 'one_off_service_comp_widget.dart' show OneOffServiceCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OneOffServiceCompModel extends FlutterFlowModel<OneOffServiceCompWidget> {
  ///  Local state fields for this component.

  DocumentReference? clientServiceReff;

  int serviceLoopCount = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for billingMode widget.
  String? billingModeValue;
  FormFieldController<String>? billingModeValueController;
  // State field(s) for priceType widget.
  String? priceTypeValue;
  FormFieldController<String>? priceTypeValueController;
  // State field(s) for qty widget.
  FocusNode? qtyFocusNode;
  TextEditingController? qtyController;
  String? Function(BuildContext, String?)? qtyControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // State field(s) for qtyUnit widget.
  String? qtyUnitValue;
  FormFieldController<String>? qtyUnitValueController;
  // State field(s) for action widget.
  String? actionValue;
  FormFieldController<String>? actionValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    qtyFocusNode?.dispose();
    qtyController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
