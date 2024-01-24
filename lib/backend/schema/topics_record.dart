import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicsRecord extends FirestoreRecord {
  TopicsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "last_post" field.
  DateTime? _lastPost;
  DateTime? get lastPost => _lastPost;
  bool hasLastPost() => _lastPost != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _lastPost = snapshotData['last_post'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topics');

  static Stream<TopicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicsRecord.fromSnapshot(s));

  static Future<TopicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicsRecord.fromSnapshot(s));

  static TopicsRecord fromSnapshot(DocumentSnapshot snapshot) => TopicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicsRecordData({
  String? category,
  String? name,
  DocumentReference? owner,
  DateTime? lastPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'name': name,
      'owner': owner,
      'last_post': lastPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicsRecordDocumentEquality implements Equality<TopicsRecord> {
  const TopicsRecordDocumentEquality();

  @override
  bool equals(TopicsRecord? e1, TopicsRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.name == e2?.name &&
        e1?.owner == e2?.owner &&
        e1?.lastPost == e2?.lastPost;
  }

  @override
  int hash(TopicsRecord? e) =>
      const ListEquality().hash([e?.category, e?.name, e?.owner, e?.lastPost]);

  @override
  bool isValidKey(Object? o) => o is TopicsRecord;
}
