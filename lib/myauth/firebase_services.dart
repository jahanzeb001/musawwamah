import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';

class FirebaseService {
  bool islogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ignore: body_might_complete_normally_nullable
  // Future<String?> signInwithGoogle(context) async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );

  //     await _auth.signInWithCredential(credential);
  //     deciderout(context);
  //   } on FirebaseAuthException catch (e) {
  //     log('${e.message}');
  //     // ignore: use_rethrow_when_possible
  //     throw e;
  //   }
  // }

  deciderout(context) {
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //     (Route<dynamic> route) => false);

    // if (user != null) {
    // FirebaseFirestore.instance
    // .collection('users')
    // .doc(user.uid)
    // .get()
    // .then((value) {
    // if (value.exists) {
    // Navigator.of(context).pushAndRemoveUntil(
    // MaterialPageRoute(builder: (context) => const HomePage()),
    // (Route<dynamic> route) => false);
    // } else {
    // Navigator.of(context).pushAndRemoveUntil(
    // MaterialPageRoute(builder: (context) => const HomePage()),
    // (Route<dynamic> route) => false);
    // }
    // });
    // }
  }

  Future<void> signOutFromGoogle(context) async {
    //await _googleSignIn.signOut();
    await _auth.signOut();
    //Get.offAll(() => const LoginScreen());
  }
}
