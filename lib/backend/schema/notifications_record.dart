import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "UziId" field.
  int? _uziId;
  int get uziId => _uziId ?? 0;
  bool hasUziId() => _uziId != null;

  // "hidden" field.
  bool? _hidden;
  bool get hidden => _hidden ?? false;
  bool hasHidden() => _hidden != null;

  // "UroId" field.
  int? _uroId;
  int get uroId => _uroId ?? 0;
  bool hasUroId() => _uroId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uziId = castToType<int>(snapshotData['UziId']);
    _hidden = snapshotData['hidden'] as bool?;
    _uroId = castToType<int>(snapshotData['UroId']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? uid,
  int? uziId,
  bool? hidden,
  int? uroId,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'UziId': uziId,
      'hidden': hidden,
      'UroId': uroId,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uziId == e2?.uziId &&
        e1?.hidden == e2?.hidden &&
        e1?.uroId == e2?.uroId &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uziId, e?.hidden, e?.uroId, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
