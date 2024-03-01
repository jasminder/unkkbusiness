import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ClientsRecord extends FirestoreRecord {
  ClientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "proposalRef" field.
  DocumentReference? _proposalRef;
  DocumentReference? get proposalRef => _proposalRef;
  bool hasProposalRef() => _proposalRef != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyEmail" field.
  String? _companyEmail;
  String get companyEmail => _companyEmail ?? '';
  bool hasCompanyEmail() => _companyEmail != null;

  // "companyPhone" field.
  String? _companyPhone;
  String get companyPhone => _companyPhone ?? '';
  bool hasCompanyPhone() => _companyPhone != null;

  // "companyAddress" field.
  String? _companyAddress;
  String get companyAddress => _companyAddress ?? '';
  bool hasCompanyAddress() => _companyAddress != null;

  // "trustName" field.
  String? _trustName;
  String get trustName => _trustName ?? '';
  bool hasTrustName() => _trustName != null;

  // "trustEmail" field.
  String? _trustEmail;
  String get trustEmail => _trustEmail ?? '';
  bool hasTrustEmail() => _trustEmail != null;

  // "trustPhone" field.
  String? _trustPhone;
  String get trustPhone => _trustPhone ?? '';
  bool hasTrustPhone() => _trustPhone != null;

  // "trustAddress" field.
  String? _trustAddress;
  String get trustAddress => _trustAddress ?? '';
  bool hasTrustAddress() => _trustAddress != null;

  // "individualName" field.
  String? _individualName;
  String get individualName => _individualName ?? '';
  bool hasIndividualName() => _individualName != null;

  // "individualEmail" field.
  String? _individualEmail;
  String get individualEmail => _individualEmail ?? '';
  bool hasIndividualEmail() => _individualEmail != null;

  // "individualAddress" field.
  String? _individualAddress;
  String get individualAddress => _individualAddress ?? '';
  bool hasIndividualAddress() => _individualAddress != null;

  // "individualPhone" field.
  String? _individualPhone;
  String get individualPhone => _individualPhone ?? '';
  bool hasIndividualPhone() => _individualPhone != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  void _initializeFields() {
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _proposalRef = snapshotData['proposalRef'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _companyEmail = snapshotData['companyEmail'] as String?;
    _companyPhone = snapshotData['companyPhone'] as String?;
    _companyAddress = snapshotData['companyAddress'] as String?;
    _trustName = snapshotData['trustName'] as String?;
    _trustEmail = snapshotData['trustEmail'] as String?;
    _trustPhone = snapshotData['trustPhone'] as String?;
    _trustAddress = snapshotData['trustAddress'] as String?;
    _individualName = snapshotData['individualName'] as String?;
    _individualEmail = snapshotData['individualEmail'] as String?;
    _individualAddress = snapshotData['individualAddress'] as String?;
    _individualPhone = snapshotData['individualPhone'] as String?;
    _gender = snapshotData['gender'] as String?;
    _type = getDataList(snapshotData['type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clients');

  static Stream<ClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientsRecord.fromSnapshot(s));

  static Future<ClientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientsRecord.fromSnapshot(s));

  static ClientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientsRecordData({
  String? firstName,
  String? lastName,
  DateTime? dateOfBirth,
  String? email,
  DateTime? createdAt,
  String? status,
  DocumentReference? proposalRef,
  String? companyName,
  String? companyEmail,
  String? companyPhone,
  String? companyAddress,
  String? trustName,
  String? trustEmail,
  String? trustPhone,
  String? trustAddress,
  String? individualName,
  String? individualEmail,
  String? individualAddress,
  String? individualPhone,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'createdAt': createdAt,
      'status': status,
      'proposalRef': proposalRef,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyPhone': companyPhone,
      'companyAddress': companyAddress,
      'trustName': trustName,
      'trustEmail': trustEmail,
      'trustPhone': trustPhone,
      'trustAddress': trustAddress,
      'individualName': individualName,
      'individualEmail': individualEmail,
      'individualAddress': individualAddress,
      'individualPhone': individualPhone,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientsRecordDocumentEquality implements Equality<ClientsRecord> {
  const ClientsRecordDocumentEquality();

  @override
  bool equals(ClientsRecord? e1, ClientsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.email == e2?.email &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.proposalRef == e2?.proposalRef &&
        e1?.companyName == e2?.companyName &&
        e1?.companyEmail == e2?.companyEmail &&
        e1?.companyPhone == e2?.companyPhone &&
        e1?.companyAddress == e2?.companyAddress &&
        e1?.trustName == e2?.trustName &&
        e1?.trustEmail == e2?.trustEmail &&
        e1?.trustPhone == e2?.trustPhone &&
        e1?.trustAddress == e2?.trustAddress &&
        e1?.individualName == e2?.individualName &&
        e1?.individualEmail == e2?.individualEmail &&
        e1?.individualAddress == e2?.individualAddress &&
        e1?.individualPhone == e2?.individualPhone &&
        e1?.gender == e2?.gender &&
        listEquality.equals(e1?.type, e2?.type);
  }

  @override
  int hash(ClientsRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.dateOfBirth,
        e?.email,
        e?.createdAt,
        e?.status,
        e?.proposalRef,
        e?.companyName,
        e?.companyEmail,
        e?.companyPhone,
        e?.companyAddress,
        e?.trustName,
        e?.trustEmail,
        e?.trustPhone,
        e?.trustAddress,
        e?.individualName,
        e?.individualEmail,
        e?.individualAddress,
        e?.individualPhone,
        e?.gender,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientsRecord;
}
