import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'proposal_success_model.dart';
export 'proposal_success_model.dart';

class ProposalSuccessWidget extends StatefulWidget {
  const ProposalSuccessWidget({super.key});

  @override
  State<ProposalSuccessWidget> createState() => _ProposalSuccessWidgetState();
}

class _ProposalSuccessWidgetState extends State<ProposalSuccessWidget> {
  late ProposalSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProposalSuccessModel());

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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 78.0, 0.0, 78.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0x1A04F5C8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(110.0, 64.0, 110.0, 64.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/15-Checked.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Text(
                        'Proposal Sent!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Text(
                        'Your proposal was successfully. \nPlease check you confirmation email.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(
                            'clientsList',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        text: 'Back to Homepage',
                        options: FFButtonOptions(
                          width: 180.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(34.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
