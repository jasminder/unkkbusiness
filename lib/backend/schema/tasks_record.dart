import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "serviceRef" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "assignee" field.
  DocumentReference? _assignee;
  DocumentReference? get assignee => _assignee;
  bool hasAssignee() => _assignee != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _serviceRef = snapshotData['serviceRef'] as DocumentReference?;
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _assignee = snapshotData['assignee'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? name,
  String? details,
  DateTime? dueDate,
  String? status,
  DateTime? createdAt,
  DocumentReference? serviceRef,
  DocumentReference? clientRef,
  DocumentReference? assignee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'details': details,
      'dueDate': dueDate,
      'status': status,
      'createdAt': createdAt,
      'serviceRef': serviceRef,
      'clientRef': clientRef,
      'assignee': assignee,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        e1?.dueDate == e2?.dueDate &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.serviceRef == e2?.serviceRef &&
        e1?.clientRef == e2?.clientRef &&
        e1?.assignee == e2?.assignee;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.details,
        e?.dueDate,
        e?.status,
        e?.createdAt,
        e?.serviceRef,
        e?.clientRef,
        e?.assignee
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
