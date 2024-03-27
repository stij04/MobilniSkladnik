import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OdmenaRecord extends FirestoreRecord {
  OdmenaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "OdmId" field.
  int? _odmId;
  int get odmId => _odmId ?? 0;
  bool hasOdmId() => _odmId != null;

  // "OdmNazev" field.
  String? _odmNazev;
  String get odmNazev => _odmNazev ?? '';
  bool hasOdmNazev() => _odmNazev != null;

  // "OdmPopis" field.
  String? _odmPopis;
  String get odmPopis => _odmPopis ?? '';
  bool hasOdmPopis() => _odmPopis != null;

  // "OdmCena" field.
  double? _odmCena;
  double get odmCena => _odmCena ?? 0.0;
  bool hasOdmCena() => _odmCena != null;

  // "OdmObrazek" field.
  String? _odmObrazek;
  String get odmObrazek => _odmObrazek ?? '';
  bool hasOdmObrazek() => _odmObrazek != null;

  // "OdmSkryto" field.
  bool? _odmSkryto;
  bool get odmSkryto => _odmSkryto ?? false;
  bool hasOdmSkryto() => _odmSkryto != null;

  // "OdmVytvoreno" field.
  DateTime? _odmVytvoreno;
  DateTime? get odmVytvoreno => _odmVytvoreno;
  bool hasOdmVytvoreno() => _odmVytvoreno != null;

  // "OdmUpraveno" field.
  DateTime? _odmUpraveno;
  DateTime? get odmUpraveno => _odmUpraveno;
  bool hasOdmUpraveno() => _odmUpraveno != null;

  void _initializeFields() {
    _odmId = castToType<int>(snapshotData['OdmId']);
    _odmNazev = snapshotData['OdmNazev'] as String?;
    _odmPopis = snapshotData['OdmPopis'] as String?;
    _odmCena = castToType<double>(snapshotData['OdmCena']);
    _odmObrazek = snapshotData['OdmObrazek'] as String?;
    _odmSkryto = snapshotData['OdmSkryto'] as bool?;
    _odmVytvoreno = snapshotData['OdmVytvoreno'] as DateTime?;
    _odmUpraveno = snapshotData['OdmUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('odmena');

  static Stream<OdmenaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OdmenaRecord.fromSnapshot(s));

  static Future<OdmenaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OdmenaRecord.fromSnapshot(s));

  static OdmenaRecord fromSnapshot(DocumentSnapshot snapshot) => OdmenaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OdmenaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OdmenaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OdmenaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OdmenaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOdmenaRecordData({
  int? odmId,
  String? odmNazev,
  String? odmPopis,
  double? odmCena,
  String? odmObrazek,
  bool? odmSkryto,
  DateTime? odmVytvoreno,
  DateTime? odmUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OdmId': odmId,
      'OdmNazev': odmNazev,
      'OdmPopis': odmPopis,
      'OdmCena': odmCena,
      'OdmObrazek': odmObrazek,
      'OdmSkryto': odmSkryto,
      'OdmVytvoreno': odmVytvoreno,
      'OdmUpraveno': odmUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class OdmenaRecordDocumentEquality implements Equality<OdmenaRecord> {
  const OdmenaRecordDocumentEquality();

  @override
  bool equals(OdmenaRecord? e1, OdmenaRecord? e2) {
    return e1?.odmId == e2?.odmId &&
        e1?.odmNazev == e2?.odmNazev &&
        e1?.odmPopis == e2?.odmPopis &&
        e1?.odmCena == e2?.odmCena &&
        e1?.odmObrazek == e2?.odmObrazek &&
        e1?.odmSkryto == e2?.odmSkryto &&
        e1?.odmVytvoreno == e2?.odmVytvoreno &&
        e1?.odmUpraveno == e2?.odmUpraveno;
  }

  @override
  int hash(OdmenaRecord? e) => const ListEquality().hash([
        e?.odmId,
        e?.odmNazev,
        e?.odmPopis,
        e?.odmCena,
        e?.odmObrazek,
        e?.odmSkryto,
        e?.odmVytvoreno,
        e?.odmUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is OdmenaRecord;
}
