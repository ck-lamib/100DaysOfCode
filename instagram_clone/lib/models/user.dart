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
}
