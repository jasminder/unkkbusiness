import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/onboard/delete_onboard_service/delete_onboard_service_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'one_off_service_comp_model.dart';
export 'one_off_service_comp_model.dart';

class OneOffServiceCompWidget extends StatefulWidget {
  const OneOffServiceCompWidget({
    super.key,
    this.clientServiceRef,
  });

  final DocumentReference? clientServiceRef;

  @override
  State<OneOffServiceCompWidget> createState() =>
      _OneOffServiceCompWidgetState();
}

class _OneOffServiceCompWidgetState extends State<OneOffServiceCompWidget> {
  late OneOffServiceCompModel _model;

  bool qtyFocusListenerRegistered = false;
  bool amountFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOffServiceCompModel());

    _model.qtyFocusNode ??= FocusNode();

    _model.amountFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ClientServicesRecord>(
      stream: ClientServicesRecord.getDocument(widget.clientServiceRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          );
        }
        final columnClientServicesRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
              child: StreamBuilder<ServicesRecord>(
                stream: ServicesRecord.getDocument(
                    columnClientServicesRecord.serviceRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: LinearProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }
                  final rowServicesRecord = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          rowServicesRecord.name,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.billingModeValueController ??=
                                        FormFieldController<String>(
                                  _model.billingModeValue ??=
                                      columnClientServicesRecord.billingMode,
                                ),
                                options: const ['Automatic', 'Manual'],
                                onChanged: (val) async {
                                  setState(() => _model.billingModeValue = val);
                                  await widget.clientServiceRef!
                                      .update(createClientServicesRecordData(
                                    billingMode: _model.billingModeValue,
                                  ));
                                },
                                width: 120.0,
                                height: 30.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Billing Mode',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: const Color(0xFFFCFCFC),
                                elevation: 0.0,
                                borderColor: const Color(0xFFFCFCFC),
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.priceTypeValueController ??=
                                    FormFieldController<String>(
                                  _model.priceTypeValue ??=
                                      columnClientServicesRecord.priceType,
                                ),
                                options: const [
                                  'Fixed',
                                  'Per Unit',
                                  'Minimum Price',
                                  'Price Range',
                                  'Included'
                                ],
                                onChanged: (val) async {
                                  setState(() => _model.priceTypeValue = val);
                                  await widget.clientServiceRef!
                                      .update(createClientServicesRecordData(
                                    priceType: _model.priceTypeValue,
                                  ));
                                },
                                width: 90.0,
                                height: 30.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Price',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: const Color(0xFFFCFCFC),
                                elevation: 0.0,
                                borderColor: const Color(0xFFFCFCFC),
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          decoration: const BoxDecoration(),
                                          child: Builder(builder: (_) {
                                            if (!qtyFocusListenerRegistered) {
                                              qtyFocusListenerRegistered = true;
                                              _model.qtyFocusNode!.addListener(
                                                () async {
                                                  await columnClientServicesRecord
                                                      .reference
                                                      .update(
                                                          createClientServicesRecordData(
                                                    quantity: int.tryParse(
                                                        _model.qtyController
                                                            .text),
                                                  ));
                                                },
                                              );
                                            }
                                            return TextFormField(
                                              controller:
                                                  _model.qtyController ??=
                                                      TextEditingController(
                                                text: columnClientServicesRecord
                                                    .quantity
                                                    .toString(),
                                              ),
                                              focusNode: _model.qtyFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.qtyController',
                                                const Duration(milliseconds: 2000),
                                                () async {
                                                  await columnClientServicesRecord
                                                      .reference
                                                      .update(
                                                          createClientServicesRecordData(
                                                    quantity: int.tryParse(
                                                        _model.qtyController
                                                            .text),
                                                  ));
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintText: 'QTY',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .qtyControllerValidator
                                                  .asValidator(context),
                                            );
                                          }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          'X',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 75.0,
                                        decoration: const BoxDecoration(),
                                        child: Builder(builder: (_) {
                                          if (!amountFocusListenerRegistered) {
                                            amountFocusListenerRegistered =
                                                true;
                                            _model.amountFocusNode!.addListener(
                                              () async {
                                                await columnClientServicesRecord
                                                    .reference
                                                    .update(
                                                        createClientServicesRecordData(
                                                  price: double.tryParse(_model
                                                      .amountController.text),
                                                ));
                                              },
                                            );
                                          }
                                          return TextFormField(
                                            controller:
                                                _model.amountController ??=
                                                    TextEditingController(
                                              text: columnClientServicesRecord
                                                  .price
                                                  .toString(),
                                            ),
                                            focusNode: _model.amountFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.amountController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                await columnClientServicesRecord
                                                    .reference
                                                    .update(
                                                        createClientServicesRecordData(
                                                  price: double.tryParse(_model
                                                      .amountController.text),
                                                ));
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintText: '\$',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .amountControllerValidator
                                                .asValidator(context),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.qtyUnitValueController ??=
                                            FormFieldController<String>(
                                      _model.qtyUnitValue ??= 'Day',
                                    ),
                                    options: const [
                                      'Day',
                                      'Hour',
                                      'Employee',
                                      'Transaction',
                                      'Entity',
                                      'Person',
                                      'Bill',
                                      'Item'
                                    ],
                                    onChanged: (val) async {
                                      setState(() => _model.qtyUnitValue = val);
                                      await widget.clientServiceRef!.update(
                                          createClientServicesRecordData(
                                        quantityUnit: _model.qtyUnitValue,
                                      ));
                                    },
                                    width: 100.0,
                                    height: 30.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Per hour',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: const Color(0xFFFCFCFC),
                                    elevation: 0.0,
                                    borderColor: const Color(0xFFFCFCFC),
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 8.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.actionValueController ??=
                                    FormFieldController<String>(null),
                                options: const ['Remove Service'],
                                onChanged: (val) async {
                                  setState(() => _model.actionValue = val);
                                  if (_model.actionValue == 'Remove Service') {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: DeleteOnboardServiceWidget(
                                              clientServiceRef:
                                                  widget.clientServiceRef,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                width: 100.0,
                                height: 30.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                    ),
                                icon: FaIcon(
                                  FontAwesomeIcons.ellipsisV,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: const Color(0xFFFCFCFC),
                                elevation: 0.0,
                                borderColor: const Color(0xFFFCFCFC),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 8.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).secondary,
            ),
          ],
        );
      },
    );
  }
}
