import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "post_username" field.
  String? _postUsername;
  String get postUsername => _postUsername ?? '';
  bool hasPostUsername() => _postUsername != null;

  // "post_likes" field.
  List<DocumentReference>? _postLikes;
  List<DocumentReference> get postLikes => _postLikes ?? const [];
  bool hasPostLikes() => _postLikes != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "attached_image" field.
  String? _attachedImage;
  String get attachedImage => _attachedImage ?? '';
  bool hasAttachedImage() => _attachedImage != null;

  // "image_bytes" field.
  String? _imageBytes;
  String get imageBytes => _imageBytes ?? '';
  bool hasImageBytes() => _imageBytes != null;

  void _initializeFields() {
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _postUsername = snapshotData['post_username'] as String?;
    _postLikes = getDataList(snapshotData['post_likes']);
    _uid = snapshotData['uid'] as String?;
    _poster = snapshotData['poster'] as DocumentReference?;
    _profilePicture = snapshotData['profile_picture'] as String?;
    _attachedImage = snapshotData['attached_image'] as String?;
    _imageBytes = snapshotData['image_bytes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postDescription,
  DateTime? timePosted,
  String? postUsername,
  String? uid,
  DocumentReference? poster,
  String? profilePicture,
  String? attachedImage,
  String? imageBytes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_description': postDescription,
      'time_posted': timePosted,
      'post_username': postUsername,
      'uid': uid,
      'poster': poster,
      'profile_picture': profilePicture,
      'attached_image': attachedImage,
      'image_bytes': imageBytes,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        e1?.postUsername == e2?.postUsername &&
        listEquality.equals(e1?.postLikes, e2?.postLikes) &&
        e1?.uid == e2?.uid &&
        e1?.poster == e2?.poster &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.attachedImage == e2?.attachedImage &&
        e1?.imageBytes == e2?.imageBytes;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postDescription,
        e?.timePosted,
        e?.postUsername,
        e?.postLikes,
        e?.uid,
        e?.poster,
        e?.profilePicture,
        e?.attachedImage,
        e?.imageBytes
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
