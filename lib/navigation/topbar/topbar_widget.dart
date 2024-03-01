import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'topbar_model.dart';
export 'topbar_model.dart';

class TopbarWidget extends StatefulWidget {
  const TopbarWidget({super.key});

  @override
  State<TopbarWidget> createState() => _TopbarWidgetState();
}

class _TopbarWidgetState extends State<TopbarWidget> {
  late TopbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopbarModel());

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
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 20.0,
                color: Color(0x14000000),
                offset: Offset(0.0, 2.0),
                spreadRadius: 0.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 32.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Rectangle_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: const ['Profile', 'Dashboard', 'Logout'],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue = val);
                                if (_model.dropDownValue == 'Logout') {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  return;
                                }
                                if (_model.dropDownValue == 'Dashboard') {
                                  context.goNamedAuth(
                                    'clientsList',
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                }
                              },
                              width: 150.0,
                              height: 30.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Profile',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 0.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 2.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
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
      ],
    );
  }
}
