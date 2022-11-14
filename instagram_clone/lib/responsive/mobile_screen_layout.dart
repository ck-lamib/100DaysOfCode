import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String userName = '';
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('user').doc(firebaseAuth.currentUser!.uid).get();

    debugPrint((documentSnapshot.data() as Map<String, dynamic>).toString());
    setState(() {
      userName = (documentSnapshot.data() as Map<String, dynamic>)['userName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User _user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(_user.photoUrl),
      ),
    );
  }
}
