import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OceneniRecord extends FirestoreRecord {
  OceneniRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "OceId" field.
  int? _oceId;
  int get oceId => _oceId ?? 0;
  bool hasOceId() => _oceId != null;

  // "OceTyoId" field.
  int? _oceTyoId;
  int get oceTyoId => _oceTyoId ?? 0;
  bool hasOceTyoId() => _oceTyoId != null;

  // "OceNazev" field.
  String? _oceNazev;
  String get oceNazev => _oceNazev ?? '';
  bool hasOceNazev() => _oceNazev != null;

  // "OcePopis" field.
  String? _ocePopis;
  String get ocePopis => _ocePopis ?? '';
  bool hasOcePopis() => _ocePopis != null;

  // "OcePodminky" field.
  String? _ocePodminky;
  String get ocePodminky => _ocePodminky ?? '';
  bool hasOcePodminky() => _ocePodminky != null;

  // "OceMena" field.
  double? _oceMena;
  double get oceMena => _oceMena ?? 0.0;
  bool hasOceMena() => _oceMena != null;

  // "OceSkryto" field.
  bool? _oceSkryto;
  bool get oceSkryto => _oceSkryto ?? false;
  bool hasOceSkryto() => _oceSkryto != null;

  // "OceVytvoril" field.
  int? _oceVytvoril;
  int get oceVytvoril => _oceVytvoril ?? 0;
  bool hasOceVytvoril() => _oceVytvoril != null;

  // "OceVytvoreno" field.
  DateTime? _oceVytvoreno;
  DateTime? get oceVytvoreno => _oceVytvoreno;
  bool hasOceVytvoreno() => _oceVytvoreno != null;

  // "OceUpravil" field.
  int? _oceUpravil;
  int get oceUpravil => _oceUpravil ?? 0;
  bool hasOceUpravil() => _oceUpravil != null;

  // "OceUpraveno" field.
  DateTime? _oceUpraveno;
  DateTime? get oceUpraveno => _oceUpraveno;
  bool hasOceUpraveno() => _oceUpraveno != null;

  // "OceObrazek" field.
  String? _oceObrazek;
  String get oceObrazek => _oceObrazek ?? '';
  bool hasOceObrazek() => _oceObrazek != null;

  void _initializeFields() {
    _oceId = castToType<int>(snapshotData['OceId']);
    _oceTyoId = castToType<int>(snapshotData['OceTyoId']);
    _oceNazev = snapshotData['OceNazev'] as String?;
    _ocePopis = snapshotData['OcePopis'] as String?;
    _ocePodminky = snapshotData['OcePodminky'] as String?;
    _oceMena = castToType<double>(snapshotData['OceMena']);
    _oceSkryto = snapshotData['OceSkryto'] as bool?;
    _oceVytvoril = castToType<int>(snapshotData['OceVytvoril']);
    _oceVytvoreno = snapshotData['OceVytvoreno'] as DateTime?;
    _oceUpravil = castToType<int>(snapshotData['OceUpravil']);
    _oceUpraveno = snapshotData['OceUpraveno'] as DateTime?;
    _oceObrazek = snapshotData['OceObrazek'] as String?;
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
  int? oceTyoId,
  String? oceNazev,
  String? ocePopis,
  String? ocePodminky,
  double? oceMena,
  bool? oceSkryto,
  int? oceVytvoril,
  DateTime? oceVytvoreno,
  int? oceUpravil,
  DateTime? oceUpraveno,
  String? oceObrazek,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OceId': oceId,
      'OceTyoId': oceTyoId,
      'OceNazev': oceNazev,
      'OcePopis': ocePopis,
      'OcePodminky': ocePodminky,
      'OceMena': oceMena,
      'OceSkryto': oceSkryto,
      'OceVytvoril': oceVytvoril,
      'OceVytvoreno': oceVytvoreno,
      'OceUpravil': oceUpravil,
      'OceUpraveno': oceUpraveno,
      'OceObrazek': oceObrazek,
    }.withoutNulls,
  );

  return firestoreData;
}

class OceneniRecordDocumentEquality implements Equality<OceneniRecord> {
  const OceneniRecordDocumentEquality();

  @override
  bool equals(OceneniRecord? e1, OceneniRecord? e2) {
    return e1?.oceId == e2?.oceId &&
        e1?.oceTyoId == e2?.oceTyoId &&
        e1?.oceNazev == e2?.oceNazev &&
        e1?.ocePopis == e2?.ocePopis &&
        e1?.ocePodminky == e2?.ocePodminky &&
        e1?.oceMena == e2?.oceMena &&
        e1?.oceSkryto == e2?.oceSkryto &&
        e1?.oceVytvoril == e2?.oceVytvoril &&
        e1?.oceVytvoreno == e2?.oceVytvoreno &&
        e1?.oceUpravil == e2?.oceUpravil &&
        e1?.oceUpraveno == e2?.oceUpraveno &&
        e1?.oceObrazek == e2?.oceObrazek;
  }

  @override
  int hash(OceneniRecord? e) => const ListEquality().hash([
        e?.oceId,
        e?.oceTyoId,
        e?.oceNazev,
        e?.ocePopis,
        e?.ocePodminky,
        e?.oceMena,
        e?.oceSkryto,
        e?.oceVytvoril,
        e?.oceVytvoreno,
        e?.oceUpravil,
        e?.oceUpraveno,
        e?.oceObrazek
      ]);

  @override
  bool isValidKey(Object? o) => o is OceneniRecord;
}
