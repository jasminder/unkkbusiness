import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ServicesTaskRecord extends FirestoreRecord {
  ServicesTaskRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "serviceRef" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _serviceRef = snapshotData['serviceRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicesTask');

  static Stream<ServicesTaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesTaskRecord.fromSnapshot(s));

  static Future<ServicesTaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesTaskRecord.fromSnapshot(s));

  static ServicesTaskRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesTaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesTaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesTaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesTaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesTaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesTaskRecordData({
  DocumentReference? serviceRef,
  String? title,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serviceRef': serviceRef,
      'title': title,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesTaskRecordDocumentEquality
    implements Equality<ServicesTaskRecord> {
  const ServicesTaskRecordDocumentEquality();

  @override
  bool equals(ServicesTaskRecord? e1, ServicesTaskRecord? e2) {
    return e1?.serviceRef == e2?.serviceRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ServicesTaskRecord? e) =>
      const ListEquality().hash([e?.serviceRef, e?.title, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ServicesTaskRecord;
}
