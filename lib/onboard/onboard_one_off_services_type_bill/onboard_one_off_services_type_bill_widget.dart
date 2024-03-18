import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'onboard_one_off_services_type_bill_model.dart';
export 'onboard_one_off_services_type_bill_model.dart';

class OnboardOneOffServicesTypeBillWidget extends StatefulWidget {
  const OnboardOneOffServicesTypeBillWidget({
    super.key,
    this.serviceRef,
    this.proposalRef,
    this.serviceType,
  });

  final DocumentReference? serviceRef;
  final DocumentReference? proposalRef;
  final String? serviceType;

  @override
  State<OnboardOneOffServicesTypeBillWidget> createState() =>
      _OnboardOneOffServicesTypeBillWidgetState();
}

class _OnboardOneOffServicesTypeBillWidgetState
    extends State<OnboardOneOffServicesTypeBillWidget> {
  late OnboardOneOffServicesTypeBillModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardOneOffServicesTypeBillModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.animation = false;
        _model.borderAcceptance = false;
        _model.borderCompletion = false;
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
                    StreamBuilder<ProposalRecord>(
                      stream: ProposalRecord.getDocument(widget.proposalRef!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          );
                        }
                        final rowProposalRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x33EEEEEE),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 28.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Send Proposal to ${rowProposalRecord.firstName} ${rowProposalRecord.lastName}',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 206.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'How will this ${widget.serviceType} service be billed?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.borderAcceptance = true;
                                                _model.borderCompletion = false;
                                                _model.clientRef = null;
                                                _model.animation = true;
                                              });
                                              _model.propsalInfo =
                                                  await ProposalRecord
                                                      .getDocumentOnce(
                                                          widget.proposalRef!);
                                              _model.serviceDetails =
                                                  await ServicesRecord
                                                      .getDocumentOnce(
                                                          widget.serviceRef!);
                                              _model.clientExists =
                                                  await queryClientsRecordOnce(
                                                queryBuilder: (clientsRecord) =>
                                                    clientsRecord.where(
                                                  'email',
                                                  isEqualTo:
                                                      _model.propsalInfo?.email,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.clientExists
                                                      ?.reference !=
                                                  null) {
                                                setState(() {
                                                  _model.clientRef = _model
                                                      .clientExists?.reference;
                                                });

                                                await _model.clientRef!.update(
                                                    createClientsRecordData(
                                                  typeOneOff:
                                                      widget.serviceType ==
                                                              'one off'
                                                          ? true
                                                          : false,
                                                  typeRegular:
                                                      widget.serviceType ==
                                                              'regular'
                                                          ? true
                                                          : false,
                                                ));
                                              } else {
                                                var clientsRecordReference =
                                                    ClientsRecord.collection
                                                        .doc();
                                                await clientsRecordReference
                                                    .set({
                                                  ...createClientsRecordData(
                                                    firstName: _model
                                                        .propsalInfo?.firstName,
                                                    lastName: _model
                                                        .propsalInfo?.lastName,
                                                    dateOfBirth: _model
                                                        .propsalInfo
                                                        ?.dateOfBirth,
                                                    email: _model
                                                        .propsalInfo?.email,
                                                    typeOneOff:
                                                        widget.serviceType ==
                                                                'one off'
                                                            ? true
                                                            : false,
                                                    typeRegular:
                                                        widget.serviceType ==
                                                                'regular'
                                                            ? true
                                                            : false,
                                                    proposalRef: _model
                                                        .propsalInfo?.reference,
                                                    clientType: 'none',
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'createdAt': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                _model.createdClient =
                                                    ClientsRecord
                                                        .getDocumentFromData({
                                                  ...createClientsRecordData(
                                                    firstName: _model
                                                        .propsalInfo?.firstName,
                                                    lastName: _model
                                                        .propsalInfo?.lastName,
                                                    dateOfBirth: _model
                                                        .propsalInfo
                                                        ?.dateOfBirth,
                                                    email: _model
                                                        .propsalInfo?.email,
                                                    typeOneOff:
                                                        widget.serviceType ==
                                                                'one off'
                                                            ? true
                                                            : false,
                                                    typeRegular:
                                                        widget.serviceType ==
                                                                'regular'
                                                            ? true
                                                            : false,
                                                    proposalRef: _model
                                                        .propsalInfo?.reference,
                                                    clientType: 'none',
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'createdAt':
                                                          DateTime.now(),
                                                    },
                                                  ),
                                                }, clientsRecordReference);
                                                setState(() {
                                                  _model.clientRef = _model
                                                      .createdClient?.reference;
                                                });
                                              }

                                              await ClientServicesRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createClientServicesRecordData(
                                                  type: widget.serviceType,
                                                  billingMode: 'on acceptance',
                                                  quantity: 1,
                                                  price: _model
                                                      .serviceDetails?.price,
                                                  clientRef: _model.clientRef,
                                                  serviceRef: widget.serviceRef,
                                                  status: 'created',
                                                  proposalRef:
                                                      widget.proposalRef,
                                                  name: _model
                                                      .serviceDetails?.name,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'createdAt': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              context.pushNamed(
                                                'onboardServicesList',
                                                queryParameters: {
                                                  'clientRef': serializeParam(
                                                    _model.clientRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'perposalRef': serializeParam(
                                                    widget.proposalRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 240.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x1904F5C8),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.borderAcceptance ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : const Color(0x1904F5C8),
                                                    const Color(0x1904F5C8),
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 40.0, 24.0, 40.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Group_289687.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'On acceptance',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Bill upon Proposal Acceptance',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.borderAcceptance = false;
                                                _model.borderCompletion = true;
                                                _model.clientRef = null;
                                                _model.animation = true;
                                              });
                                              _model.propsalInfo2 =
                                                  await ProposalRecord
                                                      .getDocumentOnce(
                                                          widget.proposalRef!);
                                              _model.serviceDetails2 =
                                                  await ServicesRecord
                                                      .getDocumentOnce(
                                                          widget.serviceRef!);
                                              _model.clientExists2 =
                                                  await queryClientsRecordOnce(
                                                queryBuilder: (clientsRecord) =>
                                                    clientsRecord.where(
                                                  'email',
                                                  isEqualTo: _model
                                                      .propsalInfo2?.email,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.clientExists2
                                                      ?.reference !=
                                                  null) {
                                                setState(() {
                                                  _model.clientRef = _model
                                                      .clientExists2?.reference;
                                                });

                                                await _model.clientRef!.update(
                                                    createClientsRecordData(
                                                  typeOneOff:
                                                      widget.serviceType ==
                                                              'one off'
                                                          ? true
                                                          : false,
                                                  typeRegular:
                                                      widget.serviceType ==
                                                              'regular'
                                                          ? true
                                                          : false,
                                                ));
                                              } else {
                                                var clientsRecordReference =
                                                    ClientsRecord.collection
                                                        .doc();
                                                await clientsRecordReference
                                                    .set({
                                                  ...createClientsRecordData(
                                                    firstName: _model
                                                        .propsalInfo2
                                                        ?.firstName,
                                                    lastName: _model
                                                        .propsalInfo2?.lastName,
                                                    dateOfBirth: _model
                                                        .propsalInfo2
                                                        ?.dateOfBirth,
                                                    email: _model
                                                        .propsalInfo2?.email,
                                                    typeOneOff:
                                                        widget.serviceType ==
                                                                'one off'
                                                            ? true
                                                            : false,
                                                    typeRegular:
                                                        widget.serviceType ==
                                                                'regular'
                                                            ? true
                                                            : false,
                                                    clientType: 'none',
                                                    proposalRef: _model
                                                        .propsalInfo2
                                                        ?.reference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'createdAt': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                _model.createdClient2 =
                                                    ClientsRecord
                                                        .getDocumentFromData({
                                                  ...createClientsRecordData(
                                                    firstName: _model
                                                        .propsalInfo2
                                                        ?.firstName,
                                                    lastName: _model
                                                        .propsalInfo2?.lastName,
                                                    dateOfBirth: _model
                                                        .propsalInfo2
                                                        ?.dateOfBirth,
                                                    email: _model
                                                        .propsalInfo2?.email,
                                                    typeOneOff:
                                                        widget.serviceType ==
                                                                'one off'
                                                            ? true
                                                            : false,
                                                    typeRegular:
                                                        widget.serviceType ==
                                                                'regular'
                                                            ? true
                                                            : false,
                                                    clientType: 'none',
                                                    proposalRef: _model
                                                        .propsalInfo2
                                                        ?.reference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'createdAt':
                                                          DateTime.now(),
                                                    },
                                                  ),
                                                }, clientsRecordReference);
                                                _model.clientRef = _model
                                                    .createdClient2?.reference;
                                              }

                                              await ClientServicesRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createClientServicesRecordData(
                                                  type: widget.serviceType,
                                                  billingMode: 'on completion',
                                                  quantity: 1,
                                                  price: _model
                                                      .serviceDetails2?.price,
                                                  clientRef: _model.clientRef,
                                                  serviceRef: widget.serviceRef,
                                                  status: 'created',
                                                  proposalRef:
                                                      widget.proposalRef,
                                                  name: _model
                                                      .serviceDetails2?.name,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'createdAt': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              context.pushNamed(
                                                'onboardServicesList',
                                                queryParameters: {
                                                  'clientRef': serializeParam(
                                                    _model.clientRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'perposalRef': serializeParam(
                                                    widget.proposalRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 238.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x1904F5C8),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.borderCompletion ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : const Color(0x1904F5C8),
                                                    const Color(0x1904F5C8),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 40.0, 24.0, 40.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/g147.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'On completion',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Manual Billing upon Completion',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
