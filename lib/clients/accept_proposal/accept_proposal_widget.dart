import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'accept_proposal_model.dart';
export 'accept_proposal_model.dart';

class AcceptProposalWidget extends StatefulWidget {
  const AcceptProposalWidget({
    super.key,
    this.clientTrackRef,
  });

  final DocumentReference? clientTrackRef;

  @override
  State<AcceptProposalWidget> createState() => _AcceptProposalWidgetState();
}

class _AcceptProposalWidgetState extends State<AcceptProposalWidget> {
  late AcceptProposalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptProposalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.trackInfo =
          await ClientTrackRecord.getDocumentOnce(widget.clientTrackRef!);
      while (_model.trackInfo!.clientServices.length > _model.loop) {
        await _model.trackInfo!.clientServices[_model.loop]
            .update(createClientServicesRecordData(
          status: 'accept',
        ));
        _model.serviceInfo = await ClientServicesRecord.getDocumentOnce(
            _model.trackInfo!.clientServices[_model.loop]);
        _model.serviceTasks = await queryServicesTaskRecordOnce(
          queryBuilder: (servicesTaskRecord) => servicesTaskRecord.where(
            'serviceRef',
            isEqualTo: _model.serviceInfo?.serviceRef,
          ),
        );
        while (_model.serviceTasks!.length > _model.tasksLoop) {
          await TasksRecord.collection.doc().set({
            ...createTasksRecordData(
              name: _model.serviceTasks?[_model.tasksLoop].title,
              details: _model.serviceTasks?[_model.tasksLoop].description,
              clientServiceRef: _model.trackInfo?.clientServices[_model.loop],
              clientRef: _model.trackInfo?.clientRef,
              serviceRef: _model.serviceTasks?[_model.tasksLoop].serviceRef,
            ),
            ...mapToFirestore(
              {
                'createdAt': FieldValue.serverTimestamp(),
              },
            ),
          });
          setState(() {
            _model.tasksLoop = _model.tasksLoop + 1;
          });
        }
        setState(() {
          _model.tasksLoop = 0;
        });
        setState(() {
          _model.loop = _model.loop + 1;
        });
      }

      await widget.clientTrackRef!.update(createClientTrackRecordData(
        status: '',
      ));
      setState(() {
        _model.loop = 0;
      });
      Navigator.pop(context);
    });

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
            child: Stack(
              alignment: const AlignmentDirectional(1.0, -1.0),
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(70.0, 40.0, 70.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Accepting proposal',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      Lottie.asset(
                        'assets/lottie_animations/UkmjPQvcAT.json',
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
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
