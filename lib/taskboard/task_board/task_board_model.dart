import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/navigation/navigation_widget.dart';
import '/navigation/topbar/topbar_widget.dart';
import 'task_board_widget.dart' show TaskBoardWidget;
import 'package:flutter/material.dart';

class TaskBoardModel extends FlutterFlowModel<TaskBoardWidget> {
  ///  Local state fields for this page.

  DateTime? taskTillDate;

  List<DocumentReference> clientsRef = [];
  void addToClientsRef(DocumentReference item) => clientsRef.add(item);
  void removeFromClientsRef(DocumentReference item) => clientsRef.remove(item);
  void removeAtIndexFromClientsRef(int index) => clientsRef.removeAt(index);
  void insertAtIndexInClientsRef(int index, DocumentReference item) =>
      clientsRef.insert(index, item);
  void updateClientsRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      clientsRef[index] = updateFn(clientsRef[index]);

  int loopCount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in taskBoard widget.
  List<TasksRecord>? clientsInfo;
  // Model for navigation component.
  late NavigationModel navigationModel;
  // Model for topbar component.
  late TopbarModel topbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
    topbarModel = createModel(context, () => TopbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
    topbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
