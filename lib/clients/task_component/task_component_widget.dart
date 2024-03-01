import '/backend/backend.dart';
import '/clients/edit_client_task/edit_client_task_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_component_model.dart';
export 'task_component_model.dart';

class TaskComponentWidget extends StatefulWidget {
  const TaskComponentWidget({
    super.key,
    this.taskRef,
  });

  final DocumentReference? taskRef;

  @override
  State<TaskComponentWidget> createState() => _TaskComponentWidgetState();
}

class _TaskComponentWidgetState extends State<TaskComponentWidget> {
  late TaskComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskComponentModel());

    _model.taskFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<TasksRecord>(
              stream: TasksRecord.getDocument(widget.taskRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                }
                final rowTasksRecord = snapshot.data!;
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Task Name 1',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.taskController ??=
                                    TextEditingController(
                                  text: rowTasksRecord.name,
                                ),
                                focusNode: _model.taskFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: rowTasksRecord.name,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0x34EEEEEE),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.taskControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: EditClientTaskWidget(
                                        clientTaskRef: widget.taskRef,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Icon(
                              Icons.edit_note,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.delete_outline_outlined,
                              color: FlutterFlowTheme.of(context).error,
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        Divider(
          height: 64.0,
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).secondary,
        ),
      ],
    );
  }
}
