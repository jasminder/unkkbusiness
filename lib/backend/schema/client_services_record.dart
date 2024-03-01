import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientServicesRecord extends FirestoreRecord {
  ClientServicesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "billingMode" field.
  String? _billingMode;
  String get billingMode => _billingMode ?? '';
  bool hasBillingMode() => _billingMode != null;

  // "priceType" field.
  String? _priceType;
  String get priceType => _priceType ?? '';
  bool hasPriceType() => _priceType != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantityUnit" field.
  String? _quantityUnit;
  String get quantityUnit => _quantityUnit ?? '';
  bool hasQuantityUnit() => _quantityUnit != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "serviceRef" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _billingMode = snapshotData['billingMode'] as String?;
    _priceType = snapshotData['priceType'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _price = castToType<double>(snapshotData['price']);
    _quantityUnit = snapshotData['quantityUnit'] as String?;
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _serviceRef = snapshotData['serviceRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clientServices');

  static Stream<ClientServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientServicesRecord.fromSnapshot(s));

  static Future<ClientServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientServicesRecord.fromSnapshot(s));

  static ClientServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientServicesRecordData({
  String? type,
  String? billingMode,
  String? priceType,
  int? quantity,
  double? price,
  String? quantityUnit,
  DocumentReference? clientRef,
  DocumentReference? serviceRef,
  DateTime? createdAt,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'billingMode': billingMode,
      'priceType': priceType,
      'quantity': quantity,
      'price': price,
      'quantityUnit': quantityUnit,
      'clientRef': clientRef,
      'serviceRef': serviceRef,
      'createdAt': createdAt,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientServicesRecordDocumentEquality
    implements Equality<ClientServicesRecord> {
  const ClientServicesRecordDocumentEquality();

  @override
  bool equals(ClientServicesRecord? e1, ClientServicesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.billingMode == e2?.billingMode &&
        e1?.priceType == e2?.priceType &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.quantityUnit == e2?.quantityUnit &&
        e1?.clientRef == e2?.clientRef &&
        e1?.serviceRef == e2?.serviceRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ClientServicesRecord? e) => const ListEquality().hash([
        e?.type,
        e?.billingMode,
        e?.priceType,
        e?.quantity,
        e?.price,
        e?.quantityUnit,
        e?.clientRef,
        e?.serviceRef,
        e?.createdAt,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientServicesRecord;
}
