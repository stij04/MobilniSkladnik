import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZiskUrovneRecord extends FirestoreRecord {
  ZiskUrovneRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ZiuId" field.
  int? _ziuId;
  int get ziuId => _ziuId ?? 0;
  bool hasZiuId() => _ziuId != null;

  // "ZiuUziId" field.
  int? _ziuUziId;
  int get ziuUziId => _ziuUziId ?? 0;
  bool hasZiuUziId() => _ziuUziId != null;

  // "ZiuUroId" field.
  int? _ziuUroId;
  int get ziuUroId => _ziuUroId ?? 0;
  bool hasZiuUroId() => _ziuUroId != null;

  // "ZiuVytvoreno" field.
  DateTime? _ziuVytvoreno;
  DateTime? get ziuVytvoreno => _ziuVytvoreno;
  bool hasZiuVytvoreno() => _ziuVytvoreno != null;

  // "ZiuUpraveno" field.
  DateTime? _ziuUpraveno;
  DateTime? get ziuUpraveno => _ziuUpraveno;
  bool hasZiuUpraveno() => _ziuUpraveno != null;

  void _initializeFields() {
    _ziuId = castToType<int>(snapshotData['ZiuId']);
    _ziuUziId = castToType<int>(snapshotData['ZiuUziId']);
    _ziuUroId = castToType<int>(snapshotData['ZiuUroId']);
    _ziuVytvoreno = snapshotData['ZiuVytvoreno'] as DateTime?;
    _ziuUpraveno = snapshotData['ZiuUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zisk_urovne');

  static Stream<ZiskUrovneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZiskUrovneRecord.fromSnapshot(s));

  static Future<ZiskUrovneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZiskUrovneRecord.fromSnapshot(s));

  static ZiskUrovneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ZiskUrovneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZiskUrovneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZiskUrovneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZiskUrovneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZiskUrovneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZiskUrovneRecordData({
  int? ziuId,
  int? ziuUziId,
  int? ziuUroId,
  DateTime? ziuVytvoreno,
  DateTime? ziuUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ZiuId': ziuId,
      'ZiuUziId': ziuUziId,
      'ZiuUroId': ziuUroId,
      'ZiuVytvoreno': ziuVytvoreno,
      'ZiuUpraveno': ziuUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZiskUrovneRecordDocumentEquality implements Equality<ZiskUrovneRecord> {
  const ZiskUrovneRecordDocumentEquality();

  @override
  bool equals(ZiskUrovneRecord? e1, ZiskUrovneRecord? e2) {
    return e1?.ziuId == e2?.ziuId &&
        e1?.ziuUziId == e2?.ziuUziId &&
        e1?.ziuUroId == e2?.ziuUroId &&
        e1?.ziuVytvoreno == e2?.ziuVytvoreno &&
        e1?.ziuUpraveno == e2?.ziuUpraveno;
  }

  @override
  int hash(ZiskUrovneRecord? e) => const ListEquality().hash(
      [e?.ziuId, e?.ziuUziId, e?.ziuUroId, e?.ziuVytvoreno, e?.ziuUpraveno]);

  @override
  bool isValidKey(Object? o) => o is ZiskUrovneRecord;
}
