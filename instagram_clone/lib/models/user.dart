import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String uid;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;
  const User({
    required this.userName,
    required this.uid,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'uid': uid,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        userName: snapshot['userName'],
        uid: snapshot['uid'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl']);
  }
}
