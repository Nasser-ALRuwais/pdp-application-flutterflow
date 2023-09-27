import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaRecord extends FirestoreRecord {
  AgendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? '';
  bool hasSpeakerName() => _speakerName != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _speakerName = snapshotData['speaker_name'] as String?;
    _topic = snapshotData['topic'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('agenda');

  static Stream<AgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendaRecord.fromSnapshot(s));

  static Future<AgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendaRecord.fromSnapshot(s));

  static AgendaRecord fromSnapshot(DocumentSnapshot snapshot) => AgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendaRecordData({
  String? speakerName,
  String? topic,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'speaker_name': speakerName,
      'topic': topic,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendaRecordDocumentEquality implements Equality<AgendaRecord> {
  const AgendaRecordDocumentEquality();

  @override
  bool equals(AgendaRecord? e1, AgendaRecord? e2) {
    return e1?.speakerName == e2?.speakerName &&
        e1?.topic == e2?.topic &&
        e1?.time == e2?.time;
  }

  @override
  int hash(AgendaRecord? e) =>
      const ListEquality().hash([e?.speakerName, e?.topic, e?.time]);

  @override
  bool isValidKey(Object? o) => o is AgendaRecord;
}
