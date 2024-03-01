import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboard_add_services_model.dart';
export 'onboard_add_services_model.dart';

class OnboardAddServicesWidget extends StatefulWidget {
  const OnboardAddServicesWidget({
    super.key,
    required this.proposalRef,
  });

  final ProposalRecord? proposalRef;

  @override
  State<OnboardAddServicesWidget> createState() =>
      _OnboardAddServicesWidgetState();
}

class _OnboardAddServicesWidgetState extends State<OnboardAddServicesWidget> {
  late OnboardAddServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardAddServicesModel());

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
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(82.0, 70.0, 82.0, 70.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('newOnboard');
                          },
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: const Color(0x33EEEEEE),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 1.0,
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 28.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Send Proposal to ${widget.proposalRef?.firstName} ${widget.proposalRef?.lastName}',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 206.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                400.0, 0.0, 400.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Text(
                                    'Add services to build your proposal',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Text(
                                  'Search and select services from your Service library. If you don’t see the one you want, you can create a new one.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: FutureBuilder<List<ServicesRecord>>(
                                      future: queryServicesRecordOnce(),
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
                                        List<ServicesRecord>
                                            dropDownServicesRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<String>(
                                            _model.dropDownValue ??= '',
                                          ),
                                          options: List<String>.from(
                                              dropDownServicesRecordList
                                                  .map((e) => e.reference.id)
                                                  .toList()),
                                          optionLabels:
                                              dropDownServicesRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => _model.dropDownValue = val),
                                          width: 420.0,
                                          height: 60.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Add Service',
                                          searchHintText: 'Search',
                                          searchCursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor: const Color(0xFFFCFCFC),
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.clientExist =
                                          await queryClientsRecordOnce(
                                        queryBuilder: (clientsRecord) =>
                                            clientsRecord.where(
                                          'proposalRef',
                                          isEqualTo:
                                              widget.proposalRef?.reference,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.clientExist?.reference ==
                                          null) {
                                        context.goNamed(
                                          'onboardAddServicesType',
                                          queryParameters: {
                                            'proposalRef': serializeParam(
                                              widget.proposalRef,
                                              ParamType.Document,
                                            ),
                                            'serviceRef': serializeParam(
                                              functions.docIDtoRef(
                                                  _model.dropDownValue!),
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'proposalRef': widget.proposalRef,
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      } else {
                                        _model.clientServiceCount =
                                            await queryClientServicesRecordCount(
                                          queryBuilder:
                                              (clientServicesRecord) =>
                                                  clientServicesRecord
                                                      .where(
                                                        'clientRef',
                                                        isEqualTo: _model
                                                            .clientExist
                                                            ?.reference,
                                                      )
                                                      .where(
                                                        'serviceRef',
                                                        isEqualTo: functions
                                                            .docIDtoRef(_model
                                                                .dropDownValue!),
                                                      ),
                                        );
                                        if (_model.clientServiceCount == 0) {
                                          context.pushNamed(
                                            'onboardAddServicesType',
                                            queryParameters: {
                                              'proposalRef': serializeParam(
                                                widget.proposalRef,
                                                ParamType.Document,
                                              ),
                                              'serviceRef': serializeParam(
                                                functions.docIDtoRef(
                                                    _model.dropDownValue!),
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'proposalRef': widget.proposalRef,
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Service already exists.',
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          75.0, 24.0, 75.0, 24.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
