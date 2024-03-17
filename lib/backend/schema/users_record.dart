import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "UziId" field.
  int? _uziId;
  int get uziId => _uziId ?? 0;
  bool hasUziId() => _uziId != null;

  // "UziJmeno" field.
  String? _uziJmeno;
  String get uziJmeno => _uziJmeno ?? '';
  bool hasUziJmeno() => _uziJmeno != null;

  // "UziPrijmeni" field.
  String? _uziPrijmeni;
  String get uziPrijmeni => _uziPrijmeni ?? '';
  bool hasUziPrijmeni() => _uziPrijmeni != null;

  // "UziBody" field.
  double? _uziBody;
  double get uziBody => _uziBody ?? 0.0;
  bool hasUziBody() => _uziBody != null;

  // "UziMena" field.
  double? _uziMena;
  double get uziMena => _uziMena ?? 0.0;
  bool hasUziMena() => _uziMena != null;

  // "UziPohlavi" field.
  bool? _uziPohlavi;
  bool get uziPohlavi => _uziPohlavi ?? false;
  bool hasUziPohlavi() => _uziPohlavi != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "fcmToken" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _uziId = castToType<int>(snapshotData['UziId']);
    _uziJmeno = snapshotData['UziJmeno'] as String?;
    _uziPrijmeni = snapshotData['UziPrijmeni'] as String?;
    _uziBody = castToType<double>(snapshotData['UziBody']);
    _uziMena = castToType<double>(snapshotData['UziMena']);
    _uziPohlavi = snapshotData['UziPohlavi'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fcmToken = snapshotData['fcmToken'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  int? uziId,
  String? uziJmeno,
  String? uziPrijmeni,
  double? uziBody,
  double? uziMena,
  bool? uziPohlavi,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? fcmToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'UziId': uziId,
      'UziJmeno': uziJmeno,
      'UziPrijmeni': uziPrijmeni,
      'UziBody': uziBody,
      'UziMena': uziMena,
      'UziPohlavi': uziPohlavi,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'fcmToken': fcmToken,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.uziId == e2?.uziId &&
        e1?.uziJmeno == e2?.uziJmeno &&
        e1?.uziPrijmeni == e2?.uziPrijmeni &&
        e1?.uziBody == e2?.uziBody &&
        e1?.uziMena == e2?.uziMena &&
        e1?.uziPohlavi == e2?.uziPohlavi &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fcmToken == e2?.fcmToken;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.uziId,
        e?.uziJmeno,
        e?.uziPrijmeni,
        e?.uziBody,
        e?.uziMena,
        e?.uziPohlavi,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.fcmToken
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
