import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClientTrackRecord extends FirestoreRecord {
  ClientTrackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "proposalRef" field.
  DocumentReference? _proposalRef;
  DocumentReference? get proposalRef => _proposalRef;
  bool hasProposalRef() => _proposalRef != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "clientServices" field.
  List<DocumentReference>? _clientServices;
  List<DocumentReference> get clientServices => _clientServices ?? const [];
  bool hasClientServices() => _clientServices != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  bool hasSignature() => _signature != null;

  // "proposalAccept" field.
  bool? _proposalAccept;
  bool get proposalAccept => _proposalAccept ?? false;
  bool hasProposalAccept() => _proposalAccept != null;

  // "signatureDate" field.
  DateTime? _signatureDate;
  DateTime? get signatureDate => _signatureDate;
  bool hasSignatureDate() => _signatureDate != null;

  void _initializeFields() {
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _proposalRef = snapshotData['proposalRef'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _clientServices = getDataList(snapshotData['clientServices']);
    _signature = snapshotData['signature'] as String?;
    _proposalAccept = snapshotData['proposalAccept'] as bool?;
    _signatureDate = snapshotData['signatureDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clientTrack');

  static Stream<ClientTrackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientTrackRecord.fromSnapshot(s));

  static Future<ClientTrackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientTrackRecord.fromSnapshot(s));

  static ClientTrackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientTrackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientTrackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientTrackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientTrackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientTrackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientTrackRecordData({
  DocumentReference? clientRef,
  DocumentReference? proposalRef,
  String? email,
  String? status,
  DateTime? createdAt,
  String? signature,
  bool? proposalAccept,
  DateTime? signatureDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clientRef': clientRef,
      'proposalRef': proposalRef,
      'email': email,
      'status': status,
      'createdAt': createdAt,
      'signature': signature,
      'proposalAccept': proposalAccept,
      'signatureDate': signatureDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientTrackRecordDocumentEquality implements Equality<ClientTrackRecord> {
  const ClientTrackRecordDocumentEquality();

  @override
  bool equals(ClientTrackRecord? e1, ClientTrackRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clientRef == e2?.clientRef &&
        e1?.proposalRef == e2?.proposalRef &&
        e1?.email == e2?.email &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.clientServices, e2?.clientServices) &&
        e1?.signature == e2?.signature &&
        e1?.proposalAccept == e2?.proposalAccept &&
        e1?.signatureDate == e2?.signatureDate;
  }

  @override
  int hash(ClientTrackRecord? e) => const ListEquality().hash([
        e?.clientRef,
        e?.proposalRef,
        e?.email,
        e?.status,
        e?.createdAt,
        e?.clientServices,
        e?.signature,
        e?.proposalAccept,
        e?.signatureDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientTrackRecord;
}
