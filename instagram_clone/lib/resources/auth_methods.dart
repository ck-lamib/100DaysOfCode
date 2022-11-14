import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user.dart' as model;

import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('user').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

//sign up
  Future<String> signUpUsers({
    required String userName,
    required String bio,
    required String password,
    required String email,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (userName.isNotEmpty ||
          bio.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred =
            await _auth.createUserWithEmailAndPassword(email: email, password: password);

        debugPrint(cred.user!.uid);
        String photoUrl = await StorageMethods().uploadImageToStorage('ProfilePic', file, false);

        model.User user = model.User(
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
          uid: cred.user!.uid,
          userName: userName,
        );
        // add user to database
        await _firestore.collection('user').doc(cred.user!.uid).set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (error) {
      res = error.message.toString();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUsers({required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      } else {
        res = "Enter all field";
      }
    } on FirebaseAuthException catch (error) {
      res = error.message.toString();
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
