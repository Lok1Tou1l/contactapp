
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid, photoUrl, username, email;
  final List contacts;

  const User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.contacts
      });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        email: snapshot['email'],
        contacts: snapshot['contacts']);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'photoUrl': photoUrl,
        'email': email,
        'contacts': contacts
      };
}
