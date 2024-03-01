import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_service_widget.dart' show EditServiceWidget;
import 'package:flutter/material.dart';

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
