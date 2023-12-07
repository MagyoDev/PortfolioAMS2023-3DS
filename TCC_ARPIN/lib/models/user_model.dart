
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;

  User({required this.uid, required this.username, required this.email});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return User(
      uid: data?['uid'],
      email: data?['email'],
      username: data?['username'],
    );
  }

  deleteUser(){
    firestore.collection('users').doc(uid).delete();
  }
}
