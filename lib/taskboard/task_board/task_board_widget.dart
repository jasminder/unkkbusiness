import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import '/taskboard/task_action/task_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'task_board_model.dart';
export 'task_board_model.dart';

class TaskBoardWidget extends StatefulWidget {
  const TaskBoardWidget({super.key});

  @override
  State<TaskBoardWidget> createState() => _TaskBoardWidgetState();
}

class _TaskBoardWidgetState extends State<TaskBoardWidget> {
  late TaskBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskBoardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().activeMenu = 'taskboard';
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.navigationModel,
                            updateCallback: () => setState(() {}),
                            child: const NavigationWidget(),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                wrapWithModel(
                                  model: _model.topbarModel,
                                  updateCallback: () => setState(() {}),
                                  child: const TopbarWidget(),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 40.0, 40.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Task Board (24)',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 12.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Day',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Week',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Month',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Quater',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Year',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Total tasks by client(3)',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Total tasks (9)',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Assignee',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        40.0, 20.0, 40.0, 20.0),
                                    child: StreamBuilder<List<ClientsRecord>>(
                                      stream: queryClientsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                        List<ClientsRecord>
                                            columnClientsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnClientsRecordList.length,
                                                (columnIndex) {
                                              final columnClientsRecord =
                                                  columnClientsRecordList[
                                                      columnIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x33EEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 30.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      0.0,
                                                                      40.0,
                                                                      13.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '${columnClientsRecord.firstName} ${columnClientsRecord.lastName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Actions',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<TasksRecord>>(
                                                          stream:
                                                              queryTasksRecord(
                                                            queryBuilder:
                                                                (tasksRecord) =>
                                                                    tasksRecord
                                                                        .where(
                                                              'clientRef',
                                                              isEqualTo:
                                                                  columnClientsRecord
                                                                      .reference,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child:
                                                                    LinearProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              );
                                                            }
                                                            List<TasksRecord>
                                                                columnTasksRecordList =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnTasksRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnTasksRecord =
                                                                    columnTasksRecordList[
                                                                        columnIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          40.0,
                                                                          13.0,
                                                                          40.0,
                                                                          13.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                  child: Text(
                                                                                    'Show Tasks',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ShowTasks',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Task 1 :  ',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                columnTasksRecord.name,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            if (columnTasksRecord.dueDate != null)
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '| Due Date ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      dateTimeFormat('yMMMd', columnTasksRecord.dueDate!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (columnTasksRecord.assignee != null)
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                                child: StreamBuilder<UsersRecord>(
                                                                                                  stream: UsersRecord.getDocument(columnTasksRecord.assignee!),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: LinearProgressIndicator(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    final rowUsersRecord = snapshot.data!;
                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          '| Assignee ',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          rowUsersRecord.displayName,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            if (columnTasksRecord.status != '')
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '| Status : ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      columnTasksRecord.status,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
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
                                                                                    return GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SizedBox(
                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                          child: TaskActionWidget(
                                                                                            taskRef: columnTasksRecord.reference,
                                                                                            clientRef: columnClientsRecord,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.ellipsisV,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
