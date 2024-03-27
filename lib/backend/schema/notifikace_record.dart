import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotifikaceRecord extends FirestoreRecord {
  NotifikaceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "NotUziId" field.
  int? _notUziId;
  int get notUziId => _notUziId ?? 0;
  bool hasNotUziId() => _notUziId != null;

  // "NotUroId" field.
  int? _notUroId;
  int get notUroId => _notUroId ?? 0;
  bool hasNotUroId() => _notUroId != null;

  // "NotPrecteno" field.
  bool? _notPrecteno;
  bool get notPrecteno => _notPrecteno ?? false;
  bool hasNotPrecteno() => _notPrecteno != null;

  // "NotVytvoreno" field.
  DateTime? _notVytvoreno;
  DateTime? get notVytvoreno => _notVytvoreno;
  bool hasNotVytvoreno() => _notVytvoreno != null;

  // "NotUpraveno" field.
  DateTime? _notUpraveno;
  DateTime? get notUpraveno => _notUpraveno;
  bool hasNotUpraveno() => _notUpraveno != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _notUziId = castToType<int>(snapshotData['NotUziId']);
    _notUroId = castToType<int>(snapshotData['NotUroId']);
    _notPrecteno = snapshotData['NotPrecteno'] as bool?;
    _notVytvoreno = snapshotData['NotVytvoreno'] as DateTime?;
    _notUpraveno = snapshotData['NotUpraveno'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifikace');

  static Stream<NotifikaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotifikaceRecord.fromSnapshot(s));

  static Future<NotifikaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotifikaceRecord.fromSnapshot(s));

  static NotifikaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotifikaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotifikaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotifikaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotifikaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotifikaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotifikaceRecordData({
  String? uid,
  int? notUziId,
  int? notUroId,
  bool? notPrecteno,
  DateTime? notVytvoreno,
  DateTime? notUpraveno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'NotUziId': notUziId,
      'NotUroId': notUroId,
      'NotPrecteno': notPrecteno,
      'NotVytvoreno': notVytvoreno,
      'NotUpraveno': notUpraveno,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotifikaceRecordDocumentEquality implements Equality<NotifikaceRecord> {
  const NotifikaceRecordDocumentEquality();

  @override
  bool equals(NotifikaceRecord? e1, NotifikaceRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.notUziId == e2?.notUziId &&
        e1?.notUroId == e2?.notUroId &&
        e1?.notPrecteno == e2?.notPrecteno &&
        e1?.notVytvoreno == e2?.notVytvoreno &&
        e1?.notUpraveno == e2?.notUpraveno;
  }

  @override
  int hash(NotifikaceRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.notUziId,
        e?.notUroId,
        e?.notPrecteno,
        e?.notVytvoreno,
        e?.notUpraveno
      ]);

  @override
  bool isValidKey(Object? o) => o is NotifikaceRecord;
}
