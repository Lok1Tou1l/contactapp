import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreCrud {

  final _firestore = FirebaseFirestore.instance;  

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> bookmarkRecipe(String recipeId) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot user = await _firestore.collection('users').doc(uid).get();

    try {
      if (user['bookmarkedRecipes'].contains(recipeId)) {
        // if already bookmarked then remove from bookmarks
        _firestore.collection('users').doc(uid).update({
          'bookmarkedRecipes': FieldValue.arrayRemove([recipeId])
        });
        log("Bookmark Removed");
      } else {
        _firestore.collection('users').doc(uid).update({
          'bookmarkedRecipes': FieldValue.arrayUnion([recipeId])
        });
        log("Bookmark Added");
      }
    } catch (e) {
      throw e.toString();
    }
  }

}
