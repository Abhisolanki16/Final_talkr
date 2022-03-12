import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  final String username;
  final String email;

  User1({
    required this.username,
    required this.email,
  });

  factory User1.fromDocument(DocumentSnapshot doc) {
    return User1(
      email: doc['email'],
      username: doc['username'],
    );
  }
}
