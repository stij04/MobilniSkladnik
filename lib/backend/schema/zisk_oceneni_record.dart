import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZiskOceneniRecord extends FirestoreRecord {
  ZiskOceneniRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ZioId" field.
  int? _zioId;
  int get zioId => _zioId ?? 0;
  bool hasZioId() => _zioId != null;

  // "ZioOceId" field.
  int? _zioOceId;
  int get zioOceId => _zioOceId ?? 0;
  bool hasZioOceId() => _zioOceId != null;

  // "ZioUziId" field.
  int? _zioUziId;
  int get zioUziId => _zioUziId ?? 0;
  bool hasZioUziId() => _zioUziId != null;

  // "ZioVytvoril" field.
  int? _zioVytvoril;
  int get zioVytvoril => _zioVytvoril ?? 0;
  bool hasZioVytvoril() => _zioVytvoril != null;

  // "ZioVytvoreno" field.
  DateTime? _zioVytvoreno;
  DateTime? get zioVytvoreno => _zioVytvoreno;
  bool hasZioVytvoreno() => _zioVytvoreno != null;

  // "ZioUpravil" field.
  int? _zioUpravil;
  int get zioUpravil => _zioUpravil ?? 0;
  bool hasZioUpravil() => _zioUpravil != null;

  // "ZioUpraveno" field.
  DateTime? _zioUpraveno;
  DateTime? get zioUpraveno => _zioUpraveno;
  bool hasZioUpraveno() => _zioUpraveno != null;

  void _initializeFields() {
    _zioId = castToType<int>(snapshotData['ZioId']);
    _zioOceId = castToType<int>(snapshotData['ZioOceId']);
    _zioUziId = castToType<int>(snapshotData['ZioUziId']);
    _zioVytvoril = castToType<int>(snapshotData['ZioVytvoril']);
    _zioVytvoreno = snapshotData['ZioVytvoreno'] as DateTime?;
    _zioUpravil = castToType<int>(snapshotData['ZioUpravil']);
    _zioUpraveno = snapshotData['ZioUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zisk_oceneni');

  static Stream<ZiskOceneniRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZiskOceneniRecord.fromSnapshot(s));

  static Future<ZiskOceneniRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZiskOceneniRecord.fromSnapshot(s));

  static ZiskOceneniRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ZiskOceneniRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZiskOceneniRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZiskOceneniRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZiskOceneniRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZiskOceneniRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZiskOceneniRecordData({
  int? zioId,
  int? zioOceId,
  int? zioUziId,
  int? zioVytvoril,
  DateTime? zioVytvoreno,
  int? zioUpravil,
  DateTime? zioUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ZioId': zioId,
      'ZioOceId': zioOceId,
      'ZioUziId': zioUziId,
      'ZioVytvoril': zioVytvoril,
      'ZioVytvoreno': zioVytvoreno,
      'ZioUpravil': zioUpravil,
      'ZioUpraveno': zioUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZiskOceneniRecordDocumentEquality implements Equality<ZiskOceneniRecord> {
  const ZiskOceneniRecordDocumentEquality();

  @override
  bool equals(ZiskOceneniRecord? e1, ZiskOceneniRecord? e2) {
    return e1?.zioId == e2?.zioId &&
        e1?.zioOceId == e2?.zioOceId &&
        e1?.zioUziId == e2?.zioUziId &&
        e1?.zioVytvoril == e2?.zioVytvoril &&
        e1?.zioVytvoreno == e2?.zioVytvoreno &&
        e1?.zioUpravil == e2?.zioUpravil &&
        e1?.zioUpraveno == e2?.zioUpraveno;
  }

  @override
  int hash(ZiskOceneniRecord? e) => const ListEquality().hash([
        e?.zioId,
        e?.zioOceId,
        e?.zioUziId,
        e?.zioVytvoril,
        e?.zioVytvoreno,
        e?.zioUpravil,
        e?.zioUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is ZiskOceneniRecord;
}
