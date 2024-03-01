import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:flutter/material.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for salutation widget.
  String? salutationValue1;
  FormFieldController<String>? salutationValueController1;
  // State field(s) for firatName widget.
  FocusNode? firatNameFocusNode1;
  TextEditingController? firatNameController1;
  String? Function(BuildContext, String?)? firatNameController1Validator;
  String? _firatNameController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode1;
  TextEditingController? lastNameController1;
  String? Function(BuildContext, String?)? lastNameController1Validator;
  String? _lastNameController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthController;
  String? Function(BuildContext, String?)? dateOfBirthControllerValidator;
  DateTime? datePicked1;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactController;
  String? Function(BuildContext, String?)? contactControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailController1;
  String? Function(BuildContext, String?)? emailController1Validator;
  String? _emailController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for addressLine1 widget.
  FocusNode? addressLine1FocusNode1;
  TextEditingController? addressLine1Controller1;
  String? Function(BuildContext, String?)? addressLine1Controller1Validator;
  String? _addressLine1Controller1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for addressLine2 widget.
  FocusNode? addressLine2FocusNode1;
  TextEditingController? addressLine2Controller1;
  String? Function(BuildContext, String?)? addressLine2Controller1Validator;
  // State field(s) for suburb widget.
  FocusNode? suburbFocusNode1;
  TextEditingController? suburbController1;
  String? Function(BuildContext, String?)? suburbController1Validator;
  String? _suburbController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for state widget.
  String? stateValue1;
  FormFieldController<String>? stateValueController1;
  // State field(s) for postCode widget.
  FocusNode? postCodeFocusNode1;
  TextEditingController? postCodeController1;
  String? Function(BuildContext, String?)? postCodeController1Validator;
  // State field(s) for addressStatus widget.
  String? addressStatusValue1;
  FormFieldController<String>? addressStatusValueController1;
  // State field(s) for TFNnumber widget.
  FocusNode? tFNnumberFocusNode1;
  TextEditingController? tFNnumberController1;
  String? Function(BuildContext, String?)? tFNnumberController1Validator;
  String? _tFNnumberController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for trader widget.
  String? traderValue1;
  FormFieldController<String>? traderValueController1;
  // State field(s) for maritalStatus widget.
  String? maritalStatusValue1;
  FormFieldController<String>? maritalStatusValueController1;
  // State field(s) for investmentProperty widget.
  String? investmentPropertyValue1;
  FormFieldController<String>? investmentPropertyValueController1;
  // State field(s) for hasHealthInsurance widget.
  String? hasHealthInsuranceValue1;
  FormFieldController<String>? hasHealthInsuranceValueController1;
  // State field(s) for cryptoInvestment widget.
  String? cryptoInvestmentValue1;
  FormFieldController<String>? cryptoInvestmentValueController1;
  // State field(s) for taxAdditionalInformation widget.
  FocusNode? taxAdditionalInformationFocusNode1;
  TextEditingController? taxAdditionalInformationController1;
  String? Function(BuildContext, String?)?
      taxAdditionalInformationController1Validator;
  // State field(s) for salutation widget.
  String? salutationValue2;
  FormFieldController<String>? salutationValueController2;
  // State field(s) for firatName widget.
  FocusNode? firatNameFocusNode2;
  TextEditingController? firatNameController2;
  String? Function(BuildContext, String?)? firatNameController2Validator;
  String? _firatNameController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode2;
  TextEditingController? lastNameController2;
  String? Function(BuildContext, String?)? lastNameController2Validator;
  String? _lastNameController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dateOfBirth2 widget.
  FocusNode? dateOfBirth2FocusNode;
  TextEditingController? dateOfBirth2Controller;
  String? Function(BuildContext, String?)? dateOfBirth2ControllerValidator;
  String? _dateOfBirth2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailController2;
  String? Function(BuildContext, String?)? emailController2Validator;
  String? _emailController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for addressLine1 widget.
  FocusNode? addressLine1FocusNode2;
  TextEditingController? addressLine1Controller2;
  String? Function(BuildContext, String?)? addressLine1Controller2Validator;
  String? _addressLine1Controller2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for addressLine2 widget.
  FocusNode? addressLine2FocusNode2;
  TextEditingController? addressLine2Controller2;
  String? Function(BuildContext, String?)? addressLine2Controller2Validator;
  // State field(s) for suburb widget.
  FocusNode? suburbFocusNode2;
  TextEditingController? suburbController2;
  String? Function(BuildContext, String?)? suburbController2Validator;
  // State field(s) for state widget.
  String? stateValue2;
  FormFieldController<String>? stateValueController2;
  // State field(s) for postCode widget.
  FocusNode? postCodeFocusNode2;
  TextEditingController? postCodeController2;
  String? Function(BuildContext, String?)? postCodeController2Validator;
  // State field(s) for addressStatus widget.
  String? addressStatusValue2;
  FormFieldController<String>? addressStatusValueController2;
  // State field(s) for TFNnumber widget.
  FocusNode? tFNnumberFocusNode2;
  TextEditingController? tFNnumberController2;
  String? Function(BuildContext, String?)? tFNnumberController2Validator;
  String? _tFNnumberController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for trader widget.
  String? traderValue2;
  FormFieldController<String>? traderValueController2;
  // State field(s) for maritalStatus widget.
  String? maritalStatusValue2;
  FormFieldController<String>? maritalStatusValueController2;
  // State field(s) for investmentProperty widget.
  String? investmentPropertyValue2;
  FormFieldController<String>? investmentPropertyValueController2;
  // State field(s) for hasHealthInsurance widget.
  String? hasHealthInsuranceValue2;
  FormFieldController<String>? hasHealthInsuranceValueController2;
  // State field(s) for cryptoInvestment widget.
  String? cryptoInvestmentValue2;
  FormFieldController<String>? cryptoInvestmentValueController2;
  // State field(s) for taxAdditionalInformation widget.
  FocusNode? taxAdditionalInformationFocusNode2;
  TextEditingController? taxAdditionalInformationController2;
  String? Function(BuildContext, String?)?
      taxAdditionalInformationController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    firatNameController1Validator = _firatNameController1Validator;
    lastNameController1Validator = _lastNameController1Validator;
    emailController1Validator = _emailController1Validator;
    addressLine1Controller1Validator = _addressLine1Controller1Validator;
    suburbController1Validator = _suburbController1Validator;
    tFNnumberController1Validator = _tFNnumberController1Validator;
    firatNameController2Validator = _firatNameController2Validator;
    lastNameController2Validator = _lastNameController2Validator;
    dateOfBirth2ControllerValidator = _dateOfBirth2ControllerValidator;
    emailController2Validator = _emailController2Validator;
    addressLine1Controller2Validator = _addressLine1Controller2Validator;
    tFNnumberController2Validator = _tFNnumberController2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    firatNameFocusNode1?.dispose();
    firatNameController1?.dispose();

    lastNameFocusNode1?.dispose();
    lastNameController1?.dispose();

    dateOfBirthFocusNode?.dispose();
    dateOfBirthController?.dispose();

    contactFocusNode?.dispose();
    contactController?.dispose();

    emailFocusNode1?.dispose();
    emailController1?.dispose();

    addressLine1FocusNode1?.dispose();
    addressLine1Controller1?.dispose();

    addressLine2FocusNode1?.dispose();
    addressLine2Controller1?.dispose();

    suburbFocusNode1?.dispose();
    suburbController1?.dispose();

    postCodeFocusNode1?.dispose();
    postCodeController1?.dispose();

    tFNnumberFocusNode1?.dispose();
    tFNnumberController1?.dispose();

    taxAdditionalInformationFocusNode1?.dispose();
    taxAdditionalInformationController1?.dispose();

    firatNameFocusNode2?.dispose();
    firatNameController2?.dispose();

    lastNameFocusNode2?.dispose();
    lastNameController2?.dispose();

    dateOfBirth2FocusNode?.dispose();
    dateOfBirth2Controller?.dispose();

    emailFocusNode2?.dispose();
    emailController2?.dispose();

    addressLine1FocusNode2?.dispose();
    addressLine1Controller2?.dispose();

    addressLine2FocusNode2?.dispose();
    addressLine2Controller2?.dispose();

    suburbFocusNode2?.dispose();
    suburbController2?.dispose();

    postCodeFocusNode2?.dispose();
    postCodeController2?.dispose();

    tFNnumberFocusNode2?.dispose();
    tFNnumberController2?.dispose();

    taxAdditionalInformationFocusNode2?.dispose();
    taxAdditionalInformationController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
