import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'delete_client_services_model.dart';
export 'delete_client_services_model.dart';

class DeleteClientServicesWidget extends StatefulWidget {
  const DeleteClientServicesWidget({
    super.key,
    this.clientServiceRef,
  });

  final DocumentReference? clientServiceRef;

  @override
  State<DeleteClientServicesWidget> createState() =>
      _DeleteClientServicesWidgetState();
}

class _DeleteClientServicesWidgetState
    extends State<DeleteClientServicesWidget> {
  late DeleteClientServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteClientServicesModel());

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
              padding: const EdgeInsetsDirectional.fromSTEB(70.0, 40.0, 70.0, 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Delete Service?',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      'Once you delete, your data will be lost.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'No, Cancel',
                            options: FFButtonOptions(
                              width: 135.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.includedServices =
                                  await queryClientServicesRecordOnce(
                                queryBuilder: (clientServicesRecord) =>
                                    clientServicesRecord.where(
                                  'includes',
                                  isEqualTo: widget.clientServiceRef,
                                ),
                              );
                              while (_model.includedServices?.length ==
                                  _model.loop) {
                                _model.tasksInfo = await queryTasksRecordOnce(
                                  queryBuilder: (tasksRecord) =>
                                      tasksRecord.where(
                                    'clientServiceRef',
                                    isEqualTo: _model
                                        .includedServices?[_model.loop]
                                        .reference,
                                  ),
                                );
                                while (_model.tasksInfo!.length >
                                    _model.tasksLoop) {
                                  await _model
                                      .tasksInfo![_model.tasksLoop].reference
                                      .delete();
                                  setState(() {
                                    _model.tasksLoop = _model.tasksLoop + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop = _model.loop + 1;
                                });
                              }
                              await widget.clientServiceRef!.delete();
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: 'Yes, Delete',
                            options: FFButtonOptions(
                              width: 135.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ],
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
