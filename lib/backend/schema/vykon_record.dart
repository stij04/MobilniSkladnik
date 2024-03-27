import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VykonRecord extends FirestoreRecord {
  VykonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "VykId" field.
  int? _vykId;
  int get vykId => _vykId ?? 0;
  bool hasVykId() => _vykId != null;

  // "VykUziId" field.
  int? _vykUziId;
  int get vykUziId => _vykUziId ?? 0;
  bool hasVykUziId() => _vykUziId != null;

  // "VykSezId" field.
  int? _vykSezId;
  int get vykSezId => _vykSezId ?? 0;
  bool hasVykSezId() => _vykSezId != null;

  // "VykDatum" field.
  DateTime? _vykDatum;
  DateTime? get vykDatum => _vykDatum;
  bool hasVykDatum() => _vykDatum != null;

  // "VykKusy" field.
  int? _vykKusy;
  int get vykKusy => _vykKusy ?? 0;
  bool hasVykKusy() => _vykKusy != null;

  // "VykKilogramy" field.
  double? _vykKilogramy;
  double get vykKilogramy => _vykKilogramy ?? 0.0;
  bool hasVykKilogramy() => _vykKilogramy != null;

  // "VykBody" field.
  double? _vykBody;
  double get vykBody => _vykBody ?? 0.0;
  bool hasVykBody() => _vykBody != null;

  // "VykKoef" field.
  double? _vykKoef;
  double get vykKoef => _vykKoef ?? 0.0;
  bool hasVykKoef() => _vykKoef != null;

  // "VykKoefVaha" field.
  double? _vykKoefVaha;
  double get vykKoefVaha => _vykKoefVaha ?? 0.0;
  bool hasVykKoefVaha() => _vykKoefVaha != null;

  // "VykVytvoreno" field.
  DateTime? _vykVytvoreno;
  DateTime? get vykVytvoreno => _vykVytvoreno;
  bool hasVykVytvoreno() => _vykVytvoreno != null;

  // "VykUpraveno" field.
  DateTime? _vykUpraveno;
  DateTime? get vykUpraveno => _vykUpraveno;
  bool hasVykUpraveno() => _vykUpraveno != null;

  void _initializeFields() {
    _vykId = castToType<int>(snapshotData['VykId']);
    _vykUziId = castToType<int>(snapshotData['VykUziId']);
    _vykSezId = castToType<int>(snapshotData['VykSezId']);
    _vykDatum = snapshotData['VykDatum'] as DateTime?;
    _vykKusy = castToType<int>(snapshotData['VykKusy']);
    _vykKilogramy = castToType<double>(snapshotData['VykKilogramy']);
    _vykBody = castToType<double>(snapshotData['VykBody']);
    _vykKoef = castToType<double>(snapshotData['VykKoef']);
    _vykKoefVaha = castToType<double>(snapshotData['VykKoefVaha']);
    _vykVytvoreno = snapshotData['VykVytvoreno'] as DateTime?;
    _vykUpraveno = snapshotData['VykUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vykon');

  static Stream<VykonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VykonRecord.fromSnapshot(s));

  static Future<VykonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VykonRecord.fromSnapshot(s));

  static VykonRecord fromSnapshot(DocumentSnapshot snapshot) => VykonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VykonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VykonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VykonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VykonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVykonRecordData({
  int? vykId,
  int? vykUziId,
  int? vykSezId,
  DateTime? vykDatum,
  int? vykKusy,
  double? vykKilogramy,
  double? vykBody,
  double? vykKoef,
  double? vykKoefVaha,
  DateTime? vykVytvoreno,
  DateTime? vykUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'VykId': vykId,
      'VykUziId': vykUziId,
      'VykSezId': vykSezId,
      'VykDatum': vykDatum,
      'VykKusy': vykKusy,
      'VykKilogramy': vykKilogramy,
      'VykBody': vykBody,
      'VykKoef': vykKoef,
      'VykKoefVaha': vykKoefVaha,
      'VykVytvoreno': vykVytvoreno,
      'VykUpraveno': vykUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class VykonRecordDocumentEquality implements Equality<VykonRecord> {
  const VykonRecordDocumentEquality();

  @override
  bool equals(VykonRecord? e1, VykonRecord? e2) {
    return e1?.vykId == e2?.vykId &&
        e1?.vykUziId == e2?.vykUziId &&
        e1?.vykSezId == e2?.vykSezId &&
        e1?.vykDatum == e2?.vykDatum &&
        e1?.vykKusy == e2?.vykKusy &&
        e1?.vykKilogramy == e2?.vykKilogramy &&
        e1?.vykBody == e2?.vykBody &&
        e1?.vykKoef == e2?.vykKoef &&
        e1?.vykKoefVaha == e2?.vykKoefVaha &&
        e1?.vykVytvoreno == e2?.vykVytvoreno &&
        e1?.vykUpraveno == e2?.vykUpraveno;
  }

  @override
  int hash(VykonRecord? e) => const ListEquality().hash([
        e?.vykId,
        e?.vykUziId,
        e?.vykSezId,
        e?.vykDatum,
        e?.vykKusy,
        e?.vykKilogramy,
        e?.vykBody,
        e?.vykKoef,
        e?.vykKoefVaha,
        e?.vykVytvoreno,
        e?.vykUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is VykonRecord;
}
