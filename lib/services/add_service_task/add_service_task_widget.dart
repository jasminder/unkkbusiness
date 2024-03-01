import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_service_task_model.dart';
export 'add_service_task_model.dart';

class AddServiceTaskWidget extends StatefulWidget {
  const AddServiceTaskWidget({
    super.key,
    this.serviceRef,
  });

  final DocumentReference? serviceRef;

  @override
  State<AddServiceTaskWidget> createState() => _AddServiceTaskWidgetState();
}

class _AddServiceTaskWidgetState extends State<AddServiceTaskWidget> {
  late AddServiceTaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddServiceTaskModel());

    _model.taskNameController ??= TextEditingController();
    _model.taskNameFocusNode ??= FocusNode();

    _model.descriptionController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 610.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(120.0, 56.0, 120.0, 56.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add Task',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Task Name',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _model.taskNameController,
                                      focusNode: _model.taskNameFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Enter name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0x34EEEEEE),
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 20.0, 20.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .taskNameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Description',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _model.descriptionController,
                                      focusNode: _model.descriptionFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Description',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0x34EEEEEE),
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 20.0, 20.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 3,
                                      validator: _model
                                          .descriptionControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }

                                    await ServicesTaskRecord.collection
                                        .doc()
                                        .set(createServicesTaskRecordData(
                                          serviceRef: widget.serviceRef,
                                          title: _model.taskNameController.text,
                                          description:
                                              _model.descriptionController.text,
                                        ));
                                    Navigator.pop(context);
                                  },
                                  text: 'Add Task',
                                  options: FFButtonOptions(
                                    width: 290.0,
                                    height: 60.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
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
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
