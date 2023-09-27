import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConferenceInfoRecord extends FirestoreRecord {
  ConferenceInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conferenceInfo');

  static Stream<ConferenceInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConferenceInfoRecord.fromSnapshot(s));

  static Future<ConferenceInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConferenceInfoRecord.fromSnapshot(s));

  static ConferenceInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConferenceInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConferenceInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConferenceInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConferenceInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConferenceInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConferenceInfoRecordData({
  String? description,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConferenceInfoRecordDocumentEquality
    implements Equality<ConferenceInfoRecord> {
  const ConferenceInfoRecordDocumentEquality();

  @override
  bool equals(ConferenceInfoRecord? e1, ConferenceInfoRecord? e2) {
    return e1?.description == e2?.description && e1?.date == e2?.date;
  }

  @override
  int hash(ConferenceInfoRecord? e) =>
      const ListEquality().hash([e?.description, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ConferenceInfoRecord;
}
