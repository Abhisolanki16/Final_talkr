import 'package:cloud_firestore/cloud_firestore.dart';

class User2 {
   String email = " ";
   String uid = ' ';
   String photoUrl = '';
   String username = '';
   String bio = '';
   List followers = [];
   List following = [];

   User2(
      {
       username,
       uid,
       photoUrl,
       email,
       bio,
       followers,
       following});

  static User2 fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User2(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
