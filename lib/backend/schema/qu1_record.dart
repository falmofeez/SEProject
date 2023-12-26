import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Qu1Record extends FirestoreRecord {
  Qu1Record._(
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
          ? parent.collection('Qu1')
          : FirebaseFirestore.instance.collectionGroup('Qu1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Qu1').doc();

  static Stream<Qu1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Qu1Record.fromSnapshot(s));

  static Future<Qu1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Qu1Record.fromSnapshot(s));

  static Qu1Record fromSnapshot(DocumentSnapshot snapshot) => Qu1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Qu1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Qu1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Qu1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Qu1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQu1RecordData({
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

class Qu1RecordDocumentEquality implements Equality<Qu1Record> {
  const Qu1RecordDocumentEquality();

  @override
  bool equals(Qu1Record? e1, Qu1Record? e2) {
    return e1?.question == e2?.question && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Qu1Record? e) => const ListEquality().hash([e?.question, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Qu1Record;
}
