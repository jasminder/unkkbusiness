import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/services/add_service_task/add_service_task_widget.dart';
import '/services/delete_service_task_confirm/delete_service_task_confirm_widget.dart';
import '/services/edit_service_task/edit_service_task_widget.dart';
import 'edit_service_widget.dart' show EditServiceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditServiceModel extends FlutterFlowModel<EditServiceWidget> {
  ///  Local state fields for this page.

  int tableRows = 3;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for service widget.
  FocusNode? serviceFocusNode;
  TextEditingController? serviceController;
  String? Function(BuildContext, String?)? serviceControllerValidator;
  String? _serviceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for serviceDescription widget.
  FocusNode? serviceDescriptionFocusNode;
  TextEditingController? serviceDescriptionController;
  String? Function(BuildContext, String?)?
      serviceDescriptionControllerValidator;
  String? _serviceDescriptionControllerValidator(
      BuildContext context, String? val) {
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
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ServicesTaskRecord>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    serviceControllerValidator = _serviceControllerValidator;
    serviceDescriptionControllerValidator =
        _serviceDescriptionControllerValidator;
    priceControllerValidator = _priceControllerValidator;
  }

  @override
  void dispose() {
    serviceFocusNode?.dispose();
    serviceController?.dispose();

    serviceDescriptionFocusNode?.dispose();
    serviceDescriptionController?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
