import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      FFAppState().activeMenu = 'taskboard';
      setState(() {
        _model.taskTillDate = functions.todayDate();
        _model.days = 0;
        _model.taskShowBy = 'day';
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 40.0, 40.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FutureBuilder<int>(
                                                  future: queryTasksRecordCount(
                                                    queryBuilder:
                                                        (tasksRecord) =>
                                                            tasksRecord.where(
                                                      'dueDate',
                                                      isLessThanOrEqualTo: functions
                                                          .getNextDateWithDays(
                                                              _model
                                                                  .taskTillDate!,
                                                              _model.days),
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child:
                                                            LinearProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      );
                                                    }
                                                    int textCount =
                                                        snapshot.data!;
                                                    return Text(
                                                      'Task Board (${textCount.toString()})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 12.0, 40.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.taskShowBy ==
                                                                    'day'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            Colors.transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.taskShowBy ==
                                                                      'day'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Colors
                                                                      .transparent,
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      4.0,
                                                                      20.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.days = 0;
                                                                _model.taskShowBy =
                                                                    'day';
                                                              });
                                                            },
                                                            child: Text(
                                                              'Day',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.taskShowBy ==
                                                                    'week'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            Colors.transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.taskShowBy ==
                                                                      'week'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Colors
                                                                      .transparent,
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      4.0,
                                                                      20.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.days = 7;
                                                                _model.taskShowBy =
                                                                    'week';
                                                              });
                                                            },
                                                            child: Text(
                                                              'Week',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model
                                                                        .taskShowBy ==
                                                                    'month'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            Colors.transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model
                                                                          .taskShowBy ==
                                                                      'month'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Colors
                                                                      .transparent,
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      4.0,
                                                                      20.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.days =
                                                                    30;
                                                                _model.taskShowBy =
                                                                    'month';
                                                              });
                                                            },
                                                            child: Text(
                                                              'Month',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.taskShowBy ==
                                                                    'quater'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            Colors.transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.taskShowBy ==
                                                                      'quater'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Colors
                                                                      .transparent,
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      4.0,
                                                                      20.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.days =
                                                                    90;
                                                                _model.taskShowBy =
                                                                    'quater';
                                                              });
                                                            },
                                                            child: Text(
                                                              'Quater',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.taskShowBy ==
                                                                    'year'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            Colors.transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.taskShowBy ==
                                                                      'year'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Colors
                                                                      .transparent,
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      4.0,
                                                                      20.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.days =
                                                                    365;
                                                                _model.taskShowBy =
                                                                    'year';
                                                              });
                                                            },
                                                            child: Text(
                                                              'Year',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (false)
                                                      Expanded(
                                                        child: Text(
                                                          'Total tasks by client',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    if (false)
                                                      Expanded(
                                                        child: Text(
                                                          'Total tasks',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (false)
                                                            Expanded(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      UsersRecord>>(
                                                                stream:
                                                                    queryUsersRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          LinearProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<UsersRecord>
                                                                      dropDownUsersRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownValue ??=
                                                                          '',
                                                                    ),
                                                                    options: List<String>.from(dropDownUsersRecordList
                                                                        .map((e) => e
                                                                            .reference
                                                                            .id)
                                                                        .toList()),
                                                                    optionLabels: dropDownUsersRecordList
                                                                        .map((e) =>
                                                                            e.displayName)
                                                                        .toList(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      setState(() =>
                                                                          _model.dropDownValue =
                                                                              val);
                                                                      setState(
                                                                          () {
                                                                        _model.assigneeRef =
                                                                            functions.userIdtoRef(_model.dropDownValue!);
                                                                      });
                                                                    },
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    hintText:
                                                                        'Assignee',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
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
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 20.0, 40.0, 20.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: StreamBuilder<
                                                        List<TasksRecord>>(
                                                      stream: queryTasksRecord(
                                                        queryBuilder:
                                                            (tasksRecord) =>
                                                                tasksRecord
                                                                    .where(
                                                          'dueDate',
                                                          isLessThanOrEqualTo: functions
                                                              .getNextDateWithDays(
                                                                  _model
                                                                      .taskTillDate!,
                                                                  _model.days),
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<TasksRecord>
                                                            containerTasksRecordList =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0x33EEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        30.0,
                                                                        0.0,
                                                                        30.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Client Name',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'Actions',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final clubbedTasks =
                                                                        functions.clubTasks(containerTasksRecordList.toList())?.toList() ??
                                                                            [];
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: List.generate(
                                                                          clubbedTasks
                                                                              .length,
                                                                          (clubbedTasksIndex) {
                                                                        final clubbedTasksItem =
                                                                            clubbedTasks[clubbedTasksIndex];
                                                                        return Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              40.0,
                                                                              13.0,
                                                                              40.0,
                                                                              13.0),
                                                                          child:
                                                                              StreamBuilder<ClientsRecord>(
                                                                            stream:
                                                                                ClientsRecord.getDocument(clubbedTasksItem.clientRef!),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: LinearProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final rowClientsRecord = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                          child: Text(
                                                                                            '${rowClientsRecord.firstName} ${rowClientsRecord.lastName}',
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
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final clientTasks = clubbedTasksItem.tasks.toList();
                                                                                              return Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(clientTasks.length, (clientTasksIndex) {
                                                                                                  final clientTasksItem = clientTasks[clientTasksIndex];
                                                                                                  return Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Task ${(clientTasksIndex + 1).toString()}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: Text(
                                                                                                            ' ${functions.getTaskFromRef(containerTasksRecordList.toList(), clientTasksItem)?.name}',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                                dateTimeFormat('yMMMd', functions.getTaskFromRef(containerTasksRecordList.toList(), clientTasksItem)!.dueDate!),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                                          child: StreamBuilder<UsersRecord>(
                                                                                                            stream: UsersRecord.getDocument(functions.getTaskFromRef(containerTasksRecordList.toList(), clientTasksItem)!.assignee!),
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
                                                                                                                functions.getTaskFromRef(containerTasksRecordList.toList(), clientTasksItem)!.status,
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
                                                                                                  );
                                                                                                }),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.ellipsisV,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
