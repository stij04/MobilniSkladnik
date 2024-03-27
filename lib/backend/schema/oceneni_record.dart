import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OceneniRecord extends FirestoreRecord {
  OceneniRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "OceId" field.
  int? _oceId;
  int get oceId => _oceId ?? 0;
  bool hasOceId() => _oceId != null;

  // "OceNazev" field.
  String? _oceNazev;
  String get oceNazev => _oceNazev ?? '';
  bool hasOceNazev() => _oceNazev != null;

  // "OcePopis" field.
  String? _ocePopis;
  String get ocePopis => _ocePopis ?? '';
  bool hasOcePopis() => _ocePopis != null;

  // "OceMena" field.
  double? _oceMena;
  double get oceMena => _oceMena ?? 0.0;
  bool hasOceMena() => _oceMena != null;

  // "OceObrazek" field.
  String? _oceObrazek;
  String get oceObrazek => _oceObrazek ?? '';
  bool hasOceObrazek() => _oceObrazek != null;

  // "OceSkryto" field.
  bool? _oceSkryto;
  bool get oceSkryto => _oceSkryto ?? false;
  bool hasOceSkryto() => _oceSkryto != null;

  // "OceVytvoreno" field.
  DateTime? _oceVytvoreno;
  DateTime? get oceVytvoreno => _oceVytvoreno;
  bool hasOceVytvoreno() => _oceVytvoreno != null;

  // "OceUpraveno" field.
  DateTime? _oceUpraveno;
  DateTime? get oceUpraveno => _oceUpraveno;
  bool hasOceUpraveno() => _oceUpraveno != null;

  void _initializeFields() {
    _oceId = castToType<int>(snapshotData['OceId']);
    _oceNazev = snapshotData['OceNazev'] as String?;
    _ocePopis = snapshotData['OcePopis'] as String?;
    _oceMena = castToType<double>(snapshotData['OceMena']);
    _oceObrazek = snapshotData['OceObrazek'] as String?;
    _oceSkryto = snapshotData['OceSkryto'] as bool?;
    _oceVytvoreno = snapshotData['OceVytvoreno'] as DateTime?;
    _oceUpraveno = snapshotData['OceUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('oceneni');

  static Stream<OceneniRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OceneniRecord.fromSnapshot(s));

  static Future<OceneniRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OceneniRecord.fromSnapshot(s));

  static OceneniRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OceneniRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OceneniRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OceneniRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OceneniRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OceneniRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOceneniRecordData({
  int? oceId,
  String? oceNazev,
  String? ocePopis,
  double? oceMena,
  String? oceObrazek,
  bool? oceSkryto,
  DateTime? oceVytvoreno,
  DateTime? oceUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OceId': oceId,
      'OceNazev': oceNazev,
      'OcePopis': ocePopis,
      'OceMena': oceMena,
      'OceObrazek': oceObrazek,
      'OceSkryto': oceSkryto,
      'OceVytvoreno': oceVytvoreno,
      'OceUpraveno': oceUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class OceneniRecordDocumentEquality implements Equality<OceneniRecord> {
  const OceneniRecordDocumentEquality();

  @override
  bool equals(OceneniRecord? e1, OceneniRecord? e2) {
    return e1?.oceId == e2?.oceId &&
        e1?.oceNazev == e2?.oceNazev &&
        e1?.ocePopis == e2?.ocePopis &&
        e1?.oceMena == e2?.oceMena &&
        e1?.oceObrazek == e2?.oceObrazek &&
        e1?.oceSkryto == e2?.oceSkryto &&
        e1?.oceVytvoreno == e2?.oceVytvoreno &&
        e1?.oceUpraveno == e2?.oceUpraveno;
  }

  @override
  int hash(OceneniRecord? e) => const ListEquality().hash([
        e?.oceId,
        e?.oceNazev,
        e?.ocePopis,
        e?.oceMena,
        e?.oceObrazek,
        e?.oceSkryto,
        e?.oceVytvoreno,
        e?.oceUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is OceneniRecord;
}
