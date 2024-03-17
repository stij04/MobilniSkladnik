import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrovenRecord extends FirestoreRecord {
  UrovenRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "UroId" field.
  int? _uroId;
  int get uroId => _uroId ?? 0;
  bool hasUroId() => _uroId != null;

  // "UroSezId" field.
  int? _uroSezId;
  int get uroSezId => _uroSezId ?? 0;
  bool hasUroSezId() => _uroSezId != null;

  // "UroNazev" field.
  String? _uroNazev;
  String get uroNazev => _uroNazev ?? '';
  bool hasUroNazev() => _uroNazev != null;

  // "UroPoradi" field.
  int? _uroPoradi;
  int get uroPoradi => _uroPoradi ?? 0;
  bool hasUroPoradi() => _uroPoradi != null;

  // "UroPopis" field.
  String? _uroPopis;
  String get uroPopis => _uroPopis ?? '';
  bool hasUroPopis() => _uroPopis != null;

  // "UroHranice" field.
  double? _uroHranice;
  double get uroHranice => _uroHranice ?? 0.0;
  bool hasUroHranice() => _uroHranice != null;

  // "UroMena" field.
  double? _uroMena;
  double get uroMena => _uroMena ?? 0.0;
  bool hasUroMena() => _uroMena != null;

  // "UroVytvoril" field.
  int? _uroVytvoril;
  int get uroVytvoril => _uroVytvoril ?? 0;
  bool hasUroVytvoril() => _uroVytvoril != null;

  // "UroVytvoreno" field.
  DateTime? _uroVytvoreno;
  DateTime? get uroVytvoreno => _uroVytvoreno;
  bool hasUroVytvoreno() => _uroVytvoreno != null;

  // "UroUpravil" field.
  int? _uroUpravil;
  int get uroUpravil => _uroUpravil ?? 0;
  bool hasUroUpravil() => _uroUpravil != null;

  // "UroUpraveno" field.
  DateTime? _uroUpraveno;
  DateTime? get uroUpraveno => _uroUpraveno;
  bool hasUroUpraveno() => _uroUpraveno != null;

  void _initializeFields() {
    _uroId = castToType<int>(snapshotData['UroId']);
    _uroSezId = castToType<int>(snapshotData['UroSezId']);
    _uroNazev = snapshotData['UroNazev'] as String?;
    _uroPoradi = castToType<int>(snapshotData['UroPoradi']);
    _uroPopis = snapshotData['UroPopis'] as String?;
    _uroHranice = castToType<double>(snapshotData['UroHranice']);
    _uroMena = castToType<double>(snapshotData['UroMena']);
    _uroVytvoril = castToType<int>(snapshotData['UroVytvoril']);
    _uroVytvoreno = snapshotData['UroVytvoreno'] as DateTime?;
    _uroUpravil = castToType<int>(snapshotData['UroUpravil']);
    _uroUpraveno = snapshotData['UroUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uroven');

  static Stream<UrovenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UrovenRecord.fromSnapshot(s));

  static Future<UrovenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UrovenRecord.fromSnapshot(s));

  static UrovenRecord fromSnapshot(DocumentSnapshot snapshot) => UrovenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UrovenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UrovenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UrovenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UrovenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUrovenRecordData({
  int? uroId,
  int? uroSezId,
  String? uroNazev,
  int? uroPoradi,
  String? uroPopis,
  double? uroHranice,
  double? uroMena,
  int? uroVytvoril,
  DateTime? uroVytvoreno,
  int? uroUpravil,
  DateTime? uroUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UroId': uroId,
      'UroSezId': uroSezId,
      'UroNazev': uroNazev,
      'UroPoradi': uroPoradi,
      'UroPopis': uroPopis,
      'UroHranice': uroHranice,
      'UroMena': uroMena,
      'UroVytvoril': uroVytvoril,
      'UroVytvoreno': uroVytvoreno,
      'UroUpravil': uroUpravil,
      'UroUpraveno': uroUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class UrovenRecordDocumentEquality implements Equality<UrovenRecord> {
  const UrovenRecordDocumentEquality();

  @override
  bool equals(UrovenRecord? e1, UrovenRecord? e2) {
    return e1?.uroId == e2?.uroId &&
        e1?.uroSezId == e2?.uroSezId &&
        e1?.uroNazev == e2?.uroNazev &&
        e1?.uroPoradi == e2?.uroPoradi &&
        e1?.uroPopis == e2?.uroPopis &&
        e1?.uroHranice == e2?.uroHranice &&
        e1?.uroMena == e2?.uroMena &&
        e1?.uroVytvoril == e2?.uroVytvoril &&
        e1?.uroVytvoreno == e2?.uroVytvoreno &&
        e1?.uroUpravil == e2?.uroUpravil &&
        e1?.uroUpraveno == e2?.uroUpraveno;
  }

  @override
  int hash(UrovenRecord? e) => const ListEquality().hash([
        e?.uroId,
        e?.uroSezId,
        e?.uroNazev,
        e?.uroPoradi,
        e?.uroPopis,
        e?.uroHranice,
        e?.uroMena,
        e?.uroVytvoril,
        e?.uroVytvoreno,
        e?.uroUpravil,
        e?.uroUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is UrovenRecord;
}
