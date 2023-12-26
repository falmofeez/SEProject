import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CourseTitle" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  // "coursename" field.
  String? _coursename;
  String get coursename => _coursename ?? '';
  bool hasCoursename() => _coursename != null;

  // "coursename2" field.
  String? _coursename2;
  String get coursename2 => _coursename2 ?? '';
  bool hasCoursename2() => _coursename2 != null;

  // "coursename3" field.
  String? _coursename3;
  String get coursename3 => _coursename3 ?? '';
  bool hasCoursename3() => _coursename3 != null;

  void _initializeFields() {
    _courseTitle = snapshotData['CourseTitle'] as String?;
    _coursename = snapshotData['coursename'] as String?;
    _coursename2 = snapshotData['coursename2'] as String?;
    _coursename3 = snapshotData['coursename3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseTitle,
  String? coursename,
  String? coursename2,
  String? coursename3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CourseTitle': courseTitle,
      'coursename': coursename,
      'coursename2': coursename2,
      'coursename3': coursename3,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.courseTitle == e2?.courseTitle &&
        e1?.coursename == e2?.coursename &&
        e1?.coursename2 == e2?.coursename2 &&
        e1?.coursename3 == e2?.coursename3;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality()
      .hash([e?.courseTitle, e?.coursename, e?.coursename2, e?.coursename3]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
