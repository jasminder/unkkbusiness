import '/backend/backend.dart';
import '/clients/accept_proposal/accept_proposal_widget.dart';
import '/clients/client_action/client_action_widget.dart';
import '/clients/delete_proposal/delete_proposal_widget.dart';
import '/components/empty_result_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'clients_list_model.dart';
export 'clients_list_model.dart';

class ClientsListWidget extends StatefulWidget {
  const ClientsListWidget({super.key});

  @override
  State<ClientsListWidget> createState() => _ClientsListWidgetState();
}

class _ClientsListWidgetState extends State<ClientsListWidget>
    with TickerProviderStateMixin {
  late ClientsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().activeMenu = 'clients';
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.navigationModel,
                            updateCallback: () => setState(() {}),
                            child: const NavigationWidget(),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.topbarModel,
                                    updateCallback: () => setState(() {}),
                                    child: const TopbarWidget(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        40.0, 40.0, 40.0, 20.0),
                                    child: FutureBuilder<int>(
                                      future: queryClientsRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int rowCount = snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Clients (${valueOrDefault<String>(
                                                  rowCount.toString(),
                                                  '0',
                                                )})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 287.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  const Duration(milliseconds: 2000),
                                                  () async {
                                                    await queryClientsRecordOnce()
                                                        .then(
                                                          (records) => _model
                                                                  .simpleSearchResults =
                                                              TextSearch(
                                                            records
                                                                .map(
                                                                  (record) => TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                        record
                                                                            .firstName,
                                                                        record
                                                                            .lastName,
                                                                        record
                                                                            .email
                                                                      ]),
                                                                )
                                                                .toList(),
                                                          )
                                                                  .search(_model
                                                                      .textController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList(),
                                                        )
                                                        .onError((_, __) =>
                                                            _model.simpleSearchResults =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  hintText:
                                                      'Search by User Name',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.3,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0x34EEEEEE),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(24.0, 16.0,
                                                              24.0, 16.0),
                                                  prefixIcon: Icon(
                                                    Icons.search_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  suffixIcon:
                                                      _model.textController!
                                                              .text.isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                                await queryClientsRecordOnce()
                                                                    .then(
                                                                      (records) =>
                                                                          _model.simpleSearchResults =
                                                                              TextSearch(
                                                                        records
                                                                            .map(
                                                                              (record) => TextSearchItem.fromTerms(record, [
                                                                                record.firstName,
                                                                                record.lastName,
                                                                                record.email
                                                                              ]),
                                                                            )
                                                                            .toList(),
                                                                      ).search(_model.textController.text).map((r) => r.object).toList(),
                                                                    )
                                                                    .onError((_,
                                                                            __) =>
                                                                        _model.simpleSearchResults =
                                                                            [])
                                                                    .whenComplete(() =>
                                                                        setState(
                                                                            () {}));

                                                                setState(() {});
                                                              },
                                                              child: const Icon(
                                                                Icons.clear,
                                                                size: 18.0,
                                                              ),
                                                            )
                                                          : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.3,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        40.0, 20.0, 40.0, 24.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 650.0,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: const Alignment(-1.0, 0),
                                            child: TabBar(
                                              isScrollable: true,
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              unselectedLabelStyle: const TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              padding: const EdgeInsets.all(2.0),
                                              tabs: const [
                                                Tab(
                                                  text: 'Subscribers',
                                                ),
                                                Tab(
                                                  text: 'Generic Clients',
                                                ),
                                                Tab(
                                                  text: 'Proposals',
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          height: 100.0,
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
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        46.0,
                                                                        36.0,
                                                                        46.0,
                                                                        36.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Name',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Email',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Date Joined',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Client Type',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Action',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ClientsRecord>>(
                                                                  stream:
                                                                      queryClientsRecord(
                                                                    queryBuilder:
                                                                        (clientsRecord) =>
                                                                            clientsRecord.where(
                                                                      'typeRegular',
                                                                      isEqualTo:
                                                                          true,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ClientsRecord>
                                                                        listViewClientsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewClientsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewClientsRecord =
                                                                            listViewClientsRecordList[listViewIndex];
                                                                        return Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${listViewClientsRecord.firstName} ${listViewClientsRecord.lastName}',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      listViewClientsRecord.email,
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      dateTimeFormat('yMMMd', listViewClientsRecord.createdAt!),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (listViewClientsRecord.clientType != '')
                                                                                    Expanded(
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          if (listViewClientsRecord.clientType == 'compnay')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Company',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x1A66BD94),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFF66BD94),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFF66BD94),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (listViewClientsRecord.clientType == 'trust')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Trust',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x19C37740),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFFC37740),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFFC37740),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (listViewClientsRecord.clientType == 'individual')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Individual',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x19E4B715),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFFE4B715),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFFE4B715),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            context.pushNamed(
                                                                                              'clientServices',
                                                                                              queryParameters: {
                                                                                                'clientRef': serializeParam(
                                                                                                  listViewClientsRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: 'Services',
                                                                                          options: FFButtonOptions(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  fontSize: 10.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: const BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(58.0),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              context.pushNamed(
                                                                                                'onboardServicesList',
                                                                                                queryParameters: {
                                                                                                  'clientRef': serializeParam(
                                                                                                    listViewClientsRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                  'perposalRef': serializeParam(
                                                                                                    listViewClientsRecord.proposalRef,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  kTransitionInfoKey: const TransitionInfo(
                                                                                                    hasTransition: true,
                                                                                                    transitionType: PageTransitionType.fade,
                                                                                                  ),
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            text: 'Proposal',
                                                                                            options: FFButtonOptions(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: const Color(0x7FC5C5C5),
                                                                                              textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(58.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: InkWell(
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
                                                                                                          child: ClientActionWidget(
                                                                                                            clientRef: listViewClientsRecord.reference,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.settings_sharp,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Divider(
                                                                                height: 24.0,
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          height: 100.0,
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
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        46.0,
                                                                        36.0,
                                                                        46.0,
                                                                        36.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Name',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Email',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Date Joined',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Client Type',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Action',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ClientsRecord>>(
                                                                  stream:
                                                                      queryClientsRecord(
                                                                    queryBuilder:
                                                                        (clientsRecord) =>
                                                                            clientsRecord.where(
                                                                      'typeOneOff',
                                                                      isEqualTo:
                                                                          true,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ClientsRecord>
                                                                        listViewClientsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewClientsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewClientsRecord =
                                                                            listViewClientsRecordList[listViewIndex];
                                                                        return Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${listViewClientsRecord.firstName} ${listViewClientsRecord.lastName}',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      listViewClientsRecord.email,
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      dateTimeFormat('yMMMd', listViewClientsRecord.createdAt!),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (listViewClientsRecord.clientType != '')
                                                                                    Expanded(
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          if (listViewClientsRecord.clientType == 'compnay')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Company',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x1A66BD94),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFF66BD94),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFF66BD94),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (listViewClientsRecord.clientType == 'trust')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Trust',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x19C37740),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFFC37740),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFFC37740),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (listViewClientsRecord.clientType == 'individual')
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'Individual',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 30.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0x19E4B715),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: const Color(0xFFE4B715),
                                                                                                        fontSize: 10.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Color(0xFFE4B715),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            context.pushNamed(
                                                                                              'clientServices',
                                                                                              queryParameters: {
                                                                                                'clientRef': serializeParam(
                                                                                                  listViewClientsRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: 'Services',
                                                                                          options: FFButtonOptions(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  fontSize: 10.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: const BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(58.0),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              context.pushNamed(
                                                                                                'onboardServicesList',
                                                                                                queryParameters: {
                                                                                                  'clientRef': serializeParam(
                                                                                                    listViewClientsRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                  'perposalRef': serializeParam(
                                                                                                    listViewClientsRecord.proposalRef,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  kTransitionInfoKey: const TransitionInfo(
                                                                                                    hasTransition: true,
                                                                                                    transitionType: PageTransitionType.fade,
                                                                                                  ),
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            text: 'Proposal',
                                                                                            options: FFButtonOptions(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: const Color(0x7FC5C5C5),
                                                                                              textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(58.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: InkWell(
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
                                                                                                          child: ClientActionWidget(
                                                                                                            clientRef: listViewClientsRecord.reference,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.settings_sharp,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Divider(
                                                                                height: 24.0,
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: StreamBuilder<
                                                      List<ClientTrackRecord>>(
                                                    stream:
                                                        queryClientTrackRecord(
                                                      queryBuilder:
                                                          (clientTrackRecord) =>
                                                              clientTrackRecord
                                                                  .where(
                                                        'status',
                                                        isEqualTo: 'created',
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ClientTrackRecord>
                                                          containerClientTrackRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x33EEEEEE),
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
                                                                      40.0,
                                                                      30.0,
                                                                      40.0,
                                                                      30.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final servicesTrack =
                                                                  containerClientTrackRecordList
                                                                      .toList();
                                                              if (servicesTrack
                                                                  .isEmpty) {
                                                                return const EmptyResultWidget();
                                                              }
                                                              return FlutterFlowDataTable<
                                                                  ClientTrackRecord>(
                                                                controller: _model
                                                                    .paginatedDataTableController,
                                                                data:
                                                                    servicesTrack,
                                                                numRows:
                                                                    containerClientTrackRecordList
                                                                        .length,
                                                                columnsBuilder:
                                                                    (onSortChanged) =>
                                                                        [
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'Email',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'Name',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'Date',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    fixedWidth:
                                                                        150.0,
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Action',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                                dataRowBuilder: (servicesTrackItem,
                                                                        servicesTrackIndex,
                                                                        selected,
                                                                        onSelectChanged) =>
                                                                    DataRow(
                                                                  cells: [
                                                                    Text(
                                                                      servicesTrackItem
                                                                          .email,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    StreamBuilder<
                                                                        ClientsRecord>(
                                                                      stream: ClientsRecord.getDocument(
                                                                          servicesTrackItem
                                                                              .clientRef!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                LinearProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          );
                                                                        }
                                                                        final textClientsRecord =
                                                                            snapshot.data!;
                                                                        return Text(
                                                                          '${textClientsRecord.firstName} ${textClientsRecord.lastName}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        );
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                          'yMMMd',
                                                                          servicesTrackItem
                                                                              .createdAt!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'proposalInfo',
                                                                              queryParameters: {
                                                                                'clientTrack': serializeParam(
                                                                                  servicesTrackItem,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'clientTrack': servicesTrackItem,
                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.fade,
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          text:
                                                                              'View',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                8.0,
                                                                                22.0,
                                                                                8.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(58.0),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
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
                                                                                        child: AcceptProposalWidget(
                                                                                          clientTrackRef: servicesTrackItem.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                'Accept',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(22.0, 8.0, 22.0, 8.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: const Color(0x0004F5C8),
                                                                              textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(58.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
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
                                                                                        child: DeleteProposalWidget(
                                                                                          trackRef: servicesTrackItem.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                'Remove',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(22.0, 8.0, 22.0, 8.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: const BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(58.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ]
                                                                      .map((c) =>
                                                                          DataCell(
                                                                              c))
                                                                      .toList(),
                                                                ),
                                                                emptyBuilder: () =>
                                                                    const EmptyResultWidget(),
                                                                paginated: true,
                                                                selectable:
                                                                    false,
                                                                hidePaginator:
                                                                    false,
                                                                showFirstLastButtons:
                                                                    false,
                                                                minWidth: 800.0,
                                                                headingRowHeight:
                                                                    56.0,
                                                                dataRowHeight:
                                                                    48.0,
                                                                columnSpacing:
                                                                    20.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                addHorizontalDivider:
                                                                    true,
                                                                addTopAndBottomDivider:
                                                                    false,
                                                                hideDefaultHorizontalDivider:
                                                                    false,
                                                                horizontalDividerColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                horizontalDividerThickness:
                                                                    1.0,
                                                                addVerticalDivider:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
