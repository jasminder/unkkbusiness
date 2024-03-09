import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_result_not_found_model.dart';
export 'search_result_not_found_model.dart';

class SearchResultNotFoundWidget extends StatefulWidget {
  const SearchResultNotFoundWidget({super.key});

  @override
  State<SearchResultNotFoundWidget> createState() =>
      _SearchResultNotFoundWidgetState();
}

class _SearchResultNotFoundWidgetState
    extends State<SearchResultNotFoundWidget> {
  late SearchResultNotFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultNotFoundModel());

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(110.0, 64.0, 110.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.not_interested,
                  color: FlutterFlowTheme.of(context).error,
                  size: 96.0,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'No result found.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
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
