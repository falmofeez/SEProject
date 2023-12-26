import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Qu4Record extends FirestoreRecord {
  Qu4Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _isTrue = snapshotData['isTrue'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Qu4')
          : FirebaseFirestore.instance.collectionGroup('Qu4');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Qu4').doc();

  static Stream<Qu4Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Qu4Record.fromSnapshot(s));

  static Future<Qu4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Qu4Record.fromSnapshot(s));

  static Qu4Record fromSnapshot(DocumentSnapshot snapshot) => Qu4Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Qu4Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Qu4Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Qu4Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Qu4Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQu4RecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'isTrue': isTrue,
    }.withoutNulls,
  );

  return firestoreData;
}

class Qu4RecordDocumentEquality implements Equality<Qu4Record> {
  const Qu4RecordDocumentEquality();

  @override
  bool equals(Qu4Record? e1, Qu4Record? e2) {
    return e1?.question == e2?.question && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Qu4Record? e) => const ListEquality().hash([e?.question, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Qu4Record;
}
