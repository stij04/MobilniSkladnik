import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SezonaRecord extends FirestoreRecord {
  SezonaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "SezId" field.
  int? _sezId;
  int get sezId => _sezId ?? 0;
  bool hasSezId() => _sezId != null;

  // "SezNazev" field.
  String? _sezNazev;
  String get sezNazev => _sezNazev ?? '';
  bool hasSezNazev() => _sezNazev != null;

  // "SezPopis" field.
  String? _sezPopis;
  String get sezPopis => _sezPopis ?? '';
  bool hasSezPopis() => _sezPopis != null;

  // "SezStart" field.
  DateTime? _sezStart;
  DateTime? get sezStart => _sezStart;
  bool hasSezStart() => _sezStart != null;

  // "SezKonec" field.
  DateTime? _sezKonec;
  DateTime? get sezKonec => _sezKonec;
  bool hasSezKonec() => _sezKonec != null;

  // "SezSkryto" field.
  bool? _sezSkryto;
  bool get sezSkryto => _sezSkryto ?? false;
  bool hasSezSkryto() => _sezSkryto != null;

  // "SezVytvoreno" field.
  DateTime? _sezVytvoreno;
  DateTime? get sezVytvoreno => _sezVytvoreno;
  bool hasSezVytvoreno() => _sezVytvoreno != null;

  // "SezUpraveno" field.
  DateTime? _sezUpraveno;
  DateTime? get sezUpraveno => _sezUpraveno;
  bool hasSezUpraveno() => _sezUpraveno != null;

  void _initializeFields() {
    _sezId = castToType<int>(snapshotData['SezId']);
    _sezNazev = snapshotData['SezNazev'] as String?;
    _sezPopis = snapshotData['SezPopis'] as String?;
    _sezStart = snapshotData['SezStart'] as DateTime?;
    _sezKonec = snapshotData['SezKonec'] as DateTime?;
    _sezSkryto = snapshotData['SezSkryto'] as bool?;
    _sezVytvoreno = snapshotData['SezVytvoreno'] as DateTime?;
    _sezUpraveno = snapshotData['SezUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sezona');

  static Stream<SezonaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SezonaRecord.fromSnapshot(s));

  static Future<SezonaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SezonaRecord.fromSnapshot(s));

  static SezonaRecord fromSnapshot(DocumentSnapshot snapshot) => SezonaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SezonaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SezonaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SezonaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SezonaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSezonaRecordData({
  int? sezId,
  String? sezNazev,
  String? sezPopis,
  DateTime? sezStart,
  DateTime? sezKonec,
  bool? sezSkryto,
  DateTime? sezVytvoreno,
  DateTime? sezUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SezId': sezId,
      'SezNazev': sezNazev,
      'SezPopis': sezPopis,
      'SezStart': sezStart,
      'SezKonec': sezKonec,
      'SezSkryto': sezSkryto,
      'SezVytvoreno': sezVytvoreno,
      'SezUpraveno': sezUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class SezonaRecordDocumentEquality implements Equality<SezonaRecord> {
  const SezonaRecordDocumentEquality();

  @override
  bool equals(SezonaRecord? e1, SezonaRecord? e2) {
    return e1?.sezId == e2?.sezId &&
        e1?.sezNazev == e2?.sezNazev &&
        e1?.sezPopis == e2?.sezPopis &&
        e1?.sezStart == e2?.sezStart &&
        e1?.sezKonec == e2?.sezKonec &&
        e1?.sezSkryto == e2?.sezSkryto &&
        e1?.sezVytvoreno == e2?.sezVytvoreno &&
        e1?.sezUpraveno == e2?.sezUpraveno;
  }

  @override
  int hash(SezonaRecord? e) => const ListEquality().hash([
        e?.sezId,
        e?.sezNazev,
        e?.sezPopis,
        e?.sezStart,
        e?.sezKonec,
        e?.sezSkryto,
        e?.sezVytvoreno,
        e?.sezUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is SezonaRecord;
}
