import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'include_services_model.dart';
export 'include_services_model.dart';

class IncludeServicesWidget extends StatefulWidget {
  const IncludeServicesWidget({
    super.key,
    this.clientServiceRef,
    this.clientRef,
  });

  final DocumentReference? clientServiceRef;
  final DocumentReference? clientRef;

  @override
  State<IncludeServicesWidget> createState() => _IncludeServicesWidgetState();
}

class _IncludeServicesWidgetState extends State<IncludeServicesWidget> {
  late IncludeServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncludeServicesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(64.0, 36.0, 64.0, 36.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Include Services',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: StreamBuilder<List<ServicesRecord>>(
                        stream: queryServicesRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LinearProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                          }
                          List<ServicesRecord> dropDownServicesRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??= '',
                            ),
                            options: List<String>.from(
                                dropDownServicesRecordList
                                    .map((e) => e.reference.id)
                                    .toList()),
                            optionLabels: dropDownServicesRecordList
                                .map((e) => e.name)
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue = val),
                            width: 420.0,
                            height: 60.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Add Service',
                            searchHintText: 'Search',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFFFCFCFC),
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.clientServicesInfo =
                            await ClientServicesRecord.getDocumentOnce(
                                widget.clientServiceRef!);
                        if (_model.clientServicesInfo?.serviceRef ==
                            functions.docIDtoRef(_model.dropDownValue!)) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('You cannot include this service.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await ClientServicesRecord.collection.doc().set({
                            ...createClientServicesRecordData(
                              type: _model.clientServicesInfo?.type,
                              billingMode:
                                  _model.clientServicesInfo?.billingMode,
                              priceType: 'Included',
                              quantity: 0,
                              price: 0.0,
                              clientRef: _model.clientServicesInfo?.clientRef,
                              serviceRef:
                                  functions.docIDtoRef(_model.dropDownValue!),
                              quantityUnit: ' ',
                              status: _model.clientServicesInfo?.status,
                              proposalRef:
                                  _model.clientServicesInfo?.proposalRef,
                              includes: _model.clientServicesInfo?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'createdAt': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        }

                        Navigator.pop(context);

                        setState(() {});
                      },
                      text: 'Add Service',
                      options: FFButtonOptions(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            75.0, 24.0, 75.0, 24.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).error,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
