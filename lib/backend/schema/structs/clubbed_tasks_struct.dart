// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubbedTasksStruct extends FFFirebaseStruct {
  ClubbedTasksStruct({
    List<DocumentReference>? tasks,
    DocumentReference? clientRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tasks = tasks,
        _clientRef = clientRef,
        super(firestoreUtilData);

  // "tasks" field.
  List<DocumentReference>? _tasks;
  List<DocumentReference> get tasks => _tasks ?? const [];
  set tasks(List<DocumentReference>? val) => _tasks = val;
  void updateTasks(Function(List<DocumentReference>) updateFn) =>
      updateFn(_tasks ??= []);
  bool hasTasks() => _tasks != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  set clientRef(DocumentReference? val) => _clientRef = val;
  bool hasClientRef() => _clientRef != null;

  static ClubbedTasksStruct fromMap(Map<String, dynamic> data) =>
      ClubbedTasksStruct(
        tasks: getDataList(data['tasks']),
        clientRef: data['clientRef'] as DocumentReference?,
      );

  static ClubbedTasksStruct? maybeFromMap(dynamic data) => data is Map
      ? ClubbedTasksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tasks': _tasks,
        'clientRef': _clientRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tasks': serializeParam(
          _tasks,
          ParamType.DocumentReference,
          true,
        ),
        'clientRef': serializeParam(
          _clientRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ClubbedTasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClubbedTasksStruct(
        tasks: deserializeParam<DocumentReference>(
          data['tasks'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['tasks'],
        ),
        clientRef: deserializeParam(
          data['clientRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clients'],
        ),
      );

  @override
  String toString() => 'ClubbedTasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ClubbedTasksStruct &&
        listEquality.equals(tasks, other.tasks) &&
        clientRef == other.clientRef;
  }

  @override
  int get hashCode => const ListEquality().hash([tasks, clientRef]);
}

ClubbedTasksStruct createClubbedTasksStruct({
  DocumentReference? clientRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClubbedTasksStruct(
      clientRef: clientRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClubbedTasksStruct? updateClubbedTasksStruct(
  ClubbedTasksStruct? clubbedTasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clubbedTasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClubbedTasksStructData(
  Map<String, dynamic> firestoreData,
  ClubbedTasksStruct? clubbedTasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clubbedTasks == null) {
    return;
  }
  if (clubbedTasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clubbedTasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clubbedTasksData =
      getClubbedTasksFirestoreData(clubbedTasks, forFieldValue);
  final nestedData =
      clubbedTasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clubbedTasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClubbedTasksFirestoreData(
  ClubbedTasksStruct? clubbedTasks, [
  bool forFieldValue = false,
]) {
  if (clubbedTasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clubbedTasks.toMap());

  // Add any Firestore field values
  clubbedTasks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClubbedTasksListFirestoreData(
  List<ClubbedTasksStruct>? clubbedTaskss,
) =>
    clubbedTaskss?.map((e) => getClubbedTasksFirestoreData(e, true)).toList() ??
    [];
