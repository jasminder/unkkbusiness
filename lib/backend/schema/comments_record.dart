import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "commentBy" field.
  String? _commentBy;
  String get commentBy => _commentBy ?? '';
  bool hasCommentBy() => _commentBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _info = snapshotData['info'] as String?;
    _commentBy = snapshotData['commentBy'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? info,
  String? commentBy,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': info,
      'commentBy': commentBy,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.info == e2?.info &&
        e1?.commentBy == e2?.commentBy &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CommentsRecord? e) =>
      const ListEquality().hash([e?.info, e?.commentBy, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
