import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NakupRecord extends FirestoreRecord {
  NakupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "NakId" field.
  int? _nakId;
  int get nakId => _nakId ?? 0;
  bool hasNakId() => _nakId != null;

  // "NakUziId" field.
  int? _nakUziId;
  int get nakUziId => _nakUziId ?? 0;
  bool hasNakUziId() => _nakUziId != null;

  // "NakOdmId" field.
  int? _nakOdmId;
  int get nakOdmId => _nakOdmId ?? 0;
  bool hasNakOdmId() => _nakOdmId != null;

  // "NakPoznamka" field.
  String? _nakPoznamka;
  String get nakPoznamka => _nakPoznamka ?? '';
  bool hasNakPoznamka() => _nakPoznamka != null;

  // "NakPotvrdil" field.
  int? _nakPotvrdil;
  int get nakPotvrdil => _nakPotvrdil ?? 0;
  bool hasNakPotvrdil() => _nakPotvrdil != null;

  // "NakPotvrzeno" field.
  DateTime? _nakPotvrzeno;
  DateTime? get nakPotvrzeno => _nakPotvrzeno;
  bool hasNakPotvrzeno() => _nakPotvrzeno != null;

  // "NakVytvoreno" field.
  DateTime? _nakVytvoreno;
  DateTime? get nakVytvoreno => _nakVytvoreno;
  bool hasNakVytvoreno() => _nakVytvoreno != null;

  // "NakUpraveno" field.
  DateTime? _nakUpraveno;
  DateTime? get nakUpraveno => _nakUpraveno;
  bool hasNakUpraveno() => _nakUpraveno != null;

  void _initializeFields() {
    _nakId = castToType<int>(snapshotData['NakId']);
    _nakUziId = castToType<int>(snapshotData['NakUziId']);
    _nakOdmId = castToType<int>(snapshotData['NakOdmId']);
    _nakPoznamka = snapshotData['NakPoznamka'] as String?;
    _nakPotvrdil = castToType<int>(snapshotData['NakPotvrdil']);
    _nakPotvrzeno = snapshotData['NakPotvrzeno'] as DateTime?;
    _nakVytvoreno = snapshotData['NakVytvoreno'] as DateTime?;
    _nakUpraveno = snapshotData['NakUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nakup');

  static Stream<NakupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NakupRecord.fromSnapshot(s));

  static Future<NakupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NakupRecord.fromSnapshot(s));

  static NakupRecord fromSnapshot(DocumentSnapshot snapshot) => NakupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NakupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NakupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NakupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NakupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNakupRecordData({
  int? nakId,
  int? nakUziId,
  int? nakOdmId,
  String? nakPoznamka,
  int? nakPotvrdil,
  DateTime? nakPotvrzeno,
  DateTime? nakVytvoreno,
  DateTime? nakUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NakId': nakId,
      'NakUziId': nakUziId,
      'NakOdmId': nakOdmId,
      'NakPoznamka': nakPoznamka,
      'NakPotvrdil': nakPotvrdil,
      'NakPotvrzeno': nakPotvrzeno,
      'NakVytvoreno': nakVytvoreno,
      'NakUpraveno': nakUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class NakupRecordDocumentEquality implements Equality<NakupRecord> {
  const NakupRecordDocumentEquality();

  @override
  bool equals(NakupRecord? e1, NakupRecord? e2) {
    return e1?.nakId == e2?.nakId &&
        e1?.nakUziId == e2?.nakUziId &&
        e1?.nakOdmId == e2?.nakOdmId &&
        e1?.nakPoznamka == e2?.nakPoznamka &&
        e1?.nakPotvrdil == e2?.nakPotvrdil &&
        e1?.nakPotvrzeno == e2?.nakPotvrzeno &&
        e1?.nakVytvoreno == e2?.nakVytvoreno &&
        e1?.nakUpraveno == e2?.nakUpraveno;
  }

  @override
  int hash(NakupRecord? e) => const ListEquality().hash([
        e?.nakId,
        e?.nakUziId,
        e?.nakOdmId,
        e?.nakPoznamka,
        e?.nakPotvrdil,
        e?.nakPotvrzeno,
        e?.nakVytvoreno,
        e?.nakUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is NakupRecord;
}
