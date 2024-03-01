import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProposalRecord extends FirestoreRecord {
  ProposalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "salutation" field.
  String? _salutation;
  String get salutation => _salutation ?? '';
  bool hasSalutation() => _salutation != null;

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

  // "address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "suburb" field.
  String? _suburb;
  String get suburb => _suburb ?? '';
  bool hasSuburb() => _suburb != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "postCode" field.
  String? _postCode;
  String get postCode => _postCode ?? '';
  bool hasPostCode() => _postCode != null;

  // "personalAddressSame" field.
  String? _personalAddressSame;
  String get personalAddressSame => _personalAddressSame ?? '';
  bool hasPersonalAddressSame() => _personalAddressSame != null;

  // "tfnNumber" field.
  String? _tfnNumber;
  String get tfnNumber => _tfnNumber ?? '';
  bool hasTfnNumber() => _tfnNumber != null;

  // "trader" field.
  String? _trader;
  String get trader => _trader ?? '';
  bool hasTrader() => _trader != null;

  // "maritalStatus" field.
  String? _maritalStatus;
  String get maritalStatus => _maritalStatus ?? '';
  bool hasMaritalStatus() => _maritalStatus != null;

  // "investmentProperty" field.
  String? _investmentProperty;
  String get investmentProperty => _investmentProperty ?? '';
  bool hasInvestmentProperty() => _investmentProperty != null;

  // "healthinsurance" field.
  String? _healthinsurance;
  String get healthinsurance => _healthinsurance ?? '';
  bool hasHealthinsurance() => _healthinsurance != null;

  // "investCrypto" field.
  String? _investCrypto;
  String get investCrypto => _investCrypto ?? '';
  bool hasInvestCrypto() => _investCrypto != null;

  // "taxAddtionalInfo" field.
  String? _taxAddtionalInfo;
  String get taxAddtionalInfo => _taxAddtionalInfo ?? '';
  bool hasTaxAddtionalInfo() => _taxAddtionalInfo != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _salutation = snapshotData['salutation'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _suburb = snapshotData['suburb'] as String?;
    _state = snapshotData['state'] as String?;
    _postCode = snapshotData['postCode'] as String?;
    _personalAddressSame = snapshotData['personalAddressSame'] as String?;
    _tfnNumber = snapshotData['tfnNumber'] as String?;
    _trader = snapshotData['trader'] as String?;
    _maritalStatus = snapshotData['maritalStatus'] as String?;
    _investmentProperty = snapshotData['investmentProperty'] as String?;
    _healthinsurance = snapshotData['healthinsurance'] as String?;
    _investCrypto = snapshotData['investCrypto'] as String?;
    _taxAddtionalInfo = snapshotData['taxAddtionalInfo'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _contact = snapshotData['contact'] as String?;
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('proposal');

  static Stream<ProposalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProposalRecord.fromSnapshot(s));

  static Future<ProposalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProposalRecord.fromSnapshot(s));

  static ProposalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProposalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProposalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProposalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProposalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProposalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProposalRecordData({
  String? salutation,
  String? firstName,
  String? lastName,
  DateTime? dateOfBirth,
  String? email,
  String? address1,
  String? address2,
  String? suburb,
  String? state,
  String? postCode,
  String? personalAddressSame,
  String? tfnNumber,
  String? trader,
  String? maritalStatus,
  String? investmentProperty,
  String? healthinsurance,
  String? investCrypto,
  String? taxAddtionalInfo,
  DateTime? createdAt,
  String? status,
  String? contact,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'salutation': salutation,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'address1': address1,
      'address2': address2,
      'suburb': suburb,
      'state': state,
      'postCode': postCode,
      'personalAddressSame': personalAddressSame,
      'tfnNumber': tfnNumber,
      'trader': trader,
      'maritalStatus': maritalStatus,
      'investmentProperty': investmentProperty,
      'healthinsurance': healthinsurance,
      'investCrypto': investCrypto,
      'taxAddtionalInfo': taxAddtionalInfo,
      'createdAt': createdAt,
      'status': status,
      'contact': contact,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProposalRecordDocumentEquality implements Equality<ProposalRecord> {
  const ProposalRecordDocumentEquality();

  @override
  bool equals(ProposalRecord? e1, ProposalRecord? e2) {
    return e1?.salutation == e2?.salutation &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.email == e2?.email &&
        e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.suburb == e2?.suburb &&
        e1?.state == e2?.state &&
        e1?.postCode == e2?.postCode &&
        e1?.personalAddressSame == e2?.personalAddressSame &&
        e1?.tfnNumber == e2?.tfnNumber &&
        e1?.trader == e2?.trader &&
        e1?.maritalStatus == e2?.maritalStatus &&
        e1?.investmentProperty == e2?.investmentProperty &&
        e1?.healthinsurance == e2?.healthinsurance &&
        e1?.investCrypto == e2?.investCrypto &&
        e1?.taxAddtionalInfo == e2?.taxAddtionalInfo &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.contact == e2?.contact &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(ProposalRecord? e) => const ListEquality().hash([
        e?.salutation,
        e?.firstName,
        e?.lastName,
        e?.dateOfBirth,
        e?.email,
        e?.address1,
        e?.address2,
        e?.suburb,
        e?.state,
        e?.postCode,
        e?.personalAddressSame,
        e?.tfnNumber,
        e?.trader,
        e?.maritalStatus,
        e?.investmentProperty,
        e?.healthinsurance,
        e?.investCrypto,
        e?.taxAddtionalInfo,
        e?.createdAt,
        e?.status,
        e?.contact,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is ProposalRecord;
}
