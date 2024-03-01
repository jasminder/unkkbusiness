import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_details_widget.dart' show ClientDetailsWidget;
import 'package:flutter/material.dart';

class ClientDetailsModel extends FlutterFlowModel<ClientDetailsWidget> {
  ///  Local state fields for this page.

  int tableRows = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthController;
  String? Function(BuildContext, String?)? dateOfBirthControllerValidator;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for clientType widget.
  List<String>? clientTypeValue;
  FormFieldController<List<String>>? clientTypeValueController;
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for companyTelephone widget.
  FocusNode? companyTelephoneFocusNode;
  TextEditingController? companyTelephoneController;
  String? Function(BuildContext, String?)? companyTelephoneControllerValidator;
  // State field(s) for companyEmail widget.
  FocusNode? companyEmailFocusNode;
  TextEditingController? companyEmailController;
  String? Function(BuildContext, String?)? companyEmailControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for trustname widget.
  FocusNode? trustnameFocusNode;
  TextEditingController? trustnameController;
  String? Function(BuildContext, String?)? trustnameControllerValidator;
  // State field(s) for trustTelephone widget.
  FocusNode? trustTelephoneFocusNode;
  TextEditingController? trustTelephoneController;
  String? Function(BuildContext, String?)? trustTelephoneControllerValidator;
  // State field(s) for trustEmail widget.
  FocusNode? trustEmailFocusNode;
  TextEditingController? trustEmailController;
  String? Function(BuildContext, String?)? trustEmailControllerValidator;
  // State field(s) for trustAddress widget.
  FocusNode? trustAddressFocusNode;
  TextEditingController? trustAddressController;
  String? Function(BuildContext, String?)? trustAddressControllerValidator;
  // State field(s) for individualName widget.
  FocusNode? individualNameFocusNode;
  TextEditingController? individualNameController;
  String? Function(BuildContext, String?)? individualNameControllerValidator;
  // State field(s) for individualTelephone widget.
  FocusNode? individualTelephoneFocusNode;
  TextEditingController? individualTelephoneController;
  String? Function(BuildContext, String?)?
      individualTelephoneControllerValidator;
  // State field(s) for individualEmail widget.
  FocusNode? individualEmailFocusNode;
  TextEditingController? individualEmailController;
  String? Function(BuildContext, String?)? individualEmailControllerValidator;
  // State field(s) for individualAddress widget.
  FocusNode? individualAddressFocusNode;
  TextEditingController? individualAddressController;
  String? Function(BuildContext, String?)? individualAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    firstnameFocusNode?.dispose();
    firstnameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    dateOfBirthFocusNode?.dispose();
    dateOfBirthController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    companyTelephoneFocusNode?.dispose();
    companyTelephoneController?.dispose();

    companyEmailFocusNode?.dispose();
    companyEmailController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    trustnameFocusNode?.dispose();
    trustnameController?.dispose();

    trustTelephoneFocusNode?.dispose();
    trustTelephoneController?.dispose();

    trustEmailFocusNode?.dispose();
    trustEmailController?.dispose();

    trustAddressFocusNode?.dispose();
    trustAddressController?.dispose();

    individualNameFocusNode?.dispose();
    individualNameController?.dispose();

    individualTelephoneFocusNode?.dispose();
    individualTelephoneController?.dispose();

    individualEmailFocusNode?.dispose();
    individualEmailController?.dispose();

    individualAddressFocusNode?.dispose();
    individualAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
